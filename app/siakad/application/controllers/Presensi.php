<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Presensi extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('model_presensi');
        $this->load->helper('url');
    }

    public function index() {
        $data['presensi'] = $this->model_presensi->get_all_presensi();
        $data['contents'] = $this->load->view('presensi/view', $data, TRUE);
        $this->load->view('template', $data);
    }

    public function add() {
        if ($this->input->post()) {
            $data = array(
                'id_jadwal' => $this->input->post('id_jadwal'),
                'nim' => $this->input->post('nim'),
                'tanggal' => $this->input->post('tanggal'),
                'status' => $this->input->post('status'),
                'keterangan' => $this->input->post('keterangan')
            );
            $this->model_presensi->add_presensi($data);
            redirect('presensi');
        }
        $data['jadwal'] = $this->model_presensi->get_jadwal();
        $data['contents'] = $this->load->view('presensi/add', $data, TRUE);
        $this->load->view('template', $data);
    }

    public function edit($id_presensi) {
        if ($this->input->post()) {
            $data = array(
                'id_jadwal' => $this->input->post('id_jadwal'),
                'nim' => $this->input->post('nim'),
                'tanggal' => $this->input->post('tanggal'),
                'status' => $this->input->post('status'),
                'keterangan' => $this->input->post('keterangan')
            );
            $this->model_presensi->update_presensi($id_presensi, $data);
            redirect('presensi');
        }
        $data['presensi'] = $this->model_presensi->get_presensi($id_presensi);
        $data['jadwal'] = $this->model_presensi->get_jadwal();
        $data['contents'] = $this->load->view('presensi/edit', $data, TRUE);
        $this->load->view('template', $data);
    }

    public function delete($id_presensi) {
        $this->model_presensi->delete_presensi($id_presensi);
        redirect('presensi');
    }

    public function get_siswa_by_kelas() {
        $kd_kelas = $this->input->post('kd_kelas');
        $siswa = $this->model_presensi->get_siswa_by_kelas($kd_kelas);
        echo json_encode($siswa);
    }
}