
//create education
$("#createEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('service_category_id', $("#service_category_id").val());
    form_data.append('name', $("#name").val());
    form_data.append('name_bn', $("#name_bn").val());
    form_data.append('description', $("#description").val());
    form_data.append('description_bn', $("#description_bn").val());

    $.ajax({
        type:'POST',
        url: '/admin/service/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            
            console.log(response);

            if((response.errors)){
                
                if (response.errors.service_category_id) {
                    $('.errorCategory').text(response.errors.service_category_id);
                }else{
                    $('.errorArea').text("");
                }
                
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
                toastr.success('Service created success.')
                setTimeout(function(){
                    location.reload();
                }, 500);
            }
        }
    });
});

//Open edit education modal
$(document).on('click', '#editEducation', function () {

    var image = image_base_path + $(this).data('image');
    $('#editEducationModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_service_category_id').val($(this).data('service_category_id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_name_bn').val($(this).data('name_bn'));
    $('#edit_description').val($(this).data('description'));
    $('#edit_description_bn').val($(this).data('description_bn'));
    $("#educationCurrentImage").attr("src", image);
 });

 //Update education
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('service_category_id', $("#edit_service_category_id").val());
    form_data.append('name', $("#edit_name").val());
    form_data.append('name_bn', $("#edit_name_bn").val());
    form_data.append('description', $("#edit_description").val());
    form_data.append('description_bn', $("#edit_description_bn").val());
    $.ajax({
        type:'POST',
        url: '/admin/service/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            console.log(response);
            if((response.errors)){
                if (response.errors.service_category_id) {
                    $('.errorCategory').text(response.errors.service_category_id);
                }else{
                    $('.errorCategory').text("");
                }
                
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
                toastr.success('Service updated success.')
                setTimeout(function(){
                    location.reload();
                }, 500);
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
        url: '/admin/service/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteEducationModal').modal('hide');
            $('.education-' + $('#del_id').val()).remove();
            toastr.success('Area guide deleted')
        }
    });
});