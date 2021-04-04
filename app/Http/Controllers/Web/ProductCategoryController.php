<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

use App\Models\PropertyType;
use Illuminate\Http\Request;
use App\Models\ProductCategory;
use Validator;

class ProductCategoryController extends Controller
{
    /**
     * get all property type
    */
    public function index(){
        $product_categories = ProductCategory::all();
        return view('abasvumi.productCategory.index', compact('product_categories'));
    }

    /**
     * Store Service Type
    */
    public function store(Request $request){
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'name'  => 'required',
            'name_bn'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $propertyType           = new ProductCategory();
            $propertyType->name     = $request->name;
            $propertyType->name_bn  = $request->name_bn;
            if($propertyType->save()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $propertyType
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

     /**
     * Update Service Type
    */
    public function update(Request $request){

        $validators=Validator::make($request->all(),[
            'name'  => 'required',
            'name_bn'  => 'required',
        ]);

        if($validators->fails()){
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        }else{
            $propertyType         = ProductCategory::find($request->id);
            $propertyType->name         = $request->name;
            $propertyType->name_bn      = $request->name_bn;
            if($propertyType->update()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $propertyType
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

    public function statusChange(Request $request) {
        $property = ProductCategory::find($request->id);
        $property->is_menu = $request->is_menu;
        $property->status = $request->status;
        $property->save();
        return $property;
        return response()->json([
            'status'        => 403,
            'data'          => []
        ]);

    }

    public function destroy(Request $request)
    {
        $block = ProductCategory::find($request->id)->delete();
        return response()->json();
    }
}
