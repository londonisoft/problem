<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AllService;
use App\Models\ServiceCategory;
use DB;
use Validator;
class ServiceController extends Controller
{
    public function index() {
        $categories = ServiceCategory::all();
        $services = DB::table('all_services')
                    ->leftJoin('service_categories','service_categories.id','all_services.service_category_id')
                    ->select('all_services.*','service_categories.name as service_category_name','service_categories.name_bn as service_category_name_bn')
                    ->get();

        return view("abasvumi.service.index",compact("services", 'categories'));
    }
    public function statusChange(Request $request) {
        $service = AllService::find($request->id);
        $service->is_featured = $request->is_featured;
        $service->status = $request->status;
        $service->save();
        return $service;
        return response()->json([
            'status'        => 403,
            'data'          => []
        ]);

    }
    public function destroy(Request $request) {
        $service = AllService::find($request->id);
        $service->delete();
        return redirect()->back();
    }

    public function store(Request $request) {
        $validators = Validator::make($request->all(),[
            'name'     => 'required',
            'name_bn'     => 'required',
            'description'     => 'required',
            'description_bn'     => 'required',
            'service_category_id'     => 'required',
            'image'     => 'required'
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $product                         = new AllService();
            $product->external_user_id       = auth()->user()->id;
            $product->service_category_id    = $request->service_category_id;
            $product->name                   = $request->name;
            $product->name_bn                = $request->name_bn;
            $product->description            = $request->description;
            $product->description_bn         = $request->description_bn;
            $product->image                  = '';
            $product->status                 = 1;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "product_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/products/';
                $file_info->move($directory, $image_name);
                $product->image   = $directory . $image_name;
            }
            if($product->save()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $product
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

    public function update (Request $request) {
        $validators = Validator::make($request->all(),[
            'name'     => 'required',
            'name_bn'     => 'required',
            'description'     => 'required',
            'description_bn'     => 'required',
            'service_category_id'     => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $product                         = AllService::find($request->id);
            $product->external_user_id       = auth()->user()->id;
            $product->service_category_id    = $request->service_category_id;
            $product->name                   = $request->name;
            $product->name_bn                = $request->name_bn;
            $product->description            = $request->description;
            $product->description_bn         = $request->description_bn;
            $product->image                  = '';
            $product->status                 = 1;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "product_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/products/';
                $file_info->move($directory, $image_name);
                $product->image   = $directory . $image_name;
            }
            if($product->save()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $product
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

}
