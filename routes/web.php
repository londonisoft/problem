<?php

use App\Http\Controllers\Web\PropertyTypeController;
use App\Http\Controllers\Web\ParkController;
use App\Http\Controllers\Web\AdminUserController;
use App\Http\Controllers\Web\AgentUserController;
use App\Http\Controllers\Web\AmenitieController;
use App\Http\Controllers\Web\AuthController;
use App\Http\Controllers\Web\AreaController;
use App\Http\Controllers\Web\AreaGuideController;
use App\Http\Controllers\Web\BlockController;
use App\Http\Controllers\Web\CommonController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\DashboardController;
use App\Http\Controllers\Web\DeveloperUserController;
use App\Http\Controllers\Web\DistrictController;
use App\Http\Controllers\Web\DivisionController;
use App\Http\Controllers\Web\EducationController;
use App\Http\Controllers\Web\HospitalController;
use App\Http\Controllers\Web\ReligiousController;
use App\Http\Controllers\Web\RestaurantController;
use App\Http\Controllers\Web\RoleController;
use App\Http\Controllers\Web\PropertyController;
use App\Http\Controllers\Web\SupplierUserController;
use App\Http\Controllers\Web\ThanaController;
use App\Http\Controllers\Web\VideoController;
use App\Http\Controllers\Web\ProductController;
use App\Http\Controllers\Web\ServiceController;
use App\Http\Controllers\Web\ProductCategoryController;
use App\Http\Controllers\Web\ServiceCategoryController;
use App\Http\Controllers\Web\AgentController;
use App\Http\Controllers\Web\SupplierController;
use App\Http\Controllers\Web\DeveloperController;
use App\Http\Controllers\Web\SettingController;
use App\Http\Controllers\Web\BrandController;
use App\Http\Controllers\Web\CategoryController;
use App\Http\Controllers\Web\BlogController;
use App\Http\Controllers\Web\TestimonialController;
use App\Http\Controllers\Web\DhNeiborController;
use App\Http\Controllers\Web\DhNeiborAreaController;
use App\Http\Controllers\Web\ContactController;

Route::get('/admin',[AuthController::class, 'login'])->name('admin.login');
Route::post('/admin/signin',[AuthController::class, 'signin'])->name('admin.signin');
Route::post('/admin/logout',[AuthController::class, 'logout'])->name('admin.logout');

Route::group(['prefix'=>'/admin', 'middleware'=>'admin'], function(){
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
});


//route for manage commont division district & thana
Route::group(['prefix'=>'admin/common', 'middleware'=>'admin'], function(){
    Route::get('/get-district/{division_id}', [CommonController::class, 'getDistrict']);
    Route::get('/get-thana/{district_id}', [CommonController::class, 'getThana']);
    Route::get('/division-district-thana/{division_id}/{district_id}/{thana_id}', [CommonController::class, 'getDivisionDistrictThana']);
    Route::get('/get-education-hospital-resturant-park-religion/{thana_id}', [CommonController::class, 'getEducationHospitalResturantParkReligion']);
});


//route for manage admin users
Route::group(['prefix'=>'admin/user', 'middleware'=>'admin'], function(){
    Route::get('/', [AdminUserController::class, 'index'])->name('user.index');
    Route::get('/systemuser', [AdminUserController::class, 'systemUser'])->name('systemUser.index');
    Route::get('/profile/edit', [AdminUserController::class, 'profileEdit'])->name('user.profile.edit');
    Route::post('/profile/update', [AdminUserController::class, 'profileUpdate'])->name('user.profile.update');
    Route::get('/password/change', [AdminUserController::class, 'passwordChange'])->name('user.password.change');
    Route::post('/password/update', [AdminUserController::class, 'passwordUpdate'])->name('user.password.update');
    Route::post('/store',  [AdminUserController::class, 'store'])->name('user.store');
    Route::post('/update',  [AdminUserController::class, 'update'])->name('user.update');
    Route::post('/destroy',  [AdminUserController::class, 'destroy'])->name('user.destroy');
});

