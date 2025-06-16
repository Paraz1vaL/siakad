<?php

class Model_pembayaran extends CI_Model
{
    public $table = "tbl_pembayaran";

    // Menyimpan data pembayaran baru
    function save()
    {
        $jumlah = str_replace('.', '', $this->input->post('jumlah', TRUE)); // Remove thousand separator
        
        $data = array(
            'nama'       => $this->input->post('nama', TRUE),
            'tanggal'   => $this->input->post('tanggal', TRUE),
            'jumlah'    => $jumlah,
            'status'    => $this->input->post('status', TRUE),
        );
        $this->db->insert($this->table, $data);
    }

    // Memperbarui data pembayaran yang ada
    function update()
    {
        $jumlah = str_replace('.', '', $this->input->post('jumlah', TRUE)); // Remove thousand separator
        
        $data = array(
            'nama'       => $this->input->post('nama', TRUE),
            'tanggal'   => $this->input->post('tanggal', TRUE),
            'jumlah'    => $jumlah,
            'status'    => $this->input->post('status', TRUE),
        );
        $id_pembayaran = $this->input->post('id_pembayaran');
        $this->db->where('id_pembayaran', $id_pembayaran);
        $this->db->update($this->table, $data);
    }

    // Mendapatkan semua data pembayaran
    function getAllPembayaran()
    {
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->order_by('tanggal', 'DESC'); // Order by latest payment
        $query = $this->db->get();
        return $query->result_array();
    }

    // Mendapatkan data pembayaran berdasarkan ID
    function getPembayaranById($id_pembayaran)
    {
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where('id_pembayaran', $id_pembayaran);
        $query = $this->db->get();
        return $query->row_array();
    }

    // Menghapus data pembayaran
    function delete($id_pembayaran)
    {
        $this->db->where('id_pembayaran', $id_pembayaran);
        $this->db->delete($this->table);
    }

    // Get pembayaran by nama
    function getPembayaranByNama($nama)
    {
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where('nama', $nama);
        $this->db->order_by('tanggal', 'DESC');
        $query = $this->db->get();
        return $query->result_array();
    }

    // Get total pembayaran by nama
    function getTotalPembayaranByNama($nama)
    {
        $this->db->select_sum('jumlah');
        $this->db->where('nama', $nama);
        $this->db->where('status', 'Lunas');
        $query = $this->db->get($this->table);
        return $query->row()->jumlah;
    }
}
?>