<?php 
class Pembayaran extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('Model_pembayaran');
        $this->load->library('template');
    }

    public function index() {
        $data['pembayaran'] = $this->Model_pembayaran->getAllPembayaran();
        $this->template->load('template', 'pembayaran/index', $data);
    }

    public function add() {
        $this->template->load('template', 'pembayaran/add');
    }

    public function add_process() {
        $this->Model_pembayaran->save();
        redirect('pembayaran');
    }

    public function edit($id_pembayaran) {
        $data['pembayaran'] = $this->Model_pembayaran->getPembayaranById($id_pembayaran);
        $this->template->load('template', 'pembayaran/edit', $data);
    }

    public function edit_process() {
        $this->Model_pembayaran->update();
        redirect('pembayaran');
    }

    public function data() {
        $pembayaran = $this->Model_pembayaran->getAllPembayaran();
        
        $data = array();
        foreach ($pembayaran as $row) {
            $aksi = '<a href="'.site_url('pembayaran/edit/'.$row['id_pembayaran']).'" class="btn btn-xs btn-primary" title="Edit"><i class="fa fa-edit"></i></a> ';
            $aksi .= '<a href="'.site_url('pembayaran/delete/'.$row['id_pembayaran']).'" class="btn btn-xs btn-danger" title="Delete" onclick="return confirm(\'Anda yakin?\')"><i class="fa fa-trash"></i></a>';
            
            $data[] = array(
                'nama' => $row['nama'],
                'tanggal' => $row['tanggal'],
                'jumlah' => number_format($row['jumlah'], 0, ',', '.'),
                'status' => $row['status'],
                'aksi' => $aksi
            );
        }
        
        $output = array(
            'data' => $data
        );
        
        echo json_encode($output);
    }

    public function get_siswa_names() {
        $search = $this->input->post('search');
        $this->db->like('nama', $search);
        $this->db->select('nama');
        $this->db->from('tbl_siswa');
        $this->db->limit(10);
        $query = $this->db->get();
        
        $result = array();
        foreach($query->result() as $row) {
            $result[] = $row->nama;
        }
        
        echo json_encode($result);
    }

    public function delete($id_pembayaran) {
        $this->Model_pembayaran->delete($id_pembayaran);
        redirect('pembayaran');
    }
}