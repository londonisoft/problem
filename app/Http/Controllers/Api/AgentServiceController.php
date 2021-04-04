<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
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
use App\Models\Service;
use App\Models\Serviceimage;
use App\Models\ServiceType;
use App\Models\Thana;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
class AgentServiceController extends Controller
{
    /**
     * Agent properties
     */

    public function index() {
        try{
            $services = DB::table('services')
                    ->leftJoin('service_types','service_types.id','services.service_type_id')
                    ->leftJoin('divisions','divisions.id','services.division_id')
                    ->leftJoin('districts','districts.id','services.district_id')
                    ->leftJoin('thanas','thanas.id','services.thana_id')
                    ->select('services.*','service_types.name as service_type_name','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                    ->where('services.agent_id',auth()->user()->id)
                   // ->where('services.agent_id',4)
                    ->paginate(config('app.perPage'));

        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        

        return response()->json([
            'status_code' => 200,
            'data'        => $services,
        ]);

    }

    /*
    * Service Store
    */
    public function store(Request $request) {

        $validator = Validator::make($request->all(),[
            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
            'service_type_id' => 'required',
            'area_id'         => 'required',
            'block_id'        => 'required',
            'title'           => 'required',
            'bn_title'        => 'required',
            'description'     => 'required',
            'bn_description'  => 'required',
            'address'         => 'required',
            'lat'             => 'required',
            'lon'             => 'required',
            'interest_rate'   => 'required',
            'price'           => 'required',
            'sqft'            => 'required',
            'baths'           => 'required',
            'garage'          => 'required',
            'balcony'         => 'required',
            'video_link'      => 'required',
            'type'            => 'required',
            'purpose'         => 'required',
            'status'          => 'required'
        ],[
            'division_id.required' => 'Division is required',
            'district_id.required' => 'District is required',
            'thana_id.required'    => 'Thana is required',
            'service_type_id.required' => 'Service Type is  required',
            'area_id.required'     => 'Area is required',
            'block_id.required'    => 'Block is required',
            'title.required'       => 'Title is required',
            'bn_title.required'    => 'Bangla title is required',
            'description.required' => 'Description is required',
            'bn_description.required' => 'Bangla description is required',
            'address.required'     => 'Address is required',
            'lat.required'         => 'Lat is required',
            'lon.required'         => 'Lon is required',
            'interest_rate.required' => 'interest_rate is required',
            'price.required'       => 'price is required',
            'sqft.required'        => 'sqft is required',
            'baths.required'       => 'Blobathsck is required',
            'garage.required'      => 'Garage is required',
            'balcony.required'     => 'Balcony is required',
            'video_link.required'  => 'Video link is required',
            'type.required'        => 'Type is required',
            'purpose.required'     => 'Purpose is required',
            'status.required'      => 'Status is required'
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
            DB::beginTransaction();
            try {
                foreach ($request->amenit_ids as $val) {
                    $amenit_ids[]=$val['value'];
                }
                foreach ($request->education_ids as $val) {
                    $education_ids[]=$val['value'];
                }
                foreach ($request->hospital_ids as $val) {
                    $hospital_ids[]=$val['value'];
                }
                foreach ($request->restaurant_ids as $val) {
                    $restaurant_ids[]=$val['value'];
                }
                foreach ($request->park_ids as $val) {
                    $park_ids[]=$val['value'];
                }
                foreach ($request->religious_ids as $val) {
                    $religious_ids[]=$val['value'];
                }
                
                $service                         = new Service();
                $service->agent_id               = auth()->user()->id;
                $service->division_id            = $request->division_id;
                $service->district_id            = $request->district_id;
                $service->thana_id               = $request->thana_id;
                $service->title                  = $request->title;
                $service->bn_title               = $request->bn_title;
                $service->service_type_id        = $request->service_type_id['value'];
                $service->area_id                = $request->area_id['value'];
                $service->block_id               = $request->block_id['value'];
                $service->amenities              = json_encode($amenit_ids);
                $service->educational_institutes = json_encode($education_ids);
                $service->hospitals              = json_encode($hospital_ids);
                $service->restaurants            = json_encode($restaurant_ids);
                $service->parks                  = json_encode($park_ids);
                $service->religious              = json_encode($religious_ids);
                $service->title                  = $request->title;
                $service->bn_title               = $request->bn_title;
                $service->description            = $request->description;
                $service->bn_description         = $request->bn_description;
                $service->address                = $request->address;
                $service->lat                    = $request->lat;
                $service->lon                    = $request->lon;
                $service->interest_rate          = $request->interest_rate;
                $service->price                  = $request->price;
                $service->sqft                   = $request->sqft;
                $service->baths                  = $request->baths;
                $service->garage                 = $request->garage;
                $service->balcony                = $request->balcony;
                $service->video_link             = $request->video_link;
                $service->agent_contact_no       = $request->agent_contact_no;
                $service->contact_email          = $request->contact_email;
                $service->contact_no_show        = $request->contact_no_show;
                $service->type                   = $request->type;
                $service->purpose                = $request->purpose;
                $service->status                 = 0;

                if ($service->save()) {
                    foreach ($request->images as $img) {
                        $service_image = ServiceImage::find($img['id']);
                        $service_image->parent_id = $service->id;
                        $service_image->save();
                    }

                    $thum_img = $request->showThumnail;
                    $thumbnail_img = ServiceImage::find($thum_img['id']);
                    $thumbnail_img->parent_id = $service->id;
                    $thumbnail_img->save();
                    DB::commit();

                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "Property save succcessfully",
                        'data'        => $service
                    ]);
                }

            } catch (\Exception $ex) {
                DB::rollBack();

                return response()->json([
                    'success'      => false,
                    'status_code'  => 500,
                    'message'        => $ex,
                ]);
            }
        }
        
    }

    public function uploadThumnail (Request $request) {

        $serviceimage = new Serviceimage();
        $serviceimage->parent_id = 0;
        $serviceimage->user_id = auth()->user()->id;
        $serviceimage->image_type_id = 1;

        $file_info = $request->file('image');
        $image_ext = strtolower($file_info->getClientOriginalExtension());
        $image_name = "service_" . time() . rand() . "." . $image_ext;                
        $directory  = 'abasvumi/uploads/images/services/';
        $file_info->move($directory, $image_name);
        $serviceimage->image  = $directory . $image_name;
        
        $serviceimage->save();

        return response()->json([
            'success'   => true,
            'status_code' => 200,
            'message' => "Property save succcessfully",
            'data'        => $serviceimage
        ]);
        
    }
    public function uploadProImg (Request $request) {

        $serviceimage = new Serviceimage();
        $serviceimage->parent_id = 0;
        $serviceimage->user_id = auth()->user()->id;
        $serviceimage->image_type_id = 2;

        $file_info = $request->file('image');
        $image_ext = strtolower($file_info->getClientOriginalExtension());
        $image_name = "service_" . time() . rand() . "." . $image_ext;                
        $directory  = 'abasvumi/uploads/images/services/';
        $file_info->move($directory, $image_name);
        $serviceimage->image  = $directory . $image_name;
        
        $serviceimage->save();

        return response()->json([
            'success'   => true,
            'status_code' => 200,
            'message' => "Property save succcessfully",
            'data'        => $serviceimage
        ]);
        
    }
    public function imageRemove (Request $request) {

        try {
            $img_id = $request->image_id;
            $serviceImage = ServiceImage::find($img_id);
            $serviceImage->delete();

            return response()->json([
                'success'   => true,
                'status_code' => 200,
                'message' => "Property save succcessfully",
                'data'        => []
            ]);
        } catch (\Exception $error) {

            return response()->json([
                'success'   => false,
                'status_code' => 500,
                'message' => $error->getMessage(),
                'data'    => []
            ]);
           
        }
       
        
    }

    public function view($id) {
        try{
            $service = DB::table('services')->where('id',$id)->first();

            $serviceAmenities             = json_decode($service->amenities);
            $serviceEducationalInstitutes = json_decode($service->educational_institutes);
            $serviceHospitals             = json_decode($service->hospitals);
            $serviceRestaurants           = json_decode($service->restaurants);
            $serviceParks                 = json_decode($service->parks);
            $serviceReligious             = json_decode($service->religious);
            //return $serviceReligious;
            
            $divisions    = Division::all();
            $districts    = District::where("division_id",$service->division_id)->get();
            $thanas       = Thana::where("district_id",$service->district_id)->get();
            $areas        = Area::all();
            $blocks       = Block::all();
            $serviceTypes = ServiceType::all();

            $amenities    = Ameniti::select('id','name')->get();
            $educations   = EducationalInstitute::select('id','name')->get();
            $hospitals    = Hospital::select('id','name')->get();
            $restaurants  = Restaurant::select('id','name')->get();
            $parks        = Park::select('id','name')->get();
            $religious    = ReligiousInstitution::select('id','name')->get();
            $serviceimage = Serviceimage::where("service_id",$id)->first();

        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }

        return response()->json([
            'status_code' => 200,
            'service'    => $service,
            'divisions'        => $divisions,
            'districts'        => $districts,
            'thanas'        => $thanas,
            'serviceAmenities'        => $serviceAmenities,
            'serviceEduInstitutes'    => $serviceEducationalInstitutes,
            'servicehospitals'    => $serviceHospitals,
            'serviceRestaurants'    => $serviceRestaurants,
            'serviceParks'    => $serviceParks,
            'serviceReligious'    => $serviceReligious,
            'areas'    => $areas,
            'blocks'    => $blocks,
            'serviceTypes'    => $serviceTypes,
            'amenities'    => $amenities,
            'educations'    => $educations,
            'hospitals'    => $hospitals,
            'restaurants'    => $restaurants,
            'parks'    => $parks,
            'religious'    => $religious,
            'serviceimage'    => $serviceimage,
        ]);
    }

       /**
     * Service edit
     */

    public function edit($id) {
        try{
            $service = DB::table('services')->where('id',$id)->first();

            $serviceAmenities             = json_decode($service->amenities);
            $serviceEducationalInstitutes = json_decode($service->educational_institutes);
            $serviceHospitals             = json_decode($service->hospitals);
            $serviceRestaurants           = json_decode($service->restaurants);
            $serviceParks                 = json_decode($service->parks);
            $serviceReligious             = json_decode($service->religious);
            //return $serviceReligious;
            
            $divisions    = Division::all();
            $districts    = District::where("division_id",$service->division_id)->get();
            $thanas       = Thana::where("district_id",$service->district_id)->get();
            $areas        = Area::all();
            $blocks       = Block::all();
            $serviceTypes = ServiceType::all();

            $amenities    = Ameniti::select('id','name')->get();
            $educations   = EducationalInstitute::select('id','name')->get();
            $hospitals    = Hospital::select('id','name')->get();
            $restaurants  = Restaurant::select('id','name')->get();
            $parks        = Park::select('id','name')->get();
            $religious    = ReligiousInstitution::select('id','name')->get();
            $serviceimage = Serviceimage::where("service_id",$id)->first();

        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }

        return response()->json([
            'status_code' => 200,
            'service'    => $service,
            'divisions'        => $divisions,
            'districts'        => $districts,
            'thanas'        => $thanas,
            'serviceAmenities'        => $serviceAmenities,
            'serviceEduInstitutes'    => $serviceEducationalInstitutes,
            'servicehospitals'    => $serviceHospitals,
            'serviceRestaurants'    => $serviceRestaurants,
            'serviceParks'    => $serviceParks,
            'serviceReligious'    => $serviceReligious,
            'areas'    => $areas,
            'blocks'    => $blocks,
            'serviceTypes'    => $serviceTypes,
            'amenities'    => $amenities,
            'educations'    => $educations,
            'hospitals'    => $hospitals,
            'restaurants'    => $restaurants,
            'parks'    => $parks,
            'religious'    => $religious,
            'serviceimage'    => $serviceimage,
        ]);
    }

    /*
    * Update service
    */
    public function update (Request $request) {
        //return $request->all();
        $this->validate($request,[
            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
            'service_type_id' => 'required',
            'area_id'         => 'required',
            'block_id'        => 'required',
            'title'           => 'required',
            'bn_title'        => 'required',
            'description'     => 'required',
            'bn_description'  => 'required',
            'address'         => 'required',
            'lat'             => 'required',
            'lon'             => 'required',
            'interest_rate'   => 'required',
            'price'           => 'required',
            'sqft'            => 'required',
            'baths'           => 'required',
            'garage'          => 'required',
            'balcony'         => 'required',
            'video_link'      => 'required',
            'type'            => 'required',
            'purpose'         => 'required',
            'status'          => 'required',
        ],[
            'division_id.required' => 'Division is required',
            'district_id.required' => 'District is required',
            'thana_id.required'    => 'Thana is required',
            'service_type_id.required' => 'Service Type is  required',
            'area_id.required'     => 'Area is required',
            'block_id.required'    => 'Block is required',
            'title.required'       => 'Title is required',
            'bn_title.required'    => 'Bangla title is required',
            'description.required' => 'Description is required',
            'bn_description.required' => 'Bangla description is required',
            'address.required'     => 'Address is required',
            'lat.required'         => 'Lat is required',
            'lon.required'         => 'Lon is required',
            'interest_rate.required' => 'interest_rate is required',
            'price.required'       => 'price is required',
            'sqft.required'        => 'sqft is required',
            'baths.required'       => 'Blobathsck is required',
            'garage.required'      => 'Garage is required',
            'balcony.required'     => 'Balcony is required',
            'video_link.required'  => 'Video link is required',
            'type.required'        => 'Type is required',
            'purpose.required'     => 'Purpose is required',
            'status.required'      => 'Status is required',
        ]);
        try{
            $amenit_ids     = json_encode($request->amenit_ids);
            $education_ids  = json_encode($request->education_ids);
            $hospital_ids   = json_encode($request->hospital_ids);
            $restaurant_ids = json_encode($request->restaurant_ids);
            $park_ids       = json_encode($request->park_ids);
            $religious_ids  = json_encode($request->religious_ids);
            
            $service                         = Service::where('id',$request->id)->first();
            
            $service->agent_id               = $request->agent_id;
            $service->division_id            = $request->division_id;
            $service->district_id            = $request->district_id;
            $service->thana_id               = $request->thana_id;
            $service->title                  = $request->title;
            $service->bn_title               = $request->bn_title;
            $service->service_type_id        = $request->service_type_id;
            $service->area_id                = $request->area_id;
            $service->block_id               = $request->block_id;
            $service->amenities              = $amenit_ids;
            $service->educational_institutes = $education_ids;
            $service->hospitals              = $hospital_ids;
            $service->restaurants            = $restaurant_ids;
            $service->parks                  = $park_ids;
            $service->religious              = $religious_ids;
            $service->title                  = $request->title;
            $service->bn_title               = $request->bn_title;
            $service->description            = $request->description;
            $service->bn_description         = $request->bn_description;
            $service->address                = $request->address;
            $service->lat                    = $request->lat;
            $service->lon                    = $request->lon;
            $service->interest_rate          = $request->interest_rate;
            $service->price                  = $request->price;
            $service->sqft                   = $request->sqft;
            $service->baths                  = $request->baths;
            $service->garage                 = $request->garage;
            $service->balcony                = $request->balcony;
            $service->video_link             = $request->video_link;
            $service->agent_contact_no       = $request->agent_contact_no;
            $service->contact_email          = $request->contact_email;
            $service->contact_no_show        = $request->contact_no_show;
            $service->type                   = $request->type;
            $service->purpose                = $request->purpose;
            $service->status                 = $request->status;

            if($request->properties_thumbnail){

                if($service->properties_thumbnail != null && file_exists($service->properties_thumbnail)){
                    unlink($service->properties_thumbnail);
                }

                $file_info = $request->file('properties_thumbnail');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "service_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/services/';
                $file_info->move($directory, $image_name);
                $service->properties_thumbnail  = $directory . $image_name;
            }

            if($service->update()){
                $serviceimage = Serviceimage::where("service_id",$service->id)->first();
                if($request->image_one){                    
                    if($serviceimage->image_one != null && file_exists($serviceimage->image_one)){
                        unlink($serviceimage->image_one);
                    }
                    $file_info = $request->file('image_one');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_one  = $directory . $image_name;
                }

                if($request->image_two){                    
                    if($serviceimage->image_two != null && file_exists($serviceimage->image_two)){
                        unlink($serviceimage->image_two);
                    }
                    $file_info = $request->file('image_two');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_two  = $directory . $image_name;
                }

                if($request->image_three){                    
                    if($serviceimage->image_three != null && file_exists($serviceimage->image_three)){
                        unlink($serviceimage->image_three);
                    }
                    $file_info = $request->file('image_three');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_three  = $directory . $image_name;
                }

                if($request->image_four){                    
                    if($serviceimage->image_four != null && file_exists($serviceimage->image_four)){
                        unlink($serviceimage->image_four);
                    }
                    $file_info = $request->file('image_four');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_four  = $directory . $image_name;
                }

                if($request->image_five){                    
                    if($serviceimage->image_five != null && file_exists($serviceimage->image_five)){
                        unlink($serviceimage->image_five);
                    }
                    $file_info = $request->file('image_five');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_five  = $directory . $image_name;
                }

                if($request->image_six){                    
                    if($serviceimage->image_six != null && file_exists($serviceimage->image_six)){
                        unlink($serviceimage->image_six);
                    }
                    $file_info = $request->file('image_six');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_six  = $directory . $image_name;
                }

                if($request->image_seven){                    
                    if($serviceimage->image_seven != null && file_exists($serviceimage->image_seven)){
                        unlink($serviceimage->image_seven);
                    }
                    $file_info = $request->file('image_seven');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_seven  = $directory . $image_name;
                }

                if($request->image_eight){                    
                    if($serviceimage->image_eight != null && file_exists($serviceimage->image_eight)){
                        unlink($serviceimage->image_eight);
                    }
                    $file_info = $request->file('image_eight');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_eight  = $directory . $image_name;
                }

                if($request->image_nine){                    
                    if($serviceimage->image_nine != null && file_exists($serviceimage->image_nine)){
                        unlink($serviceimage->image_nine);
                    }
                    $file_info = $request->file('image_nine');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "service_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/services/';
                    $file_info->move($directory, $image_name);
                    $serviceimage->image_nine  = $directory . $image_name;
                }
                $serviceimage->update();
                
                return response()->json([
                    'status'     => true,
                    'message'    => 'Service updated.',
                ]);

            }

        }catch(Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not store.',
                'errors'    => $error->getMessage(),
            ]);
        }
    }


}
