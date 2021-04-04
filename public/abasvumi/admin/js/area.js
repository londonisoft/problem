
//create education
$("#createEducation").click(function (e) {
    e.preventDefault();
    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('name', $("#name").val());
    form_data.append('bn_name', $("#bn_name").val());
    form_data.append('address', $("#address").val());
    form_data.append('address_bn', $("#address_bn").val());
    $.ajax({
        type:'POST',
        url: '/admin/area/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            if((response.errors)){

                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }else{
                    $('.errorName').text("");
                }

                if (response.errors.bn_name) {
                    $('.errorBnName').text(response.errors.bn_name);
                }else{
                    $('.errorBnName').text("");
                }

                if (response.errors.address) {
                    $('.errorAddress').text(response.errors.address);
                }else{
                    $('.errorAddress').text("");
                }

                if (response.errors.address_bn) {
                    $('.errorBnAddress').text(response.errors.address_bn);
                }else{
                    $('.errorBnAddress').text("");
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
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td><img src="'+ image_base_path + response.data.image +'" style="width:80px;height:60px;" /></td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'"  data-image="'+ response.data.image +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#bn_name").val('');
                $("#image").val('');
                toastr.success('Created area.')
            }
        }
    });
});

//Open edit education modal
$(document).on('click', '#editEducation', function () {
    
    var image = image_base_path + $(this).data('image');
    $('#editEducationModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_bn_name').val($(this).data('bn_name'));
    $('#edit_address').val($(this).data('address'));
    $('#edit_address_bn').val($(this).data('address_bn'));
    $("#educationCurrentImage").attr("src", image);

 });

 //Update education
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('name', $("#edit_name").val());
    form_data.append('bn_name', $("#edit_bn_name").val());
    form_data.append('address', $("#edit_address").val());
    form_data.append('address_bn', $("#edit_address_bn").val());

    $.ajax({
        type:'POST',
        url: '/admin/area/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            console.log(response);
            if((response.errors)){
                
                if(response.errors.name){
                    $('.errorName').text(response.errors.name);
                }else{
                    $('.errorName').text("");
                }

                if (response.errors.bn_name) {
                    $('.errorBnName').text(response.errors.bn_name);
                }else{
                    $('.errorBnName').text("");
                }

                if (response.errors.address) {
                    $('.errorAddress').text(response.errors.address);
                }else{
                    $('.errorAddress').text("");
                }

                if (response.errors.address_bn) {
                    $('.errorBnAddress').text(response.errors.address_bn);
                }else{
                    $('.errorBnAddress').text("");
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
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td><img src="'+ image_base_path + response.data.image +'" style="width:80px;height:60px;" /></td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'"  data-image="'+ response.data.image +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#name").val('');
                $("#bn_name").val('');
                $("#edit_image").val('');
                toastr.success('Update area.')
            }
        }
    });
});


//open delete education modal
$(document).on('click', '#deleteEducation', function () {
    $('#deleteEducationModal').modal('show');
    $('#del_id').val('');
    $('#del_id').val($(this).data('id'));
 });

//destroy education
$("#destroyEducation").click(function(){
    $.ajax({
        type: 'POST',
        url: '/admin/area/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteEducationModal').modal('hide');
            $('.education-' + $('#del_id').val()).remove();
            toastr.success('Area Deleted')
        }
    });
});