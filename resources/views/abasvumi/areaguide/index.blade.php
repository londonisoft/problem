@extends('abasvumi.layout.admin')
@section('title','Area guide')

@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Area guide</h1>
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
                                <th style="width:150px;text-align:center;">Area Name</th>
                                <th style="width:150px;text-align:center;">Title</th>
                                <th style="width:350px;text-align:center;">Title (Bn) </th>
                                <th style="width:150px;text-align:center;">Image</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($areaGuides as $areaGuide)
                                <tr class="education-{{ $areaGuide->id }}">
                                    <td style="vertical-align:middle;text-align:center;">{{ $areaGuide->area_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $areaGuide->title}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $areaGuide->bn_title}}</td>
                                    <td style="vertical-align:middle;text-align:center;"> <img src="{{ asset($areaGuide->image) }}" width="50px"/> </td>
                                    <td style="vertical-align:middle;text-align:center;">
                                        <button class="btn btn-sm btn-warning" id="editEducation" data-toggle="modal" data-target="#editEducationModal" data-id="{{ $areaGuide->id }}" data-area_id="{{ $areaGuide->area_id }}" data-title="{{ $areaGuide->title }}"  data-bn_title="{{ $areaGuide->bn_title }}"  data-description="{{ $areaGuide->description }}"  data-bn_description="{{ $areaGuide->bn_description }}"  data-image="{{ $areaGuide->image }}" data-video_link="{{ $areaGuide->video_link }}"  data-type="{{ $areaGuide->type }}"><i class="fas fa-pencil-alt"></i></button>
                                        <!-- <button class="btn btn-sm btn-danger" id="deleteEducation" data-toggle="modal" data-target="#deleteEducationModal" data-id="{{ $areaGuide->id }}" ><i class="fas fa-trash"></i></button> -->
                                    </td>

                                </tr>
                            @endforeach
                        </tbody>

                        <tfoot>
                            <tr>
                                <th style="width:150px;text-align:center;">Area Name</th>
                                <th style="width:150px;text-align:center;">Title</th>
                                <th style="width:350px;text-align:center;">Title (Bn) </th>
                                <th style="width:150px;text-align:center;">Image</th>
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
                  <h5 class="modal-title text-center w-100">Create New Area guide</h5>
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
                                <label for="area_id">Area <span class="text-danger" title="Required">*</span></label>
                                <select id="area_id" class="form-control select2">
                                    <option value="">Select area</option>
                                    @foreach($areas as $area)
                                      <option value="{{ $area->id }}">{{ $area->name}}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger errorArea"></span>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                          <div class="form-group">
                              <label for="title">Title (En)<span class="text-danger" title="Required">*</span></label>
                              <input type="text" id="title" class="form-control" placeholder="English title">
                              <span class="text-danger errorTitle"></span>
                          </div>
                        </div>

                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="bn_title">Title (Bn)<span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="bn_title" class="form-control" placeholder="Bangla title">
                            <span class="text-danger errorBnTitle"></span>
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
                            <label for="video_link">Video link <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="video_link" class="form-control" placeholder="Video link">
                            <span class="text-danger errorVideoLink"></span>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="type">Type <span class="text-danger" title="Required">*</span></label>
                          <select id="type" class="form-control select2">
                              <option value="">Select type</option>
                              <option value="1">Highlight </option>
                              <option value="2">Neighborhood </option>
                              <option value="3">Lifestyle </option>
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
                  <h5 class="modal-title text-center w-100">Edit area guide</h5>
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
                              <label for="edit_area_id">Area <span class="text-danger" title="Required">*</span></label>
                              <select id="edit_area_id" class="form-control select2">
                                  <option value="">Select area</option>
                                  @foreach($areas as $area)
                                    <option value="{{ $area->id }}">{{ $area->name}}</option>
                                  @endforeach
                              </select>
                              <span class="text-danger errorArea"></span>
                          </div>
                      </div>
                      
                      <div class="col-md-4">
                        <div class="form-group">
                            <label for="edit_title">Title (En)<span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_title" class="form-control" placeholder="English title">
                            <input type="hidden" id="edit_id" class="form-control" placeholder="English title">
                            <span class="text-danger errorTitle"></span>
                        </div>
                      </div>

                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="edit_bn_title">Title (Bn)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_bn_title" class="form-control" placeholder="Bangla title">
                          <span class="text-danger errorBnTitle"></span>
                        </div>
                      </div>

                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="edit_description">Description (En)<span class="text-danger" title="Required">*</span></label>
                        <textarea id="edit_description" class="form-control" placeholder="English description"></textarea>
                        <span class="text-danger errorDescription"></span>
                      </div>
                    </div>

                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="edit_bn_description">Description (Bn)<span class="text-danger" title="Required">*</span></label>
                        <textarea id="edit_bn_description" class="form-control" placeholder="Bangla Description"></textarea>
                        <span class="text-danger errorBnDescription"></span>
                      </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-group">
                          <label for="edit_video_link">Video link <span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_video_link" class="form-control" placeholder="Video link">
                          <span class="text-danger errorVideoLink"></span>
                      </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="edit_type">Type <span class="text-danger" title="Required">*</span></label>
                        <select id="edit_type" class="form-control select2">
                            <option value="">Select type</option>
                            <option value="1">Highlight </option>
                            <option value="2">Neighborhood </option>
                            <option value="3">Lifestyle </option>
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
<script src="{{ asset('abasvumi/admin/js/areaguide.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>
    $(".areas").addClass("menu-open");
    $(".nav-area-guide").addClass("active");
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