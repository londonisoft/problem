@extends('abasvumi.layout.admin')
@section('title','Services create')

@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-9">
            <h1 class="m-0 text-dark"> Create new service</h1>
          </div><!-- /.col -->
          <div class="col-sm-3">
              
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('setting.store') }} " method="POST" enctype="multipart/form-data">

                            {{ csrf_field() }} {{ method_field('POST') }}

                            <div class="row">
                                <input type='hidden' name='id' value="{{ $setting->id }}">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="home_title">Home Title </label>
                                        <input type='text' name="home_title" value="{{ $setting->home_title }}" id='home_title' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="home_title_bn">Home Title (Bn)</label>
                                        <input type='text' name="home_title_bn" value="{{ $setting->home_title_bn }}" id='home_title_bn' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="home_description">Home Description </label>
                                        <input type='text' name="home_description" value="{{ $setting->home_description }}" id='home_description' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="home_description_bn">Home Description (Bn) </label>
                                        <input type='text' name="home_description_bn" value="{{ $setting->home_description_bn }}" id='home_description_bn' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="total_agent">Total Agent </label>
                                        <input type='text' name="total_agent" value="{{ $setting->total_agent }}" id='total_agent' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="total_developer">Total Developer </label>
                                        <input type='text' name="total_developer" value="{{ $setting->total_developer }}" id='total_developer' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="total_supplier">Total Supplier </label>
                                        <input type='text' name="total_supplier" value="{{ $setting->total_supplier }}" id='total_supplier' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="total_sale">Total Sale </label>
                                        <input type='text' name="total_sale" value="{{ $setting->total_sale }}" id='total_sale' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="total_rent">Total Rent </label>
                                        <input type='text' name="total_rent" value="{{ $setting->total_rent }}" id='total_rent' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="footer_text">Footer Text </label>
                                        <input type='text' name="footer_text" value="{{ $setting->footer_text }}" id='footer_text' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="footer_text_bn">Footer Text (Bn) </label>
                                        <input type='text' name="footer_text_bn" value="{{ $setting->footer_text_bn }}" id='footer_text_bn' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="facebook_link">Facebook Link </label>
                                        <input type='text' name="facebook_link" value="{{ $setting->facebook_link }}" id='facebook_link' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="twitter_link">Twitter Link </label>
                                        <input type='text' name="twitter_link" value="{{ $setting->twitter_link }}" id='twitter_link' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="google_link">Google List </label>
                                        <input type='text' name="google_link" value="{{ $setting->google_link }}" id='google_link' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="linkedin_link">Linkedin Link </label>
                                        <input type='text' name="linkedin_link" value="{{ $setting->linkedin_link }}" id='linkedin_link' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email </label>
                                        <input type='text' name="email" value="{{ $setting->email }}" id='email' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Mobile </label>
                                        <input type='text' name="mobile" value="{{ $setting->mobile }}" id='mobile' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="address">Address </label>
                                        <input type='text' name="address" value="{{ $setting->address }}" id='address' class='form-control'>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="address_bn">Address (Bn) </label>
                                        <input type='text' name="address_bn" value="{{ $setting->address_bn }}" id='address_bn' class='form-control'>
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="thumbnail">Logo <span class="text-danger" title="Required">*</span></label>
                                        <input type='file' id="logo" name="logo" class="form-control"/>
                                        <img id="propertiesThumbnail" src="{{ asset('/abasvumi/admin/images/default_bg.jpg') }}" alt="Thumbnail image" width="100" class="mt-1"/>
                                        <span class="text-danger errorThumbnail"></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="thumbnail">Favicon <span class="text-danger" title="Required">*</span></label>
                                        <input type='file' id="favicon" name="favicon" class="form-control"/>
                                        <img id="propertiesThumbnail" src="{{ asset('/abasvumi/admin/images/default_bg.jpg') }}" alt="Thumbnail image" width="100" class="mt-1"/>
                                        <span class="text-danger errorThumbnail"></span>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-success" id="createEducation">Save</button>
                                    <a href="{{ route('service.index') }}" class="btn btn-danger" >Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
  </div>
  <!-- /.content-wrapper -->

@endsection
@section('scripts')
<script src="{{ asset('abasvumi/admin/js/service.js') }}"></script>
<script src="{{ asset('/abasvumi/admin/js/select2.full.min.js') }}"></script>
<script>
    $(".services").addClass("menu-open");
    $(".nav-service").addClass("active");
</script>


<script type="text/javascript">
    $(document).ready(function() {

        $('#description').summernote();
        $('#bn_description').summernote();
        $('.select2').select2();

        @if(Session::has("success"))
            toastr.success("{{ Session::get('success') }}");
        @endif

        @if(Session::has("warning"))
            toastr.warning("{{ Session::get('warning') }}");
        @endif

        @if(Session::has("error"))
            toastr.error("{{ Session::get('error') }}");
        @endif

    });

    $(document).ready(function() {

        function readURL(input) {
            if (input.files && input.files[0]) {

                var reader = new FileReader();
                if(input.id == 'logo'){
                    reader.onload = function(e) {
                        $('#propertiesThumbnail').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'favicon'){
                    reader.onload = function(e) {
                        $('#imageOne').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_two'){
                    reader.onload = function(e) {
                        $('#imageTwo').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_three'){
                    reader.onload = function(e) {
                        $('#imageThree').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_four'){
                    reader.onload = function(e) {
                        $('#imageFour').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_five'){
                    reader.onload = function(e) {
                        $('#imageFive').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_six'){
                    reader.onload = function(e) {
                        $('#imageSix').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_seven'){
                    reader.onload = function(e) {
                        $('#imageSeven').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_eight'){
                    reader.onload = function(e) {
                        $('#imageEight').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_nine'){
                    reader.onload = function(e) {
                        $('#imageNine').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                reader.readAsDataURL(input.files[0]); // convert to base64 string
            }
        }

        $("#logo").change(function() {
            readURL(this);
        });

        $("#favicon").change(function() {
            readURL(this);
        });

        $("#image_two").change(function() {
            readURL(this);
        });

        $("#image_three").change(function() {
            readURL(this);
        });

        $("#image_four").change(function() {
            readURL(this);
        });

        $("#image_five").change(function() {
            readURL(this);
        });

        $("#image_six").change(function() {
            readURL(this);
        });

        $("#image_seven").change(function() {
            readURL(this);
        });

        $("#image_eight").change(function() {
            readURL(this);
        });

        $("#image_nine").change(function() {
            readURL(this);
        });

    });

</script>

@endsection
@section('styles')
    <link rel="stylesheet" href="{{ asset('/abasvumi/admin/css/select2.min.css') }}"/>
    <link rel="stylesheet" href="{{ asset('/abasvumi/admin/css/select2-bootstrap4.min.css') }}"/>
    <style>
        .select2-container--default .select2-selection--single {padding: 0;}
        .select2-container--default .select2-selection--multiple .select2-selection__choice{color:#000}
    </style>
@endsection