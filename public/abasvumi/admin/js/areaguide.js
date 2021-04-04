
//create education
$("#createEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('area_id', $("#area_id").val());
    form_data.append('title', $("#title").val());
    form_data.append('bn_title', $("#bn_title").val());
    form_data.append('description', $("#description").val());
    form_data.append('bn_description', $("#bn_description").val());
    form_data.append('video_link', $("#video_link").val());
    form_data.append('type', $("#type :selected").val());

    $.ajax({
        type:'POST',
        url: '/admin/area-guide/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            
            console.log(response);

            if((response.errors)){
                
                if (response.errors.area_id) {
                    $('.errorArea').text(response.errors.area_id);
                }else{
                    $('.errorArea').text("");
                }
                
                if (response.errors.title) {
                    $('.errorTitle').text(response.errors.title);
                }else{
                    $('.errorTitle').text("");
                }
                
                if (response.errors.bn_title) {
                    $('.errorBnTitle').text(response.errors.bn_title);
                }else{
                    $('.errorBnTitle').text("");
                } 

                if (response.errors.description) {
                    $('.errorDescription').text(response.errors.description);
                }else{
                    $('.errorDescription').text("");
                }  
                            
                if (response.errors.bn_description) {
                    $('.errorBnDescription').text(response.errors.bn_description);
                }else{
                    $('.errorBnDescription').text("");
                }    

                if (response.errors.video_link) {
                    $('.errorVideoLink').text(response.errors.video_link);
                }else{
                    $('.errorVideoLink').text("");
                }

                if (response.errors.type) {
                    $('.errorType').text(response.errors.type);
                }else{
                    $('.errorType').text("");
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
                        '<td>'+ response.data.area_name +'</td>\n' +
                        '<td>'+ response.data.title +'</td>\n' +
                        '<td>'+ response.data.bn_title +'</td>\n' +
                        '<td><img src="'+ image_base_path + response.data.image +'" style="width:80px;height:60px;" /></td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-area_id="'+ response.data.area_id +'" data-title="'+ response.data.title +'" data-bn_title="'+ response.data.bn_title +'" data-description="'+ response.data.description +'" data-bn_description="'+ response.data.bn_description +'" data-video_link="'+ response.data.video_link +'" data-type="'+ response.data.type +'"  data-image="'+ response.data.image +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#area_id").val('');
                $("#title").val('');
                $("#bn_title").val('');
                $("#description").val('');
                $("#bn_description").val('');
                $("#video_link").val('');
                $("#type").val('');
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
    $('#edit_area_id').val($(this).data('area_id'));
    $('#edit_title').val($(this).data('title'));
    $('#edit_bn_title').val($(this).data('bn_title'));
    $('#edit_description').val($(this).data('description'));
    $('#edit_bn_description').val($(this).data('bn_description'));
    $('#edit_video_link').val($(this).data('video_link'));
    $('#edit_type').val($(this).data('type'));
    $("#educationCurrentImage").attr("src", image);
 });

 //Update education
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('area_id', $("#edit_area_id").val());
    form_data.append('title', $("#edit_title").val());
    form_data.append('bn_title', $("#edit_bn_title").val());
    form_data.append('description', $("#edit_description").val());
    form_data.append('bn_description', $("#edit_bn_description").val());
    form_data.append('video_link', $("#edit_video_link").val());
    form_data.append('type', $("#edit_type :selected").val());

    $.ajax({
        type:'POST',
        url: '/admin/area-guide/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            console.log(response);
            if((response.errors)){
                if (response.errors.area_id) {
                    $('.errorArea').text(response.errors.area_id);
                }else{
                    $('.errorArea').text("");
                }
                
                if (response.errors.title) {
                    $('.errorTitle').text(response.errors.title);
                }else{
                    $('.errorTitle').text("");
                }
                
                if (response.errors.bn_title) {
                    $('.errorBnTitle').text(response.errors.bn_title);
                }else{
                    $('.errorBnTitle').text("");
                } 

                if (response.errors.description) {
                    $('.errorDescription').text(response.errors.description);
                }else{
                    $('.errorDescription').text("");
                }  
                            
                if (response.errors.bn_description) {
                    $('.errorBnDescription').text(response.errors.bn_description);
                }else{
                    $('.errorBnDescription').text("");
                }    

                if (response.errors.video_link) {
                    $('.errorVideoLink').text(response.errors.video_link);
                }else{
                    $('.errorVideoLink').text("");
                }

                if (response.errors.type) {
                    $('.errorType').text(response.errors.type);
                }else{
                    $('.errorType').text("");
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
                        '<td>'+ response.data.area_name +'</td>\n' +
                        '<td>'+ response.data.title +'</td>\n' +
                        '<td>'+ response.data.bn_title +'</td>\n' +
                        '<td><img src="'+ image_base_path + response.data.image +'" style="width:80px;height:60px;" /></td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-area_id="'+ response.data.area_id +'" data-title="'+ response.data.title +'" data-bn_title="'+ response.data.bn_title +'"  data-description="'+ response.data.description +'" data-bn_description="'+ response.data.bn_description +'" data-video_link="'+ response.data.video_link +'"  data-type="'+ response.data.type +'"  data-image="'+ response.data.image +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#area_id").val('');
                $("#title").val('');
                $("#bn_title").val('');
                $("#description").val('');
                $("#bn_description").val('');
                $("#video_link").val('');
                $("#type").val('');
                $("#edit_image").val('');
                toastr.success('Update area guide.')
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
        url: '/admin/area-guide/destroy',
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