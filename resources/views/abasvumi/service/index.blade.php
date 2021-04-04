@extends('abasvumi.layout.admin')
@section('title','Services')

@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"> Services </h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <button class="btn btn-success float-right" data-toggle="modal" data-target="#addEducationModal"><i class="fas fa-plus-circle"></i> Create</button>
          </div>
        </div>
      </div>
    </div>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                      <table id="category" class="table table-bordered table-striped table-sm">

                        <thead>
                            <tr>
                                <th style="width:250px;text-align:center;">Title</th>
                                <th style="width:10px;text-align:center;">Category</th>
                                <th style="width:150px;text-align:center;">Featured S</th>
                                <th style="width:150px;text-align:center;">Status</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($services as $service)
                                <tr">
                                    <td style="vertical-align:middle;text-align:center;">{{ $service->name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $service->service_category_name}}</td>  
                                    <td style="vertical-align:middle;text-align:center;">{{ ($service->is_featured) ? "Featured" : ""}}</td>                                  
                                    <td style="vertical-align:middle;text-align:center;">{{ ($service->status) ? "Approved" : "Pending"}}</td>                                  
                                    <td style="vertical-align:middle;text-align:center;">
                                    <button class="btn btn-sm btn-warning" id="editEducation" data-toggle="modal" data-target="#editEducationModal" data-id="{{ $service->id }}" data-service_category_id="{{ $service->service_category_id }}" data-name="{{ $service->name }}"  data-name_bn="{{ $service->name_bn }}"  data-description="{{ $service->description }}"  data-description_bn="{{ $service->description_bn }}"  data-image="{{ $service->image }}"  ><i class="fas fa-pencil-alt"></i></button>
                                    <button class="btn btn-sm btn-warning" id="editRole" data-toggle="modal" data-target="#createRoleModal" data-id="{{ $service->id }}" data-is_featured="{{ $service->is_featured }}" data-status="{{ $service->status }}" title="Edit"><i class="fas fa-plus"></i></button>
                                        <a onclick="return confirm('Are you sure');" href="{{ route('service.destroy',['id'=>$service->id])}}" class="btn btn-sm btn-danger" id="deleteEducation" ><i class="fas fa-trash"></i></a>
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
  </div>
  <div class="modal fade" tabindex="-1" id="addEducationModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
              <h5 class="modal-title text-center w-100">Create Service</h5>
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
                            <label for="service_category_id">Category <span class="text-danger" title="Required">*</span></label>
                            <select id="service_category_id" class="form-control select2">
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
                          <label for="name">Name (En)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="name" class="form-control" placeholder="English name">
                          <span class="text-danger errorName"></span>
                      </div>
                    </div>

                    <div class="col-md-4">
                      <div class="form-group">
                        <label for="name_bn">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                        <input type="text" id="name_bn" class="form-control" placeholder="Bangla name">
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
                      <label for="description_bn">Description (Bn)<span class="text-danger" title="Required">*</span></label>
                      <textarea id="description_bn" class="form-control" placeholder="Bangla Description"></textarea>
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
                <h5 class="modal-title text-center w-100">Edit Service</h5>
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
                            <label for="edit_service_category_id">Category <span class="text-danger" title="Required">*</span></label>
                            <select id="edit_service_category_id" class="form-control select2">
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
                          <label for="edit_name">Name (En)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_name" class="form-control" placeholder="English title">
                          <input type="hidden" id="edit_id" class="form-control" placeholder="English title">
                          <span class="text-danger errorName"></span>
                      </div>
                    </div>

                    <div class="col-md-4">
                      <div class="form-group">
                        <label for="edit_name_bn">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                        <input type="text" id="edit_name_bn" class="form-control" placeholder="Bangla title">
                        <span class="text-danger errorBnName"></span>
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
  <!-- /.content-wrapper -->
  <div class="modal" tabindex="-1" id="createRoleModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Update Status</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                      <div class="form-group">
                        <input type="hidden" id="edit_id">
                        <label for="name">Featured <span class="text-danger" title="Required">*</span></label><br>
                        <input name='is_featured' class='is_featured' value ='1' type='radio'> Actice
                        <input name='is_featured' class='is_featured' value ='0' Class="ml-2" type='radio'> Inactice
                      </div>
                      <div class="form-group">
                        <label for="name">Status <span class="text-danger" title="Required">*</span></label><br>
                        <input name='status' class='status' value ='1'  type='radio'> Actice
                        <input name='status' class='status' value ='0' Class="ml-2" type='radio'> Inactice
                      </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="destroyUser">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scripts')
<script src="{{ asset('abasvumi/admin/js/allService.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
  <script>
    //open edit block modal
    $(document).on('click', '#editRole', function () {
        $('#edit_id').val($(this).data('id'));
        $('input:radio[name="is_featured"][value="'+$(this).data('is_featured')+'"]').attr('checked',true);
        $('input:radio[name="status"][value="'+$(this).data('status')+'"]').attr('checked',true);
    });

    $("#destroyUser").click(function(){
        $.ajax({
            type: 'POST',
            url: '/admin/service/status',
            headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
            data: {
                id: $('#edit_id').val(),
                is_featured: $('.is_featured:checked').val(),
                status: $('.status:checked').val()
            },
            success: function (data) {
                $('#createRoleModal').modal('hide');
                toastr.success('Property status updated.')
                setTimeout(function(){
                  location.reload();
                }, 500);
            }
        });
    });
      $(".services").addClass("menu-open");
      $(".nav-services").addClass("active");
  </script>
@endsection
