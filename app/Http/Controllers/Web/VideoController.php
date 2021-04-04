<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Video;
use Validator;
use Illuminate\Http\Request;

class VideoController extends Controller
{
    /*
    * Get all Video
    */
    public function index() {
        $videos = Video::all();
        //return $educations;
        return view("abasvumi.video.index",compact("videos"));
    }


    /*
    * Video Store
    */
    public function store(Request $request) {
        //return $request->type;
        $validators = Validator::make($request->all(),[
            'title' => 'required',
            'bn_title' => 'required',
            'video_link' => 'required',
            'image'=> 'required|max:100',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $video              = new Video();
            $video->title       = $request->title;
            $video->bn_title    = $request->bn_title;
            $video->video_link  = $request->video_link;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "video_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/video/';
                $file_info->move($directory, $image_name);
                $video->image   = $directory . $image_name;
            }
            if($video->save()){
                $video= Video::where('id', $video->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $video
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
    * Update video
    */
    public function update (Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'title' => 'required',
            'bn_title' => 'required',
            'video_link' => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $video              = Video::find($request->id);
            $video->title       = $request->title;
            $video->bn_title    = $request->bn_title;
            $video->video_link  = $request->video_link;

            if($request->image){

                unlink($video->image);

                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "video_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/video/';
                $file_info->move($directory, $image_name);
                $video->image   = $directory . $image_name;
            }
            if($video->update()){
                $video= Video::where('id', $video->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $video
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
    * Destroy video
    */
    public function destroy(Request $request) {
        $video = Video::find($request->id);

        if(($video->image != null) && file_exists($video->image)){
            unlink($video->image);
        }

        $video->delete();
        return response()->json();
    }
}
