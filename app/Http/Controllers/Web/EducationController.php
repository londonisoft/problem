<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Division;
use App\Models\EducationalInstitute;
use Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EducationController extends Controller
{
    /*
    * Get all Educational Institute
    */
    public function index() {
        $divisions = Division::all();

        $educations = DB::table('educational_institutes')
                    ->leftJoin('divisions','divisions.id','educational_institutes.division_id')
                    ->leftJoin('districts','districts.id','educational_institutes.district_id')
                    ->leftJoin('thanas','thanas.id','educational_institutes.thana_id')
                    ->select('educational_institutes.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                    ->get();
        //return $educations;
        return view("abasvumi.educational_institute.index",compact("divisions","educations"));
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
            
            $education                 = new EducationalInstitute();
            $education->division_id    = $request->division_id;
            $education->district_id    = $request->district_id;
            $education->thana_id       = $request->thana_id;
            $education->name           = $request->name;
            $education->bn_name        = $request->bn_name;
            $education->description    = $request->description;
            $education->bn_description = $request->bn_description;
            $education->lat            = $request->lat;
            $education->lon            = $request->lon;
            $education->type           = $request->type;

            if($request->image){
                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "education_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/education/';
                $file_info->move($directory, $image_name);
                $education->image   = $directory . $image_name;
            }
            if($education->save()){
                $education= EducationalInstitute::join('divisions','divisions.id','educational_institutes.division_id')
                        ->join('districts','districts.id','educational_institutes.district_id')
                        ->join('thanas','thanas.id','educational_institutes.thana_id')
                        ->select('educational_institutes.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                        ->where('educational_institutes.id', $education->id)
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
            
            $education                 = EducationalInstitute::find($request->id);
            
            $education->division_id    = $request->division_id;
            $education->district_id    = $request->district_id;
            $education->thana_id       = $request->thana_id;
            $education->name           = $request->name;
            $education->bn_name        = $request->bn_name;
            $education->description    = $request->description;
            $education->bn_description = $request->bn_description;
            $education->lat            = $request->lat;
            $education->lon            = $request->lon;
            $education->type           = $request->type;

            if($request->image){

                unlink($education->image);

                $file_info = $request->file('image');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "education_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/education/';
                $file_info->move($directory, $image_name);
                $education->image   = $directory . $image_name;
            }
            if($education->update()){
                $education= EducationalInstitute::join('divisions','divisions.id','educational_institutes.division_id')
                        ->join('districts','districts.id','educational_institutes.district_id')
                        ->join('thanas','thanas.id','educational_institutes.thana_id')
                        ->select('educational_institutes.*','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                        ->where('educational_institutes.id', $education->id)
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
        $education = EducationalInstitute::find($request->id);

        if(($education->image != null) && file_exists($education->image)){
            unlink($education->image);
        }

        $education->delete();
        return response()->json();
    }

}
