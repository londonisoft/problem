<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

use App\Models\PropertyType;
use Illuminate\Http\Request;
use App\Models\Category;
use Validator;

class CategoryController extends Controller
{
    /**
     * get all property type
    */
    public function index(){
        $categories = Category::all();
        return view('abasvumi.category.index', compact('categories'));
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
            $propertyType           = new Category();
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
            $propertyType         = Category::find($request->id);
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
        $property = Category::find($request->id);
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
        $block = Category::find($request->id)->delete();
        return response()->json();
    }
}
