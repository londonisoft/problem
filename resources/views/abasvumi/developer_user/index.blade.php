@extends('abasvumi.layout.admin')
@section('title','Developers')

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">All Developers</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <button class="btn btn-success float-right" data-toggle="modal" data-target="#createUserModal"><i class="fas fa-plus-circle"></i> Create</button>
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
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Image</th>
                            <th style="text-align:center;">Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Image</th>
                          <th style="text-align:center;">Action</th>
                        </tr>
                    </tfoot>
                    <tbody id="allUser">
                      @foreach($developers as $developer)
                        <tr align="center" class="user-{{ $developer->id }}">
                            <td>{{ $developer->name }}</td>
                            <td>{{ $developer->email }}</td>
                            <td>{{ $developer->phone }}</td>
                            <td><img src="{{ asset($developer->image) }}" style="width: 80px;height:60px;"/></td>
                            <td style="vertical-align:middle;text-align:center;">
                                <button class="btn btn-sm btn-warning" id="editUser" data-toggle="modal" data-target="#editUserModal" data-id="{{ $developer->id }}" data-name="{{ $developer->name }}" data-email="{{ $developer->email }}" data-phone="{{ $developer->phone }}" data-role_id="{{ $developer->role_id }}" data-image="{{ $developer->image }}" title="Edit"><i class="fas fa-pencil-alt"></i></button>
                                <!-- <button class="btn btn-sm btn-danger"  id="deleteUser" data-toggle="modal" data-target="#deleteUserModal" data-id="{{ $developer->id }}" title="Delete"><i class="fas fa-trash"></i></button> -->
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
    <div class="modal fade" tabindex="-1" id="createUserModal" User="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" User="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Create New Developer</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form id="createUserForm" method="POST" enctype="multipart/form-data">
                      {{ csrf_field() }} {{ method_field('POST') }}
                        <div class="form-group">
                            <label for="name">Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="name" class="form-control" placeholder="Name" required>
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="email">Email <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="email" class="form-control" placeholder="Email" required>
                            <span class="text-danger errorEmail"></span>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="phone" class="form-control" placeholder="Phone" required>
                            <span class="text-danger errorPhone"></span>
                        </div>                        
                        <div class="form-group">
                            <label for="password">Password <span class="text-danger" title="Required">*</span></label>
                            <input type="password" id="password" class="form-control" placeholder="Password" required>
                            <span class="text-danger errorPassword"></span>
                        </div>
                        <div class="form-group">
                            <label for="image">Image <span class="text-danger" title="Required">*</span></label>
                            <input type="file" id="image" name="image" class="form-control" placeholder="Phone" required>
                            <span class="text-danger errorImage"></span>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="createUser">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" id="editUserModal" User="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" User="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Edit Developer</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <form id="editUserForm" method="POST" enctype="multipart/form-data">
                      {{ csrf_field() }} {{ method_field('POST') }}
                        <div class="form-group">
                            <label for="edit_name">Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_name" class="form-control" placeholder="Name" required>
                            <input type="hidden" id="edit_id"/>
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="edit_email">Email <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_email" class="form-control" placeholder="Email" required>
                            <span class="text-danger errorEmail"></span>
                        </div>
                        <div class="form-group">
                            <label for="edit_phone">Phone <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_phone" class="form-control" placeholder="Phone" required>
                            <span class="text-danger errorPhone"></span>
                        </div>                        
                        <div class="form-group">
                            <label for="password">Password </label>
                            <input type="password" id="edit_password" class="form-control" placeholder="Password" required>
                            <span class="text-danger errorPassword"></span>
                        </div>
                        <div class="form-group">
                            <label for="image">Current Image <span class="text-danger" title="Required">*</span></label>
                            <img id="userCurrentImage" src="" class="form-control" style="width: 100px;height:80px;">
                            <span class="text-danger errorImage"></span>
                        </div>
                        <div class="form-group">
                            <label for="edit_image">Image </label>
                            <input type="file" id="agentCurrentImage" name="image" class="form-control">
                            <span class="text-danger errorImage"></span>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="updateUser">Update</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" id="deleteUserModal" User="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-default" User="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Delete Confirmation</h5>
                </div>
                <div class="modal-body">
                    <h3 class="text-center">Are you sure to delete ?</h3>
                    <input type="hidden" id="del_id" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="destroyUser">Delete</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content -->
</div>
@endsection
@section('scripts')
<script src="{{ asset('abasvumi/admin/js/developer.js') }}"></script>
<script>    
    $(".users").addClass("menu-open");
    $(".nav-developer").addClass("active");
</script>
@endsection