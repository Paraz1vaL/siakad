<?php

	class Jadwal extends CI_Controller
	{
		
		function __construct()
		{
			parent::__construct();
			//checkAksesModule();
			// $this->load->library('ssp');
			$this->load->model('model_jadwal');
		}

		function index() {
			// Siswa view (id_level_user 4 = siswa)
			if ($this->session->userdata('id_level_user') == 5) {
				$sql = "SELECT tj.id_jadwal, tju.nama_jurusan, ttk.nama_tingkatan, tm.nama_mapel, 
						tj.jam, tr.nama_ruangan, tj.hari, tj.semester, tg.nama_guru
						FROM tbl_jadwal AS tj
						JOIN tbl_jurusan AS tju ON tj.kd_jurusan = tju.kd_jurusan 
						JOIN tbl_ruangan AS tr ON tj.kd_ruangan = tr.kd_ruangan
						JOIN tbl_mapel AS tm ON tj.kd_mapel = tm.kd_mapel
						JOIN tbl_tingkatan_kelas AS ttk ON tj.kd_tingkatan = ttk.kd_tingkatan
						JOIN tbl_guru AS tg ON tj.id_guru = tg.id_guru
						WHERE tj.kd_kelas = '".$this->session->userdata('kd_kelas')."'
						ORDER BY FIELD(tj.hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'),
						tj.jam ASC";
				$data['jadwal'] = $this->db->query($sql);
				$this->template->load('template', 'jadwal/jadwal_view_siswa', $data);
			}
			// Guru view (id_level_user 3 = guru) 
			else if ($this->session->userdata('id_level_user') == 3) {
				$sql = "SELECT tj.id_jadwal, tju.nama_jurusan, ttk.nama_tingkatan, tm.nama_mapel, 
						tj.jam, tr.nama_ruangan, tj.hari, tj.semester
						FROM tbl_jadwal AS tj
						JOIN tbl_jurusan AS tju ON tj.kd_jurusan = tju.kd_jurusan 
						JOIN tbl_ruangan AS tr ON tj.kd_ruangan = tr.kd_ruangan
						JOIN tbl_mapel AS tm ON tj.kd_mapel = tm.kd_mapel
						JOIN tbl_tingkatan_kelas AS ttk ON tj.kd_tingkatan = ttk.kd_tingkatan
						WHERE tj.id_guru = ".$this->session->userdata('id_guru')."
						ORDER BY FIELD(tj.hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'),
						tj.jam ASC";
				$data['jadwal'] = $this->db->query($sql);
				$this->template->load('template', 'jadwal/jadwal_ajar_guru', $data);
			} 
			// Admin view
			else {
				$this->template->load('template', 'jadwal/view');
			}
		}
	
		function delete_dataJadwal($id) {
			// Check if user has permission
			if ($this->session->userdata('id_level_user') != 1 && 
				$this->session->userdata('id_level_user') != 2) {
				$this->session->set_flashdata('message', 'Anda tidak memiliki hak akses untuk menghapus jadwal');
				redirect('jadwal');
			}
	
			try {
				$this->db->trans_start();
				$this->db->where('id_jadwal', $id);
				$delete = $this->db->delete('tbl_jadwal');
				$this->db->trans_complete();
	
				if ($this->db->trans_status() === FALSE) {
					$this->session->set_flashdata('message', 'Gagal menghapus jadwal');
				} else {
					$this->session->set_flashdata('message', 'Jadwal berhasil dihapus');
				}
			} catch (Exception $e) {
				$this->session->set_flashdata('message', 'Error: ' . $e->getMessage());
			}
	
			redirect('jadwal');
		}
	
		function dataJadwal() {
			$kode_jurusan = $_GET['kd_jurusan'];
			$kode_tingkatan = $_GET['kd_tingkatan'];
			$kelas = $_GET['kelas'];
	
			echo "<table class='table table-striped table-bordered table-hover table-full-width dataTable'>
					<thead>
						<tr>
							<th class='text-center'>NO</th>
							<th class='text-center'>MATA PELAJARAN</th>
							<th class='text-center'>GURU</th>
							<th class='text-center'>RUANGAN</th>
							<th class='text-center'>HARI</th>
							<th class='text-center'>JAM</th>
							<th class='text-center'>AKSI</th>
						</tr>
					</thead>";
	
			$sql_datajadwal = "SELECT tj.id_jadwal, tm.nama_mapel, tg.id_guru, tg.nama_guru, tr.kd_ruangan, tj.hari, tj.jam
							  FROM tbl_jadwal AS tj, tbl_mapel AS tm, tbl_guru AS tg, tbl_ruangan AS tr
							  WHERE tj.kd_mapel = tm.kd_mapel 
							  AND tj.id_guru = tg.id_guru 
							  AND tj.kd_ruangan = tr.kd_ruangan 
							  AND tj.kd_jurusan = '$kode_jurusan' 
							  AND tj.kd_kelas = '$kelas'";
			$data_jadwal = $this->db->query($sql_datajadwal)->result();
			$no = 1;
			$jam_pelajaran = $this->model_jadwal->jamPelajaran();
			$hari = array(
				'Senin'  => 'Senin',
				'Selasa' => 'Selasa',
				'Rabu'   => 'Rabu',
				'Kamis'  => 'Kamis',
				'Jumat'  => 'Jumat'
				
			);
	
			foreach ($data_jadwal as $row) {
				echo "<tr>
						<td class='text-center'>$no</td>
						<td>$row->nama_mapel</td>
						<td>".cmb_dinamis('guru', 'tbl_guru', 'nama_guru', 'id_guru', $row->id_guru, "id='guru".$row->id_jadwal."' onChange='updateGuru(".$row->id_jadwal.")'")."</td>
						<td>".cmb_dinamis('ruangan', 'tbl_ruangan', 'nama_ruangan', 'kd_ruangan', $row->kd_ruangan, "id='ruangan".$row->id_jadwal."' onChange='updateRuangan(".$row->id_jadwal.")'")."</td>
						<td>".form_dropdown('hari', $hari, $row->hari, "class='form-control' id='hari".$row->id_jadwal."' onChange='updateHari(".$row->id_jadwal.")'")."</td>
						<td>".form_dropdown('jam', $jam_pelajaran, $row->jam, "class='form-control' id='jam".$row->id_jadwal."' onChange='updateJam(".$row->id_jadwal.")'")."</td>
						<td class='text-center'>
							<a href='javascript:void(0)' onclick='deleteJadwal(".$row->id_jadwal.")' class='btn btn-xs btn-danger' data-placement='top' title='Delete'>
								<i class='fa fa-times fa fa-white'></i>
							</a>
						</td>
					</tr>";
				$no++;
			}
	
			echo "</table>";
			
			// Add JavaScript for delete confirmation
			echo "<script>
					function deleteJadwal(id) {
						if (confirm('Apakah anda yakin ingin menghapus jadwal ini?')) {
							window.location.href = '".site_url('jadwal/delete_dataJadwal/')."' + id;
						}
					}
				 </script>";
		}

		function update_guru()
		{
			$idguru 	= $_GET['id_guru'];
			$idjadwal 	= $_GET['id_jadwal'];
			$this->db->where('id_jadwal', $idjadwal);
			$this->db->update('tbl_jadwal', array('id_guru' => $idguru));
		}

		function update_ruangan()
		{
			$kdruangan 	= $_GET['kd_ruangan'];
			$idjadwal 	= $_GET['id_jadwal'];
			$this->db->where('id_jadwal', $idjadwal);
			$this->db->update('tbl_jadwal', array('kd_ruangan' => $kdruangan));
		}

		function update_hari()
		{
			$harinya 	= $_GET['hari'];
			$idjadwal 	= $_GET['id_jadwal'];
			$this->db->where('id_jadwal', $idjadwal);
			$this->db->update('tbl_jadwal', array('hari' => $harinya));
		}

		function update_jam()
		{
			$jamnya 	= $_GET['jam'];
			$idjadwal 	= $_GET['id_jadwal'];
			$this->db->where('id_jadwal', $idjadwal);
			$this->db->update('tbl_jadwal', array('jam' => $jamnya));
		}

		function tampil_kelas()
		{
			echo "<select id='kelas' name='kelas' class='form-control' onChange='loadPelajaran()'>";

			// menggunakan get_where
			// $where = array('kd_tingkatan' => $_GET['kd_tingkatan'], 'kd_jurusan' => $_GET['jurusan']);
			// $kelas = $this->db->get_where('tbl_kelas', $where);

			// menggunakan get
			$this->db->where('kd_jurusan', $_GET['kd_jurusan']);
			$this->db->where('kd_tingkatan', $_GET['kd_tingkatan']);
			$kelas = $this->db->get('tbl_kelas');
			
			foreach ($kelas->result() as $row) {
				echo "<option value='$row->kd_kelas'>$row->nama_kelas</option>";
			}

			echo "</select>";
		}

		function cetak_jadwal() {
			$kelas = $_POST['kelas'];
			$this->load->library('CFPDF');
			
			$days = array(
				'SENIN'  => 'SENIN',
				'SELASA' => 'SELASA',
				'RABU'   => 'RABU',
				'KAMIS'  => 'KAMIS',
				'JUMAT'  => 'JUMAT',
			);
			
			// Create PDF instance
			$pdf = new FPDF('L', 'mm', 'A4');
			$pdf->AddPage();
			
			// Call the header generation function
			$this->generate_pdf_header($pdf);

			// Tambahkan judul jadwal kelas
			$pdf->SetFont('Arial', 'B', 14);
			$pdf->Cell(0, 10, 'JADWAL KELAS ' . strtoupper($kelas), 0, 1, 'C');
			$pdf->Ln(4);
			
			// Table headers for the schedule
			$pdf->SetFont('Arial', 'B', 8.5);
			$pdf->Cell(8, 10, 'NO', 1, 0, 'C');
			$pdf->Cell(25, 10, 'WAKTU', 1, 0, 'C');
			
			foreach ($days as $day) {
			$pdf->Cell(49, 10, $day, 1, 0, 'C');
			}
			$pdf->Cell(30, 10, '', 0, 1, 'C');
			
			$jam_ajar = $this->model_jadwal->jamPelajaran();
			$no = 1;
			
			// Loop through the schedule to print
			foreach ($jam_ajar as $jam) {
				// Check if it's the break time after the 3rd or 4th lesson
				if ($no == 3 || $no == 4) {
					$pdf->Cell(278, 10, 'ISTIRAHAT', 1, 0, 'C');
					$pdf->Cell(30, 10, '', 0, 1, 'C');
				}

				if ($no == 1) {
					$pdf->Cell(278, 10, 'UPACARA / APEL PAGI', 1, 0, 'C');
					$pdf->Cell(30, 10, '', 0, 1, 'C');
				}
				
				// Print lesson details
				$pdf->Cell(8, 10, $no, 1, 0, 'C');
				$pdf->Cell(25, 10, $jam, 1, 0, 'C');
				
				foreach ($days as $day) {
					$pdf->Cell(49, 10, $this->getPelajaran($jam, $day, $kelas), 1, 0, 'C');
				}
				$pdf->Cell(30, 10, '', 0, 1, 'C');
				$no++;
			}
			
			$pdf->Output();
		}
		
		private function generate_pdf_header($pdf) {
			$pdf->SetFont('Arial', 'B', 14);
			$pdf->Cell(278, 14, 'SMK CAKRABUANA', 0, 5, 'C');

		}

		function generate_jadwal() {
			if (isset($_POST['submit'])) {
				$this->model_jadwal->generateJadwal();
			}
			redirect('jadwal');
		}
		
		

		

	 	function getPelajaran($jam, $hari, $kelas) {
	 		$sql = "SELECT tj.*,tm.nama_mapel
                   FROM tbl_jadwal as tj, tbl_mapel as tm 
                   WHERE tj.kd_mapel=tm.kd_mapel and tj.kd_kelas='$kelas' and tj.hari='$hari' and tj.jam='$jam'";
	 		$pelajaran = $this->db->query($sql);
	 		if ($pelajaran->num_rows()>0) {
	 			$row = $pelajaran->row_array();
	 			return $row['nama_mapel'];
	 		} else {
	 			return '-';
	 		}
	 	}

		

	}

?>