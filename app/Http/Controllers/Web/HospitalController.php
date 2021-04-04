<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\Division;
use App\Models\EducationalInstitute;
use App\Models\Hospital;
use App\Models\Thana;
use Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HospitalController extends Controller
{
    /*
    * Get all Educational Institute
    */
    public function index() {
        $divisions = Division::all();

        $educations = DB::table('hospitals')
                    ->leftJoin('divisions','divisions.id','hospitals.division_id')
                    ->leftJoin('districts','districts.id','hospitals.district_id')
                    ->leftJoin('thanas','thanas.id','hospitals.thana_id')
                    ->select('hospitals.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                    ->get();
        //return $educations;
        return view("abasvumi.hospital.index",compact("divisions","educations"));
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
            'type'=> 'required',
            'image'=> 'required|max:100',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $hospital                 = new Hospital();
            $hospital->division_id    = $request->division_id;
            $hospital->district_id    = $request->district_id;
            $hospital->thana_id       = $request->thana_id;
            $hospital->name           = $request->name;
            $hospital->bn_name        = $request->bn_name;
            $hospital->description    = $request->description;
            $hospital->bn_description = $request->bn_description;
            $hospital->lat            = $request->lat;
            $hospital->lon            = $request->lon;
            $hospital->type           = $request->type;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "hospital_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/hospital/';
                $file_info->move($directory, $image_name);
                $hospital->image   = $directory . $image_name;
            }
            if($hospital->save()){
                $education= Hospital::join('divisions','divisions.id','hospitals.division_id')
                        ->join('districts','districts.id','hospitals.district_id')
                        ->join('thanas','thanas.id','hospitals.thana_id')
                        ->select('hospitals.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                        ->where('hospitals.id', $hospital->id)
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
            'type'=> 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $hospital                 = Hospital::find($request->id);
            
            $hospital->division_id    = $request->division_id;
            $hospital->district_id    = $request->district_id;
            $hospital->thana_id       = $request->thana_id;
            $hospital->name           = $request->name;
            $hospital->bn_name        = $request->bn_name;
            $hospital->description    = $request->description;
            $hospital->bn_description = $request->bn_description;
            $hospital->lat            = $request->lat;
            $hospital->lon            = $request->lon;
            $hospital->type           = $request->type;

            if($request->image){

                unlink($hospital->image);

                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "hospital_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/hospital/';
                $file_info->move($directory, $image_name);
                $hospital->image   = $directory . $image_name;
            }
            if($hospital->update()){
                $education= Hospital::join('divisions','divisions.id','hospitals.division_id')
                        ->join('districts','districts.id','hospitals.district_id')
                        ->join('thanas','thanas.id','hospitals.thana_id')
                        ->select('hospitals.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                        ->where('hospitals.id', $hospital->id)
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
        $education = Hospital::find($request->id);

        if(($education->image != null) && file_exists($education->image)){
            unlink($education->image);
        }

        $education->delete();
        return response()->json();
    }
}
