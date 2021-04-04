//open edit Category modal
$(document).on('click', '#editRole', function () {
    $('#editRoleModal').modal('show');
    $('#view_name').text($(this).data('name'));
    $('#view_email').text($(this).data('email'));
    $('#view_phone').text($(this).data('phone'));
    $('#view_message').text($(this).data('message'));
    $('#view_pro_id').text($(this).data('pro_id'));
 });