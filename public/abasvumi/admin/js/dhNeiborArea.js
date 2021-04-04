
//create education
$("#createEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('dhaka_neigbor_id', $("#dhaka_neigbor_id").val());
    form_data.append('area_id', $("#area_id").val());

    $.ajax({
        type:'POST',
        url: '/admin/dhaka/neibors/area/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            
            console.log(response);

            if((response.errors)){
                
                if (response.errors.dhaka_neigbor_id) {
                    $('.errorArea').text(response.errors.dhaka_neigbor_id);
                }else{
                    $('.errorArea').text("");
                }
                
                if (response.errors.area_id) {
                    $('.errorBnTitle').text(response.errors.area_id);
                }else{
                    $('.errorBnTitle').text("");
                } 
                          
            }else{
                $('#addEducationModal').modal('hide');
                $("#allEducation").append('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.neibor_name +'</td>\n' +
                        '<td>'+ response.data.area_name +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-dhaka_neigbor_id="'+ response.data.dhaka_neigbor_id +'" data-area_id="'+ response.data.area_id +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#dhaka_neigbor_id").val('');
                $("#area_id").val('');
                toastr.success('Created Neibor area.')
            }
        }
    });
});

//Open edit education modal
$(document).on('click', '#editEducation', function () {

    var image = image_base_path + $(this).data('image');
    $('#editEducationModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_dhaka_neigbor_id').val($(this).data('dhaka_neigbor_id'));
    $('#edit_area_id').val($(this).data('area_id'));
 });

 //Update education
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('dhaka_neigbor_id', $("#edit_dhaka_neigbor_id").val());
    form_data.append('area_id', $("#edit_area_id").val());

    $.ajax({
        type:'POST',
        url: '/admin/dhaka/neibors/area/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            console.log(response);
            if((response.errors)){
                if (response.errors.dhaka_neigbor_id) {
                    $('.errorArea').text(response.errors.dhaka_neigbor_id);
                }else{
                    $('.errorArea').text("");
                }
            
                if (response.errors.area_id) {
                    $('.errorBnTitle').text(response.errors.area_id);
                }else{
                    $('.errorBnTitle').text("");
                } 

            }else{
                $('#editEducationModal').modal('hide');
                $("tr.education-" + response.data.id).replaceWith('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.neibor_name +'</td>\n' +
                        '<td>'+ response.data.area_name +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-dhaka_neigbor_id="'+ response.data.dhaka_neigbor_id +'" data-area_id="'+ response.data.area_id +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#dhaka_neigbor_id").val('');
                $("#area_id").val('');
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
        url: '/admin/dhaka/neibors/area/destroy',
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