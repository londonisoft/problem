<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProductCategory;
use App\Models\Product;
use App\Models\Unit;
use DB;
use Validator;
class ProductController extends Controller
{
    public function index() {

        $categories = ProductCategory::all();
        $units = Unit::all();

        $products = DB::table('products')
                    ->leftJoin('product_categories','product_categories.id','products.product_category_id')
                    ->select('products.*','product_categories.name as product_category_name','product_categories.name_bn as product_category_name_bn')
                    ->get();

        $units = Unit::all();
        return view("abasvumi.product.index",compact("products", "categories", "units"));
    }
    public function statusChange(Request $request) {
        $property = Product::find($request->id);
        $property->is_featured = $request->is_featured;
        $property->status = $request->status;
        $property->save();
        return $property;
        return response()->json([
            'status'        => 403,
            'data'          => []
        ]);

    }
    public function destroy(Request $request) {
        $property = Product::find($request->id);
        $property->delete();
        return redirect()->back();
    }



    public function store(Request $request) {
        $validators = Validator::make($request->all(),[
            'name'     => 'required',
            'name_bn'     => 'required',
            'description'     => 'required',
            'description_bn'     => 'required',
            'unit_id'     => 'required',
            'price'     => 'required',
            'product_category_id'     => 'required',
            'image'     => 'required'
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $product                         = new Product();
            $product->external_user_id       = auth()->user()->id;
            $product->product_category_id    = $request->product_category_id;
            $product->unit_id                = $request->unit_id ;
            $product->name                   = $request->name;
            $product->name_bn                = $request->name_bn;
            $product->description            = $request->description;
            $product->description_bn         = $request->description_bn;
            $product->price                  = $request->price;
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
            'unit_id'     => 'required',
            'price'     => 'required',
            'product_category_id'     => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $product                         = Product::find($request->id);
            $product->external_user_id       = auth()->user()->id;
            $product->product_category_id    = $request->product_category_id;
            $product->unit_id                = $request->unit_id ;
            $product->name                   = $request->name;
            $product->name_bn                = $request->name_bn;
            $product->description            = $request->description;
            $product->description_bn         = $request->description_bn;
            $product->price                  = $request->price;
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
