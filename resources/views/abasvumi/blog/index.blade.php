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
                                <th style="width:150px;text-align:center;">Category Name</th>
                                <th style="width:150px;text-align:center;">Title</th>
                                <th style="width:350px;text-align:center;">Title (Bn) </th>
                                <th style="width:150px;text-align:center;">Image</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($blogs as $blog)
                                <tr class="education-{{ $blog->id }}">
                                    <td style="vertical-align:middle;text-align:center;">{{ $blog->category_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $blog->title}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $blog->bn_title}}</td>
                                    <td style="vertical-align:middle;text-align:center;"> <img src="{{ asset($blog->image) }}" width="50px"/> </td>
                                    <td style="vertical-align:middle;text-align:center;">
                                        <button class="btn btn-sm btn-warning" id="editEducation" data-toggle="modal" data-target="#editEducationModal" data-id="{{ $blog->id }}" data-category_id="{{ $blog->category_id }}" data-title="{{ $blog->title }}"  data-bn_title="{{ $blog->bn_title }}"  data-description="{{ $blog->description }}"  data-bn_description="{{ $blog->bn_description }}"  data-image="{{ $blog->image }}"  ><i class="fas fa-pencil-alt"></i></button>
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
                                <label for="category_id">Category <span class="text-danger" title="Required">*</span></label>
                                <select id="category_id" class="form-control select2">
                                    <option value="">Select category</option>
                                    @foreach($categories as $category)
                                      <option value="{{ $category->id }}">{{ $category->name}}</option>
                                    @endforeach
                                </select>
                                <span class="text-danger errorCategory"></span>
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
                              <label for="edit_category_id">Category <span class="text-danger" title="Required">*</span></label>
                              <select id="edit_category_id" class="form-control select2">
                                  <option value="">Select category</option>
                                  @foreach($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name}}</option>
                                  @endforeach
                              </select>
                              <span class="text-danger errorCategory"></span>
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
<script src="{{ asset('abasvumi/admin/js/blog.js') }}"></script>
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