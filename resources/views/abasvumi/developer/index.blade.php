@extends('abasvumi.layout.admin')
@section('title','Developers')

@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"> Developers </h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
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
                                <th style="width:300px;text-align:center;">Name</th>
                                <th style="width:150px;text-align:center;">Mobile</th>
                                <th style="width:200px;text-align:center;">Email</th>
                                <th style="width:150px;text-align:center;">Featured S</th>
                                <th style="width:150px;text-align:center;">Status</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($external_users as $user)
                                <tr">
                                    <td style="vertical-align:middle;text-align:center;">{{ $user->name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $user->phone}}</td>                                  
                                    <td style="vertical-align:middle;text-align:center;">{{ $user->email}}</td>  
                                    <td style="vertical-align:middle;text-align:center;">{{ ($user->is_featured) ? "Featured" : ""}}</td>                                  
                                    <td style="vertical-align:middle;text-align:center;">{{ ($user->status) ? "Approved" : "Pending"}}</td>                                  
                                    <td style="vertical-align:middle;text-align:center;">
                                        <button class="btn btn-sm btn-warning" id="editRole" data-toggle="modal" data-target="#createRoleModal" data-id="{{ $user->id }}" data-is_featured="{{ $user->is_featured }}" data-status="{{ $user->status }}" title="Edit"><i class="fas fa-pencil-alt"></i></button>
                                        <!-- <a onclick="return confirm('Are you sure');" href="{{ route('user.destroy',['id'=>$user->id])}}" class="btn btn-sm btn-danger" id="deleteEducation" ><i class="fas fa-trash"></i></a> -->
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
            url: '/admin/developer/status',
            headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
            data: {
                id: $('#edit_id').val(),
                is_featured: $('.is_featured:checked').val(),
                status: $('.status:checked').val()
            },
            success: function (data) {
                $('#createRoleModal').modal('hide');
                toastr.success('Agent status updated.')
                setTimeout(function(){
                  location.reload();
                }, 500);
            }
        });
    });
      $(".products").addClass("menu-open");
      $(".nav-user").addClass("active");
  </script>
@endsection