// //route for manage agent
// Route::group(['prefix'=>'admin/agent', 'middleware'=>'admin'], function(){
//     Route::get('/', [AgentUserController::class, 'index'])->name('agent.index');
//     Route::post('/store',  [AgentUserController::class, 'store'])->name('agent.store');
//     Route::post('/update',  [AgentUserController::class, 'update'])->name('agent.update');
//     Route::post('/destroy',  [AgentUserController::class, 'destroy'])->name('agent.destroy');
// });

// //route for manage developer
// Route::group(['prefix'=>'admin/developer', 'middleware'=>'admin'], function(){
//     Route::get('/', [DeveloperUserController::class, 'index'])->name('developer.index');
//     Route::post('/store',  [DeveloperUserController::class, 'store'])->name('developer.store');
//     Route::post('/update',  [DeveloperUserController::class, 'update'])->name('developer.update');
//     Route::post('/destroy',  [DeveloperUserController::class, 'destroy'])->name('developer.destroy');
// });

// //route for manage Supplier
// Route::group(['prefix'=>'admin/supplier', 'middleware'=>'admin'], function(){
//     Route::get('/', [SupplierUserController::class, 'index'])->name('supplier.index');
//     Route::post('/store',  [SupplierUserController::class, 'store'])->name('supplier.store');
//     Route::post('/update',  [SupplierUserController::class, 'update'])->name('supplier.update');
//     Route::post('/destroy',  [SupplierUserController::class, 'destroy'])->name('supplier.destroy');
// });

//route for manage education
Route::group(['prefix'=>'admin/education', 'middleware'=>'admin'], function(){
    Route::get('/', [EducationController::class, 'index'])->name('education.index');
    Route::get('get/district/thana/{division_id}/{district_id}/{thana_id}', [EducationController::class, 'getDistrictThana']);
    Route::post('/store',  [EducationController::class, 'store'])->name('education.store');
    Route::post('/update',  [EducationController::class, 'update'])->name('education.update');
    Route::post('/destroy',  [EducationController::class, 'destroy'])->name('education.destroy');
});

//route for manage religious
Route::group(['prefix'=>'admin/religious', 'middleware'=>'admin'], function(){
    Route::get('/', [ReligiousController::class, 'index'])->name('religious.index');
    Route::post('/store',  [ReligiousController::class, 'store'])->name('religious.store');
    Route::post('/update',  [ReligiousController::class, 'update'])->name('religious.update');
    Route::post('/destroy',  [ReligiousController::class, 'destroy'])->name('religious.destroy');
});

//route for manage hospital
Route::group(['prefix'=>'admin/hospital', 'middleware'=>'admin'], function(){
    Route::get('/', [HospitalController::class, 'index'])->name('hospital.index');
    Route::post('/store',  [HospitalController::class, 'store'])->name('hospital.store');
    Route::post('/update',  [HospitalController::class, 'update'])->name('hospital.update');
    Route::post('/destroy',  [HospitalController::class, 'destroy'])->name('hospital.destroy');
});

//route for manage park
Route::group(['prefix'=>'admin/park', 'middleware'=>'admin'], function(){
    Route::get('/', [ParkController::class, 'index'])->name('park.index');
    Route::post('/store',  [ParkController::class, 'store'])->name('park.store');
    Route::post('/update',  [ParkController::class, 'update'])->name('park.update');
    Route::post('/destroy',  [ParkController::class, 'destroy'])->name('park.destroy');
});

//route for manage restaurant
Route::group(['prefix'=>'admin/restaurant', 'middleware'=>'admin'], function(){
    Route::get('/', [RestaurantController::class, 'index'])->name('restaurant.index');
    Route::post('/store',  [RestaurantController::class, 'store'])->name('restaurant.store');
    Route::post('/update',  [RestaurantController::class, 'update'])->name('restaurant.update');
    Route::post('/destroy',  [RestaurantController::class, 'destroy'])->name('restaurant.destroy');
});

