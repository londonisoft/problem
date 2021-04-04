<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\DhakaNeigbor;
use DB;
class DhakaNeibor extends Controller
{
    public function DhakaNeiborList(Request $request) {
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
