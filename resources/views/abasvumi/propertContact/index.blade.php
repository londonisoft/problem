@extends('abasvumi.layout.admin')
@section('title','Property type')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Property Contact List</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
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
                            <th>Propety Id</th>
                            <th>Name</th>
                            <th>Phone </th>
                            <th style="text-align:center;">Action</th>
                        </tr>
                    </thead>
                    <tbody id="allRole">
                      @foreach($contacts as $contact)
                        <tr class="role-{{ $contact->id }}">
                            <td>{{ $contact->pro_id }}</td>
                            <td>{{ $contact->name }}</td>
                            <td>{{ $contact->phone }}</td>
                            <td style="vertical-align:middle;text-align:center;">
                                <button class="btn btn-sm btn-warning" id="editRole" data-toggle="modal" data-target="#editRoleModal" data-name="{{ $contact->name }}" data-email="{{ $contact->email }}" data-phone="{{ $contact->phone }}" data-message="{{ $contact->message }}" data-pro_id="{{ $contact->pro_id }}" title="Edit"><i class="fas fa-eye"></i></button>
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
    <div class="modal" tabindex="-1" id="editRoleModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title w-100">Property Contact Details</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                    <table class='table table-bordered table-sm'>
                      <tr>
                        <th colspan='2' class="text-center"><span class='text-bold' id='view_pro_id'></span></th>
                      </tr>
                      <tr>
                        <th  width='100px'>Name</th>
                        <td><span id='view_name'></span></td>
                      </tr>
                      <tr>
                        <th>Email</th>
                        <td><span id='view_email'></span></td>
                      </tr>
                      <tr>
                        <th>Phone</th>
                        <td><span id='view_phone'></span></td>
                      </tr>
                      <tr>
                        <th>Message</th>
                        <td><span id='view_message'></span></td>
                      </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Closed</button>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('scripts')
<script src="{{ asset('abasvumi/admin/js/propertyContact.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>    
    $(".properties").addClass("menu-open");
    $(".nav-service-type").addClass("active");
</script>
@endsection