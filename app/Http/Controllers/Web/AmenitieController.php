<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Ameniti;
use Validator;
use Illuminate\Http\Request;

class AmenitieController extends Controller
{
/*
    * Get all Amenitie
    */
    public function index() {
        $amenities = Ameniti::all();
        //return $educations;
        return view("abasvumi.amenitie.index",compact("amenities"));
    }


    /*
    * Amenitie Store
    */
    public function store(Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'name' => 'required',
            'bn_name' => 'required',
            'icon' => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $amenitie          = new Ameniti();
            $amenitie->name    = $request->name;
            $amenitie->bn_name = $request->bn_name;
            
            if($request->icon){
                $file_info = $request->file('icon');
                $icon_ext = strtolower($file_info->getClientOriginalExtension());
                $icon_name = "am_" . time() . rand() . "." . $icon_ext;                
                $directory  = 'abasvumi/uploads/icons/';
                $file_info->move($directory, $icon_name);
                $amenitie->icon   = $directory . $icon_name;
            }

            if($amenitie->save()){
                $amenitie= Ameniti::where('id', $amenitie->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $amenitie
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
    * Update Amenitie
    */
    public function update (Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'name' => 'required',
            'bn_name' => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $amenitie          = Ameniti::find($request->id);
            $amenitie->name    = $request->name;
            $amenitie->bn_name    = $request->bn_name;

            if($request->icon){

                if($amenitie->icon != null && file_exists($amenitie->icon)){
                    unlink($amenitie->icon);
                }

                $file_info = $request->file('icon');
                $icon_ext = strtolower($file_info->getClientOriginalExtension());
                $icon_name = "am_" . time() . rand() . "." . $icon_ext;                
                $directory  = 'abasvumi/uploads/icons/';
                $file_info->move($directory, $icon_name);
                $amenitie->icon   = $directory . $icon_name;
            }



            if($amenitie->update()){
                $amenitie= Ameniti::where('id', $amenitie->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $amenitie
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
    * Destroy amenitie
    */
    public function destroy(Request $request) {
        $amenitie = Ameniti::find($request->id);

        if($amenitie->icon != null && file_exists($amenitie->icon)){
            unlink($amenitie->icon);
        }
        
        $amenitie->delete();
        return response()->json();
    }
}
