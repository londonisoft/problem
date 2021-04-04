<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /**
     * show dashboard page
     */
    public function index () 
    {
        return view('abasvumi.dashboard.index');
    }
}
