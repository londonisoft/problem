@extends('abasvumi.layout.admin')
@section('title','Suppliers')

@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">All Suppliers</h1>
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
                            <th>address</th>
                            <th>Experience</th>
                            <th style="text-align:center;">Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>address</th>
                            <th>Experience</th>
                          <th style="text-align:center;">Action</th>
                        </tr>
                    </tfoot>
                    <tbody id="allUser">
                      @foreach($suppliers as $supplier)
                        <tr align="center" class="user-{{ $supplier->id }}">
                            <td>{{ $supplier->name }}</td>
                            <td>{{ $supplier->email }}</td>
                            <td>{{ $supplier->phone }}</td>
                            <td>{{ $supplier->address }}</td>
                            <td>{{ $supplier->experiance }}</td>
                            
                            <td style="vertical-align:middle;text-align:center;">
                                <button class="btn btn-sm btn-warning" id="editUser" data-toggle="modal" data-target="#editUserModal" data-id="{{ $supplier->id }}" data-name="{{ $supplier->name }}" data-email="{{ $supplier->email }}" data-phone="{{ $supplier->phone }}" data-address="{{ $supplier->address }}" data-experiance="{{ $supplier->experiance }}"  data-type="{{ $supplier->type }}" title="Edit"><i class="fas fa-pencil-alt"></i></button>
                                <!-- <button class="btn btn-sm btn-danger"  id="deleteUser" data-toggle="modal" data-target="#deleteUserModal" data-id="{{ $supplier->id }}" title="Delete"><i class="fas fa-trash"></i></button> -->
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
                  <h5 class="modal-title text-center w-100">Create New Supplier</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <form id="createUserForm" method="POST" enctype="multipart/form-data">
                      {{ csrf_field() }} {{ method_field('POST') }}
                        <div class="form-group">
                            <label for="name">Name <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="name" class="form-control" placeholder="Name">
                            <span class="text-danger errorName"></span>
                        </div>
                        <div class="form-group">
                            <label for="email">Email </label>
                            <input type="text" id="email" class="form-control" placeholder="Email">
                            <span class="text-danger errorEmail"></span>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="phone" class="form-control" placeholder="Phone">
                            <span class="text-danger errorPhone"></span>
                        </div>                        
                        <div class="form-group">
                            <label for="address">Address <span class="text-danger" title="Required">*</span></label>
                            <textarea id="address" class="form-control"></textarea>
                            <span class="text-danger errorAddress"></span>
                        </div>
                        <div class="form-group">
                            <label for="experiance">Experience </label>
                            <textarea id="experiance" class="form-control"></textarea>
                            <span class="text-danger errorExperiance"></span>
                        </div>
                        <div class="form-group">
                            <label for="type">Type <span class="text-danger" title="Required">*</span></label>                            
                            <select id="type" class="form-control">
                              <option value="">Select type</option>
                                <option value="1">Service</option>
                                <option value="2">Row meterial provider</option>                              
                            </select>
                            <span class="text-danger errorType"></span>
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
                  <h5 class="modal-title text-center w-100">Edit Supplier</h5>
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
                            <label for="edit_email">Email </label>
                            <input type="text" id="edit_email" class="form-control" placeholder="Email">
                            <span class="text-danger errorEmail"></span>
                        </div>
                        <div class="form-group">
                            <label for="edit_phone">Phone <span class="text-danger" title="Required">*</span></label>
                            <input type="text" id="edit_phone" class="form-control" placeholder="Phone">
                            <span class="text-danger errorPhone"></span>
                        </div>                
                        <div class="form-group">
                            <label for="edit_address">Address <span class="text-danger" title="Required">*</span></label>
                            <textarea id="edit_address" class="form-control"></textarea>
                            <span class="text-danger errorAddress"></span>
                        </div>
                        <div class="form-group">
                            <label for="edit_experiance">Experience <span class="text-danger" title="Required">*</span></label>
                            <textarea id="edit_experiance" class="form-control"></textarea>
                            <span class="text-danger errorExperiance"></span>
                        </div>
                        <div class="form-group">
                            <label for="edit_type">Type <span class="text-danger" title="Required">*</span></label>                            
                            <select id="edit_type" class="form-control">
                              <option value="">Select</option>
                                <option value="1">Service</option>
                                <option value="2">Row meterial provider</option>                              
                            </select>
                            <span class="text-danger errorType"></span>
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
<script src="{{ asset('abasvumi/admin/js/supplier.js') }}"></script>
<script>    
    $(".users").addClass("menu-open");
    $(".nav-supplier").addClass("active");
</script>
@endsection