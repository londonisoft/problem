//create block
$("#createRole").click(function (e) {
    e.preventDefault();
    var name    = $("#name").val();
    var bn_name = $("#bn_name").val();
    $.ajax({
        type:'POST',
        url: '/admin/block/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            name     : name,
            bn_name  : bn_name,
        },
        success:function(response){
            console.log(response);
            if((response.errors)){
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }
                if (response.errors.bn_name) {
                    $('.errorBnName').text(response.errors.bn_name);
                }                
            }else{
                $('#createRoleModal').modal('hide');
                $("#allRole").append('' +
                    '<tr align="center" class="role-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                            '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editRole" data-target="#editRoleModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'"  data-bn_name="'+ response.data.bn_name +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteRole" data-target="#deleteRoleModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#bn_name").val('');
                toastr.success('Block Created.')
            }
        }
    });
});

//open edit block modal
$(document).on('click', '#editRole', function () {
    $('#editRoleModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_bn_name').val($(this).data('bn_name'));
 });

// update block
$("#updateRole").click(function (e) {
    e.preventDefault();
    var id       = $("#edit_id").val();
    var name     = $("#edit_name").val();
    var bn_name  = $("#edit_bn_name").val();
    $.ajax({
        type:'POST',
        url: '/admin/block/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id      : id,
            name    : name,
            bn_name : bn_name,
        },
        success:function(response){
            if((response.errors)){
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }
                if (response.errors.bn_name) {
                    $('.errorBnName').text(response.errors.bn_name);
                }  
            }else{
                $('#editRoleModal').modal('hide');
                $("tr.role-"+ response.data.id).replaceWith('' +
                    '<tr align="center" class="role-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                            '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editRole" data-target="#editRoleModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteRole" data-target="#deleteRoleModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                toastr.success('Block Updated.')
            }
        }
    });
});

//open delete block modal
$(document).on('click', '#deleteRole', function () {
    $('#deleteRoleModal').modal('show');
    $('#del_id').val($(this).data('id'));
 });

//destroy block
$("#destroyRole").click(function(){
    $.ajax({
        type: 'POST',
        url: '/admin/block/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        
        success: function (data) {
            $('#deleteRoleModal').modal('hide');
            $('.role-' + $('#del_id').val()).remove();
            toastr.success('Block Deleted')
        }
    });
});