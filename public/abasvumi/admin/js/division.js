
//create video
$("#createEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('name', $("#name").val());
    form_data.append('bn_name', $("#bn_name").val());
    form_data.append('url', $("#url").val());

    $.ajax({
        type:'POST',
        url: '/admin/division/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            if((response.errors)){
                
                if (response.errors.name) {
                    $('.errorName').text(response.errors.name);
                }else{
                    $('.errorName').text("");
                }
                
                if (response.errors.bn_name) {
                    $('.errorBnName').text(response.errors.bn_name);
                }else{
                    $('.errorBnName').text("");
                }
                
                if (response.errors.url) {
                    $('.errorUrl').text(response.errors.url);
                }else{
                    $('.errorUrl').text("");
                }
                          
            }else{
                $('#addEducationModal').modal('hide');
                $("#allEducation").append('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td>'+ response.data.url +'</td>\n' +                        
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'" data-url="'+ response.data.url +'"  title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#bn_name").val('');
                $("#url").val('');
                toastr.success('Created Division.')
            }
        }
    });
});

//Open edit division modal
$(document).on('click', '#editEducation', function () {

    var image = image_base_path + $(this).data('image');
    $('#editEducationModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_bn_name').val($(this).data('bn_name'));
    $('#edit_url').val($(this).data('url'));
 });

 //Update video
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('name', $("#edit_name").val());
    form_data.append('bn_name', $("#edit_bn_name").val());
    form_data.append('url', $("#edit_url").val());

    $.ajax({
        type:'POST',
        url: '/admin/division/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            console.log(response);
            if((response.errors)){
                
                if (response.errors.name) {
                    $('.errorName').text(response.errors.name);
                }else{
                    $('.errorName').text("");
                }
                
                if (response.errors.bn_name) {
                    $('.errorBnName').text(response.errors.bn_name);
                }else{
                    $('.errorBnName').text("");
                }
                
                if (response.errors.url) {
                    $('.errorUrl').text(response.errors.url);
                }else{
                    $('.errorUrl').text("");
                }
                          
            }else{
                $('#editEducationModal').modal('hide');
                $("tr.education-" + response.data.id).replaceWith('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td>'+ response.data.url +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'" data-url="'+ response.data.url +'"  title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#bn_name").val('');
                $("#url").val('');
                toastr.success('Update Division.')
            }
        }
    });
});


//open delete division modal
$(document).on('click', '#deleteEducation', function () {
    $('#deleteEducationModal').modal('show');
    $('#del_id').val($(this).data('id'));
 });

//destroy division
$("#destroyEducation").click(function(){
    $.ajax({
        type: 'POST',
        url: '/admin/division/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteEducationModal').modal('hide');
            $('.education-' + $('#del_id').val()).remove();
            toastr.success('Delete Division')
        }
    });
});