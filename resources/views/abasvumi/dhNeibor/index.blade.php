@extends('abasvumi.layout.admin')
@section('title','Dhaka Neibors')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Dhaka Neibors</h1>
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
                            <th>Status</th>
                            <th style="text-align:center;">Action</th>
                        </tr>
                    </thead>
                    <tbody id="allRole">
                      @foreach($neibors as $serviceCat)
                        <tr class="role-{{ $serviceCat->id }}">
                            <td>{{ $serviceCat->name }}</td>
                            <td>{{ $serviceCat->name_bn }}</td>
                            <td style="vertical-align:middle;text-align:center;">{{ ($serviceCat->status) ? "Active" : "Inactive"}}</td>
                            <td style="vertical-align:middle;text-align:center;">
                                <button class="btn btn-sm btn-warning" id="editRole" data-toggle="modal" data-target="#editRoleModal" data-id="{{ $serviceCat->id }}" data-name="{{ $serviceCat->name }}" data-name_bn="{{ $serviceCat->name_bn }}" title="Edit"><i class="fas fa-pencil-alt"></i></button>
                                <button class="btn btn-sm btn-warning" id="updateStatus" data-toggle="modal" data-target="#statusModal" data-id="{{ $serviceCat->id }}" data-status="{{ $serviceCat->status }}" title="Edit"><i class="fas fa-plus"></i></button>
                                <button class="btn btn-sm btn-danger"  id="deleteRole" data-toggle="modal" data-target="#deleteRoleModal" data-id="{{ $serviceCat->id }}" title="Delete"><i class="fas fa-trash"></i></button>
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
                  <h5 class="modal-title text-center w-100">Create New Service Category</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="name">Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="name" class="form-control" placeholder="Name">
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="name_bn">Name (Bn) <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="name_bn" class="form-control" placeholder="Name Bangla">
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
                  <h5 class="modal-title text-center w-100">Edit Service Category</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
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


<div class="modal" tabindex="-1" id="statusModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
<script src="{{ asset('abasvumi/admin/js/dhNeibor.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>    
 //open edit block modal
 $(document).on('click', '#updateStatus', function () {
        $('#edit_id').val($(this).data('id'));
        $('input:radio[name="status"][value="'+$(this).data('status')+'"]').attr('checked',true);
    });

    $("#destroyUser").click(function(){
        $.ajax({
            type: 'POST',
            url: '/admin/dhaka/neibors/status',
            headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
            data: {
                id: $('#edit_id').val(),
                status: $('.status:checked').val()
            },
            success: function (data) {
                $('#statusModal').modal('hide');
                toastr.success('Property status updated.')
                setTimeout(function(){
                  location.reload();
                }, 500);
            }
        });
    });
    $(".services").addClass("menu-open");
    $(".nav-service-type").addClass("active");
</script>
@endsection