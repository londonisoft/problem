<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\Division;
use Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DistrictController extends Controller
{
    /*
    * Get all district
    */
    public function index() {
        $divisions = Division::all();
        $districts = DB::table('districts')
                    ->leftJoin('divisions','divisions.id','districts.division_id')
                    ->select('districts.*','divisions.name as division_name')
                    ->get();
        return view("abasvumi.district.index",compact("divisions","districts"));
    }


    /*
    * District Store
    */
    public function store(Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'division_id' => 'required',
            'name'  => 'required',
            'bn_name'  => 'required',
            'url'  => 'required',
            'lat'  => 'required',
            'lon'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $district                 = new District();
            $district->division_id    = $request->division_id;
            $district->name           = $request->name;
            $district->bn_name        = $request->bn_name;
            $district->url            = $request->url;
            $district->lat            = $request->lat;
            $district->lon            = $request->lon;
            
            if($district->save()){
                $district=  DB::table('districts')
                            ->leftJoin('divisions','divisions.id','districts.division_id')
                            ->select('districts.*','divisions.name as division_name')
                            ->where('districts.id', $district->id)
                            ->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $district
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
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'division_id' => 'required',
            'name'  => 'required',
            'bn_name'  => 'required',
            'url'  => 'required',
            'lat'  => 'required',
            'lon'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $district                 = District::find($request->id);
            
            $district->division_id    = $request->division_id;
            $district->name           = $request->name;
            $district->bn_name        = $request->bn_name;
            $district->url            = $request->url;
            $district->lat            = $request->lat;
            $district->lon            = $request->lon;

        
            if($district->update()){
                $district= District::join('divisions','divisions.id','districts.division_id')
                        ->select('districts.*','divisions.name as division_name')
                        ->where('districts.id', $district->id)
                        ->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $district
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
        $district = District::find($request->id);
        $district->delete();
        return response()->json();
    }
}
