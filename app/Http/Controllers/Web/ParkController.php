<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\Division;
use App\Models\EducationalInstitute;
use App\Models\Hospital;
use App\Models\Park;
use App\Models\Thana;
use Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ParkController extends Controller
{
/*
    * Get all Educational Institute
    */
    public function index() {
        $divisions = Division::all();

        $educations = DB::table('parks')
                    ->leftJoin('divisions','divisions.id','parks.division_id')
                    ->leftJoin('districts','districts.id','parks.district_id')
                    ->leftJoin('thanas','thanas.id','parks.thana_id')
                    ->select('parks.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                    ->get();
        //return $educations;
        return view("abasvumi.park.index",compact("divisions","educations"));
    }

    /*
    * Get all district By division id.
    */
    public function changeDistrict($division_id) {
        $districts = District::select("id","name")->where("division_id",$division_id)->get();

        $dataList = array(
            'districts' => $districts,
        );
        $appendDistrict = view('abasvumi.ajax_html.district', $dataList)->render();

        return response()->json([
            'districts' => $appendDistrict
        ]);
    }

    /*
    * Get all thana By district id.
    */
    public function changeThana($district_id) {

        $thanas = Thana::select("id","name")->where("district_id",$district_id)->get();

        $dataList = array(
            'thanas' => $thanas,
        );
        $appendThana = view('abasvumi.ajax_html.thana', $dataList)->render();

        return response()->json([
            'thanas' => $appendThana
        ]);

    }

    /*
    * Education Store
    */
    public function store(Request $request) {
        //return $request->type;
        $validators = Validator::make($request->all(),[

            'division_id' => 'required',
            'district_id' => 'required',
            'thana_id' => 'required',
            'name'  => 'required',
            'bn_name'  => 'required',
            'description'  => 'required',
            'bn_description'  => 'required',
            'lat'  => 'required',
            'lon'  => 'required',
            'image'=> 'required|max:100',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $park                 = new Park();
            $park->division_id    = $request->division_id;
            $park->district_id    = $request->district_id;
            $park->thana_id       = $request->thana_id;
            $park->name           = $request->name;
            $park->bn_name        = $request->bn_name;
            $park->description    = $request->description;
            $park->bn_description = $request->bn_description;
            $park->lat            = $request->lat;
            $park->lon            = $request->lon;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "park_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/park/';
                $file_info->move($directory, $image_name);
                $park->image   = $directory . $image_name;
            }
            if($park->save()){
                $education= Park::join('divisions','divisions.id','parks.division_id')
                        ->join('districts','districts.id','parks.district_id')
                        ->join('thanas','thanas.id','parks.thana_id')
                        ->select('parks.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                        ->where('parks.id', $park->id)
                        ->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $education
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
    * Get district and thana
    */
    public function getDistrictThana($division_id,$district_id,$thana_id) {

        //return $division_id . $district_id . $thana_id;
        
        $districts = District::where("division_id",$division_id)->get();
        $thanas = Thana::where("district_id",$district_id)->get();

        $dataListDistrict = array(
            'districts' => $districts,
            'district_id' => $district_id,
        );

        $dataListThana = array(
            'thana_id' => $thana_id,
            'thanas' => $thanas,
        );
        
        $appendDistrict = view('abasvumi.ajax_html.districtAppend', $dataListDistrict)->render();
        $appendThana = view('abasvumi.ajax_html.thanaSelectedAppend', $dataListThana)->render();

        $data = array(
            'appendDistrict'=>$appendDistrict,
            'appendThana'=>$appendThana,
        );

        return response()->json($data);
    }

    /*
    * Update education
    */
    public function update (Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[

            'division_id' => 'required',
            'district_id' => 'required',
            'thana_id' => 'required',
            'name'  => 'required',
            'bn_name'  => 'required',
            'description'  => 'required',
            'bn_description'  => 'required',
            'lat'  => 'required',
            'lon'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $park                 = Park::find($request->id);
            
            $park->division_id    = $request->division_id;
            $park->district_id    = $request->district_id;
            $park->thana_id       = $request->thana_id;
            $park->name           = $request->name;
            $park->bn_name        = $request->bn_name;
            $park->description    = $request->description;
            $park->bn_description = $request->bn_description;
            $park->lat            = $request->lat;
            $park->lon            = $request->lon;

            if($request->image){

                unlink($park->image);

                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "park_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/park/';
                $file_info->move($directory, $image_name);
                $park->image   = $directory . $image_name;
            }
            if($park->update()){
                $education= Park::join('divisions','divisions.id','parks.division_id')
                        ->join('districts','districts.id','parks.district_id')
                        ->join('thanas','thanas.id','parks.thana_id')
                        ->select('parks.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                        ->where('parks.id', $park->id)
                        ->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $education
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
    * Destroy education
    */
    public function destroy(Request $request) {
        $park = Park::find($request->id);

        if(($park->image != null) && file_exists($park->image)){
            unlink($park->image);
        }

        $park->delete();
        return response()->json();
    }
}