//route for manage video
Route::group(['prefix'=>'admin/video', 'middleware'=>'admin'], function(){
    Route::get('/', [VideoController::class, 'index'])->name('video.index');
    Route::post('/store',  [VideoController::class, 'store'])->name('video.store');
    Route::post('/update',  [VideoController::class, 'update'])->name('video.update');
    Route::post('/destroy',  [VideoController::class, 'destroy'])->name('video.destroy');
});
//route for manage brand
Route::group(['prefix'=>'admin/brand', 'middleware'=>'admin'], function(){
    Route::get('/', [BrandController::class, 'index'])->name('brand.index');
    Route::post('/store',  [BrandController::class, 'store'])->name('brand.store');
    Route::post('/update',  [BrandController::class, 'update'])->name('brand.update');
    Route::post('/destroy',  [BrandController::class, 'destroy'])->name('brand.destroy');
});

//route for manage amenitie
Route::group(['prefix'=>'admin/amenitie', 'middleware'=>'admin'], function(){
    Route::get('/', [AmenitieController::class, 'index'])->name('amenitie.index');
    Route::post('/store',  [AmenitieController::class, 'store'])->name('amenitie.store');
    Route::post('/update',  [AmenitieController::class, 'update'])->name('amenitie.update');
    Route::post('/destroy',  [AmenitieController::class, 'destroy'])->name('amenitie.destroy');

});


//route for manage roles
Route::group(['prefix'=>'admin/role', 'middleware'=>'admin'], function(){
    Route::get('/', [RoleController::class, 'index'])->name('role.index');
    Route::post('/store',  [RoleController::class, 'store'])->name('role.store');
    Route::post('/update',  [RoleController::class, 'update'])->name('role.update');
    Route::post('/destroy',  [RoleController::class, 'destroy'])->name('role.destroy');
});

//route for manage division
Route::group(['prefix'=>'admin/division', 'middleware'=>'admin'], function(){
    Route::get('/', [DivisionController::class, 'index'])->name('division.index');
    Route::post('/store',  [DivisionController::class, 'store'])->name('division.store');
    Route::post('/update',  [DivisionController::class, 'update'])->name('division.update');
    Route::post('/destroy',  [DivisionController::class, 'destroy'])->name('division.destroy');
});

//route for manage district
Route::group(['prefix'=>'admin/district', 'middleware'=>'admin'], function(){
    Route::get('/', [DistrictController::class, 'index'])->name('district.index');
    Route::post('/store',  [DistrictController::class, 'store'])->name('district.store');
    Route::post('/update',  [DistrictController::class, 'update'])->name('district.update');
    Route::post('/destroy',  [DistrictController::class, 'destroy'])->name('district.destroy');
});

//route for manage thana
Route::group(['prefix'=>'admin/thana', 'middleware'=>'admin'], function(){
    Route::get('/', [ThanaController::class, 'index'])->name('thana.index');
    Route::post('/store',  [ThanaController::class, 'store'])->name('thana.store');
    Route::post('/update',  [ThanaController::class, 'update'])->name('thana.update');
    Route::post('/destroy',  [ThanaController::class, 'destroy'])->name('thana.destroy');
});

//route for manage block
Route::group(['prefix'=>'admin/block', 'middleware'=>'admin'], function(){
    Route::get('/', [BlockController::class, 'index'])->name('block.index');
    Route::post('/store',  [BlockController::class, 'store'])->name('block.store');
    Route::post('/update',  [BlockController::class, 'update'])->name('block.update');
    Route::post('/destroy',  [BlockController::class, 'destroy'])->name('block.destroy');
});

