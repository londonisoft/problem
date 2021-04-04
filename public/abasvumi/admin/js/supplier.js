//create user
$("#createUser").click(function (e) {
    e.preventDefault();
    var form_data = new FormData($("#createUserForm")[0]);
    form_data.append('name', $("#name").val());
    form_data.append('email', $("#email").val());
    form_data.append('phone', $("#phone").val());
    form_data.append('address', $("#address").val());
    form_data.append('experiance', $("#experiance").val());
    form_data.append('type', $("#type").val());
    $.ajax({
        type:'POST',
        url: '/admin/supplier/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            if((response.errors)){
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }
                if (response.errors.email) {
                    $('.errorEmail').text(response.errors.email);
                }
                if (response.errors.phone) {
                    $('.errorPhone').text(response.errors.phone);
                }
                if (response.errors.address) {
                    $('.errorAddress').text(response.errors.address);
                }
                if (response.errors.experiance) {
                    $('.errorExperiance').text(response.errors.experiance);
                }
                if (response.errors.type) {
                    $('.errorType').text(response.errors.type);
                }
            }else{
                $('#createUserModal').modal('hide');
                $("#allUser").append('' +
                    '<tr align="center" class="user-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.email +'</td>\n' +
                        '<td>'+ response.data.phone +'</td>\n' +
                        '<td>'+ response.data.address +'</td>\n' +
                        '<td>'+ response.data.experiance +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editUser" data-target="#editUserModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-email="'+ response.data.email +'" data-phone="'+ response.data.phone +'" data-address="'+ response.data.address +'" data-experiance="'+ response.data.experiance +'"  data-type="'+ response.data.type +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteUser" data-target="#deleteUserModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#email").val('');
                $("#phone").val('');
                $("#address").val('');
                $("#experiance").val('');
                $("#type").val('');
                toastr.success('Supplier Created.')
            }
        }
    });
});

//open edit user modal
$(document).on('click', '#editUser', function () {
    var image = image_base_path + $(this).data('image');
    $('#editUserModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_email').val($(this).data('email'));
    $('#edit_phone').val($(this).data('phone'));
    $('#edit_address').val($(this).data('address'));
    $('#edit_experiance').val($(this).data('experiance'));
    $('#edit_type').val($(this).data('type'));
 });

// update role
$("#updateUser").click(function (e) {
    e.preventDefault();    
    var form_data = new FormData($("#editUserForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('name', $("#edit_name").val());
    form_data.append('email', $("#edit_email").val());
    form_data.append('phone', $("#edit_phone").val());
    form_data.append('address', $("#edit_address").val());
    form_data.append('experiance', $("#edit_experiance").val());
    form_data.append('type', $("#edit_type").val());
    $.ajax({
        type:'POST',
        url: '/admin/supplier/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            if((response.errors)){
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }
                if (response.errors.email) {
                    $('.errorEmail').text(response.errors.email);
                }
                if (response.errors.phone) {
                    $('.errorPhone').text(response.errors.phone);
                }
                if (response.errors.address) {
                    $('.errorAddress').text(response.errors.address);
                }
                if (response.errors.experiance) {
                    $('.errorExperiance').text(response.errors.experiance);
                }
                if (response.errors.type) {
                    $('.errorType').text(response.errors.type);
                }    
            }else{
                $('#editUserModal').modal('hide');
                $("tr.user-"+ response.data.id).replaceWith('' +
                    '<tr align="center" class="user-'+ response.data.id +'">\n' +
                    '<td>'+ response.data.name +'</td>\n' +
                    '<td>'+ response.data.email +'</td>\n' +
                    '<td>'+ response.data.phone +'</td>\n' +
                    '<td>'+ response.data.address +'</td>\n' +
                    '<td>'+ response.data.experiance +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                            '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editUser" data-target="#editUserModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-email="'+ response.data.email +'" data-phone="'+ response.data.phone +'" data-address="'+ response.data.address +'" data-experiance="'+ response.data.experiance +'"  data-type="'+ response.data.type +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteUser" data-target="#deleteUserModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#email").val('');
                $("#phone").val('');
                $("#address").val('');
                $("#experiance").val('');
                $("#type").val('');
                toastr.success('Supplier Updated.')
            }
        }
    });
});

//open delete user modal
$(document).on('click', '#deleteUser', function () {
    $('#deleteUserModal').modal('show');
    $('#del_id').val($(this).data('id'));
 });

//destroy user
$("#destroyUser").click(function(){
    $.ajax({
        type: 'POST',
        url: '/admin/supplier/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteUserModal').modal('hide');
            $('.user-' + $('#del_id').val()).remove();
            toastr.success('Supplier Deleted')
        }
    });
});