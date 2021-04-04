<!-- /.content-wrapper -->
<footer class="main-footer">
    <strong>Copyright &copy; <?php echo date('Y'); ?> All rights reserved.
  </footer>

</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="{{ asset('abasvumi/admin/js/jquery.min.js') }}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{ asset('abasvumi/admin/js/jquery-ui.min.js') }}"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>$.widget.bridge('uibutton', $.ui.button)</script>
<!-- Bootstrap 4 -->
<script src="{{ asset('abasvumi/admin/js/bootstrap.bundle.min.js') }}"></script>
<!-- daterangepicker -->
<script src="{{ asset('abasvumi/admin/js/moment.min.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/daterangepicker.js') }}"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="{{ asset('abasvumi/admin/js/tempusdominus-bootstrap-4.min.js') }}"></script>
<!-- overlayScrollbars -->
<script src="{{ asset('abasvumi/admin/js/jquery.overlayScrollbars.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('abasvumi/admin/js/adminlte.js') }}"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="{{ asset('abasvumi/admin/js/dashboard.js') }}"></script>
<!-- toastr js -->
<script src="{{ asset('abasvumi/admin/js/toastr.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
  $(function () {
    $(".table").DataTable();
  });
  var image_base_path="http://abasvumi.local/";
  var website_url="http://abasvumi.local/";
</script>
@yield('scripts')
</body>
</html>
