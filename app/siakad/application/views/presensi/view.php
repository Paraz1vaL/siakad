<section class="content">
    <div class="row">
        <div class="col-xs-12">

          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Data Table Presensi</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            <!-- button add -->
            <?php
                echo anchor('presensi/add', '<button class="btn bg-navy btn-flat margin">Tambah Data</button>');
                echo anchor('presensi/form', '<button class="btn btn-warning btn-flat margin">Import Data</button>');
                echo anchor('presensi/rekap', '<button class="btn btn-info btn-flat margin">Rekap Presensi</button>');
            ?>

              <table id="mytable" class="table table-striped table-bordered table-hover table-full-width dataTable" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>NIM</th>
                        <th>NAMA</th>
                        <th>TANGGAL</th>
                        <th>MATA PELAJARAN</th>
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
                "ajax": '<?php echo site_url('presensi/data'); ?>',
                "order": [[ 1, 'asc' ]],
                "columns": [
                    {
                        "data": null,
                        "width": "50px",
                        "class": "text-center",
                        "orderable": false,
                    },
                    {
                        "data": "nim",
                        "width": "120px",
                        "class": "text-center"
                    },
                    { 
                        "data": "nama",
                    },
                    { 
                        "data": "tanggal", 
                        "width": "150px",
                        "class": "text-center"
                    },
                    { 
                        "data": "mata_pelajaran",
                        "width": "200px"
                    },
                    { 
                        "data": "status", 
                        "width": "100px",
                        "class": "text-center",
                        "render": function(data, type, row) {
                            if (data === 'Hadir') {
                                return '<span class="label label-success">Hadir</span>';
                            } else if (data === 'Absen') {
                                return '<span class="label label-danger">Absen</span>';
                            } else if (data === 'Izin') {
                                return '<span class="label label-warning">Izin</span>';
                            } else {
                                return data;
                            }
                        }
                    },
                    { 
                        "data": "aksi",
                        "width": "80px",
                        "class": "text-center"
                    },
                ]
            } );
               
            t.on( 'order.dt search.dt', function () {
                t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                    cell.innerHTML = i+1;
                } );
            } ).draw();
        } );
</script>