//route for manage property type
Route::group(['prefix'=>'admin/property/type', 'middleware'=>'admin'], function(){
    Route::get('/', [PropertyTypeController::class, 'index'])->name('propertytype.index');
    Route::post('/store',  [PropertyTypeController::class, 'store'])->name('propertytype.store');
    Route::post('/update',  [PropertyTypeController::class, 'update'])->name('propertytype.update');
    Route::post('/destroy',  [PropertyTypeController::class, 'destroy'])->name('propertytype.destroy');
    Route::post('/status',  [PropertyTypeController::class, 'statusChange'])->name('propertytype.change');

});
//route for manage property type
Route::group(['prefix'=>'admin/productCategory', 'middleware'=>'admin'], function(){
    Route::get('/', [ProductCategoryController::class, 'index'])->name('productCategory.index');
    Route::post('/store',  [ProductCategoryController::class, 'store'])->name('productCategory.store');
    Route::post('/update',  [ProductCategoryController::class, 'update'])->name('productCategory.update');
    Route::post('/destroy',  [ProductCategoryController::class, 'destroy'])->name('productCategory.destroy');
    Route::post('/status',  [ProductCategoryController::class, 'statusChange'])->name('productCategory.change');

});
//route for manage property type
Route::group(['prefix'=>'admin/category', 'middleware'=>'admin'], function(){
    Route::get('/', [CategoryController::class, 'index'])->name('category.index');
    Route::post('/store',  [CategoryController::class, 'store'])->name('category.store');
    Route::post('/update',  [CategoryController::class, 'update'])->name('category.update');
    Route::post('/destroy',  [CategoryController::class, 'destroy'])->name('category.destroy');
    Route::post('/status',  [CategoryController::class, 'statusChange'])->name('category.change');

});
//route for manage property type
Route::group(['prefix'=>'admin/serviceCategory', 'middleware'=>'admin'], function(){
    Route::get('/', [ServiceCategoryController::class, 'index'])->name('serviceCategory.index');
    Route::post('/store',  [ServiceCategoryController::class, 'store'])->name('serviceCategory.store');
    Route::post('/update',  [ServiceCategoryController::class, 'update'])->name('serviceCategory.update');
    Route::post('/destroy',  [ServiceCategoryController::class, 'destroy'])->name('serviceCategory.destroy');
    Route::post('/status',  [ServiceCategoryController::class, 'statusChange'])->name('serviceCategory.change');
});
//route for manage property type
Route::group(['prefix'=>'admin/dhaka/neibors', 'middleware'=>'admin'], function(){
    Route::get('/', [DhNeiborController::class, 'index'])->name('dhNeibor.index');
    Route::post('/store',  [DhNeiborController::class, 'store'])->name('dhNeibor.store');
    Route::post('/update',  [DhNeiborController::class, 'update'])->name('dhNeibor.update');
    Route::post('/destroy',  [DhNeiborController::class, 'destroy'])->name('dhNeibor.destroy');
    Route::post('/status',  [DhNeiborController::class, 'statusChange'])->name('dhNeibor.change');
});

//route for manage property type
Route::group(['prefix'=>'admin/dhaka/neibors/area', 'middleware'=>'admin'], function(){
    Route::get('/', [DhNeiborAreaController::class, 'index'])->name('dhNeiborArea.index');
    Route::post('/store',  [DhNeiborAreaController::class, 'store'])->name('dhNeiborArea.store');
    Route::post('/update',  [DhNeiborAreaController::class, 'update'])->name('dhNeiborArea.update');
    Route::post('/destroy',  [DhNeiborAreaController::class, 'destroy'])->name('dhNeiborArea.destroy');
    Route::post('/status',  [DhNeiborAreaController::class, 'statusChange'])->name('dhNeiborArea.change');
});

//route for manage product type
Route::group(['prefix'=>'admin/product', 'middleware'=>'admin'], function(){
    Route::get('/', [ProductController::class, 'index'])->name('product.index');
    Route::post('/store',  [ProductController::class, 'store'])->name('product.store');
    Route::post('/update',  [ProductController::class, 'update'])->name('product.update');
    Route::post('/status',  [ProductController::class, 'statusChange'])->name('product.change');
    Route::post('/destroy',  [ProductController::class, 'destroy'])->name('product.destroy');

});
//route for manage agent type
Route::group(['prefix'=>'admin/agent', 'middleware'=>'admin'], function(){
    Route::get('/', [AgentController::class, 'index'])->name('agent.index');
    Route::post('/status',  [AgentController::class, 'statusChange'])->name('agent.change');
    Route::post('/destroy',  [AgentController::class, 'destroy'])->name('agent.destroy');

});
//route for manage agent type
Route::group(['prefix'=>'admin/developer', 'middleware'=>'admin'], function(){
    Route::get('/', [DeveloperController::class, 'index'])->name('developer.index');
    Route::post('/status',  [DeveloperController::class, 'statusChange'])->name('developer.change');
    Route::post('/destroy',  [DeveloperController::class, 'destroy'])->name('developer.destroy');

});
//route for manage agent type
Route::group(['prefix'=>'admin/supplier', 'middleware'=>'admin'], function(){
    Route::get('/', [SupplierController::class, 'index'])->name('supplier.index');
    Route::post('/status',  [SupplierController::class, 'statusChange'])->name('supplier.change');
    Route::post('/destroy',  [SupplierController::class, 'destroy'])->name('supplier.destroy');

});

