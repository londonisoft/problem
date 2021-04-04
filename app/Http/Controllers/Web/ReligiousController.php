<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\Division;
use App\Models\ReligiousInstitution;
use App\Models\Thana;
use Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReligiousController extends Controller
{
/*
    * Get all Religious Institute
    */
    public function index() {
        $divisions = Division::all();

        $educations = DB::table('religious_institutions')
                    ->leftJoin('divisions','divisions.id','religious_institutions.division_id')
                    ->leftJoin('districts','districts.id','religious_institutions.district_id')
                    ->leftJoin('thanas','thanas.id','religious_institutions.thana_id')
                    ->select('religious_institutions.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                    ->get();
        //return $educations;
        return view("abasvumi.religious.index",compact("divisions","educations"));
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
    * Religious Store
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
            
            $religious                 = new ReligiousInstitution();
            $religious->division_id    = $request->division_id;
            $religious->district_id    = $request->district_id;
            $religious->thana_id       = $request->thana_id;
            $religious->name           = $request->name;
            $religious->bn_name        = $request->bn_name;
            $religious->description    = $request->description;
            $religious->bn_description = $request->bn_description;
            $religious->lat            = $request->lat;
            $religious->lon            = $request->lon;
            $religious->type           = $request->type;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "education_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/religious/';
                $file_info->move($directory, $image_name);
                $religious->image   = $directory . $image_name;
            }
            if($religious->save()){
                $education= ReligiousInstitution::join('divisions','divisions.id','religious_institutions.division_id')
                        ->join('districts','districts.id','religious_institutions.district_id')
                        ->join('thanas','thanas.id','religious_institutions.thana_id')
                        ->select('religious_institutions.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                        ->where('religious_institutions.id', $religious->id)
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
    * Update religious
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
            
            $religious                 = ReligiousInstitution::find($request->id);
            
            $religious->division_id    = $request->division_id;
            $religious->district_id    = $request->district_id;
            $religious->thana_id       = $request->thana_id;
            $religious->name           = $request->name;
            $religious->bn_name        = $request->bn_name;
            $religious->description    = $request->description;
            $religious->bn_description = $request->bn_description;
            $religious->lat            = $request->lat;
            $religious->lon            = $request->lon;
            $religious->type           = $request->type;

            if($request->image){

                unlink($religious->image);

                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "education_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/religious/';
                $file_info->move($directory, $image_name);
                $religious->image   = $directory . $image_name;
            }
            if($religious->update()){
                $education= ReligiousInstitution::join('divisions','divisions.id','religious_institutions.division_id')
                        ->join('districts','districts.id','religious_institutions.district_id')
                        ->join('thanas','thanas.id','religious_institutions.thana_id')
                        ->select('religious_institutions.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                        ->where('religious_institutions.id', $religious->id)
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
    * Destroy religious
    */
    public function destroy(Request $request) {
        $religious = ReligiousInstitution::find($request->id);

        if(($religious->image != null) && file_exists($religious->image)){
            unlink($religious->image);
        }

        $religious->delete();
        return response()->json();
    }
}
