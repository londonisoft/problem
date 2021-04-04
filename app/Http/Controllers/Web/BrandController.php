<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Validator;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    /*
    * Get all Brand
    */
    public function index() {
        $brands = Brand::all();
        //return $educations;
        return view("abasvumi.brand.index",compact("brands"));
    }


    /*
    * Brand Store
    */
    public function store(Request $request) {
        //return $request->type;
        $validators = Validator::make($request->all(),[
            'name' => 'required',
            'name_bn' => 'required',
            'image'=> 'required|max:100',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $brand              = new Brand();
            $brand->name       = $request->name;
            $brand->name_bn    = $request->name_bn;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "video_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/brand/';
                $file_info->move($directory, $image_name);
                $brand->image   = $directory . $image_name;
            }
            if($brand->save()){
                $brand= Brand::where('id', $brand->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $brand
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
    * Update brand
    */
    public function update (Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'name' => 'required',
            'name_bn' => 'required'
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $brand              = Brand::find($request->id);
            $brand->name       = $request->name;
            $brand->name_bn    = $request->name_bn;

            if($request->image){

                unlink($brand->image);

                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "video_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/brand/';
                $file_info->move($directory, $image_name);
                $brand->image   = $directory . $image_name;
            }
            if($brand->update()){
                $brand= Brand::where('id', $brand->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $brand
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
    * Destroy brand
    */
    public function destroy(Request $request) {
        $brand = Brand::find($request->id);

        if(($brand->image != null) && file_exists($brand->image)){
            unlink($brand->image);
        }

        $brand->delete();
        return response()->json();
    }
}