//route for manage property type
Route::group(['prefix'=>'admin/service', 'middleware'=>'admin'], function(){
    Route::get('/', [ServiceController::class, 'index'])->name('service.index');
    Route::post('/store',  [ServiceController::class, 'store'])->name('service.store');
    Route::post('/update',  [ServiceController::class, 'update'])->name('service.update');
    Route::post('/status',  [ServiceController::class, 'statusChange'])->name('service.change');
    Route::post('/destroy',  [ServiceController::class, 'destroy'])->name('service.destroy');

});

//route for manage property
Route::group(['prefix'=>'admin/property'], function(){
    Route::get('/', [PropertyController::class, 'index'])->name('property.index');
    Route::get('/create', [PropertyController::class, 'create'])->name('property.create');
    Route::post('/store',  [PropertyController::class, 'store'])->name('property.store');
    Route::get('/edit/{id}', [PropertyController::class, 'edit'])->name('property.edit');
    Route::post('/update/{id}',  [PropertyController::class, 'update'])->name('property.update');
    Route::get('/destroy/{id}',  [PropertyController::class, 'destroy'])->name('property.destroy');
    Route::post('/status',  [PropertyController::class, 'statusChange'])->name('property.change');
});

//route for manage area
Route::group(['prefix'=>'admin/area', 'middleware'=>'admin'], function(){
    Route::get('/', [AreaController::class, 'index'])->name('area.index');
    Route::post('/store',  [AreaController::class, 'store'])->name('area.store');
    Route::post('/update',  [AreaController::class, 'update'])->name('area.update');
    Route::post('/destroy',  [AreaController::class, 'destroy'])->name('area.destroy');
});

//route for manage area guide
Route::group(['prefix'=>'admin/area-guide', 'middleware'=>'admin'], function(){
    Route::get('/', [AreaGuideController::class, 'index'])->name('areaguide.index');
    Route::post('/store',  [AreaGuideController::class, 'store'])->name('areaguide.store');
    Route::post('/update',  [AreaGuideController::class, 'update'])->name('areaguide.update');
    Route::post('/destroy',  [AreaGuideController::class, 'destroy'])->name('areaguide.destroy');
});
//route for manage area guide
Route::group(['prefix'=>'admin/blog', 'middleware'=>'admin'], function(){
    Route::get('/', [BlogController::class, 'index'])->name('blog.index');
    Route::post('/store',  [BlogController::class, 'store'])->name('blog.store');
    Route::post('/update',  [BlogController::class, 'update'])->name('blog.update');
    Route::post('/destroy',  [BlogController::class, 'destroy'])->name('blog.destroy');
});
//route for manage area guide
Route::group(['prefix'=>'admin/testimonial', 'middleware'=>'admin'], function(){
    Route::get('/', [TestimonialController::class, 'index'])->name('testimonial.index');
    Route::post('/store',  [TestimonialController::class, 'store'])->name('testimonial.store');
    Route::post('/update',  [TestimonialController::class, 'update'])->name('testimonial.update');
    Route::post('/destroy',  [TestimonialController::class, 'destroy'])->name('testimonial.destroy');
});
//route for manage area guide
Route::group(['prefix'=>'admin/propertyContact', 'middleware'=>'admin'], function(){
    Route::get('/', [ContactController::class, 'index'])->name('propertyContact.index');
    Route::get('/view/{id}', [ContactController::class, 'view'])->name('propertyContact.view');
});
//route for manage area guide
Route::group(['prefix'=>'admin/setting', 'middleware'=>'admin'], function(){
    Route::get('/', [SettingController::class, 'index'])->name('setting.index');
    Route::post('/store',  [SettingController::class, 'store'])->name('setting.store');
});