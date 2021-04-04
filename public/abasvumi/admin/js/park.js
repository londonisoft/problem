
//Search Division by district.
$('#division_id').change(function(){
    var division_id = $("#division_id :selected").val();
    var redirect_url = website_url + 'admin/common/get-district/' + division_id;

    $.get(redirect_url, function (data) {
        console.log(data);
        $(".districtBydivision").empty();
        $(".thanaBydistrict").empty();
        $(".districtBydivision").append(data.districts);
    });

});

//Search District by thana.
$('#district_id').change(function(){
    var district_id = $("#district_id :selected").val();
    var redirect_url = website_url + 'admin/common/get-thana/' + district_id;

    $.get(redirect_url, function (data) {
        $(".thanaBydistrict").empty();
        $(".thanaBydistrict").append(data.thanas);
    });

});

//create education
$("#createEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#createEducationForm")[0]);
    form_data.append('division_id', $("#division_id").val());
    form_data.append('district_id', $("#district_id").val());
    form_data.append('thana_id', $("#thana_id").val());
    form_data.append('name', $("#name").val());
    form_data.append('bn_name', $("#bn_name").val());
    form_data.append('description', $("#description").val());
    form_data.append('bn_description', $("#bn_description").val());
    form_data.append('lat', $("#lat").val());
    form_data.append('lon', $("#lon").val());

    $.ajax({
        type:'POST',
        url: '/admin/park/store',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        data: form_data,
        success:function(response){
            if((response.errors)){
                
                if (response.errors.division_id) {
                    $('.errorDivision').text(response.errors.division_id);
                }else{
                    $('.errorDivision').text("");
                }
                
                if (response.errors.district_id) {
                    $('.errorDistrict').text(response.errors.district_id);
                }else{
                    $('.errorDistrict').text("");
                }
                
                if (response.errors.thana_id) {
                    $('.errorThana').text(response.errors.thana_id);
                }else{
                    $('.errorThana').text("");
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

                if (response.errors.image) {
                    $('.errorImage').text(response.errors.image);
                }else{
                    $('.errorImage').text("");
                }    
                          
            }else{
                $('#addEducationModal').modal('hide');
                $("#allEducation").append('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.division_name +'</td>\n' +
                        '<td>'+ response.data.district_name +'</td>\n' +
                        '<td>'+ response.data.thana_name +'</td>\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-division_id="'+ response.data.division_id +'" data-district_id="'+ response.data.district_id +'" data-thana_id="'+ response.data.thana_id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'" data-description="'+ response.data.description +'" data-bn_description="'+ response.data.bn_description +'" data-lat="'+ response.data.lat +'" data-lon="'+ response.data.lon +'"  data-image="'+ response.data.image +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#division_id").val('');
                $("#district_id").val('');
                $("#thana_id").val('');
                $("#name").val('');
                $("#bn_name").val('');
                $("#description").val('');
                $("#bn_description").val('');
                $("#lat").val('');
                $("#lon").val('');
                $("#image").val('');
                toastr.success('Created Park.')
            }
        }
    });
});

//Open edit education modal
$(document).on('click', '#editEducation', function () {

    division_id = $(this).data('division_id');
    district_id = $(this).data('district_id');
    thana_id = $(this).data('thana_id');

    var redirect_url = website_url + 'admin/common/division-district-thana/'+ division_id + "/" + district_id + "/" + thana_id;

    $.get(redirect_url, function (data) {
        $(".edit_district").empty();
        $(".edit_thana").empty();
        $(".edit_district").append(data.appendDistrict);
        $(".edit_thana").append(data.appendThana);
    });

    var image = image_base_path + $(this).data('image');
    $('#editEducationModal').modal('show');
    $('#edit_id').val($(this).data('id'));
    $('#edit_division_id').val($(this).data('division_id'));
    $('#edit_district_id').val(district_id);
    $('#edit_thana_id').val($(this).data('thana_id'));
    $('#edit_name').val($(this).data('name'));
    $('#edit_bn_name').val($(this).data('bn_name'));
    $('#edit_description').val($(this).data('description'));
    $('#edit_bn_description').val($(this).data('bn_description'));
    $('#edit_lat').val($(this).data('lat'));
    $('#edit_lon').val($(this).data('lon'));
    $("#educationCurrentImage").attr("src", image);
 });

