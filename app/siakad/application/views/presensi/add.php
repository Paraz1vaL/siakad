<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Presensi</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/AdminLTE.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Tambah Presensi</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form action="<?php echo site_url('presensi/add'); ?>" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label for="id_jadwal" class="col-sm-2 control-label">Jadwal:</label>
                                    <div class="col-sm-10">
                                        <select name="id_jadwal" id="id_jadwal" class="form-control" required>
                                            <option value="">Pilih Jadwal</option>
                                            <?php foreach ($jadwal as $j): ?>
                                                <option value="<?php echo $j->id_jadwal; ?>"><?php echo $j->nama_mapel . ' - ' . $j->hari . ' ' . $j->jam . ' - ' . $j->nama_kelas; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="nim" class="col-sm-2 control-label">Siswa:</label>
                                    <div class="col-sm-10">
                                        <select name="nim" id="nim" class="form-control" required>
                                            <option value="">Pilih Siswa</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="tanggal" class="col-sm-2 control-label">Tanggal:</label>
                                    <div class="col-sm-10">
                                        <input type="date" name="tanggal" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="status" class="col-sm-2 control-label">Status:</label>
                                    <div class="col-sm-10">
                                        <select name="status" class="form-control" required>
                                            <option value="Hadir">Hadir</option>
                                            <option value="Izin">Izin</option>
                                            <option value="Sakit">Sakit</option>
                                            <option value="Alpa">Alpa</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="keterangan" class="col-sm-2 control-label">Keterangan:</label>
                                    <div class="col-sm-10">
                                        <textarea name="keterangan" class="form-control" rows="3"></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-primary">Simpan</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.wrapper -->

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.18/js/adminlte.min.js"></script>
    
    <script>
    $(document).ready(function() {
        $('#id_jadwal').change(function() {
            var id_jadwal = $(this).val();
            $.ajax({
                url: '<?php echo site_url('presensi/get_siswa_by_kelas'); ?>',
                method: 'POST',
                data: {kd_kelas: id_jadwal},
                dataType: 'json',
                success: function(data) {
                    $('#nim').empty();
                    $('#nim').append('<option value="">Pilih Siswa</option>');
                    $.each(data, function(key, value) {
                        $('#nim').append('<option value="'+ value.nim +'">'+ value.nama +'</option>');
                    });
                }
            });
        });
    });
    </script>
</body>
</html>