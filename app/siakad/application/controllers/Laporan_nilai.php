<?php
 
class Laporan_nilai extends CI_Controller
{
    public function __construct() {
        parent::__construct();
        // Check if user is logged in
        if (!$this->session->userdata('id_guru')) {
            redirect('auth/login');
        }
    }
    
    function index()
    {
        // Get wali kelas data with error checking
        $walikelas = $this->db->get_where('tbl_walikelas', 
            array('id_guru' => $this->session->userdata('id_guru')))->row_array();
            
        // Check if wali kelas exists
        if (!$walikelas) {
            $this->session->set_flashdata('error', 'Anda tidak terdaftar sebagai wali kelas');
            redirect('dashboard');
            return;
        }

        // Only proceed if we have valid wali kelas data
        $kelas = "SELECT tk.nama_kelas, tju.nama_jurusan, tm.nama_mapel, ttk.nama_tingkatan 
                  FROM tbl_jadwal AS tj
                  JOIN tbl_jurusan AS tju ON tj.kd_jurusan = tju.kd_jurusan
                  JOIN tbl_kelas AS tk ON tj.kd_kelas = tk.kd_kelas
                  JOIN tbl_mapel AS tm ON tj.kd_mapel = tm.kd_mapel
                  JOIN tbl_tingkatan_kelas AS ttk ON tj.kd_tingkatan = ttk.kd_tingkatan
                  WHERE tj.kd_kelas = ?";

        $siswa = "SELECT ts.nim, ts.nama
                  FROM tbl_riwayat_kelas AS trk
                  JOIN tbl_siswa AS ts ON trk.nim = ts.nim
                  WHERE trk.kd_kelas = ? 
                  AND trk.id_tahun_akademik = ?";

        $data['kelas'] = $this->db->query($kelas, array($walikelas['kd_kelas']))->row_array();
        $data['siswa'] = $this->db->query($siswa, array(
            $walikelas['kd_kelas'],
            get_tahun_akademik('id_tahun_akademik')
        ));

        $this->template->load('template', 'Laporan_nilai/list_siswa', $data);
    }

    function nilai_semester()
    {
        $nim = $this->uri->segment(3);
        if (!$nim) {
            $this->session->set_flashdata('error', 'NIM tidak ditemukan');
            redirect('laporan_nilai');
            return;
        }

        // Get student info with proper JOIN syntax and parameter binding
        $sqlSiswa = "SELECT ts.nama as nama_siswa, ts.nim, tj.nama_jurusan, 
                            tk.nama_kelas, tk.kd_tingkatan, tk.kd_kelas
                     FROM tbl_riwayat_kelas as trk
                     JOIN tbl_siswa as ts ON ts.nim = trk.nim
                     JOIN tbl_kelas as tk ON tk.kd_kelas = ts.kd_kelas
                     JOIN tbl_jurusan as tj ON tk.kd_jurusan = tj.kd_jurusan
                     WHERE trk.nim = ? 
                     AND trk.id_tahun_akademik = ?";

        $siswa = $this->db->query($sqlSiswa, array(
            $nim, 
            get_tahun_akademik('id_tahun_akademik')
        ))->row_array();

        if (!$siswa) {
            $this->session->set_flashdata('error', 'Data siswa tidak ditemukan');
            redirect('laporan_nilai');
            return;
        }

        // Load PDF generation
        $this->load->library('CFPDF');
        $pdf = new FPDF('P', 'mm', 'A4');
        $pdf->AddPage();
        
        // Generate PDF header
        $this->generate_pdf_header($pdf);
        
        // Generate student info
        $this->generate_student_info($pdf, $siswa);
        
        // Generate grades table
        $this->generate_grades_table($pdf, $siswa);
        
        // Generate footer
        $this->generate_pdf_footer($pdf);
        
        $pdf->Output();
    }

    private function generate_pdf_header($pdf) {
        $pdf->SetFont('Arial', 'B', 12);
        $pdf->Cell(190, 5, 'NAMA SEKOLAH', 1, 1, 'C');
        $pdf->SetFont('Arial', 'B', 14);
        $pdf->Cell(190, 7, 'SMK CAKRABUANA', 1, 1, 'C');
        $pdf->SetFont('Arial', '', 8);
        $pdf->Cell(190, 5, 'Jl. HUBUNGAN TANPA STATUS', 1, 1, 'C');
        $pdf->Cell(190, 5, '', 0, 1);
    }

    private function generate_student_info($pdf, $siswa) {
        $pdf->SetFont('Arial', 'B', 9);
        $pdf->Cell(30, 5, 'NIM', 0, 0, 'L');
        $pdf->Cell(88, 5, ': ' . $siswa['nim'], 0, 0, 'L');
        $pdf->Cell(30, 5, 'KELAS', 0, 0, 'L');
        $pdf->Cell(40, 5, ': ' . $siswa['nama_kelas'], 0, 1, 'L');
        
        $pdf->Cell(30, 5, 'NAMA', 0, 0, 'L');
        $pdf->Cell(88, 5, ': ' . $siswa['nama_siswa'], 0, 0, 'L');
        $pdf->Cell(30, 5, 'TAHUN AJARAN', 0, 0, 'L');
        $pdf->Cell(40, 5, ': ' . get_tahun_akademik('tahun_akademik'), 0, 1, 'L');
        
        $pdf->Cell(30, 5, 'JURUSAN', 0, 0, 'L');
        $pdf->Cell(88, 5, ': ' . $siswa['nama_jurusan'], 0, 0, 'L');
        $pdf->Cell(30, 5, 'SEMESTER', 0, 0, 'L');
        $pdf->Cell(40, 5, ': ' . get_tahun_akademik('semester'), 0, 1, 'L');
    }

