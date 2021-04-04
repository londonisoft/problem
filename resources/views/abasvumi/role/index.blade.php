@extends('abasvumi.layout.admin')
@section('title','Roles')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Roles</h1>
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
                  <table class="table table-bordered table-striped table-sm">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Description</th>
                            <th style="text-align:center;">Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                          <th>Name</th>
                          <th>Description</th>
                          <th style="text-align:center;">Action</th>
                        </tr>
                    </tfoot>
                    <tbody id="allRole">
                      @foreach($roles as $role)
                        <tr class="role-{{ $role->id }}">
                            <td>{{ $role->name }}</td>
                            <td>{{ $role->description }}</td>
                            <td style="vertical-align:middle;text-align:center;">
                                <button class="btn btn-sm btn-warning" id="editRole" data-toggle="modal" data-target="#editRoleModal" data-id="{{ $role->id }}" data-name="{{ $role->name }}" data-description="{{ $role->description }}" title="Edit"><i class="fas fa-pencil-alt"></i></button>
                                <button class="btn btn-sm btn-danger"  id="deleteRole" data-toggle="modal" data-target="#deleteRoleModal" data-id="{{ $role->id }}" title="Delete"><i class="fas fa-trash"></i></button>
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
                  <h5 class="modal-title text-center w-100">Create New Role</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="name">Role Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="name" class="form-control" placeholder="Name">
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="description">Role Description <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="description" class="form-control" placeholder="Description">
                            <span class="text-danger errorDescription"></span>
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
                  <h5 class="modal-title text-center w-100">Edit Role</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="name">Role Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_name" class="form-control" placeholder="Name">
                            <input type="hidden" id="edit_id">
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="description">Role Description <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_description" class="form-control" placeholder="Description">
                            <span class="text-danger errorDescription"></span>
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
    <!-- /.content -->
</div>
@endsection
@section('scripts')
<script src="{{ asset('abasvumi/admin/js/role.js') }}"></script>
<script>    
    $(".users").addClass("menu-open");
    $(".nav-role").addClass("active");
</script>
@endsection