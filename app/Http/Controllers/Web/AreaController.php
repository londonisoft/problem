<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Area;
use Illuminate\Http\Request;
use Validator;

class AreaController extends Controller
{
    /*
    * Get all Areas Institute
    */
    public function index() {
        $areas = Area::all();
        return view("abasvumi.area.index",compact("areas"));
    }


    /*
    * Area Store
    */
    public function store(Request $request) {
        //return $request->type;
        $validators = Validator::make($request->all(),[
            'name'  => 'required',
            'bn_name'  => 'required',
            'address'  => 'required',
            'address_bn'  => 'required',
            'image'=> 'required|max:100',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $area                 = new Area();
            $area->name           = $request->name;
            $area->bn_name        = $request->bn_name;
            $area->address        = $request->address;
            $area->address_bn        = $request->address_bn;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "education_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/area/';
                $file_info->move($directory, $image_name);
                $area->image   = $directory . $image_name;
            }
            if($area->save()){
                $area= Area::where('id', $area->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $area
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

    
    /*
    * Update area
    */
    public function update (Request $request) {
        $validators = Validator::make($request->all(),[
            'name'  => 'required',
            'bn_name'  => 'required',
            'address'  => 'required',
            'address_bn'  => 'required'
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $area                 = Area::find($request->id);
            $area->name           = $request->name;
            $area->bn_name        = $request->bn_name;
            $area->address        = $request->address;
            $area->address_bn      = $request->address_bn;

            if($request->image){

                unlink($area->image);

                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "education_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/area/';
                $file_info->move($directory, $image_name);
                $area->image   = $directory . $image_name;
            }
            if($area->save()){
                $area = Area::where('id', $area->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $area
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

    /*
    * Destroy area
    */
    public function destroy(Request $request) {
        $area = Area::find($request->id);

        if(($area->image != null) && file_exists($area->image)){
            unlink($area->image);
        }

        $area->delete();
        return response()->json();
    }
}
