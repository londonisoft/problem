<?php

namespace App\Lib;
use App\Models\ExternalUser;
use App\Models\Property;

use Illuminate\Support\Facades\DB;

class DropDowns
{
    public static function divisionList()
    {
        return DB::table('divisions')->select('id', 'name as text_en', 'bn_name as text_bn')->get();
    }

    public static function districtList()
    {
        return DB::table('districts')->select('id','division_id', 'name as text_en', 'bn_name as text_bn')->get();
    }

    public static function thanaList()
    {
        return DB::table('thanas')->select('id','district_id', 'name as text_en', 'bn_name as text_bn')->get();
    }

    public static function educations(){
        return DB::table('educational_institutes')->select('id','division_id','district_id','thana_id','name as text_en','bn_name as text_bn')->get();
    }

    public static function hospitals(){
        return DB::table('hospitals')->select('id','division_id','district_id','thana_id','name as text_en','bn_name as text_bn')->get();
    }

    public static function restaurants(){
        return DB::table('restaurants')->select('id','division_id','district_id','thana_id','name as text_en','bn_name as text_bn')->get();
    }

    public static function parks(){
        return DB::table('parks')->select('id','division_id','district_id','thana_id','name as text_en','bn_name as text_bn')->get();
    }

    public static function serviceTypes(){
        return DB::table('service_types')->select('id','name as text_en','bn_name as text_bn')->get();
    }
    public static function areas(){
        return DB::table('areas')->select('id','name as text_en','bn_name as text_bn', 'address', 'address_bn','image')->get();
    }
    public static function userAreaList(){
        $data = DB::table('properties')->select('area_id  as text_en','area_id  as text_bn')->get();

			$final  = array();

			foreach ($data as $current) {
				if ( ! in_array($current, $final)) {
					$final[] = $current;
				}
			}
		return $final;
    }
    public static function blocks(){
        return DB::table('blocks')->select('id','name as text_en','bn_name as text_bn')->get();
    }
    public static function religious(){
        return DB::table('religious_institutions')->select('id','division_id','district_id','thana_id','name as text_en','bn_name as text_bn')->get();
    }
    public static function amenitis(){
        return DB::table('amenitis')->select('id','name as text_en','bn_name as text_bn', 'icon')->get();
    }
    public static function productCategoryList(){
        return DB::table('product_categories')->select('id','name as text_en','name_bn as text_bn','is_menu')->get();
    }
    public static function serviceCategoryList(){
        return DB::table('service_categories')->select('id','name as text_en','name_bn as text_bn','is_menu')->get();
    }
    public static function unitList(){
        return DB::table('units')->select('id','name as text_en','name_bn as text_bn')->get();
    }
    public static function sertting(){
        return DB::table('settings')->select('*')->first();
    }
    public static function propertyTypeList(){
        return DB::table('property_types')->select('id','name as text_en','bn_name as text_bn','category_id', 'is_menu')->get();
    }
    public static function sliderList(){
        return DB::table('sliders')->select('image','id')->get();
    }
    public static function sumDataList(){
        $all_agent = ExternalUser::where('user_type', 1)->count();
        $all_developers = ExternalUser::where('user_type', 2)->count();
        $all_suppliers = ExternalUser::where('user_type', 3)->count();
        $all_sale_pro = Property::where('purpose', 1)->count();
        $all_rent_pro = Property::where('purpose', 2)->count();

        $Dhaka_all = Property::where('division_id', 6)->count();
        $chitaa_all = Property::where('division_id', 1)->count();
        $syllet = Property::where('division_id', 5)->count();
        $rajshahi = Property::where('division_id', 2)->count();

        $datas = [
            'total_agent'=> $all_agent,
            'total_developer'=> $all_developers,
            'total_supplier'=> $all_suppliers,
            'total_sale'=> $all_sale_pro,
            'total_rent'=> $all_rent_pro,
            'total_dhaka'=> $Dhaka_all,
            'total_chita'=> $chitaa_all,
            'total_syllet'=> $syllet,
            'total_rajshahi'=> $rajshahi
        ];

        return $datas;
    }
    
}
