<section class="content">
    <div class="row">
        <!-- Info Box -->
        <div class="col-xs-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <table class="table table-bordered">
                        <tr>
                            <td width="200">Tahun Akademik</td>
                            <td> : <?php echo get_tahun_akademik('tahun_akademik'); ?></td>
                        </tr>
                        <tr>
                            <td>Semester</td>
                            <td> : <?php echo get_tahun_akademik('semester'); ?></td>
                        </tr>
                        <tr>
                            <td>Jurusan </td>
                            <td> : 
                            <?php 
                            $selected_kelas = $kelas[0]; 
                            ?>
                            <input type="text" class="text" value="<?= $selected_kelas->nama_jurusan ?>" style="width: 100%; max-width: 500px; border: none; background-color: transparent; outline: none;">
                        </tr>
                        <tr>
                            <td> Tingkatan </td>
                            <td> :
                                <?php 
                                $selected_kelas = $kelas[0]; 
                                ?>
                                <input type="text" class="text" value="<?= $selected_kelas->nama_kelas ?>" style="width: 100%; max-width: 500px; border: none; background-color: transparent; outline: none;">
                                <input type="hidden" name="kd_kelas" id="kd_kelas" value="<?= $selected_kelas->kd_kelas ?>">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <!-- Main Content Box -->
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Input Nilai Siswa</h3>
                </div>
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center" width="100">NIM</th>
                                    <th>Nama</th>
                                    <th class="text-center" width="150">Aksi</th>
                                </tr>
                            </thead>
                            <tbody id="nilai-content">
                                <!-- Data akan dimuat secara dinamis -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
$(document).ready(function () {
    var kd_kelas = $('#kd_kelas').val();

    if (kd_kelas) {
        $.ajax({
            url: '<?= site_url('nilai/get_siswa_by_kelas') ?>',
            type: 'POST',
            data: { kd_kelas: kd_kelas },
            dataType: 'json',
            success: function (response) {
                if (response.status === 'error') {
                    alert(response.message);
                    return;
                }

                let html = '';
                response.siswa.forEach(function (siswa) {
                    html += `
                        <tr>
                            <td class="text-center">${siswa.nim}</td>
                            <td>${siswa.nama}</td>
                            <td class="text-center">
                                <button type="button" class="btn btn-primary btn-sm btn-input-nilai" data-nim="${siswa.nim}">
                                    Input Nilai
                                </button>
                            </td>
                        </tr>
                    `;
                });
                $('#nilai-content').html(html);
            },
        });
    }
    // Event untuk membuka form input nilai per siswa
    $(document).on('click', '.btn-input-nilai', function () {
    const nim = $(this).data('nim');
    
    // Verify the NIM is being passed correctly
    console.log('Selected NIM:', nim);

    // Add error handling to the AJAX request
    $.ajax({
        url: '<?= site_url('nilai/get_mapel_by_siswa') ?>',
        type: 'POST',
        data: { nim: nim },
        dataType: 'json',
        success: function (response) {
            if (response.status === 'success' && response.mapel.length > 0) {
                let html = '';
                response.mapel.forEach(function (mapel) {
                    html += `
                        <tr>
                            <td>${mapel.nama_mapel}</td>
                            <td class="text-center">
                                <input type="hidden" name="id_jadwal[]" value="${mapel.id_jadwal}">
                                <input type="number" name="nilai[]" class="form-control" min="0" max="100" placeholder="Nilai">
                            </td>
                        </tr>
                    `;
                });
                $('#modal-nilai-content').html(html);
                $('#modal-nilai').modal('show');
            } else {
                alert('Tidak ada mata pelajaran untuk siswa ini');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error fetching mapel:', error);
            alert('Gagal memuat mata pelajaran');
        }
    });
});

    // Submit nilai per siswa
    $('#form-nilai').submit(function (e) {
        e.preventDefault();
        $.ajax({
            url: '<?= site_url('nilai/save_nilai') ?>',
            type: 'POST',
            data: $(this).serialize(),
            dataType: 'json',
            success: function (response) {
                alert(response.message);
                if (response.status === 'success') {
                    $('#modal-nilai').modal('hide');
                }
            },
        });
    });
});
</script>

<!-- Modal Input Nilai -->
<!-- Modal Input Nilai -->
<div id="modal-nilai" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Input Nilai Siswa</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="form-nilai">
                <div class="modal-body">
                    <input type="hidden" name="nim" id="modal-nim">
                    <input type="hidden" name="kd_kelas" id="modal-kd-kelas">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Mata Pelajaran</th>
                                <th class="text-center" width="150">Nilai</th>
                            </tr>
                        </thead>
                        <tbody id="modal-nilai-content">
                            <!-- Data mapel akan dimuat secara dinamis -->
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Simpan Nilai</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function () {
    // Modify the btn-input-nilai click event
    $(document).on('click', '.btn-input-nilai', function () {
        const nim = $(this).data('nim');
        const kd_kelas = $('#kd_kelas').val(); // Get the class code from the hidden input

        $('#modal-nim').val(nim);
        $('#modal-kd-kelas').val(kd_kelas);

        $.ajax({
            url: '<?= site_url('nilai/get_mapel_by_siswa') ?>',
            type: 'POST',
            data: { 
                nim: nim,
                kd_kelas: kd_kelas
            },
            dataType: 'json',
            success: function (response) {
                if (response.status === 'success' && response.mapel.length > 0) {
                    let html = '';
                    response.mapel.forEach(function (mapel) {
                        html += `
                            <tr>
                                <td>${mapel.nama_mapel}</td>
                                <td class="text-center">
                                    <input type="hidden" name="id_jadwal[]" value="${mapel.id_jadwal}">
                                    <input type="number" name="nilai[]" class="form-control" min="0" max="100" placeholder="Nilai" style="width:100px; margin:0 auto;">
                                </td>
                            </tr>
                        `;
                    });
                    $('#modal-nilai-content').html(html);
                    $('#modal-nilai').modal('show');
                } else {
                    alert('Tidak ada mata pelajaran untuk siswa ini');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error fetching mapel:', error);
                alert('Gagal memuat mata pelajaran');
            }
        });
    });
});

// Modify form submission handler
$('#form-nilai').submit(function (e) {
    e.preventDefault();
    
    // Add loading state to submit button
    const submitBtn = $(this).find('button[type="submit"]');
    submitBtn.prop('disabled', true).html('Menyimpan...');

    $.ajax({
        url: '<?= site_url('nilai/save_nilai') ?>',
        type: 'POST',
        data: $(this).serialize(),
        dataType: 'json',
        success: function (response) {
            if (response.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Berhasil!',
                    text: response.message,
                    timer: 1500,
                    showConfirmButton: false
                });
                $('#modal-nilai').modal('hide');
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal',
                    text: response.message
                });
            }
        },
        error: function() {
            Swal.fire({
                icon: 'error', 
                title: 'Kesalahan',
                text: 'Gagal menyimpan nilai'
            });
        },
        complete: function() {
            // Restore submit button
            submitBtn.prop('disabled', false).html('Simpan Nilai');
        }
    });
});
</script>