<?php

namespace App\Lib;

use Illuminate\Support\Facades\DB;

class Frontend 
{
    public static function developers()
    {
        return DB::table('external_users')->select("*")->where('user_type', 1)->paginate(config('app.perPage'));
    }
    public static function agents()
    {
        return DB::table('external_users')->select("*")->where('user_type', 2)->paginate(config('app.perPage'));
    }
    public static function suppliers()
    {
        return DB::table('external_users')->select("*")->where('user_type', 3)->paginate(config('app.perPage'));
    }
    
}