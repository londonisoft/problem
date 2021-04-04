@extends('abasvumi.layout.admin')
@section('title','Blogs')

@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Testimonial</h1>
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
                                <th style="width:150px;text-align:center;">Name</th>
                                <th style="width:350px;text-align:center;">Name (Bn) </th>
                                <th style="width:150px;text-align:center;">Image</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($testimonials as $testimonial)
                                <tr class="education-{{ $testimonial->id }}">
                                    <td style="vertical-align:middle;text-align:center;">{{ $testimonial->name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $testimonial->name_bn }}</td>
                                    <td style="vertical-align:middle;text-align:center;"> <img src="{{ asset($testimonial->image) }}" width="50px"/> </td>
                                    <td style="vertical-align:middle;text-align:center;">
                                        <button class="btn btn-sm btn-warning" id="editEducation" data-toggle="modal" data-target="#editEducationModal" data-id="{{ $testimonial->id }}" data-name="{{ $testimonial->name }}"  data-name_bn="{{ $testimonial->name_bn }}"  data-description="{{ $testimonial->description }}"  data-description_bn="{{ $testimonial->description_bn }}"  data-image="{{ $testimonial->image }}" data-designation="{{ $testimonial->designation }}" data-designation_bn="{{ $testimonial->designation_bn }}"  ><i class="fas fa-pencil-alt"></i></button>
                                        <button class="btn btn-sm btn-danger" id="deleteEducation" data-toggle="modal" data-target="#deleteEducationModal" data-id="{{ $testimonial->id }}" ><i class="fas fa-trash"></i></button>
                                    </td>

                                </tr>
                            @endforeach
                        </tbody>
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
                  <h5 class="modal-title text-center w-100">Create New Testimonials</h5>
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
                              <label for="name">Name (En)<span class="text-danger" title="Required">*</span></label>
                              <input type="text" id="name" class="form-control" placeholder="English name">
                              <span class="text-danger errorTitle"></span>
                          </div>
                        </div>

                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="name_bn">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="name_bn" class="form-control" placeholder="Bangla title">
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
                          <label for="description_bn">Description (Bn)<span class="text-danger" title="Required">*</span></label>
                          <textarea id="description_bn" class="form-control" placeholder="Bangla Description"></textarea>
                          <span class="text-danger errorBnDescription"></span>
                        </div>
                      </div>
                      <div class="col-md-4">
                          <div class="form-group">
                              <label for="designation">Designation<span class="text-danger" title="Required">*</span></label>
                              <input type="text" id="designation" class="form-control" placeholder="English designation">
                              <span class="text-danger errorTitle"></span>
                          </div>
                        </div>

                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="designation_bn">Designation (Bn)<span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="designation_bn" class="form-control" placeholder="Bangla title">
                            <span class="text-danger errorBnTitle"></span>
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
                  <h5 class="modal-title text-center w-100">Edit category guide</h5>
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
                            <label for="edit_name">Name (En)<span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_name" class="form-control" placeholder="English title">
                            <input type="hidden" id="edit_id" class="form-control" placeholder="English name">
                            <span class="text-danger errorName"></span>
                        </div>
                      </div>

                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="edit_name_bn">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_name_bn" class="form-control" placeholder="Bangla name">
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
                        <label for="edit_description_bn">Description (Bn)<span class="text-danger" title="Required">*</span></label>
                        <textarea id="edit_description_bn" class="form-control" placeholder="Bangla Description"></textarea>
                        <span class="text-danger errorBnDescription"></span>
                      </div>
                    </div>

                    <div class="col-md-4">
                      <div class="form-group">
                          <label for="edit_designation">Designation<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_designation" class="form-control" placeholder="English designation">
                          <span class="text-danger errorTitle"></span>
                      </div>
                    </div>

                    <div class="col-md-4">
                      <div class="form-group">
                        <label for="edit_designation_bn">Designation (Bn)<span class="text-danger" title="Required">*</span></label>
                        <input type="text" id="edit_designation_bn" class="form-control" placeholder="Bangla title">
                        <span class="text-danger errorBnTitle"></span>
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
<script src="{{ asset('abasvumi/admin/js/testimonial.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>
    $(".categories").addClass("menu-open");
    $(".nav-category-guide").addClass("active");
</script>


<script type="text/javascript">
    $(document).ready(function() {
        // $('#description').summernote();
        // $('#description_bn').summernote();
        // $('#edit_description').summernote();
        // $('#edit_description_bn').summernote();
    });
</script>

@endsection