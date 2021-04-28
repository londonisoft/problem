<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;
use Validator;

class SliderController extends Controller
{
      /*
    * Get all Slider
    */
    public function index() {
        $sliders = Slider::all();
        //return $educations;
        return view("abasvumi.slider.index",compact("sliders"));
    }


    /*
    * Slider Store
    */
    public function store(Request $request) {
        //return $request->type;
        $validators = Validator::make($request->all(),[
            'image'=> 'required|max:100',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $slider              = new Slider();

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "video_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/slider/';
                $file_info->move($directory, $image_name);
                $slider->image   = $directory . $image_name;
            }
            if($slider->save()){
                $slider= Slider::where('id', $slider->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $slider
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
    * Update slider
    */
    public function update (Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[
			'image'=> 'required|max:100'
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $slider= Slider::find($request->id);
            if($request->file('image')){

                unlink($slider->image);

                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "video_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/slider/';
                $file_info->move($directory, $image_name);
                $slider->image   = $directory . $image_name;
            }
            if($slider->update()){
                $slider= Slider::where('id', $slider->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $slider
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

    public function destroy(Request $request) {
        $slider = Slider::find($request->id);

        if(($slider->image != null) && file_exists($slider->image)){
            unlink($slider->image);
        }

        $slider->delete();
        return response()->json();
    }
}
