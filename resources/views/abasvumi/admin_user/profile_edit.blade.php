@extends('abasvumi.layout.admin')
@section('title','Profile')

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Edit profile</h1>
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
          <div class="col-6">
            <div class="card">
                <div class="card-body">
                <form  action="{{ route('user.profile.update') }}" method="POST" enctype="multipart/form-data">
                      {{ csrf_field() }} {{ method_field('POST') }}
                        <div class="form-group">
                            <label for="name">Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" name="name" class="form-control" placeholder="Name" required value="{{ Auth::guard('web')->user()->name }}"/>
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="email">Email <span class="text-danger" title="Required">*</span></label>
                            <input type="text" name="email" class="form-control" placeholder="Email" required value="{{ Auth::guard('web')->user()->email }}"/>
                            <span class="text-danger errorEmail"></span>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone <span class="text-danger" title="Required">*</span></label>
                            <input type="text" name="phone" class="form-control" placeholder="Phone" required value="{{ Auth::guard('web')->user()->phone }}">
                            <span class="text-danger errorPhone"></span>
                        </div>
                        
                        <div class="form-group">
                            <label for="image">Image</label>
                            <input type="file" name="image" class="form-control">
                            <span class="text-danger errorImage"></span>
                        </div>
                        <input type="submit" class="btn btn-success" value="Update Profile"/>
                    </form>
                </div>
              </div>
          </div>
          <div class="col-6">
            <div class="card">
                    <div class="card-body" style="padding:115px;text-align:center">
                        @if( Auth::user()->image != null)
                            <img src="{{ asset(Auth::user()->image) }}" class="img-round" style="width: 150px;" alt="User Image">
                        @else
                            <img src="{{ asset('abasvumi/admin/images/avatar.png') }}" class="img-round"  style="width: 150px;" alt="User Image">
                        @endif
                        <p><b>Current Avater</b></p>
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