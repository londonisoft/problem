@extends('abasvumi.layout.admin')
@section('title','Password change')

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Password change</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-6 offset-3">
            <div class="card">
                <div class="card-body">
                    <form  action="{{ route('user.password.update') }}" method="POST">
                      {{ csrf_field() }} {{ method_field('POST') }}
                        <div class="form-group">
                            <label for="old_password">Old Password <span class="text-danger" title="Required">*</span></label>
                            <input type="password" name="old_password" class="form-control"  placeholder="Old password"/>
                        </div>
                        <div class="form-group">
                            <label for="new_password">New password <span class="text-danger" title="Required">*</span></label>
                            <input type="password" name="password" class="form-control"  placeholder="New password"/>
                        </div>
                        <div class="form-group">
                            <label for="password_confirmation">Confirm password <span class="text-danger" title="Required">*</span></label>
                            <input type="password" name="password_confirmation"  class="form-control" placeholder="Confirm password">
                            <span class="text-danger errorPhone"></span>
                        </div>
                        
                        <input type="submit" class="btn btn-success" value="Update Password"/>
                    </form>
                </div>
              </div>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    
    <!-- /.content -->
</div>
@endsection
@section('scripts')
<script src="{{ asset('abasvumi/admin/js/user.js') }}"></script>
<script>    
    $(".users").addClass("menu-open");
    $(".nav-admin").addClass("active");

    @if(Session::has("success"))
      toastr.success("{{ Session::get('success') }}");
    @endif

    @if(Session::has("warning"))
      toastr.warning("{{ Session::get('warning') }}");
    @endif

    @if(Session::has("error"))
      toastr.error("{{ Session::get('error') }}");
    @endif

    @if(count($errors) > 0)
      @foreach($errors->all() as $error)
        toastr.warning('{{ $error }}');
      @endforeach
    @endif

</script>
@endsection