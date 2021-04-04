@extends('abasvumi.layout.admin')
@section('title','Property type')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Property type</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <button class="btn btn-success float-right" data-toggle="modal" data-target="#createRoleModal"><i class="fas fa-plus-circle"></i> Create</button>
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
                  <table class="table table-bordered table-striped table-sm text-center">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Name (Bn) </th>
                            <th style="text-align:center;">Action</th>
                        </tr>
                    </thead>
                    <tbody id="allRole">
                      @foreach($propertyTypes as $propertyType)
                        <tr class="role-{{ $propertyType->id }}">
                            <td>{{ $propertyType->name }}</td>
                            <td>{{ $propertyType->bn_name }}</td>
                            <td style="vertical-align:middle;text-align:center;">
                                <button class="btn btn-sm btn-warning" id="editRole" data-toggle="modal" data-target="#editRoleModal" data-id="{{ $propertyType->id }}" data-name="{{ $propertyType->name }}" data-bn_name="{{ $propertyType->bn_name }}" data-category_id="{{ $propertyType->category_id }}" title="Edit"><i class="fas fa-pencil-alt"></i></button>
                                <button class="btn btn-sm btn-warning" id="editType" data-toggle="modal" data-target="#editTypeModal" data-id="{{ $propertyType->id }}" data-is_menu="{{ $propertyType->is_menu }}" data-status="{{ $propertyType->status }}" title="Edit"><i class="fas fa-plus"></i></button>
                                <button class="btn btn-sm btn-danger"  id="deleteRole" data-toggle="modal" data-target="#deleteRoleModal" data-id="{{ $propertyType->id }}" title="Delete"><i class="fas fa-trash"></i></button>
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
    <div class="modal fade" tabindex="-1" id="createRoleModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Create New Property Type</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="category_id">Category <span class="text-danger" title="Required">*</span></label>
                            <select id="category_id" class="form-control" >
                              <option value=''>Select one</option>
                              <option value='1'>Residential</option>
                              <option value='2'>Commertial</option>
                            </select>
                            <span class="text-danger errorCategory"></span>
                        </div>
                        <div class="form-group">
                            <label for="name">Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="name" class="form-control" placeholder="Name">
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="bn_name">Name (Bn) <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="bn_name" class="form-control" placeholder="Name Bangla">
                            <span class="text-danger errorBnName"></span>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="createRole">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" id="editRoleModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Edit Property Type</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="edit_category_id">Category <span class="text-danger" title="Required">*</span></label>
                            <select id="edit_category_id" class="form-control" >
                              <option value=''>Select one</option>
                              <option value='1'>Residential</option>
                              <option value='2'>Commertial</option>
                            </select>
                            <span class="text-danger errorCategory"></span>
                        </div>
                        <div class="form-group">
                            <label for="edit_name"> Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_name" class="form-control" placeholder="Edit name">
                            <input type="hidden" id="edit_id">
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="edit_bn_name"> Name (Bn) <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_bn_name" class="form-control" placeholder="Name Bangla">
                            <span class="text-danger errorBnName"></span>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="updateRole">Update</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" id="deleteRoleModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
                    <button type="button" class="btn btn-success" id="destroyRole">Delete</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal" tabindex="-1" id="editTypeModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
                      <input type="hidden" id="status_id">
                      <label for="name">Menu <span class="text-danger" title="Required">*</span></label><br>
                      <input name='is_menu' class='is_menu' value ='1' type='radio'> Actice
                      <input name='is_menu' class='is_menu' value ='0' Class="ml-2" type='radio'> Inactice
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





</div>
@endsection
@section('scripts')
<script src="{{ asset('abasvumi/admin/js/servicetype.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>    
    //open edit block modal
    $(document).on('click', '#editType', function () {
        $('#status_id').val($(this).data('id'));
        $('input:radio[name="is_menu"][value="'+$(this).data('is_menu')+'"]').attr('checked',true);
        $('input:radio[name="status"][value="'+$(this).data('status')+'"]').attr('checked',true);
    });

    $("#destroyUser").click(function(){
        $.ajax({
            type: 'POST',
            url: '/admin/property/type/status',
            headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
            data: {
                id: $('#status_id').val(),
                is_menu: $('.is_menu:checked').val(),
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
    $(".properties").addClass("menu-open");
    $(".nav-service-type").addClass("active");
</script>
@endsection