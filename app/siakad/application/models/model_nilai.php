<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_nilai extends CI_Model {

    public function is_wali_kelas($id_guru, $kd_kelas) {
        $this->db->where('id_guru', $id_guru);
        $this->db->where('kd_kelas', $kd_kelas);
        return $this->db->get('tbl_walikelas')->num_rows() > 0;
    }
    
    
    // Modifikasi get_all_kelas untuk hanya menampilkan kelas yang dipegang
    public function get_all_kelas($id_guru = null) {
        $this->db->select('tk.*, tj.nama_jurusan');
        $this->db->from('tbl_kelas tk');
        $this->db->join('tbl_jurusan tj', 'tk.kd_jurusan = tj.kd_jurusan');
        
        // Jika id_guru ada, filter berdasarkan wali kelas
        if ($id_guru) {
            $this->db->join('tbl_walikelas twk', 'tk.kd_kelas = twk.kd_kelas');
            $this->db->where('twk.id_guru', $id_guru);
        }
        
        return $this->db->get()->result();
    }

    public function get_by_nim($nim)
    {
        $this->db->select('m.nama_mapel, j.id_jadwal');
        $this->db->from('jadwal j');
        $this->db->join('mata_pelajaran m', 'j.id_mapel = m.id_mapel');
        $this->db->join('siswa s', 'j.kd_kelas = s.kd_kelas');
        $this->db->where('s.nim', $nim);

        $query = $this->db->get();
        return $query->result();
    }
    
    // Fungsi-fungsi lain tetap sama seperti sebelumnya
    public function get_siswa_by_kelas($kd_kelas, $tahun_akademik) {
        $this->db->select('ts.nim, ts.nama');
        $this->db->from('tbl_riwayat_kelas trk');
        $this->db->join('tbl_siswa ts', 'trk.nim = ts.nim');
        $this->db->where('trk.kd_kelas', $kd_kelas);
        $this->db->where('trk.id_tahun_akademik', $tahun_akademik);
        return $this->db->get()->result();
    }

    public function get_kelas_by_id($kd_kelas) {
        $this->db->select('tk.*, tj.nama_jurusan');
        $this->db->from('tbl_kelas tk');
        $this->db->join('tbl_jurusan tj', 'tk.kd_jurusan = tj.kd_jurusan');
        $this->db->where('tk.kd_kelas', $kd_kelas);
        return $this->db->get()->row_array();
    }
    
    
    //public function get_all_kelas() {
    //    $this->db->select('tk.*, tj.nama_jurusan');
    //    $this->db->from('tbl_kelas tk');
    //    $this->db->join('tbl_jurusan tj', 'tk.kd_jurusan = tj.kd_jurusan');
    //    return $this->db->get()->result();
    //}
    
    //public function get_siswa_by_kelas($kd_kelas, $tahun_akademik) {
    //    $this->db->select('ts.nim, ts.nama');
    //    $this->db->from('tbl_riwayat_kelas trk');
    //    $this->db->join('tbl_siswa ts', 'trk.nim = ts.nim');
    //    $this->db->where('trk.kd_kelas', $kd_kelas);
    //    $this->db->where('trk.id_tahun_akademik', $tahun_akademik);
    //    return $this->db->get()->result();
    //}
    
    public function get_mapel_by_kelas($kd_kelas, $tahun_akademik) {
        $this->db->select('tj.id_jadwal, tm.nama_mapel');
        $this->db->from('tbl_jadwal tj');
        $this->db->join('tbl_mapel tm', 'tj.kd_mapel = tm.kd_mapel');
        $this->db->where('tj.kd_kelas', $kd_kelas);
        $this->db->where('tj.id_tahun_akademik', $tahun_akademik);
        return $this->db->get()->result();
    }
    
    public function save_or_update_batch_nilai($data) {
        // Cek apakah nilai sudah ada, jika ada update, jika tidak insert
        $this->db->trans_start();
        
        foreach ($data as $item) {
            $existing = $this->db->get_where('tbl_nilai', [
                'nim' => $item['nim'], 
                'id_jadwal' => $item['id_jadwal']
            ])->row();
    
            if ($existing) {
                // Update existing record
                $this->db->where('nim', $item['nim'])
                         ->where('id_jadwal', $item['id_jadwal'])
                         ->update('tbl_nilai', ['nilai' => $item['nilai']]);
            } else {
                // Insert new record
                $this->db->insert('tbl_nilai', $item);
            }
        }
    
        $this->db->trans_complete();
        return $this->db->trans_status();
    }
    
    public function import_nilai($values) {
        if (empty($values)) return false;
        
        // Delete existing records
        $nims = array_unique(array_column($values, 'nim'));
        $jadwals = array_unique(array_column($values, 'id_jadwal'));
        
        $this->db->where_in('nim', $nims);
        $this->db->where_in('id_jadwal', $jadwals);
        $this->db->delete('tbl_nilai');
        
        // Insert new records
        return $this->db->insert_batch('tbl_nilai', $values);
    }

    public function get_mapel_by_student_nim($nim, $tahun_akademik, $semester) {
        $this->db->select('m.kd_mapel, m.nama_mapel, j.id_jadwal');
        $this->db->from('tbl_mapel m');
        $this->db->join('tbl_jadwal j', 'm.kd_mapel = j.kd_mapel');
        $this->db->join('tbl_kelas k', 'j.kd_kelas = k.kd_kelas');
        $this->db->join('tbl_siswa s', 'k.kd_kelas = s.kd_kelas');
        $this->db->where('s.nim', $nim);
        $this->db->where('j.id_tahun_akademik', $tahun_akademik);
        $this->db->where('j.semester', $semester);
        
        return $this->db->get()->result_array();
    }
}