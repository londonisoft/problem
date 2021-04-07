<?php

namespace App\Lib;

use Illuminate\Support\Facades\DB;
use App\Models\PopularPlace;
use App\Models\DhakaNeigbor;
use App\Models\Property;

class Frontend 
{
    public static function featuredPropertyList()
    {
        return Property::select('id','price','price','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id')->orderBy('id', 'desc')->where('is_featured', 1)->take(10)->get();
    }
    public static function dhakaNeiborList()
    {
        return  DhakaNeigbor::with('areas')->get();
    }
    public static function soldPropertyList()
    {
        // return Property::with('images:property_id,image,image_type_id')->orderBy('id', 'desc')->where('status', 3)->take(10)->get();
        return Property::select('id','price','price','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id')->orderBy('id', 'desc')->take(10)->get();
    }
    public static function latestPropertyList()
    {
        return Property::select('id','price','price','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id')->orderBy('id', 'desc')->take(10)->get();
    }
    public static function popularPlaceList()
    {
        return PopularPlace::get();
    }
    public static function homeAgentList()
    {
        return DB::table('external_users')->select("*")->where('user_type', 2)->take(10)->get();
    }
    public static function homeTestimonialList()
    {
        return DB::table('testimonials')->select("*")->get();
    }
    public static function homeBrandList()
    {
        return DB::table('brands')->select("*")->get();
    }
}