//Search Division by district for edit modal.
$('#edit_division_id').change(function(){
    var division_id = $("#edit_division_id :selected").val();
    var redirect_url = website_url + 'admin/common/get-district/' + division_id;

    $.get(redirect_url, function (data) {
        $(".editDistrictBydivision").empty();
        $(".editThanaBydistrict").empty();
        $(".editDistrictBydivision").append(data.districts);
    });

});

//Search District by thana for edit modal.
$('#edit_district_id').change(function(){
    var district_id = $("#edit_district_id :selected").val();
    var redirect_url = website_url + 'admin/common/get-thana/' + district_id;

    $.get(redirect_url, function (data) {
        $(".editThanaBydistrict").empty();
        $(".editThanaBydistrict").append(data.thanas);
    });

});

 //Update education
$("#updateEducation").click(function (e) {
    e.preventDefault();

    var form_data = new FormData($("#updateEducationForm")[0]);
    form_data.append('id', $("#edit_id").val());
    form_data.append('division_id', $("#edit_division_id").val());
    form_data.append('district_id', $("#edit_district_id").val());
    form_data.append('thana_id', $("#edit_thana_id").val());
    form_data.append('name', $("#edit_name").val());
    form_data.append('bn_name', $("#edit_bn_name").val());
    form_data.append('description', $("#edit_description").val());
    form_data.append('bn_description', $("#edit_bn_description").val());
    form_data.append('lat', $("#edit_lat").val());
    form_data.append('lon', $("#edit_lon").val());

    $.ajax({
        type:'POST',
        url: '/admin/park/update',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        enctype: 'multipart/form-data',
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
                
                if (response.errors.district_id) {
                    $('.errorDistrict').text(response.errors.district_id);
                }else{
                    $('.errorDistrict').text("");
                }
                
                if (response.errors.thana_id) {
                    $('.errorThana').text(response.errors.thana_id);
                }else{
                    $('.errorThana').text("");
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

                if (response.errors.image) {
                    $('.errorImage').text(response.errors.image);
                }else{
                    $('.errorImage').text("");
                }    
                          
            }else{
                $('#editEducationModal').modal('hide');
                $("tr.education-" + response.data.id).replaceWith('' +
                    '<tr align="center" class="education-'+ response.data.id +'">\n' +
                        '<td>'+ response.data.division_name +'</td>\n' +
                        '<td>'+ response.data.district_name +'</td>\n' +
                        '<td>'+ response.data.thana_name +'</td>\n' +
                        '<td>'+ response.data.name +'</td>\n' +
                        '<td>'+ response.data.bn_name +'</td>\n' +
                        '<td style="text-align:center;">\n' +
                        '<button class="btn btn-warning btn-sm" data-toggle="modal" id="editEducation" data-target="#editEducationModal" data-id="'+ response.data.id +'" data-division_id="'+ response.data.division_id +'" data-district_id="'+ response.data.district_id +'" data-thana_id="'+ response.data.thana_id +'" data-name="'+ response.data.name +'" data-bn_name="'+ response.data.bn_name +'" data-description="'+ response.data.description +'" data-bn_description="'+ response.data.bn_description +'" data-lat="'+ response.data.lat +'" data-lon="'+ response.data.lon +'"  data-image="'+ response.data.image +'" title="Edit"><i class="fas fa-pencil-alt"></i></button>\n' +
                            '<button class="btn btn-danger btn-sm" data-toggle="modal" id="deleteEducation" data-target="#deleteEducationModal" data-id="'+ response.data.id +'" title="Delete"><i class="fas fa-trash"></i></button>\n' +
                        '</td>\n' +
                    '</tr>'+
                '');
                $("#division_id").val('');
                $("#district_id").val('');
                $("#thana_id").val('');
                $("#name").val('');
                $("#bn_name").val('');
                $("#description").val('');
                $("#bn_description").val('');
                $("#lat").val('');
                $("#lon").val('');
                $("#edit_image").val('');
                toastr.success('Update Park.')
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
        url: '/admin/park/destroy',
        headers: { 'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content') },
        data: {
            id: $('#del_id').val()
        },
        success: function (data) {
            $('#deleteEducationModal').modal('hide');
            $('.education-' + $('#del_id').val()).remove();
            toastr.success('Park Deleted')
        }
    });
});