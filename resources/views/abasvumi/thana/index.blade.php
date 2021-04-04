@extends('abasvumi.layout.admin')
@section('title','Thanas')

@section('content')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">

    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Thanas</h1>
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
                      <table id="category" class="table table-bordered table-striped">

                        <thead>
                            <tr>
                                <th style="width:150px;text-align:center;">District</th>
                                <th style="width:150px;text-align:center;">Name</th>
                                <th style="width:150px;text-align:center;">Bangla Name</th>
                                <th style="width:150px;text-align:center;">Url</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </thead>

                        <tbody id="allEducation">
                            @foreach($thanas as $thana)
                                <tr class="education-{{ $thana->id }}">
                                    <td style="vertical-align:middle;text-align:center;">{{ $thana->district_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $thana->name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $thana->bn_name}}</td>
                                    <td style="vertical-align:middle;text-align:center;">{{ $thana->url}}</td>
                                    <td style="vertical-align:middle;text-align:center;">
                                        <button class="btn btn-sm btn-warning" id="editEducation" data-toggle="modal" data-id="{{ $thana->id }}" data-district_id="{{ $thana->district_id }}" data-name="{{ $thana->name }}" data-bn_name="{{ $thana->bn_name }}" data-url="{{ $thana->url }}"   ><i class="fas fa-pencil-alt"></i></button>
                                        <button class="btn btn-sm btn-danger" id="deleteEducation" data-toggle="modal" data-target="#deleteEducationModal" data-id="{{ $thana->id }}" ><i class="fas fa-trash"></i></button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>

                        <tfoot>
                            <tr>
                                <th style="width:150px;text-align:center;">Division</th>
                                <th style="width:150px;text-align:center;">Name</th>
                                <th style="width:150px;text-align:center;">Bangla Name</th>
                                <th style="width:150px;text-align:center;">Url</th>
                                <th style=" width:150px;text-align:center;  text-align:center;">Action</th>
                            </tr>
                        </tfoot>
                      </table>
                    </div>
                  </div>
            </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <div class="modal fade" tabindex="-1" id="addEducationModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Create New Thana</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">

                <form id="createEducationForm" method="POST">

                    {{ csrf_field() }} {{ method_field('POST') }}

                    <div class="form-group">
                        <label for="district_id">District <span class="text-danger" title="Required">*</span></label>
                        <select id="district_id" class="form-control select2">
                            <option value=" ">Select District</option>
                              @foreach($districts as $district)
                                <option value="{{ $district->id }}">{{ $district->name}}</option>
                              @endforeach
                        </select>
                        <span class="text-danger errorDistrict"></span>
                      </div>

                      <div class="form-group">
                          <label for="name">Name (En)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="name" class="form-control" placeholder="English name">
                          <span class="text-danger errorName"></span>
                      </div>

                      <div class="form-group">
                          <label for="bn_name">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="bn_name" class="form-control" placeholder="Bangla name">
                          <span class="text-danger errorBnName"></span>
                      </div>

                      <div class="form-group">
                        <label for="url">Url <span class="text-danger" title="Required">*</span></label>
                        <input type="text" id="url" class="form-control" placeholder="Url">
                        <span class="text-danger errorUrl"></span>
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
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                  <h5 class="modal-title text-center w-100">Edit Thana</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                
                <div class="modal-body">
                  <form id="updateEducationForm" method="post">

                    {{ csrf_field() }} {{ method_field('POST') }}

                    <div class="form-group">
                        <label for="edit_district_id">Division <span class="text-danger" title="Required">*</span></label>
                        <select id="edit_district_id" class="form-control select2">
                            <option value="">Select District</option>
                            @foreach($districts as $district)
                            <option value="{{ $district->id }}">{{ $district->name}}</option>
                            @endforeach
                        </select>
                        <span class="text-danger errorDistrict"></span>
                      </div>

                      <div class="form-group">
                          <label for="edit_name">Name (En)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_name" class="form-control" placeholder="English name">
                          <input type="hidden" id="edit_id"/>
                          <span class="text-danger errorName"></span>
                      </div>

                      <div class="form-group">
                          <label for="edit_bn_name">Name (Bn)<span class="text-danger" title="Required">*</span></label>
                          <input type="text" id="edit_bn_name" class="form-control" placeholder="Bangla name">
                          <span class="text-danger errorBnName"></span>
                      </div>

                      <div class="form-group">
                        <label for="edit_url">Url <span class="text-danger" title="Required">*</span></label>
                        <input type="text" id="edit_url" class="form-control" placeholder="Url">
                        <span class="text-danger errorUrl"></span>
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
<script src="{{ asset('abasvumi/admin/js/thana.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('abasvumi/admin/js/dataTables.bootstrap4.js') }}"></script>
<script>
    $(".settings").addClass("menu-open");
    $(".nav-thana").addClass("active");
</script>
@endsection