<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nilai extends CI_Controller {
    
    private $id_guru;
    
    public function __construct() {
        parent::__construct();
        $this->load->model('Model_nilai');
        $this->load->library('form_validation');
        
        // Cek login
        if (!$this->session->userdata('id_guru')) {
            redirect('auth/login');
        }
        
        $this->id_guru = $this->session->userdata('id_guru');
    }
    
    public function index() {
        $data['title'] = 'Data Nilai Siswa';
        // Hanya ambil kelas yang dipegang oleh guru ini
        $data['kelas'] = $this->Model_nilai->get_all_kelas($this->id_guru);
        $this->template->load('template', 'nilai/index', $data);
    }
    
    public function get_siswa_by_kelas() {
        $kd_kelas = $this->input->post('kd_kelas');
        
        // Cek apakah guru ini adalah wali kelas
        if (!$this->Model_nilai->is_wali_kelas($this->id_guru, $kd_kelas)) {
            $response = [
                'status' => 'error',
                'message' => 'Anda tidak memiliki akses untuk kelas ini'
            ];
            echo json_encode($response);
            return;
        }
        
        $tahun_akademik = get_tahun_akademik('id_tahun_akademik');
        
        $siswa = $this->Model_nilai->get_siswa_by_kelas($kd_kelas, $tahun_akademik);
        $mapel = $this->Model_nilai->get_mapel_by_kelas($kd_kelas, $tahun_akademik);
        
        $data = [
            'siswa' => $siswa,
            'mapel' => $mapel
        ];
        
        echo json_encode($data);
    }
    
    public function save_nilai() {
        $nim = $this->input->post('nim');
        $kd_kelas = $this->input->post('kd_kelas');
        $nilai = $this->input->post('nilai');
        $id_jadwal = $this->input->post('id_jadwal');
        
        // Validasi input
        $this->form_validation->set_rules('nim', 'NIM', 'required');
        $this->form_validation->set_rules('kd_kelas', 'Kelas', 'required');
        
        if ($this->form_validation->run() == FALSE) {
            echo json_encode([
                'status' => 'error',
                'message' => validation_errors()
            ]);
            return;
        }
    
        // Siapkan data untuk batch insert
        $data_insert = [];
        foreach ($id_jadwal as $index => $jadwal_id) {
            if (isset($nilai[$index]) && $nilai[$index] !== '') {
                $data_insert[] = [
                    'nim' => $nim,
                    'id_jadwal' => $jadwal_id,
                    'nilai' => $nilai[$index]
                ];
            }
        }
    
        // Simpan atau update nilai
        if (!empty($data_insert)) {
            $result = $this->Model_nilai->save_or_update_batch_nilai($data_insert);
            
            if ($result) {
                echo json_encode([
                    'status' => 'success',
                    'message' => 'Nilai berhasil disimpan'
                ]);
            } else {
                echo json_encode([
                    'status' => 'error',
                    'message' => 'Gagal menyimpan nilai'
                ]);
            }
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'Tidak ada nilai yang diinput'
            ]);
        }
    }

    public function get_mapel_by_siswa() {
        $nim = $this->input->post('nim');
        
        // Get current active academic year and semester
        $tahun_akademik = get_tahun_akademik('id_tahun_akademik');
        $semester = get_tahun_akademik('semester');
        
        // Fetch mapel for the specific student
        $mapel = $this->Model_nilai->get_mapel_by_student_nim($nim, $tahun_akademik, $semester);
        
        if (!empty($mapel)) {
            echo json_encode([
                'status' => 'success', 
                'mapel' => $mapel
            ]);
        } else {
            echo json_encode([
                'status' => 'error', 
                'message' => 'Tidak ada mata pelajaran ditemukan'
            ]);
        }
    }
}