//create Category
$("#createRole").click(function (e) {
    e.preventDefault();
    var name    = $("#name").val();
    var name_bn = $("#name_bn").val();
    $.ajax({
        type:'POST',
        url: '/admin/dhaka/neibors/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            name     : name,
            name_bn  : name_bn,
        },
        success:function(response){
            console.log(response);
            if((response.errors)){
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }
                if (response.errors.name_bn) {
                    $('.errorBnName').text(response.errors.name_bn);
                }                
                             
            }else{
                $('#createRoleModal').modal('hide');
                $("#allRole").append('' +
                    '<tr align="center" class="role-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.name_bn +'</td>\n' +
                        '<td>'+ 'active' +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                            '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editRole" data-target="#editRoleModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'"  data-name_bn="'+ response.data.name_bn +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteRole" data-target="#deleteRoleModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#name_bn").val('');
                toastr.success('Block Created.')
            }
        }
    });
});

//open edit Category modal
$(document).on('click', '#editRole', function () {
    $('#editRoleModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_bn_name').val($(this).data('name_bn'));
 });

// update Category
$("#updateRole").click(function (e) {
    e.preventDefault();
    var id       = $("#edit_id").val();
    var name     = $("#edit_name").val();
    var name_bn  = $("#edit_bn_name").val();
    
    $.ajax({
        type:'POST',
        url: '/admin/dhaka/neibors/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id      : id,
            name    : name,
            name_bn : name_bn,
        },
        success:function(response){
            if((response.errors)){
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }
                if (response.errors.name_bn) {
                    $('.errorBnName').text(response.errors.name_bn);
                }  
            }else{
                $('#editRoleModal').modal('hide');
                $("tr.role-"+ response.data.id).replaceWith('' +
                    '<tr align="center" class="role-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.name_bn +'</td>\n' +
                        '<td>'+ response.data.name_bn +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                            '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editRole" data-target="#editRoleModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-name_bn="'+ response.data.name_bn +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteRole" data-target="#deleteRoleModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                toastr.success('Block Updated.')
            }
        }
    });
});

//open delete Category modal
$(document).on('click', '#deleteRole', function () {
    $('#deleteRoleModal').modal('show');
    $('#del_id').val($(this).data('id'));
 });

//destroy Category
$("#destroyRole").click(function(){
    $.ajax({
        type: 'POST',
        url: '/admin/dhaka/neibors/destroy',
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