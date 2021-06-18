<?php

use App\Http\Controllers\Api\AgentServiceController;
use App\Http\Controllers\Api\ExternalUserPropertyController;
use App\Http\Controllers\Api\ExternalUserController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserProductController;
use App\Http\Controllers\Api\UserServiceController;
use App\Http\Controllers\Api\LocationController;
use App\Http\Controllers\Api\PropertyController;
use App\Http\Controllers\Api\ServiceController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\DhakaNeibor;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\AreaguideController;
use App\Http\Controllers\Api\BlogController;
use App\Http\Controllers\Api\HomeLoanController;
use Illuminate\Support\Facades\Route;

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/external-user/register', [AuthController::class, 'ExternalUserRegister'])->name('external-user.register');
Route::post('/external-user/otp-verify', [AuthController::class, 'verifyOtp'])->name('external-user.otp');
Route::post('/external-user/login', [AuthController::class, 'ExternalUserLogin'])->name('external-user.login');
Route::post('/contact/store', [ContactController::class, 'store'])->name('contact.store');
Route::post('/loan/store', [HomeLoanController::class, 'store']);

Route::post('/external-user/forget-password', [AuthController::class, 'forgetPass'])->name('external-user.forget');
Route::post('/external-user/password-change', [AuthController::class, 'changePass'])->name('external-user.changePass');

Route::get('/common', function() {
    return response()->json([
        'status_code' => 200,
        'divisionList' => \App\Lib\DropDowns::divisionList(),
        'districtList' => \App\Lib\DropDowns::districtList(),
        'thanaList' => \App\Lib\DropDowns::thanaList(),
        'educations' => \App\Lib\DropDowns::educations(),
        'hospitals' => \App\Lib\DropDowns::hospitals(),
        'restaurants' => \App\Lib\DropDowns::restaurants(),
        'parks' => \App\Lib\DropDowns::parks(),
        'religious' => \App\Lib\DropDowns::religious(),
        'serviceTypes' => \App\Lib\DropDowns::serviceTypes(),
        'areas' => \App\Lib\DropDowns::areas(),
        'blocks' => \App\Lib\DropDowns::blocks(),
        'amenitis' => \App\Lib\DropDowns::amenitis(),
        'serviceCategoryList' => \App\Lib\DropDowns::serviceCategoryList(),
        'productCategoryList' => \App\Lib\DropDowns::productCategoryList(),
        'unitList' => \App\Lib\DropDowns::unitList(),
        'setting' => \App\Lib\DropDowns::sertting(),
        'propertyTypeList' => \App\Lib\DropDowns::propertyTypeList(),
        'sumDataList' => \App\Lib\DropDowns::sumDataList(),
        'sliderList' => \App\Lib\DropDowns::sliderList(),
        'userAreaList' => \App\Lib\DropDowns::userAreaList()
    ]);
});
Route::get('/frontend-data', function() {
    return response()->json([
        'status_code' => 200,
        'featuredPropertyList' => \App\Lib\Frontend::featuredPropertyList(),
        'dhakaNeiborList' => \App\Lib\Frontend::dhakaNeiborList(),
        'latestPropertyList' => \App\Lib\Frontend::latestPropertyList(),
        'popularPlaceList' => \App\Lib\Frontend::popularPlaceList(),
        'homeAgentList' => \App\Lib\Frontend::homeAgentList(),
        'homeTestimonialList' => \App\Lib\Frontend::homeTestimonialList(),
        'homeBrandList' => \App\Lib\Frontend::homeBrandList()
        ]);
});

Route::get('/properties/similar/{type}', [PropertyController::class, 'getSimilarProperty']);
Route::get('/properties/{status}/{category}', [PropertyController::class, 'propertyByStatusCategory']);
Route::get('/properties/{status}', [PropertyController::class, 'propertyByStatus']);
Route::get('/popular-place', [PropertyController::class, 'popularPlace']);
Route::get('/home/agent', [PropertyController::class, 'homeAgent']);
Route::get('/home/testimonial', [PropertyController::class, 'homeTestimonial']);
Route::get('/home/brands', [PropertyController::class, 'homeBrand']);
Route::get('/guide-list/{id}', [AreaguideController::class, 'areaGuideList']);
Route::get('/blog-categories', [BlogController::class, 'categories']);
Route::get('/blog-list/{id}', [BlogController::class, 'blog']);

// for porduct route
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/view/{id}', [ProductController::class, 'view']);

// for service route
Route::get('/services', [ServiceController::class, 'index']);
Route::get('/services/view/{id}', [ServiceController::class, 'view']);



Route::get('/properties', [PropertyController::class, 'index'])->name('properties');
Route::get('/property/view/{id}', [PropertyController::class, 'view'])->name('property.view');
Route::get('/property-locations', [LocationController::class, 'getPropertyLocations'])->name('property.locations');

Route::get('/properties', [PropertyController::class, 'index'])->name('properties');

