<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    public function getPropertyLocations (Request $request) {
        //return response($request->location);
        $tables = [
            'divisions',
            'districts',
            'thanas',
            'areas'
        ];
        return response([]);
    }
}
