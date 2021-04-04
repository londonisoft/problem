<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\District;
use App\Models\Thana;
use Validator;
use Illuminate\Support\Facades\DB;

class ThanaController extends Controller
{
/*
    * Get all district
    */
    public function index() {
        $districts = District::all();
        $thanas = DB::table('thanas')
                    ->leftJoin('districts','districts.id','thanas.district_id')
                    ->select('thanas.*','districts.name as district_name')
                    ->get();
        return view("abasvumi.thana.index",compact("thanas","districts"));
    }


    /*
    * Thana Store
    */
    public function store(Request $request) {
        //return $request->all();

        $validators = Validator::make($request->all(),[
            'district_id' => 'required',
            'name'        => 'required',
            'bn_name'     => 'required',
            'url'         => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $thana                 = new Thana();
            $thana->district_id    = $request->district_id;
            $thana->name           = $request->name;
            $thana->bn_name        = $request->bn_name;
            $thana->url            = $request->url;
            
            if($thana->save()){
                $thana =  DB::table('thanas')
                            ->leftJoin('districts','districts.id','thanas.district_id')
                            ->select('thanas.*','districts.name as district_name')
                            ->where('thanas.id', $thana->id)
                            ->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $thana
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
    * Update district
    */
    public function update (Request $request) {
        $validators = Validator::make($request->all(),[
            'district_id' => 'required',
            'name'  => 'required',
            'bn_name'  => 'required',
            'url'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $thana                 = Thana::find($request->id);            
            $thana->district_id    = $request->district_id;
            $thana->name           = $request->name;
            $thana->bn_name        = $request->bn_name;
            $thana->url            = $request->url;

        
            if($thana->update()){
                $thana= Thana::join('districts','districts.id','thanas.district_id')
                        ->select('thanas.*','districts.name as district_name')
                        ->where('thanas.id', $thana->id)
                        ->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $thana
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
    * Destroy district
    */
    public function destroy(Request $request) {
        $thana = Thana::find($request->id);
        $thana->delete();
        return response()->json();
    }
}
