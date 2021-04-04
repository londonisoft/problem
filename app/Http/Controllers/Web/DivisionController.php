<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Division;
use PhpParser\Node\Expr\AssignOp\Div;
use Validator;

class DivisionController extends Controller
{
 /*
    * Get all Division
    */
    public function index() {
        $divisions = Division::all();
        //return $educations;
        return view("abasvumi.division.index",compact("divisions"));
    }


    /*
    * Division Store
    */
    public function store(Request $request) {
        //return $request->type;
        $validators = Validator::make($request->all(),[
            'name' => 'required',
            'bn_name' => 'required',
            'url' => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $division             = new Division();
            $division->name       = $request->name;
            $division->bn_name    = $request->bn_name;
            $division->url        = $request->url;

            if($division->save()){
                $division= Division::where('id', $division->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $division
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
    * Update division
    */
    public function update (Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'name' => 'required',
            'bn_name' => 'required',
            'url' => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $division             = Division::find($request->id);
            $division->name       = $request->name;
            $division->bn_name    = $request->bn_name;
            $division->url        = $request->url;

            if($division->update()){
                $division= Division::where('id', $division->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $division
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
    * Division video
    */
    public function destroy(Request $request) {
        $division = Division::find($request->id);

        if(($division->image != null) && file_exists($division->image)){
            unlink($division->image);
        }

        $division->delete();
        return response()->json();
    }
}
