<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AreaGuide;

class AreaguideController extends Controller
{
    public function DhakaNeiborList(Request $request) {
        try{
            $data =  AreaGuide::get()
        }catch (Exception $error) {
            return response()->json([
                'success'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
        return response()->json([
            'success' => true,
            'message'  => 'Data found.',
            'data'        => $data,
        ]);

    }
}
