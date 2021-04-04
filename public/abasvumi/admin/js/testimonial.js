
//create education
$("#createEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('name', $("#name").val());
    form_data.append('name_bn', $("#name_bn").val());
    form_data.append('description', $("#description").val());
    form_data.append('description_bn', $("#description_bn").val());
    form_data.append('designation', $("#designation").val());
    form_data.append('designation_bn', $("#designation_bn").val());

    $.ajax({
        type:'POST',
        url: '/admin/testimonial/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
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
                
                if (response.errors.name_bn) {
                    $('.errorNameBn').text(response.errors.name_bn);
                }else{
                    $('.errorNameBn').text("");
                } 

                if (response.errors.description) {
                    $('.errorDescription').text(response.errors.description);
                }else{
                    $('.errorDescription').text("");
                }  
                            
                if (response.errors.description_bn) {
                    $('.errorDescriptionBn').text(response.errors.description_bn);
                }else{
                    $('.errorDescriptionBn').text("");
                }    

                if (response.errors.image) {
                    $('.errorImage').text(response.errors.image);
                }else{
                    $('.errorImage').text("");
                }    
                          
            }else{
                $('#addEducationModal').modal('hide');
                $("#allEducation").append('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.name_bn +'</td>\n' +
                        '<td><img src="'+ image_base_path + response.data.image +'" style="width:80px;height:60px;" /></td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-name_bn="'+ response.data.name_bn +'" data-description="'+ response.data.description +'" data-description_bn="'+ response.data.description_bn +'" data-image="'+ response.data.image +'" data-designation="'+ response.data.designation +'" data-designation_bn="'+ response.data.designation_bn +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#category_id").val('');
                $("#name").val('');
                $("#name_bn").val('');
                $("#description").val('');
                $("#description_bn").val('');
                $("#designation").val('');
                $("#designation_bn").val('');
                $("#image").val('');
                toastr.success('Created area guide.')
            }
        }
    });
});

//Open edit education modal
$(document).on('click', '#editEducation', function () {

    var image = image_base_path + $(this).data('image');
    $('#editEducationModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_category_id').val($(this).data('category_id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_name_bn').val($(this).data('name_bn'));
    $('#edit_description').val($(this).data('description'));
    $('#edit_description_bn').val($(this).data('description_bn'));
    $('#edit_designation').val($(this).data('designation'));
    $('#edit_designation_bn').val($(this).data('designation_bn'));

    $("#educationCurrentImage").attr("src", image);
 });

 //Update education
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('category_id', $("#edit_category_id").val());
    form_data.append('name', $("#edit_name").val());
    form_data.append('name_bn', $("#edit_name_bn").val());
    form_data.append('description', $("#edit_description").val());
    form_data.append('description_bn', $("#edit_description_bn").val());
    form_data.append('designation', $("#edit_designation").val());
    form_data.append('designation_bn', $("#edit_designation_bn").val());
    $.ajax({
        type:'POST',
        url: '/admin/testimonial/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
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
                
                if (response.errors.name_bn) {
                    $('.errorBnName').text(response.errors.name_bn);
                }else{
                    $('.errorBnName').text("");
                } 

                if (response.errors.description) {
                    $('.errorDescription').text(response.errors.description);
                }else{
                    $('.errorDescription').text("");
                }  
                            
                if (response.errors.description_bn) {
                    $('.errorBnDescription').text(response.errors.description_bn);
                }else{
                    $('.errorBnDescription').text("");
                }    

                if (response.errors.image) {
                    $('.errorImage').text(response.errors.image);
                }else{
                    $('.errorImage').text("");
                }  
                          
            }else{
                $('#editEducationModal').modal('hide');
                $("tr.education-" + response.data.id).replaceWith('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.name_bn +'</td>\n' +
                        '<td><img src="'+ image_base_path + response.data.image +'" style="width:80px;height:60px;" /></td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-name_bn="'+ response.data.name_bn +'" data-description="'+ response.data.description +'" data-description_bn="'+ response.data.description_bn +'" data-image="'+ response.data.image +'" data-designation="'+ response.data.designation +'" data-designation_bn="'+ response.data.designation_bn +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#bn_nam").val('');
                $("#description").val('');
                $("#description_bn").val('');
                $("#designation").val('');
                $("#designation_bn").val('');
                $("#edit_image").val('');
                toastr.success('Updated testimonial.')
            }
        }
    });
});


//open delete area guide
$(document).on('click', '#deleteEducation', function () {
    $('#deleteEducationModal').modal('show');
    $('#del_id').val('');
    $('#del_id').val($(this).data('id'));
 });

//destroy education
$("#destroyEducation").click(function(){
    $.ajax({
        type: 'POST',
        url: '/admin/testimonial/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteEducationModal').modal('hide');
            $('.education-' + $('#del_id').val()).remove();
            toastr.success('Testimonial deleted')
        }
    });
});