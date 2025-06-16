<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Tambah Data Pembayaran</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form action="<?php echo base_url('pembayaran/add_process'); ?>" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="nama" class="col-sm-2 control-label">Nama Siswa</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="nama" id="nama" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="tanggal" class="col-sm-2 control-label">Tanggal</label>
                            <div class="col-sm-4">
                                <input type="datetime-local" class="form-control" name="tanggal" id="tanggal" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="jumlah" class="col-sm-2 control-label">Jumlah</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="jumlah" id="jumlah" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="status" class="col-sm-2 control-label">Status</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="status" id="status" required>
                                    <option value="">-- Pilih Status --</option>
                                    <option value="Lunas">Lunas</option>
                                    <option value="Belum Lunas">Belum Lunas</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">Simpan</button>
                                <a href="<?php echo site_url('pembayaran'); ?>" class="btn btn-default">Kembali</a>
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

<script>
$(document).ready(function() {
    // Initialize nama with autocomplete
    $("#nama").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "<?php echo base_url('siswa/get_names'); ?>",
                type: 'post',
                dataType: "json",
                data: {
                    search: request.term
                },
                success: function(data) {
                    response(data);
                }
            });
        },
        minLength: 2
    });

    // Format jumlah as currency
    $('#jumlah').on('keyup', function() {
        var value = $(this).val();
        value = value.replace(/\./g, '');
        if(value != "") {
            value = parseInt(value);
            $(this).val(number_format(value, 0, ',', '.'));
        }
    });
});


</script>