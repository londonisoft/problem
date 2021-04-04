
//Search Division by district.
$('#division_id').change(function(){
    var division_id = $("#division_id :selected").val();
    var redirect_url = website_url + 'admin/common/get-district/' + division_id;

    $.get(redirect_url, function (data) {
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

//Search Division by district for edit modal.
$('#edit_division_id').change(function(){
    var id = $("#edit_division_id :selected").val();
    var redirect_url = website_url + 'admin/education/change/district/by/division/' + id;

    $.get(redirect_url, function (data) {
        $(".editDistrictBydivision").empty();
        $(".editThanaBydistrict").empty();
        $(".editDistrictBydivision").append(data.districts);
    });

});

//Search District by thana for edit modal.
$('#edit_district_id').change(function(){
    var id = $("#edit_district_id :selected").val();
    var redirect_url = website_url + 'admin/education/change/thana/by/district/' + id;

    $.get(redirect_url, function (data) {
        $(".editThanaBydistrict").empty();
        $(".editThanaBydistrict").append(data.thanas);
    });

});


//Search educational, religion, park, hospital, resturant by thana.
$('#thana_id').change(function(){
    var thana_id = $("#thana_id :selected").val();
    var redirect_url = website_url + 'admin/common/get-education-hospital-resturant-park-religion/' + thana_id;

    $('#education_id').empty();
    $('#hospital_id').empty();
    $('#restaurants_id').empty();
    $('#parks_id').empty();
    $('#religious_id').empty();

    $.get(redirect_url, function (data) {

        var educations = data.educations;
        var hospitals  = data.hospitals;
        var parks      = data.parks;
        var religious  = data.religious;
        var resturants = data.resturants;

        $.each(educations, function (index, value) {
            var option = $("<option value='" + value.id + "'>" + value.name + "</option>");
            $('#education_id').append(option);
        });     

        $.each(hospitals, function (index, value) {
            var option = $("<option value='" + value.id + "'>" + value.name + "</option>");
            $('#hospital_id').append(option);
        });     

        $.each(resturants, function (index, value) {
            var option = $("<option value='" + value.id + "'>" + value.name + "</option>");
            $('#restaurants_id').append(option);
        });     

        $.each(parks, function (index, value) {
            var option = $("<option value='" + value.id + "'>" + value.name + "</option>");
            $('#parks_id').append(option);
        });     

        $.each(religious, function (index, value) {
            var option = $("<option value='" + value.id + "'>" + value.name + "</option>");
            $('#religious_id').append(option);
        });     

    });

});

