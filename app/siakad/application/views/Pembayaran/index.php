<section class="content">
    <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Data Pembayaran</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            
            <!-- button add -->
            <?php
                echo anchor('pembayaran/add', '<button class="btn bg-navy btn-flat margin">Tambah Data</button>');
                echo anchor('pembayaran/form', '<button class="btn btn-warning btn-flat margin">Import Data</button>');
            ?>

              <table id="mytable" class="table table-striped table-bordered table-hover table-full-width dataTable" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>NAMA SISWA</th>
                        <th>TANGGAL</th>
                        <th>JUMLAH</th>
                        <th>STATUS</th>
                        <th>AKSI</th>
                    </tr>
                </thead>
              </table>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>

<script src="<?php echo base_url(); ?>assets/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url(); ?>assets/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="<?php echo base_url(); ?>assets/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

<script>
    $(document).ready(function() {
        var t = $('#mytable').DataTable( {
            "ajax": '<?php echo site_url('pembayaran/data'); ?>',
            "order": [[ 2, 'desc' ]], // Order by date descending
            "columns": [
                {
                    "data": null,
                    "width": "50px",
                    "class": "text-center",
                    "orderable": false,
                },
                {
                    "data": "nama",
                    "width": "200px", // Increased width for names
                },
                { 
                    "data": "tanggal",
                    "width": "150px",
                    "class": "text-center",
                    "render": function(data, type, row) {
                        // Format date nicely
                        var date = new Date(data);
                        return date.toLocaleDateString('id-ID', { 
                            day: '2-digit',
                            month: 'short',
                            year: 'numeric',
                            hour: '2-digit',
                            minute: '2-digit'
                        });
                    }
                },
                { 
                    "data": "jumlah",
                    "width": "150px",
                    "class": "text-center",
                    "render": function(data, type, row) {
                        return 'Rp ' + number_format(data, 0, ',', '.'); // Added Rp prefix
                    }
                },
                { 
                    "data": "status",
                    "width": "100px",
                    "class": "text-center",
                    "render": function(data, type, row) {
                        var badge = '';
                        if(data === 'Lunas') {
                            badge = '<span class="badge bg-green">Lunas</span>';
                        } else {
                            badge = '<span class="badge bg-red">Belum Lunas</span>';
                        }
                        return badge;
                    }
                },
                { 
                    "data": "aksi",
                    "width": "100px",
                    "class": "text-center"
                },
            ]
        });
           
        t.on('order.dt search.dt', function () {
            t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                cell.innerHTML = i+1;
            });
        }).draw();
    });

    function number_format(number, decimals, dec_point, thousands_sep) {
    // Remove any non-numeric characters
    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');

    // If no decimals are specified, return the original number
    if (!decimals) {
        return number;
    }

    // Convert the number to a float and round it to the specified number of decimals
    var num = parseFloat(number).toFixed(decimals);

    // Add thousands separators if specified
    if (thousands_sep) {
        var parts = num.split('.');
        parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, thousands_sep);
        num = parts.join('.');
    }

    return num;
}
</script>