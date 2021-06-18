@extends('abasvumi.layout.admin')
@section('title','Amenitis')

@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Amenitis</h1>
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
                                <th style="width:150px;text-align:center;">Name (Bn)</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($amenities as $amenitie)
                                <tr class="education-{{ $amenitie->id }}">
                                    <td style="vertical-align:middle;text-align:center;">{{ $amenitie->name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $amenitie->bn_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">
                                        <button class="btn btn-sm btn-warning" id="editEducation" data-toggle="modal" data-target="#editEducationModal" data-id="{{ $amenitie->id }}" data-name="{{ $amenitie->name }}"  data-bn_name="{{ $amenitie->bn_name }}" data-icon="{{ $amenitie->icon }}" ><i class="fas fa-pencil-alt"></i></button>
                                        <!-- <button class="btn btn-sm btn-danger" id="deleteEducation" data-toggle="modal" data-target="#deleteEducationModal" data-id="{{ $amenitie->id }}" ><i class="fas fa-trash"></i></button> -->
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
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Create New Amenitie</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">

                <form id="createEducationForm" method="POST"  enctype="multipart/form-data">
                    {{ csrf_field() }} {{ method_field('POST') }}
                      <div class="form-group">
                          <label for="name">Name<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="name" class="form-control" placeholder="English name">
                          <span class="text-danger errorName"></span>
                      </div>

                      <div class="form-group">
                          <label for="bn_name">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="bn_name" class="form-control" placeholder="Bangla name">
                          <span class="text-danger errorBnName"></span>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                            <label for="icon">Icon Image <span class="text-danger" title="Required">*</span></label>
                            <input type="file" id="icon"  name="icon" class="form-control" accept="image/gif, image/jpeg, image/png">
                            <span class="text-danger errorImage"></span>
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
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Edit Video</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                
                <div class="modal-body">
                  <form id="updateEducationForm" method="post" enctype="multipart/form-data">

                    {{ csrf_field() }} {{ method_field('POST') }}

                    <div class="form-group">
                          <label for="edit_name">Name<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_name" class="form-control" placeholder="Name">
                          <input type="hidden" id="edit_id"/>
                          <span class="text-danger errorName"></span>
                      </div>

                      <div class="form-group">
                          <label for="edit_bn_name">Edit Name (Bn)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_bn_name" class="form-control" placeholder="Edit bangla name">
                          <span class="text-danger errorEditBnName"></span>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                            <label for="icon">Icon Image <span class="text-danger" title="Required">*</span></label>
                            <input type="file" id="icon" name="icon"  class="form-control">
                            <span class="text-danger errorImage"></span>
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                              <label for="icon">Current Icon</label>
                              <img id="educationCurrentImage" src="" width="100" height="80">
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
<script src="{{ asset('abasvumi/admin/js/amenitie.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>
    $(".common-service").addClass("menu-open");
    $(".nav-amenitie").addClass("active");
</script>
@endsection