
//create video
$("#createEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('title', $("#title").val());
    form_data.append('bn_title', $("#bn_title").val());
    form_data.append('video_link', $("#video_link").val());

    $.ajax({
        type:'POST',
        url: '/admin/video/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            if((response.errors)){
                
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
                
                if (response.errors.video_link) {
                    $('.errorVideoLink').text(response.errors.video_link);
                }else{
                    $('.errorVideoLink').text("");
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
                        '<td>'+ response.data.title +'</td>\n' +
                        '<td>'+ response.data.bn_title +'</td>\n' +
                        '<td><img src="'+ image_base_path + response.data.image +'" style="width:80px;height:60px;" /></td>\n' +
                        '<td>'+ response.data.video_link +'</td>\n' +                        
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-title="'+ response.data.title +'" data-bn_title="'+ response.data.bn_title +' "data-image="'+ response.data.image +'" data-video_link="'+ response.data.video_link +'"  title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#title").val('');
                $("#bn_title").val('');
                $("#video_link").val('');
                $("#image").val('');
                toastr.success('Created Video.')
            }
        }
    });
});

//Open edit education modal
$(document).on('click', '#editEducation', function () {

    var image = image_base_path + $(this).data('image');
    $('#editEducationModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_title').val($(this).data('title'));
    $('#edit_bn_title').val($(this).data('bn_title'));
    $('#edit_video_link').val($(this).data('video_link'));
    $("#videoCurrentImage").attr("src", image);
 });

 //Update video
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('title', $("#edit_title").val());
    form_data.append('bn_title', $("#edit_bn_title").val());
    form_data.append('video_link', $("#edit_video_link").val());

    $.ajax({
        type:'POST',
        url: '/admin/video/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            console.log(response);
            if((response.errors)){
                
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
                
                if (response.errors.video_link) {
                    $('.errorVideoLink').text(response.errors.video_link);
                }else{
                    $('.errorVideoLink').text("");
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
                        '<td>'+ response.data.title +'</td>\n' +
                        '<td>'+ response.data.bn_title +'</td>\n' +
                        '<td><img src="'+ image_base_path + response.data.image +'" style="width:80px;height:60px;" /></td>\n' +
                        '<td>'+ response.data.video_link +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-title="'+ response.data.title +'" data-bn_title="'+ response.data.bn_title +'" data-video_link="'+ response.data.video_link +'"  data-image="'+ response.data.image +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#title").val('');
                $("#bn_title").val('');
                $("#video_link").val('');
                $("#image").val('');
                toastr.success('Update Video.')
            }
        }
    });
});


//open delete education modal
$(document).on('click', '#deleteEducation', function () {
    $('#deleteEducationModal').modal('show');
    $('#del_id').val($(this).data('id'));
 });

//destroy education
$("#destroyEducation").click(function(){
    $.ajax({
        type: 'POST',
        url: '/admin/video/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteEducationModal').modal('hide');
            $('.education-' + $('#del_id').val()).remove();
            toastr.success('Delete Video')
        }
    });
});