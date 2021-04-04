<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Area;
use App\Models\AreaGuide;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;

class AreaGuideController extends Controller
{
        /*
        * Get all Area guides
        */
        public function index() {
            $areas = Area::all();
    
            $areaGuides = DB::table('area_guides')
                        ->leftJoin('areas','areas.id','area_guides.area_id')
                        ->select('area_guides.*','areas.name as area_name')
                        ->get();
            return view("abasvumi.areaguide.index",compact("areas","areaGuides"));
        }
        
        /*
        * Area Guide Store
        */
        public function store(Request $request) {

            //return $request->all();

            $validators = Validator::make($request->all(),[
                'area_id' => 'required',
                'title'  => 'required',
                'bn_title'  => 'required',
                'description'  => 'required',
                'bn_description'  => 'required',
                'image'=> 'required|max:100',
                'video_link'  => 'required',
                'type'=> 'required',
            ]);
    
            if($validators->fails()) {
                return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
            } else {
                
                $areaGuide                 = new AreaGuide();
                $areaGuide->area_id        = $request->area_id;
                $areaGuide->title          = $request->title;
                $areaGuide->bn_title       = $request->bn_title;
                $areaGuide->description    = $request->description;
                $areaGuide->bn_description = $request->bn_description;
                $areaGuide->video_link     = $request->video_link;
                $areaGuide->type           = $request->type;
    
                if($request->image){
                    $file_info = $request->file('image');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "education_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/areaguide/';
                    $file_info->move($directory, $image_name);
                    $areaGuide->image   = $directory . $image_name;
                }
                if($areaGuide->save()){
                    $areaGuide= AreaGuide::join('areas','areas.id','area_guides.area_id')
                            ->select('area_guides.*','areas.name as area_name')
                            ->where('area_guides.id', $areaGuide->id)
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
                'area_id' => 'required',
                'title'  => 'required',
                'bn_title'  => 'required',
                'description'  => 'required',
                'bn_description'  => 'required',
                'video_link'  => 'required',
                'type'=> 'required',
            ]);
    
            if($validators->fails()) {
                return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
            } else {
                
                $areaGuide                 = AreaGuide::find($request->id);
                $areaGuide->area_id        = $request->area_id;
                $areaGuide->title          = $request->title;
                $areaGuide->bn_title       = $request->bn_title;
                $areaGuide->description    = $request->description;
                $areaGuide->bn_description = $request->bn_description;
                $areaGuide->video_link     = $request->video_link;
                $areaGuide->type           = $request->type;
    
                if($request->image){
    
                    unlink($areaGuide->image);
    
                    $file_info = $request->file('image');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "education_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/areaguide/';
                    $file_info->move($directory, $image_name);
                    $areaGuide->image   = $directory . $image_name;
                }
                if($areaGuide->update()){

                    $areaGuide = AreaGuide::join('areas','areas.id','area_guides.area_id')
                        ->select('area_guides.*','areas.name as area_name')
                        ->where('area_guides.id', $areaGuide->id)
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
            $areaGuide = AreaGuide::find($request->id);
    
            if(($areaGuide->image != null) && file_exists($areaGuide->image)){
                unlink($areaGuide->image);
            }
    
            $areaGuide->delete();
            return response()->json();
        }
    }
