<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

use App\Models\PropertyType;
use Illuminate\Http\Request;
use Validator;

class PropertyTypeController extends Controller
{
    /**
     * get all property type
    */
    public function index(){
        $propertyTypes = PropertyType::all();
        return view('abasvumi.propertytype.index', compact('propertyTypes'));
    }

    /**
     * Store Service Type
    */
    public function store(Request $request){
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'name'  => 'required',
            'bn_name'  => 'required',
            'category_id'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $propertyType           = new PropertyType();
            $propertyType->name     = $request->name;
            $propertyType->bn_name  = $request->bn_name;
            $propertyType->category_id  = $request->category_id;
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
            'bn_name'  => 'required',
            'category_id'  => 'required',
        ]);

        if($validators->fails()){
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        }else{
            $propertyType         = PropertyType::find($request->id);
            $propertyType->name         = $request->name;
            $propertyType->bn_name      = $request->bn_name;
            $propertyType->category_id  = $request->category_id;
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
        $property = PropertyType::find($request->id);
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
        $block = PropertyType::find($request->id)->delete();
        return response()->json();
    }
}
