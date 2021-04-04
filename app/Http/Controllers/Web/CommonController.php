<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\District;
use App\Models\Thana;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CommonController extends Controller
{
    /**
     * get district by division id
     */
    public function getDistrict ($division_id) 
    {
        $districts = District::select("id","name")->where("division_id",$division_id)->get();

        $dataList = array(
            'districts' => $districts,
        );

        $appendDistrict = view('abasvumi.ajax_html.district', $dataList)->render();

        return response()->json([
            'districts' => $appendDistrict
        ]);
    }

    /**
     * get thana by district id
     */
    public function getThana ($district_id) 
    {
        $thanas = Thana::select("id","name")->where("district_id",$district_id)->get();

        $dataList = array(
            'thanas' => $thanas,
        );

        $appendThana = view('abasvumi.ajax_html.thana', $dataList)->render();

        return response()->json([
            'thanas' => $appendThana
        ]);
    }

    /**
     * get district & thana by division & district id
     */
    public function getDivisionDistrictThana ($division_id, $district_id, $thana_id) 
    {
        $districts = District::where("division_id",$division_id)->get();
        $thanas    = Thana::where("district_id",$district_id)->get();

        $dataListDistrict = array(
            'districts'   => $districts,
            'district_id' => $district_id,
        );

        $dataListThana = array(
            'thana_id' => $thana_id,
            'thanas'   => $thanas,
        );
        
        $appendDistrict = view('abasvumi.ajax_html.districtAppend', $dataListDistrict)->render();
        $appendThana    = view('abasvumi.ajax_html.thanaSelectedAppend', $dataListThana)->render();

        $data = array(
            'appendDistrict'=>$appendDistrict,
            'appendThana'   =>$appendThana,
        );

        return response()->json($data);
    }

    public function getEducationHospitalResturantParkReligion($thana_id) {
        $educations = DB::table('educational_institutes')->select('id','name')->where('thana_id',$thana_id)->get()->toArray();
        $hospitals  = DB::table('hospitals')->select('id','name')->where('thana_id',$thana_id)->get();
        $resturants = DB::table('restaurants')->select('id','name')->where('thana_id',$thana_id)->get();
        $parks      = DB::table('parks')->select('id','name')->where('thana_id',$thana_id)->get();
        $religious  = DB::table('religious_institutions')->select('id','name')->where('thana_id',$thana_id)->get();

        $data = array(
            'educations' => $educations,
            'hospitals'  => $hospitals,
            'resturants' => $resturants,
            'parks'      => $parks,
            'religious'  => $religious,
        ); 
        return response()->json($data);

    }
}