Route::get('/dhaka-neigbors', [DhakaNeibor::class, 'DhakaNeiborList']);

// Route::group(['prefix'=>'/agent','middleware'=>'auth:sanctum'], function(){
//     Route::get('/profile/edit', [AuthController::class, 'agentProfileEdit'])->name('agent.profile.edit');
//     Route::post('/profile/update', [AuthController::class, 'agentProfileUpdate'])->name('agent.profile.update');
//     Route::post('/password/update', [AuthController::class, 'agentPasswordUpdate'])->name('agent.password.update');
//     Route::post('/logout', [AuthController::class, 'agentLogout'])->name('agent.logout');

//     Route::get('/properties', [AgentServiceController::class, 'index'])->name('agent.properties');
//     Route::get('/property/view/{id}', [AgentServiceController::class, 'view'])->name('agent.property.view');
//     Route::post('/property/store', [AgentServiceController::class, 'store'])->name('agent.property.store');
//     Route::get('/property/edit/{id}', [AgentServiceController::class, 'edit'])->name('agent.property.edit');
//     Route::post('/property/update', [AgentServiceController::class, 'update'])->name('agent.property.update');
//     Route::post('/property/thumbnail', [AgentServiceController::class, 'uploadThumnail'])->name('agent.property.uploadThumnail');
//     Route::post('/property/image-remove', [AgentServiceController::class, 'imageRemove'])->name('agent.property.remove');
//     Route::post('/property/upload-img', [AgentServiceController::class, 'uploadProImg'])->name('agent.property.uploadProImg');
// });

Route::group(['prefix'=>'/external-user','middleware'=>'auth:sanctum'], function(){

    Route::get('/profile/edit', [AuthController::class, 'ExternalUserProfileEdit'])->name('ExternalUser.profile.edit');
    Route::post('/profile/update', [AuthController::class, 'ExternalUserProfileUpdate'])->name('ExternalUser.profile.update');
    Route::post('/password/update', [AuthController::class, 'ExternalUserPasswordUpdate'])->name('ExternalUser.password.update');
    Route::post('/logout', [AuthController::class, 'ExternalUserLogout'])->name('ExternalUser.logout');

    Route::get('/properties', [ExternalUserPropertyController::class, 'index'])->name('ExternalUser.properties');
    Route::post('/property/store', [ExternalUserPropertyController::class, 'store'])->name('ExternalUser.property.store');
    Route::get('/property/view/{id}', [ExternalUserPropertyController::class, 'view'])->name('ExternalUser.property.view');
    Route::get('/property/edit/{id}', [ExternalUserPropertyController::class, 'edit'])->name('ExternalUser.property.edit');
    Route::post('/property/update', [ExternalUserPropertyController::class, 'update'])->name('ExternalUser.property.update');
    Route::post('/property/thumbnail', [ExternalUserPropertyController::class, 'uploadThumnail'])->name('ExternalUser.property.uploadThumnail');
    Route::post('/property/image-remove', [ExternalUserPropertyController::class, 'imageRemove'])->name('ExternalUser.property.remove');
    Route::post('/property/upload-img', [ExternalUserPropertyController::class, 'uploadProImg'])->name('ExternalUser.property.uploadProImg');


    Route::get('/products', [UserProductController::class, 'index'])->name('ExternalUser.products');
    Route::post('/product/store', [UserProductController::class, 'store'])->name('ExternalUser.product.store');
    Route::get('/product/edit/{id}', [UserProductController::class, 'edit'])->name('ExternalUser.product.edit');
    Route::post('/product/update', [UserProductController::class, 'update'])->name('ExternalUser.product.update');
    Route::post('/product/delete', [UserProductController::class, 'delete'])->name('ExternalUser.product.delete');

    Route::get('/services', [UserServiceController::class, 'index'])->name('ExternalUser.services');
    Route::post('/service/store', [UserServiceController::class, 'store'])->name('ExternalUser.service.store');
    Route::get('/service/edit/{id}', [UserServiceController::class, 'edit'])->name('ExternalUser.service.edit');
    Route::post('/service/update', [UserServiceController::class, 'update'])->name('ExternalUser.service.update');
    Route::post('/service/delete', [UserServiceController::class, 'delete'])->name('ExternalUser.service.delete');


});

Route::group(['prefix'=>'/external-user'], function(){
    Route::get('/agents', [ExternalUserController::class, 'agents'])->name('ExternalUser.agents');
    Route::get('/developers', [ExternalUserController::class, 'developers'])->name('ExternalUser.developers');
    Route::get('/developers/view/{id}', [ExternalUserController::class, 'developerView']);
    Route::get('/developers/properties/{id}', [ExternalUserController::class, 'developerProperty']);
    Route::get('/suppliers', [ExternalUserController::class, 'suppliers'])->name('ExternalUser.suppliers');
    Route::get('/favorite', [ExternalUserController::class, 'favorite']);
});

