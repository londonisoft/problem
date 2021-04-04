//create role
$("#createRole").click(function (e) {
    e.preventDefault();
    var name        = $("#name").val();
    var description = $("#description").val();
    $.ajax({
        type:'POST',
        url: '/admin/role/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            name        : name,
            description : description,
        },
        success:function(response){
            if((response.errors)){
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }
                if (response.errors.description) {
                    $('.errorDescription').text(response.errors.description);
                }                
            }else{
                $('#createRoleModal').modal('hide');
                $("#allRole").append('' +
                    '<tr class="role-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.description +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                            '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editRole" data-target="#editRoleModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'"  data-description="'+ response.data.description +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteRole" data-target="#deleteRoleModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#description").val('');
                toastr.success('Role Created.')
            }
        }
    });
});

//open edit role modal
$(document).on('click', '#editRole', function () {
    $('#editRoleModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_description').val($(this).data('description'));
 });

// update role
$("#updateRole").click(function (e) {
    e.preventDefault();
    var id          = $("#edit_id").val();
    var name       = $("#edit_name").val();
    var description = $("#edit_description").val();
    $.ajax({
        type:'POST',
        url: '/admin/role/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id          : id,
            name       : name,
            description : description,
        },
        success:function(response){
            if((response.errors)){
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }
                if (response.errors.description) {
                    $('.errorDescription').text(response.errors.description);
                }  
            }else{
                $('#editRoleModal').modal('hide');
                $("tr.role-"+ response.data.id).replaceWith('' +
                    '<tr class="role-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.description +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                            '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editRole" data-target="#editRoleModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-description="'+ response.data.description +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteRole" data-target="#deleteRoleModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                toastr.success('Role Updated.')
            }
        }
    });
});

//open delete role modal
$(document).on('click', '#deleteRole', function () {
    $('#deleteRoleModal').modal('show');
    $('#del_id').val($(this).data('id'));
 });

//destroy role
$("#destroyRole").click(function(){
    $.ajax({
        type: 'POST',
        url: '/admin/role/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteRoleModal').modal('hide');
            $('.role-' + $('#del_id').val()).remove();
            toastr.success('Role Deleted')
        }
    });
});