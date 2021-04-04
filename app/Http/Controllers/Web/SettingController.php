<?php

namespace App\Http\Controllers\Web;
use App\Models\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ameniti;
use App\Models\Area;
use App\Models\Block;
use App\Models\District;
use App\Models\Division;
use App\Models\EducationalInstitute;
use App\Models\Hospital;
use App\Models\Park;
use App\Models\ReligiousInstitution;
use App\Models\Restaurant;
use App\Models\Property;
use App\Models\Propertyimage;
use App\Models\PropertyType;
use App\Models\Thana;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class SettingController extends Controller
{

    public function index() {
        $setting = Setting::first();

        if ($setting) {
            return view("abasvumi.setting.create",compact('setting'));
        } else {
            $setting = new Setting();
            $setting->home_title = 'welcome';
            $setting->save();
            return view("abasvumi.setting.create",compact('setting'));
        }

    }



    public function store (Request $request) {
       
            if ($request->id) {
                $setting = Setting::find($request->id);
            } else {
                $setting = new Setting();
            }
           
            $setting->home_title              = $request->home_title;
            $setting->home_title_bn              = $request->home_title_bn;
            $setting->home_description              = $request->home_description;
            $setting->home_description_bn              = $request->home_description_bn;
            $setting->total_agent              = $request->total_agent;
            $setting->total_developer              = $request->total_developer;
            $setting->total_supplier              = $request->total_supplier;
            $setting->total_sale              = $request->total_sale;
            $setting->total_rent              = $request->total_rent;
            $setting->footer_text              = $request->footer_text;
            $setting->footer_text_bn              = $request->footer_text_bn;
            $setting->facebook_link              = $request->facebook_link;
            $setting->twitter_link              = $request->twitter_link;
            $setting->google_link              = $request->google_link;
            $setting->linkedin_link              = $request->linkedin_link;
            $setting->email              = $request->email;
            $setting->mobile              = $request->mobile;
            $setting->address              = $request->address;
            $setting->address_bn              = $request->address_bn;
         

            if($request->logo){

                if($setting->logo != null && file_exists($setting->logo)){
                    unlink($setting->logo);
                }

                $file_info = $request->file('logo');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "setting_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/setting/';
                $file_info->move($directory, $image_name);
                $setting->logo  = $directory . $image_name;
            }
            if($request->favicon){

                if($setting->favicon != null && file_exists($setting->favicon)){
                    unlink($setting->favicon);
                }

                $file_info = $request->file('favicon');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "setting_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/setting/';
                $file_info->move($directory, $image_name);
                $setting->favicon  = $directory . $image_name;
            }


          
            $setting->save();
            
            return redirect()->back();
            
        
    }
}
