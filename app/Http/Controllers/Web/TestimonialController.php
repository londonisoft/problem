<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Testimonial;
use Illuminate\Support\Facades\DB;
use Validator;




class TestimonialController extends Controller
{
    /*
        * Get all Category guides
        */
        public function index() {
    
            $testimonials = DB::table('testimonials')
                        ->select('testimonials.*')->get();
            return view("abasvumi.testimonial.index",compact("testimonials"));
        }
        
        /*
        * Category Guide Store
        */
        public function store(Request $request) {

            //return $request->all();

            $validators = Validator::make($request->all(),[
                'name'  => 'required',
                'name_bn'  => 'required',
                'description'  => 'required',
                'description_bn'  => 'required',
                'designation'  => 'required',
                'designation_bn'  => 'required',
                'image'=> 'required|max:100'
            ]);
    
            if($validators->fails()) {
                return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
            } else {
                
                $areaGuide                 = new Testimonial();
                $areaGuide->name          = $request->name;
                $areaGuide->name_bn       = $request->name_bn;
                $areaGuide->description    = $request->description;
                $areaGuide->description_bn = $request->description_bn;
                $areaGuide->designation    = $request->designation;
                $areaGuide->designation_bn = $request->designation_bn;
    
                if($request->image){
                    $file_info = $request->file('image');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "education_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/testimonial/';
                    $file_info->move($directory, $image_name);
                    $areaGuide->image   = $directory . $image_name;
                }
                if($areaGuide->save()){
                    $areaGuide= Testimonial::select('testimonials.*')
                            ->where('testimonials.id', $areaGuide->id)
                            ->first();
                    return response()->json([
                        'status'    => 201,
                        'data'      => $areaGuide
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
        * Update area guide
        */
        public function update (Request $request) {

            //return $request->all();
            $validators = Validator::make($request->all(),[
                'name'  => 'required',
                'name_bn'  => 'required',
                'description'  => 'required',
                'description_bn'  => 'required',
                'designation'  => 'required',
                'designation_bn'  => 'required',
            ]);
    
            if($validators->fails()) {
                return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
            } else {
                
                $areaGuide                 = Testimonial::find($request->id);
                $areaGuide->name          = $request->name;
                $areaGuide->name_bn       = $request->name_bn;
                $areaGuide->description    = $request->description;
                $areaGuide->description_bn = $request->description_bn;
                $areaGuide->designation    = $request->designation;
                $areaGuide->designation_bn = $request->designation_bn;
    
                if($request->image){
                    if(($areaGuide->image != null) && file_exists($areaGuide->image)){
                        unlink($areaGuide->image);
                    }
                    $file_info = $request->file('image');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "education_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/blog/';
                    $file_info->move($directory, $image_name);
                    $areaGuide->image   = $directory . $image_name;
                }
                if($areaGuide->update()){

                    $areaGuide= Testimonial::select('testimonials.*')
                    ->where('testimonials.id', $areaGuide->id)
                    ->first();

                    return response()->json([
                        'status'    => 201,
                        'data'      => $areaGuide
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
        * Destroy area guide
        */
        public function destroy(Request $request) {
            $areaGuide = Testimonial::find($request->id);
    
            if(($areaGuide->image != null) && file_exists($areaGuide->image)){
                unlink($areaGuide->image);
            }
    
            $areaGuide->delete();
            return response()->json();
        }
}
