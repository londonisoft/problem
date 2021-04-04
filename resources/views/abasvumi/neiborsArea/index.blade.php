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
            <h1 class="m-0 text-dark">Blogs</h1>
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
                                <th style="width:150px;text-align:center;">Neibor Name</th>
                                <th style="width:150px;text-align:center;">Area Name</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($neibors_area as $blog)
                                <tr class="education-{{ $blog->id }}">
                                    <td style="vertical-align:middle;text-align:center;">{{ $blog->neibor_name }}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $blog->area_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">
                                        <button class="btn btn-sm btn-warning" id="editEducation" data-toggle="modal" data-target="#editEducationModal" data-id="{{ $blog->id }}" data-dhaka_neigbor_id ="{{ $blog->dhaka_neigbor_id  }}" data-area_id ="{{ $blog->area_id  }}"  ><i class="fas fa-pencil-alt"></i></button>
                                        <button class="btn btn-sm btn-danger" id="deleteEducation" data-toggle="modal" data-target="#deleteEducationModal" data-id="{{ $blog->id }}" ><i class="fas fa-trash"></i></button>
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
                  <h5 class="modal-title text-center w-100">Create New Blogs</h5>
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
                                <label for="dhaka_neigbor_id">Neibor Name <span class="text-danger" title="Required">*</span></label>
                                <select id="dhaka_neigbor_id" class="form-control select2">
                                    <option value="">Select neibor</option>
                                    @foreach($neibors as $neibor)
                                      <option value="{{ $neibor->id }}">{{ $neibor->name}}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger errorCategory"></span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="area_id">Area Name <span class="text-danger" title="Required">*</span></label>
                                <select id="area_id" class="form-control select2">
                                    <option value="">Select area</option>
                                    @foreach($areas as $area)
                                      <option value="{{ $area->id }}">{{ $area->name}}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger errorCategory"></span>
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
                              <label for="edit_dhaka_neigbor_id">Neibor Name <span class="text-danger" title="Required">*</span></label>
                              <select id="edit_dhaka_neigbor_id" class="form-control select2">
                                  <option value="">Select neibor</option>
                                  @foreach($neibors as $neibor)
                                    <option value="{{ $neibor->id }}">{{ $neibor->name}}</option>
                                  @endforeach
                              </select>
                              <span class="text-danger errorCategory"></span>
                          </div>
                      </div>
                      <div class="col-md-4">
                          <div class="form-group">
                              <label for="edit_area_id">Area Name <span class="text-danger" title="Required">*</span></label>
                              <select id="edit_area_id" class="form-control select2">
                                  <option value="">Select area</option>
                                  @foreach($areas as $area)
                                    <option value="{{ $area->id }}">{{ $area->name}}</option>
                                  @endforeach
                              </select>
                              <span class="text-danger errorCategory"></span>
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
<script src="{{ asset('abasvumi/admin/js/dhNeiborArea.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>
    $(".categories").addClass("menu-open");
    $(".nav-category-guide").addClass("active");
</script>


<script type="text/javascript">
    $(document).ready(function() {
        // $('#description').summernote();
        // $('#bn_description').summernote();
        // $('#edit_description').summernote();
        // $('#edit_bn_description').summernote();
    });
</script>

@endsection