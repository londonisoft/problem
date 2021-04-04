<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;

class BlogController extends Controller
{
        /*
        * Get all Category guides
        */
        public function index() {
            $categories = Category::all();
    
            $blogs = DB::table('blogs')
                        ->leftJoin('categories','categories.id','blogs.category_id')
                        ->select('blogs.*','categories.name as category_name')
                        ->get();
            return view("abasvumi.blog.index",compact("categories","blogs"));
        }
        
        /*
        * Category Guide Store
        */
        public function store(Request $request) {

            //return $request->all();

            $validators = Validator::make($request->all(),[
                'category_id' => 'required',
                'title'  => 'required',
                'bn_title'  => 'required',
                'description'  => 'required',
                'bn_description'  => 'required',
                'image'=> 'required|max:100',
            ]);
    
            if($validators->fails()) {
                return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
            } else {
                
                $areaGuide                 = new Blog();
                $areaGuide->category_id        = $request->category_id;
                $areaGuide->title          = $request->title;
                $areaGuide->bn_title       = $request->bn_title;
                $areaGuide->description    = $request->description;
                $areaGuide->bn_description = $request->bn_description;
    
                if($request->image){
                    $file_info = $request->file('image');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "education_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/blog/';
                    $file_info->move($directory, $image_name);
                    $areaGuide->image   = $directory . $image_name;
                }
                if($areaGuide->save()){
                    $areaGuide= Blog::join('categories','categories.id','blogs.category_id')
                            ->select('blogs.*','categories.name as category_name')
                            ->where('blogs.id', $areaGuide->id)
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
                'category_id' => 'required',
                'title'  => 'required',
                'bn_title'  => 'required',
                'description'  => 'required',
                'bn_description'  => 'required',
            ]);
    
            if($validators->fails()) {
                return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
            } else {
                
                $areaGuide                 = Blog::find($request->id);
                $areaGuide->category_id    = $request->category_id;
                $areaGuide->title          = $request->title;
                $areaGuide->bn_title       = $request->bn_title;
                $areaGuide->description    = $request->description;
                $areaGuide->bn_description = $request->bn_description;
    
                if($request->image){
    
                    if($areaGuide->image != null && file_exists($areaGuide->image)){
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

                    $areaGuide = Blog::join('categories','categories.id','blogs.category_id')
                        ->select('blogs.*','categories.name as category_name')
                        ->where('blogs.id', $areaGuide->id)
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
            $areaGuide = Blog::find($request->id);
    
            if(($areaGuide->image != null) && file_exists($areaGuide->image)){
                unlink($areaGuide->image);
            }
    
            $areaGuide->delete();
            return response()->json();
        }
    }
