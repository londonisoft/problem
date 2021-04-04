@extends('abasvumi.layout.admin')
@section('title','Religious Institute')

@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Religious Institute</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <button class="btn btn-success float-right" data-toggle="modal" data-target="#addEducationModal"><i class="fas fa-plus-circle"></i> Create</button>
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
                      <table id="category" class="table table-bordered table-striped table-sm">

                        <thead>
                            <tr>
                                <th style="width:150px;text-align:center;">Division</th>
                                <th style="width:150px;text-align:center;">District</th>
                                <th style="width:150px;text-align:center;">Thana</th>
                                <th style="width:150px;text-align:center;">Name</th>
                                <th style="width:350px;text-align:center;">Name (Bn) </th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($educations as $education)
                                <tr class="education-{{ $education->id }}">
                                    <td style="vertical-align:middle;text-align:center;">{{ $education->division_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $education->district_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $education->thana_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $education->name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $education->bn_name}}</td>                                    
                                    <td style="vertical-align:middle;text-align:center;">
                                        <button class="btn btn-sm btn-warning" id="editEducation" data-toggle="modal" data-target="#editEducationModal" data-id="{{ $education->id }}" data-division_id="{{ $education->division_id }}" data-district_id="{{ $education->district_id }}" data-thana_id="{{ $education->thana_id}}" data-name="{{ $education->name }}" data-bn_name="{{ $education->bn_name }}" data-description="{{ $education->description }}"  data-bn_description="{{ $education->bn_description }}"  data-lat="{{ $education->lat }}"  data-lon="{{ $education->lon }}"  data-type="{{ $education->type }}"  data-image="{{ $education->image }}"><i class="fas fa-pencil-alt"></i></button>
                                        <button class="btn btn-sm btn-danger" id="deleteEducation" data-toggle="modal" data-target="#deleteEducationModal" data-id="{{ $education->id }}" ><i class="fas fa-trash"></i></button>
                                    </td>

                                </tr>
                            @endforeach
                        </tbody>

                        <tfoot>
                            <tr>
                                <th style="width:150px;text-align:center;">Division</th>
                                <th style="width:150px;text-align:center;">District</th>
                                <th style="width:150px;text-align:center;">Thana</th>
                                <th style="width:150px;text-align:center;">Name</th>
                                <th style="width:350px;text-align:center;">Name (Bn) </th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </tfoot>
                      </table>
                    </div>
                  </div>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <div class="modal fade" tabindex="-1" id="addEducationModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Create New Religious Institute</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">

                <form id="createEducationForm" method="POST" enctype="multipart/form-data">

                    {{ csrf_field() }} {{ method_field('POST') }}

                      <div class="row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="division_id">Division <span class="text-danger" title="Required">*</span></label>
                                <select id="division_id" class="form-control select2">
                                    <option value="">Select division</option>
                                    @foreach($divisions as $division)
                                    <option value="{{ $division->id }}">{{ $division->name}}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger errorDivision"></span>
                            </div>
                        </div>
                    
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="district_id">District <span class="text-danger" title="Required">*</span></label>
                                <select id="district_id" class="form-control select2 districtBydivision"></select>
                                <span class="text-danger errorDistrict"></span>
                            </div>
                        </div>

                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="thana_id">Thana <span class="text-danger" title="Required">*</span></label>
                            <select id="thana_id" class="form-control select2 thanaBydistrict"></select>
                            <span class="text-danger errorThana"></span>
                          </div>
                        </div>

                        <div class="col-md-6">
                          <div class="form-group">
                              <label for="name">Name (En)<span class="text-danger" title="Required">*</span></label>
                              <input type="text" id="name" class="form-control" placeholder="English Name">
                              <span class="text-danger errorName"></span>
                          </div>
                        </div>

                        <div class="col-md-6">
                          <div class="form-group">
                            <label for="bn_name">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="bn_name" class="form-control" placeholder="Bangla Name">
                            <span class="text-danger errorBnName"></span>
                          </div>
                        </div>

                       <div class="col-md-12">
                        <div class="form-group">
                          <label for="description">Description (En)<span class="text-danger" title="Required">*</span></label>
                          <textarea id="description" class="form-control" placeholder="English description"></textarea>
                          <span class="text-danger errorDescription"></span>
                        </div>
                      </div>

                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="bn_description">Description (Bn)<span class="text-danger" title="Required">*</span></label>
                        <textarea id="bn_description" class="form-control" placeholder="Bangla Description"></textarea>
                        <span class="text-danger errorBnDescription"></span>
                      </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="lat">Lat <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="lat" class="form-control" placeholder="lat">
                            <span class="text-danger errorLat"></span>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                            <label for="lon">Lon <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="lon" class="form-control" placeholder="lon">
                            <span class="text-danger errorLon"></span>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="type">Type <span class="text-danger" title="Required">*</span></label>
                          <select id="type" class="form-control select2">
                              <option selected disabled>Select type</option>
                              <option value="1">Mosque </option>
                              <option value="2">Mondir </option>
                              <option value="3">Church </option>
                              <option value="4">Pagoda </option>
                          </select>
                          <span class="text-danger errorType"></span>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                            <label for="image">Image <span class="text-danger" title="Required">*</span></label>
                            <input type="file" id="image"  name="image" class="form-control" accept="image/gif, image/jpeg, image/png">
                            <span class="text-danger errorImage"></span>
                        </div>
                      </div>

                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="createEducation">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" id="editEducationModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Edit Religious Institute</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                
                <div class="modal-body">
                  <form id="updateEducationForm" method="post" enctype="multipart/form-data">

                    {{ csrf_field() }} {{ method_field('POST') }}

                    <div class="row">

                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="edit_division_id">Division <span class="text-danger" title="Required">*</span></label>
                            <select id="edit_division_id" class="form-control select2">
                                <option value="">Select division</option>
                                @foreach($divisions as $division)
                                    <option value="{{ $division->id }}">{{ $division->name}}</option>
                                @endforeach
                            </select>
                            <span class="text-danger errorDivision"></span>
                          </div>
                        </div>
                    
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="edit_district_id">District <span class="text-danger" title="Required">*</span></label>
                            <select id="edit_district_id" class="form-control select2 edit_district editDistrictBydivision">
                                
                            </select>
                            <span class="text-danger errorDistrict"></span>
                          </div>
                        </div>

                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="edit_thana_id">Thana <span class="text-danger" title="Required">*</span></label>
                          <select id="edit_thana_id" class="form-control select2 edit_thana editThanaBydistrict">
                              
                          </select>
                          <span class="text-danger errorThana"></span>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                            <label for="edit_name">Name (En)<span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_name" class="form-control" placeholder="English Name">
                            <input type="hidden" id="edit_id"/>
                            <span class="text-danger errorName"></span>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="edit_bn_name">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_bn_name" class="form-control" placeholder="Bangla Name">
                          <span class="text-danger errorBnName"></span>
                        </div>
                      </div>

                     <div class="col-md-12">
                      <div class="form-group">
                        <label for="edit_description">Description (En)<span class="text-danger" title="Required">*</span></label>
                        <textarea id="edit_description" class="form-control ckeditor" placeholder="English description"></textarea>
                        <span class="text-danger errorDescription"></span>
                      </div>
                    </div>

                  <div class="col-md-12">
                    <div class="form-group">
                      <label for="edit_bn_description">Description (Bn)<span class="text-danger" title="Required">*</span></label>
                      <textarea id="edit_bn_description" class="form-control ckeditor" placeholder="Bangla Description"></textarea>
                      <span class="text-danger errorBnDescription"></span>
                    </div>
                  </div>

                  <div class="col-md-6">
                      <div class="form-group">
                          <label for="edit_lat">Lat <span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_lat" class="form-control" placeholder="lat">
                          <span class="text-danger errorLat"></span>
                      </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-group">
                          <label for="edit_lon">Lon <span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_lon" class="form-control" placeholder="lon">
                          <span class="text-danger errorLon"></span>
                      </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="edit_type">Type <span class="text-danger" title="Required">*</span></label>
                        <select id="edit_type" class="form-control select2">
                             <option selected disabled>Select type</option>
                              <option value="1">Mosque </option>
                              <option value="2">Mondir </option>
                              <option value="3">Church </option>
                              <option value="4">Pagoda </option>
                        </select>
                        <span class="text-danger errorType"></span>
                      </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-group">
                          <label for="image">Image <span class="text-danger" title="Required">*</span></label>
                          <input type="file" id="image" name="image"  class="form-control">
                          <span class="text-danger errorImage"></span>
                      </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-group">
                            <label for="image">Current Image</label>
                            <img id="educationCurrentImage" src="" width="100" height="80">
                      </div>
                    </div>

                  </div>
                </form>
              </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="updateEducation">Update</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" id="deleteEducationModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-default" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Delete Confirmation</h5>
                </div>
                <div class="modal-body">
                    <h3 class="text-center">Are you sure to delete ?</h3>
                    <input type="hidden" id="del_id" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="destroyEducation">Delete</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

@endsection
@section('scripts')
<script src="{{ asset('abasvumi/admin/js/religious.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>
    $(".common-service").addClass("menu-open");
    $(".nav-religious").addClass("active");
</script>


<script type="text/javascript">
    $(document).ready(function() {
        //$('#description').summernote();
        //$('#bn_description').summernote();
        //$('#edit_description').summernote();
        //$('#edit_bn_description').summernote();
    });
</script>

@endsection