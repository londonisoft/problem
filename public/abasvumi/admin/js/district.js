
//create education
$("#createEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('division_id', $("#division_id").val());
    form_data.append('name', $("#name").val());
    form_data.append('bn_name', $("#bn_name").val());
    form_data.append('url', $("#url").val());
    form_data.append('lat', $("#lat").val());
    form_data.append('lon', $("#lon").val());

    $.ajax({
        type:'POST',
        url: '/admin/district/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            
            console.log(response.data);

            if((response.errors)){
                
                if (response.errors.division_id) {
                    $('.errorDivision').text(response.errors.division_id);
                }else{
                    $('.errorDivision').text("");
                }      

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
                            
                if (response.errors.url) {
                    $('.errorUrl').text(response.errors.url);
                }else{
                    $('.errorUrl').text("");
                }    

                if (response.errors.lat) {
                    $('.errorLat').text(response.errors.lat);
                }else{
                    $('.errorLat').text("");
                }    

                if (response.errors.lon) {
                    $('.errorLon').text(response.errors.lon);
                }else{
                    $('.errorLon').text("");
                }

                          
            }else{
                $('#addEducationModal').modal('hide');
                $("#allEducation").append('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.division_name +'</td>\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td>'+ response.data.url +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-id="'+ response.data.id +'" data-division_id="'+ response.data.division_id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'" data-url="'+ response.data.url +'" data-lat="'+ response.data.lat +'" data-lon="'+ response.data.lon +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#division_id").val('');
                $("#name").val('');
                $("#bn_name").val('');
                $("#url").val('');
                $("#lat").val('');
                $("#lon").val('');
                toastr.success('Created District.')
            }
        }
    });
});

//Open edit education modal
$(document).on('click', '#editEducation', function () {

    $('#editEducationModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_division_id').val($(this).data('division_id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_bn_name').val($(this).data('bn_name'));
    $('#edit_url').val($(this).data('url'));
    $('#edit_lat').val($(this).data('lat'));
    $('#edit_lon').val($(this).data('lon'));
 });


 //Update education
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('division_id', $("#edit_division_id").val());
    form_data.append('name', $("#edit_name").val());
    form_data.append('bn_name', $("#edit_bn_name").val());
    form_data.append('url', $("#edit_url").val());
    form_data.append('lat', $("#edit_lat").val());
    form_data.append('lon', $("#edit_lon").val());

    $.ajax({
        type:'POST',
        url: '/admin/district/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            console.log(response);
            if((response.errors)){
                
                if (response.errors.division_id) {
                    $('.errorDivision').text(response.errors.division_id);
                }else{
                    $('.errorDivision').text("");
                }      

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
                            
                if (response.errors.url) {
                    $('.errorUrl').text(response.errors.url);
                }else{
                    $('.errorUrl').text("");
                }    

                if (response.errors.lat) {
                    $('.errorLat').text(response.errors.lat);
                }else{
                    $('.errorLat').text("");
                }    

                if (response.errors.lon) {
                    $('.errorLon').text(response.errors.lon);
                }else{
                    $('.errorLon').text("");
                } 
                          
            }else{
                $('#editEducationModal').modal('hide');
                $("tr.education-" + response.data.id).replaceWith('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.division_name +'</td>\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td>'+ response.data.url +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-id="'+ response.data.id +'" data-division_id="'+ response.data.division_id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'" data-url="'+ response.data.url +'" data-lat="'+ response.data.lat +'" data-lon="'+ response.data.lon +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#division_id").val('');
                $("#name").val('');
                $("#bn_name").val('');
                $("#url").val('');
                $("#lat").val('');
                $("#lon").val('');
                toastr.success('Update District.')
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
        url: '/admin/district/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteEducationModal').modal('hide');
            $('.education-' + $('#del_id').val()).remove();
            toastr.success('District Deleted')
        }
    });
});