    private function generate_grades_table($pdf, $siswa) {
        $pdf->Cell(1, 10, '', 0, 1);
        
        // Table header
        $pdf->SetFont('Arial', 'B', 9);
        $pdf->Cell(8, 5, 'NO', 1, 0, 'C');
        $pdf->Cell(57, 5, 'Mata Pelajaran', 1, 0, 'C');
        $pdf->Cell(10, 5, 'KKM', 1, 0, 'C');
        $pdf->Cell(12, 5, 'Angka', 1, 0, 'C');
        $pdf->Cell(32, 5, 'Huruf', 1, 0, 'C');
        $pdf->Cell(23, 5, 'Ketercapaian', 1, 0, 'C');
        $pdf->Cell(20, 5, 'Rata Kelas', 1, 0, 'C');
        $pdf->Cell(35, 5, 'Deskripsi Kemampuan', 1, 1, 'C');
        
        // Table content
        $pdf->SetFont('Arial', '', 8,5);
        
        // Updated query to get only subjects taught in the student's class
        $sqlMapel = "SELECT tj.id_jadwal, tm.nama_mapel 
                    FROM tbl_jadwal as tj
                    JOIN tbl_mapel as tm ON tj.kd_mapel = tm.kd_mapel 
                    WHERE tj.kd_tingkatan = ? 
                    AND tj.kd_kelas = ?
                    AND tj.id_tahun_akademik = ?
                    ORDER BY tm.nama_mapel ASC";
        
        $mapel = $this->db->query($sqlMapel, array(
            $siswa['kd_tingkatan'],
            $siswa['kd_kelas'],
            get_tahun_akademik('id_tahun_akademik')
        ))->result();
        
        $no = 1;
        foreach ($mapel as $m) {
            $nilai = check_nilai($siswa['nim'], $m->id_jadwal);
            $kkm = 75; // Default KKM, sesuaikan dengan kebutuhan
            
            // Deskripsi Kemampuan
            $deskripsi_kemampuan = ($nilai >= $kkm) ? 'Pertahankan' : 'Tingkatkan lagi';
            
            $pdf->Cell(8, 5, $no, 1, 0, 'C');
            $pdf->Cell(57, 5, $m->nama_mapel, 1, 0, 'C');
            $pdf->Cell(10, 5, $kkm, 1, 0, 'C');
            $pdf->Cell(12, 5, $nilai, 1, 0, 'C');
            $pdf->Cell(32, 5, Terbilang($nilai), 1, 0, 'C');
            $pdf->Cell(23, 5, $this->ketercapaian_kopetensi($nilai), 1, 0, 'C');
            $pdf->Cell(20, 5, ceil($this->rata_rata_nilai($m->id_jadwal)), 1, 0, 'C');
            $pdf->Cell(35, 5, $deskripsi_kemampuan, 1, 1, 'C');
            $no++;
        }
    }

    private function generate_pdf_footer($pdf) {

        
        $pdf->Cell(190, 5, '', 0, 1);
        $pdf->Cell(45, 15, 'Mengetahui,', 0, 0, 'C');
        $pdf->Cell(87, 5, '', 0, 0, 'c');
        $pdf->Cell(25, 5, 'Diberikan Di', 0, 0, 'c');
        $pdf->Cell(33, 5, ': ', 0, 1, 'L');
        $pdf->Cell(45, 15, 'Orang Tua Wali', 0, 0, 'C');
        $pdf->Cell(87, 5, '', 0, 0, 'c');
        $pdf->Cell(25, 5, 'Pada', 0, 0, 'c');
        $pdf->Cell(33, 5, ': ', 0, 1, 'L');
        $pdf->Cell(132, 5, '', 0, 0, 'c');
        $pdf->Cell(25, 5, 'Wali Kelas', 0, 0, 'c');
        $pdf->Cell(33, 5, ': ', 0, 1, 'L');
    }

    function rata_rata_nilai($id_jadwal) {
        $sql = "SELECT COALESCE(AVG(nilai), 0) as nilai_rata_rata 
                FROM tbl_nilai 
                WHERE id_jadwal = ?";
        $nilai = $this->db->query($sql, array($id_jadwal))->row_array();
        return $nilai['nilai_rata_rata'];
    }

    function ketercapaian_kopetensi($nilai) {
        if ($nilai > 90) {
            return 'Sangat baik';
        } elseif ($nilai > 80 && $nilai <= 90) {
            return 'Baik';
        } elseif ($nilai > 75 && $nilai <= 80) {
            return 'Cukup';
        } else {
            return "Kurang";
        }
    }
}