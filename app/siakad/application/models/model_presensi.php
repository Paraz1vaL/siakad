<?php
class Model_presensi extends CI_Model {
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function get_all_presensi() {
        $this->db->select('p.*, s.nama as nama_siswa, m.nama_mapel, j.hari, j.jam');
        $this->db->from('tbl_presensi p');
        $this->db->join('tbl_siswa s', 'p.nim = s.nim');
        $this->db->join('tbl_jadwal j', 'p.id_jadwal = j.id_jadwal');
        $this->db->join('tbl_mapel m', 'j.kd_mapel = m.kd_mapel');
        return $this->db->get()->result();
    }

    public function get_presensi($id_presensi) {
        return $this->db->get_where('tbl_presensi', array('id_presensi' => $id_presensi))->row();
    }

    public function add_presensi($data) {
        return $this->db->insert('tbl_presensi', $data);
    }

    public function update_presensi($id_presensi, $data) {
        $this->db->where('id_presensi', $id_presensi);
        return $this->db->update('tbl_presensi', $data);
    }

    public function delete_presensi($id_presensi) {
        return $this->db->delete('tbl_presensi', array('id_presensi' => $id_presensi));
    }

    public function get_jadwal() {
        $this->db->select('j.id_jadwal, m.nama_mapel, j.hari, j.jam, k.nama_kelas');
        $this->db->from('tbl_jadwal j');
        $this->db->join('tbl_mapel m', 'j.kd_mapel = m.kd_mapel');
        $this->db->join('tbl_kelas k', 'j.kd_kelas = k.kd_kelas');
        return $this->db->get()->result();
    }

    public function get_siswa_by_kelas($kd_kelas) {
        return $this->db->get_where('tbl_siswa', array('kd_kelas' => $kd_kelas))->result();
    }
}
?>