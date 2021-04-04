<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CountController extends Controller
{
    public function sumDataList(Request $request) {
        try{
            $data =  DhakaNeigbor::with('areas')->get();
            
            
        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
        return response()->json([
            'status_code' => 200,
            'data'        => $data,
        ]);

    }

    public function placeData(Request $request) {
        $division_id = $request->division_id;
        try{
            $data =  DhakaNeigbor::with('areas')->get();
            
            
        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
        return response()->json([
            'status_code' => 200,
            'data'        => $data,
        ]);

    }
}
