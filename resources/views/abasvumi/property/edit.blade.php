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
            <h1 class="m-0 text-dark"> Edit property</h1>
            
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
                        <form action="{{ route('property.update',['id'=> $property->id])}}" method="POST" enctype="multipart/form-data">

                            {{ csrf_field() }} {{ method_field('POST') }}

                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="division_id">Division <span class="text-danger" title="Required">*</span></label>
                                        <select id="division_id" name="division_id"  class="form-control">
                                            <option value="">Select division</option>
                                            @foreach($divisions as $division)
                                            <option @if($property->division_id == $division->id) selected @endif value="{{ $division->id }}">{{ $division->name}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger errorDivision"></span>
                                    </div>
                                </div>
                            
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="district_id">District <span class="text-danger" title="Required">*</span></label>
                                        <select id="district_id" name="district_id"  class="form-control districtBydivision">
                                            <option value="">Select district</option>
                                            @foreach($districts as $district)
                                            <option @if($property->district_id == $district->id) selected @endif value="{{ $district->id }}">{{ $district->name}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger errorDistrict"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                    <label for="thana_id">Thana <span class="text-danger" title="Required">*</span></label>
                                    <select id="thana_id" name="thana_id" class="form-control thanaBydistrict">
                                        <option value="">Select Thana</option>
                                        @foreach($thanas as $thana)
                                        <option @if($property->thana_id == $thana->id) selected @endif value="{{ $thana->id }}">{{ $thana->name}}</option>
                                        @endforeach
                                    </select>
                                    <span class="text-danger errorThana"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="property_type_id">Service Type <span class="text-danger" title="Required">*</span></label>
                                        <select id="property_type_id" name="property_type_id" class="form-control select2">
                                            <option value="" disabled>Select Service Type</option>
                                            @foreach($propertyTypes as $propertyType)
                                            <option  @if($property->property_type_id == $propertyType->id) selected @endif value="{{ $propertyType->id }}">{{ $propertyType->name}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger errorServiceType"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="area_id"> Area <span class="text-danger" title="Required">*</span></label>
                                        <select id="area_id" name="area_id" class="form-control select2">
                                            <option value="" disabled>Select Area</option>
                                            @foreach($areas as $area)
                                            <option @if($property->area_id == $area->id) selected @endif value="{{ $area->id }}">{{ $area->name}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger errorArea"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="block_id">Blocks <span class="text-danger" title="Required">*</span></label>
                                        <select id="block_id" name="block_id" class="form-control select2">
                                            <option value="" disabled>Select blocks</option>
                                            @foreach($blocks as $block)
                                            <option @if($property->block_id == $block->id) selected @endif value="{{ $block->id }}">{{ $block->name}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger errorBlock"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="amenit_id">Amenites <span class="text-danger" title="Required">*</span></label>
                                        <select id="amenit_id" name="amenit_ids[]" class="form-control select2" multiple="multiple">
                                            <option value="" disabled>Select Amenites</option>
                                            @foreach($amenities as $amenit)
                                                <option {{ in_array($amenit->id, $propertyAmenities) ? 'selected' : '' }} value="{{ $amenit->id }}">{{ $amenit->name}}</option>
                                            @endforeach
                                        </select>
                                        <span class="text-danger errorAmenit"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="education_id"> Education <span class="text-danger" title="Required">*</span></label>
                                        <select data-placeholder="Select education..." id="education_id" name="education_ids[]"  class="form-control select2" multiple="multiple">
                                            @if(!empty($propertyEducationalInstitutes))
                                                @foreach($educations as $education)
                                                    <option {{ in_array($education->id, $propertyEducationalInstitutes) ? 'selected' : '' }} value="{{ $education->id }}">{{ $education->name}}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                        <span class="text-danger errorEducation"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="hospital_id"> Hospital <span class="text-danger" title="Required">*</span></label>
                                        <select data-placeholder="Select hospital..." id="hospital_id" name="hospital_ids[]" class="form-control select2" multiple="multiple">
                                            @if(!empty($propertyHospitals))
                                                @foreach($hospitals as $hospital)
                                                    <option {{ in_array($hospital->id, $propertyHospitals) ? 'selected' : '' }} value="{{ $hospital->id }}">{{ $hospital->name}}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                        <span class="text-danger errorHospital"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="restaurants_id"> Restaurants <span class="text-danger" title="Required">*</span></label>
                                        <select data-placeholder="Select restaurants..." id="restaurants_id" name="restaurant_ids[]" class="form-control select2" multiple="multiple">
                                            @if(!empty($propertyRestaurants))
                                                @foreach($restaurants as $restaurant)
                                                    <option {{ in_array($restaurant->id, $propertyRestaurants) ? 'selected' : '' }}  value="{{ $restaurant->id }}">{{ $restaurant->name}}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                        <span class="text-danger errorRestaurant"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="parks_id"> Park <span class="text-danger" title="Required">*</span></label>
                                        <select data-placeholder="Select park..." id="parks_id" name="park_ids[]" class="form-control select2" multiple="multiple">
                                            @if(!empty($propertyParks))
                                                @foreach($parks as $park)
                                                    <option {{ in_array($park->id, $propertyParks) ? 'selected' : '' }} value="{{ $park->id }}">{{ $park->name}}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                        <span class="text-danger errorPark"></span>
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="religious_id"> Religious <span class="text-danger" title="Required">*</span></label>
                                        <select data-placeholder="Select religion..." id="religious_id" name="religious_ids[]" class="form-control select2" multiple="multiple">
                                            @if(!empty($propertyReligious))
                                                @foreach($religious as $religiou)
                                                    <option {{ in_array($religiou->id, $propertyReligious) ? 'selected' : '' }} value="{{ $religiou->id }}">{{ $religiou->name}}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                        <span class="text-danger errorReligious"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="title">Ttitle (En)<span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="title" name="title" class="form-control" placeholder="Title Name" value="{{ $property->title }}">
                                        <span class="text-danger errorTitle"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                    <label for="bn_title">Title (Bn)<span class="text-danger" title="Required">*</span></label>
                                    <input type="text" id="bn_title" name="bn_title" class="form-control" placeholder="Bangla Title" value="{{ $property->bn_title }}">
                                    <span class="text-danger errorBnTitle"></span>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                <div class="form-group">
                                    <label for="description">Description (En)<span class="text-danger" title="Required">*</span></label>
                                    <textarea id="description" name="description" class="form-control" placeholder="English description">{{ $property->description }}</textarea>
                                    <span class="text-danger errorDescription"></span>
                                </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                    <label for="bn_description">Description (Bn)<span class="text-danger" title="Required">*</span></label>
                                    <textarea id="bn_description" name="bn_description" class="form-control" placeholder="Bangla Description">{{ $property->bn_description }}</textarea>
                                    <span class="text-danger errorBnDescription"></span>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                    <label for="address">Address <span class="text-danger" title="Required">*</span></label>
                                    <textarea id="address" name="address" class="form-control" placeholder="Address">{{ $property->address }}</textarea>
                                    <span class="text-danger errorAddress"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lat">Lat <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="lat" name="lat" class="form-control" placeholder="lat" value="{{ $property->lat }}">
                                        <span class="text-danger errorLat"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lon">Lon <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="lon" name="lon" class="form-control" placeholder="lon" value="{{ $property->lon }}">
                                        <span class="text-danger errorLon"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="interest_rate">Interest Rate <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="interest_rate" name="interest_rate" class="form-control" placeholder="Interest rate"  value="{{ $property->interest_rate }}">
                                        <span class="text-danger errorInterestRate"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="price"> Price <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="price" name="price" class="form-control" placeholder="Price" value="{{ $property->price }}">
                                        <span class="text-danger errorPrice"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="sqft"> Sqft <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="sqft" name="sqft" class="form-control" placeholder="Sqft" value="{{ $property->sqft }}">
                                        <span class="text-danger errorSqft"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="baths"> Baths <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="baths" name="baths" class="form-control" placeholder="Baths" value="{{ $property->baths }}">
                                        <span class="text-danger errorBaths"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="garage"> Garage <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="garage"name="garage"  class="form-control" placeholder="Garage" value="{{ $property->garage }}">
                                        <span class="text-danger errorGarage"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="balcony"> Balcony <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="balcony" name="balcony" class="form-control" placeholder="Balcony" value="{{ $property->balcony }}">
                                        <span class="text-danger errorBalcony"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="video_link"> Video Link <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="video_link" name="video_link" class="form-control" placeholder="Video link" value="{{ $property->video_link }}">
                                        <span class="text-danger errorVideoLink"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="admin_contact_no"> Admin Contact No <span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="admin_contact_no" name="admin_contact_no"class="form-control" placeholder="Admin Contract No" value="{{ $property->admin_contact_no }}">
                                        <span class="text-danger errorAdminContactNo"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="contact_email">Contact Email<span class="text-danger" title="Required">*</span></label>
                                        <input type="text" id="contact_email" name="contact_email" class="form-control" placeholder="Contract Email" value="{{ $property->contact_email }}">
                                        <span class="text-danger errorContactEmail"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="contact_no_show"> Contact No Show <span class="text-danger" title="Required">*</span></label>
                                        <select id="contact_no_show" name="contact_no_show" class="form-control">
                                            <option value="">Select type</option>
                                            <option @if($property->contact_no_show == 1) selected @endif value="1">Show</option>
                                            <option @if($property->contact_no_show == 2) selected @endif value="2">Hide</option>
                                        </select>
                                        <span class="text-danger errorContactShowNo"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="type">Type <span class="text-danger" title="Required">*</span></label>
                                        <select id="type" name="type" class="form-control">
                                            <option value="">Select type</option>
                                            <option @if($property->type == 1) selected @endif value="1">Flat</option>
                                            <option @if($property->type == 2) selected @endif value="2">Plot</option>
                                            <option @if($property->type == 3) selected @endif value="3">Apartment</option>
                                            <option @if($property->type == 4) selected @endif value="4">Office</option>
                                            <option @if($property->type == 5) selected @endif  value="5">Duplex</option>
                                        </select>
                                        <span class="text-danger errorType"></span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="purpose">Purpose <span class="text-danger" title="Required">*</span></label>
                                        <select id="purpose" name="purpose" class="form-control">
                                            <option value="">Select purpose</option>
                                            <option @if($property->purpose == 1) selected @endif value="1">Sale</option>
                                            <option @if($property->purpose == 2) selected @endif value="2">Rent</option>
                                        </select>
                                        <span class="text-danger errorPurpose"></span>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="status">Status <span class="text-danger" title="Required">*</span></label>
                                        <select id="status" name="status" class="form-control">
                                            <option value="">Select status</option>
                                            <option @if($property->status == 1) selected @endif value="1">Popular</option>
                                            <option @if($property->status == 2) selected @endif value="2">Normal</option>
                                        </select>
                                        <span class="text-danger errorStatus"></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="status">Approval Status <span class="text-danger" title="Required">*</span></label>
                                        <select id="status" name="approval_status" class="form-control">
                                            <option value=""> Select approval status</option>
                                            <option @if($property->approval_status == 0) selected @endif value="0">Unpublished</option>
                                            <option @if($property->approval_status == 1) selected @endif value="1">Published</option>
                                        </select>
                                        <span class="text-danger errorStatus"></span>
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="thumbnail">Thumbnail <span class="text-danger" title="Required">*</span></label>
                                        <input type='file' id="properties_thumbnail" name="properties_thumbnail" class="form-control"/>
                                        <img id="propertiesThumbnail" src="@if($property->properties_thumbnail) {{ asset($property->properties_thumbnail) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        <span class="text-danger errorThumbnail"></span>
                                    </div>
                                </div>
                                <div class="row border mb-2">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_one">Property image one </label>
                                            <input type='file' id="image_one" name="image_one" class="form-control"/>
                                            <img id="imageOne" src="@if($propertyimage->image_one) {{ asset($propertyimage->image_one) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_two">Property image two </label>
                                            <input type='file' id="image_two" name="image_two" class="form-control"/>
                                            <img id="imageTwo" src="@if($propertyimage->image_two) {{ asset($propertyimage->image_two) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_three">Property image three </label>
                                            <input type='file' id="image_three" name="image_three" class="form-control"/>
                                            <img id="imageThree" src="@if($propertyimage->image_three) {{ asset($propertyimage->image_three) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_four">Property image Four <span class="text-danger" title="Required">*</span></label>
                                            <input type='file' id="image_four" name="image_four" class="form-control"/>
                                            <img id="imageFour" src="@if($propertyimage->image_four) {{ asset($propertyimage->image_four) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_five">Property image five </label>
                                            <input type='file' id="image_five" name="image_five" class="form-control"/>
                                            <img id="imageFive" src="@if($propertyimage->image_five) {{ asset($propertyimage->image_five) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_six">Property image six </label>
                                            <input type='file' id="image_six" name="image_six" class="form-control"/>
                                            <img id="imageSix" src="@if($propertyimage->image_six) {{ asset($propertyimage->image_six) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_seven">Property image seven </label>
                                            <input type='file' id="image_seven" name="image_seven" class="form-control"/>
                                            <img id="imageSeven" src="@if($propertyimage->image_seven) {{ asset($propertyimage->image_seven) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_eight">Property image eight </label>
                                            <input type='file' id="image_eight" name="image_eight" class="form-control"/>
                                            <img id="imageEight" src="@if($propertyimage->image_eight) {{ asset($propertyimage->image_eight) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="image_nine">Property image nine </label>
                                            <input type='file' id="image_nine" name="image_nine" class="form-control"/>
                                            <img id="imageNine" src="@if($propertyimage->image_nine) {{ asset($propertyimage->image_nine) }} @else {{ asset('/abasvumi/admin/images/default_bg.jpg') }} @endif" alt="Thumbnail image" width="100" class="mt-1"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-success" id="createEducation">Update</button>
                                    <a href="{{ route('property.index') }}" class="btn btn-danger" >Cancel</a>
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
<script src="{{ asset('abasvumi/admin/js/property.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/select2.full.min.js') }}"></script>
  <script>
      $(".propertys").addClass("menu-open");
      $(".nav-property").addClass("active");
  </script>


  <script type="text/javascript">
        $(document).ready(function() {
            $('#description').summernote();
            $('#bn_description').summernote();
            $('.select2').select2();
        });

    $(document).ready(function() {

        function readURL(input) {
            if (input.files && input.files[0]) {

                var reader = new FileReader();
                if(input.id == 'properties_thumbnail'){
                    reader.onload = function(e) {
                        $('#propertiesThumbnail').attr('src', e.target.result).fadeIn(650);
                    }
                }
                
                if(input.id == 'image_one'){
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

        $("#properties_thumbnail").change(function() {
            readURL(this);
        });

        $("#image_one").change(function() {
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
        @if(Session::has("success"))
            toastr.success("{{ Session::get('success') }}");
        @endif

        @if(Session::has("warning"))
            toastr.warning("{{ Session::get('warning') }}");
        @endif

        @if(Session::has("error"))
            toastr.error("{{ Session::get('error') }}");
        @endif
  </script>

@endsection
@section('styles')
<link rel="stylesheet" href="{{ asset('abasvumi/admin/css/select2.min.css') }}"/>
<link rel="stylesheet" href="{{ asset('abasvumi/admin/css/select2-bootstrap4.min.css') }}"/>
<style>
        .select2-container--default .select2-selection--single {padding: 0;}
        .select2-container--default .select2-selection--multiple .select2-selection__choice{color:#000}
    </style>
@endsection