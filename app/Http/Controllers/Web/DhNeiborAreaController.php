<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\DhakaNeigborArea;
use App\Models\DhakaNeigbor;
use App\Models\Area;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;

class DhNeiborAreaController extends Controller
{
        /*
        * Get all Category guides
        */
        public function index() {
            $neibors = DhakaNeigbor::all();
            $areas = Area::all();
    
            $neibors_area = DB::table('dhaka_neigbor_areas')
                ->leftJoin('dhaka_neigbors','dhaka_neigbors.id','dhaka_neigbor_areas.dhaka_neigbor_id')
                ->leftJoin('areas','areas.id','dhaka_neigbor_areas.area_id')
                ->select('dhaka_neigbor_areas.*','dhaka_neigbors.name as neibor_name', 'areas.name as area_name')
                        ->get();

            return view("abasvumi.neiborsArea.index",compact("neibors","areas","neibors_area"));
        }
        
        /*
        * Category Guide Store
        */
        public function store(Request $request) {
            //return $request->all();

            $validators = Validator::make($request->all(),[
                'dhaka_neigbor_id' => 'required',
                'area_id' => 'required',
            ]);
    
            if($validators->fails()) {
                return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
            } else {
                
                $areaGuide                          = new DhakaNeigborArea();
                $areaGuide->dhaka_neigbor_id        = $request->dhaka_neigbor_id;
                $areaGuide->area_id                 = $request->area_id;
              
                
                if($areaGuide->save()){
                    $neibors_area = DB::table('dhaka_neigbor_areas')
                    ->leftJoin('dhaka_neigbors','dhaka_neigbors.id','dhaka_neigbor_areas.dhaka_neigbor_id')
                    ->leftJoin('areas','areas.id','dhaka_neigbor_areas.area_id')
                    ->select('dhaka_neigbor_areas.*','dhaka_neigbors.name as neibor_name', 'areas.name as area_name')
                    ->where('dhaka_neigbor_areas.id', $areaGuide->id)
                    ->first();

                    return response()->json([
                        'status'    => 201,
                        'data'      => $neibors_area
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
                'dhaka_neigbor_id' => 'required',
                'area_id' => 'required',
            ]);
    
            if($validators->fails()) {
                return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
            } else {
                
                $areaGuide                 = new DhakaNeigborArea();
                $areaGuide->dhaka_neigbor_id        = $request->dhaka_neigbor_id;
                $areaGuide->area_id        = $request->area_id;

                if($areaGuide->update()){

                    $neibors_area = DB::table('dhaka_neigbor_areas')
                        ->leftJoin('dhaka_neigbors','dhaka_neigbors.id','dhaka_neigbor_areas.dhaka_neigbor_id')
                        ->leftJoin('areas','areas.id','dhaka_neigbor_areas.area_id')
                        ->select('dhaka_neigbor_areas.*','dhaka_neigbors.name as neibor_name', 'areas.name as area_name')
                        ->where('dhaka_neigbor_areas.id', $areaGuide->id)
                        ->first();

                    return response()->json([
                        'status'    => 201,
                        'data'      => $neibors_area
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
            $areaGuide = DhakaNeigborArea::find($request->id);
    
            if(($areaGuide->image != null) && file_exists($areaGuide->image)){
                unlink($areaGuide->image);
            }
    
            $areaGuide->delete();
            return response()->json();
        }
    }
