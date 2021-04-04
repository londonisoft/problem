<?php

namespace App\Http\Controllers\Web;

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
use App\Models\Property;
use App\Models\Propertyimage;
use App\Models\PropertyType;
use App\Models\Thana;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class PropertyController extends Controller
{
    /*
    * Get all Property
    */
    public function index() {
        

        $properties = DB::table('properties')
                    ->leftJoin('property_types','property_types.id','properties.property_type')
                    ->leftJoin('divisions','divisions.id','properties.division_id')
                    ->leftJoin('districts','districts.id','properties.district_id')
                    ->leftJoin('thanas','thanas.id','properties.thana_id')
                    ->select('properties.*','property_types.name as property_type_name','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name')
                    ->get();

        return view("abasvumi.property.index",compact("properties"));
    }

    /**
     * Create new property
     */
    public function create() {
        
        $divisions = Division::all();
        $areas  = Area::all();
        $blocks = Block::all();
        $propertyTypes = PropertyType::all();

        $amenities   = Ameniti::select('id','name')->get();
        $educations  = EducationalInstitute::select('id','name')->get();
        $hospitals   = Hospital::select('id','name')->get();
        $restaurants = Restaurant::select('id','name')->get();
        $parks       = Park::select('id','name')->get();
        $religious   = ReligiousInstitution::select('id','name')->get();
         
        return view("abasvumi.property.create",compact(
            "divisions","areas","blocks","propertyTypes"
            ,"amenities","educations","hospitals","restaurants","parks","religious"
        ));
    }

    /*
    * Property Store
    */
    public function store(Request $request) {
        
        /*$this->validate($request,[
            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
            'property_type_id' => 'required',
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
            'properties_thumbnail'          => 'required',
        ],[
            'division_id.required' => 'Division is required',
            'district_id.required' => 'District is required',
            'thana_id.required'    => 'Thana is required',
            'property_type_id.required' => 'Property Type is  required',
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
        ]);*/
        

        $validators = Validator::make($request->all(),[

            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
            'property_type_id' => 'required',
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
            'approval_status' => 'required',

        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {

            $amenit_ids     = json_encode($request->amenit_ids);
            $education_ids  = json_encode($request->education_ids);
            $hospital_ids   = json_encode($request->hospital_ids);
            $restaurant_ids = json_encode($request->restaurant_ids);
            $park_ids       = json_encode($request->park_ids);
            $religious_ids  = json_encode($request->religious_ids);
            
            $property                         = new Property();
            $property->division_id            = $request->division_id;
            $property->division_id            = $request->division_id;
            $property->district_id            = $request->district_id;
            $property->thana_id               = $request->thana_id;
            $property->title                  = $request->title;
            $property->bn_title               = $request->bn_title;
            $property->property_type_id        = $request->property_type_id;
            $property->area_id                = $request->area_id;
            $property->block_id               = $request->block_id;
            $property->amenities              = $amenit_ids;
            $property->educational_institutes = $education_ids;
            $property->hospitals              = $hospital_ids;
            $property->restaurants            = $restaurant_ids;
            $property->parks                  = $park_ids;
            $property->religious              = $religious_ids;
            $property->title                  = $request->title;
            $property->bn_title               = $request->bn_title;
            $property->description            = $request->description;
            $property->bn_description         = $request->bn_description;
            $property->address                = $request->address;
            $property->lat                    = $request->lat;
            $property->lon                    = $request->lon;
            $property->interest_rate          = $request->interest_rate;
            $property->price                  = $request->price;
            $property->sqft                   = $request->sqft;
            $property->baths                  = $request->baths;
            $property->garage                 = $request->garage;
            $property->balcony                = $request->balcony;
            $property->video_link             = $request->video_link;
            $property->admin_contact_no       = $request->admin_contact_no;
            $property->contact_email          = $request->contact_email;
            $property->contact_no_show        = $request->contact_no_show;
            $property->type                   = $request->type;
            $property->purpose                = $request->purpose;
            $property->status                 = $request->status;

            if($request->properties_thumbnail){
                $file_info = $request->file('properties_thumbnail');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "property_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/properties/';
                $file_info->move($directory, $image_name);
                $property->properties_thumbnail  = $directory . $image_name;
            }

            if($property->save()){
                $propertyimage = new PropertyImage();
                $propertyimage->property_id = $property->id;

                if($request->image_one){
                    $file_info = $request->file('image_one');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_one  = $directory . $image_name;
                }

                $propertyimage->save();
                
                return redirect()->back()->with("success","Property created");
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }


    /**
     * Edit property
     */
    public function edit($id) {

        $property = DB::table('properties')->where('id',$id)->first();
        $propertyAmenities             = json_decode($property->amenities);
        $propertyEducationalInstitutes = json_decode($property->educational_institutes);
        $propertyHospitals             = json_decode($property->hospitals);
        $propertyRestaurants           = json_decode($property->restaurants);
        $propertyParks                 = json_decode($property->parks);
        $propertyReligious             = json_decode($property->religious);
        //return $propertyReligious;
        
        $divisions    = Division::all();
        $districts    = District::where("division_id",$property->division_id)->get();
        $thanas       = Thana::where("district_id",$property->district_id)->get();
        $areas        = Area::all();
        $blocks       = Block::all();
        $propertyTypes = PropertyType::all();

        $amenities    = Ameniti::select('id','name')->get();
        $educations   = EducationalInstitute::select('id','name')->get();
        $hospitals    = Hospital::select('id','name')->get();
        $restaurants  = Restaurant::select('id','name')->get();
        $parks        = Park::select('id','name')->get();
        $religious    = ReligiousInstitution::select('id','name')->get();
        $propertyimage = PropertyImage::where("property_id",$id)->first();

        return view("abasvumi.property.edit",compact(
            "divisions","districts","thanas","propertyAmenities","propertyEducationalInstitutes","propertyHospitals","propertyRestaurants","propertyParks","propertyReligious","areas","blocks","propertyTypes","property"
            ,"amenities","educations","hospitals","restaurants","parks","religious","propertyimage"
        ));
    }

    /*
    * Update property
    */
    public function update (Request $request) {
        //return $request->all();
        $validators = Validator::make($request->all(),[

            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
            'property_type_id' => 'required',
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

        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            
            $amenit_ids     = json_encode($request->amenit_ids);
            $education_ids  = json_encode($request->education_ids);
            $hospital_ids   = json_encode($request->hospital_ids);
            $restaurant_ids = json_encode($request->restaurant_ids);
            $park_ids       = json_encode($request->park_ids);
            $religious_ids  = json_encode($request->religious_ids);
            
            $property                         = Property::where('id',$request->id)->first();
            $property->division_id            = $request->division_id;
            $property->division_id            = $request->division_id;
            $property->district_id            = $request->district_id;
            $property->thana_id               = $request->thana_id;
            $property->title                  = $request->title;
            $property->bn_title               = $request->bn_title;
            $property->property_type_id        = $request->property_type_id;
            $property->area_id                = $request->area_id;
            $property->block_id               = $request->block_id;
            $property->amenities              = $amenit_ids;
            $property->educational_institutes = $education_ids;
            $property->hospitals              = $hospital_ids;
            $property->restaurants            = $restaurant_ids;
            $property->parks                  = $park_ids;
            $property->religious              = $religious_ids;
            $property->title                  = $request->title;
            $property->bn_title               = $request->bn_title;
            $property->description            = $request->description;
            $property->bn_description         = $request->bn_description;
            $property->address                = $request->address;
            $property->lat                    = $request->lat;
            $property->lon                    = $request->lon;
            $property->interest_rate          = $request->interest_rate;
            $property->price                  = $request->price;
            $property->sqft                   = $request->sqft;
            $property->baths                  = $request->baths;
            $property->garage                 = $request->garage;
            $property->balcony                = $request->balcony;
            $property->video_link             = $request->video_link;
            $property->admin_contact_no       = $request->admin_contact_no;
            $property->contact_email          = $request->contact_email;
            $property->contact_no_show        = $request->contact_no_show;
            $property->type                   = $request->type;
            $property->purpose                = $request->purpose;
            $property->status                 = $request->status;

            if($request->properties_thumbnail){

                if($property->properties_thumbnail != null && file_exists($property->properties_thumbnail)){
                    unlink($property->properties_thumbnail);
                }

                $file_info = $request->file('properties_thumbnail');
                $image_ext = strtolower($file_info->getClientOriginalExtension());
                $image_name = "property_" . time() . rand() . "." . $image_ext;                
                $directory  = 'abasvumi/uploads/images/properties/';
                $file_info->move($directory, $image_name);
                $property->properties_thumbnail  = $directory . $image_name;
            }

            if($property->update()){
                $propertyimage = PropertyImage::where("property_id",$property->id)->first();
                if($request->image_one){                    
                    if($propertyimage->image_one != null && file_exists($propertyimage->image_one)){
                        unlink($propertyimage->image_one);
                    }
                    $file_info = $request->file('image_one');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_one  = $directory . $image_name;
                }

                if($request->image_two){                    
                    if($propertyimage->image_two != null && file_exists($propertyimage->image_two)){
                        unlink($propertyimage->image_two);
                    }
                    $file_info = $request->file('image_two');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_two  = $directory . $image_name;
                }

                if($request->image_three){                    
                    if($propertyimage->image_three != null && file_exists($propertyimage->image_three)){
                        unlink($propertyimage->image_three);
                    }
                    $file_info = $request->file('image_three');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_three  = $directory . $image_name;
                }

                if($request->image_four){                    
                    if($propertyimage->image_four != null && file_exists($propertyimage->image_four)){
                        unlink($propertyimage->image_four);
                    }
                    $file_info = $request->file('image_four');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_four  = $directory . $image_name;
                }

                if($request->image_five){                    
                    if($propertyimage->image_five != null && file_exists($propertyimage->image_five)){
                        unlink($propertyimage->image_five);
                    }
                    $file_info = $request->file('image_five');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_five  = $directory . $image_name;
                }

                if($request->image_six){                    
                    if($propertyimage->image_six != null && file_exists($propertyimage->image_six)){
                        unlink($propertyimage->image_six);
                    }
                    $file_info = $request->file('image_six');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_six  = $directory . $image_name;
                }

                if($request->image_seven){                    
                    if($propertyimage->image_seven != null && file_exists($propertyimage->image_seven)){
                        unlink($propertyimage->image_seven);
                    }
                    $file_info = $request->file('image_seven');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_seven  = $directory . $image_name;
                }

                if($request->image_eight){                    
                    if($propertyimage->image_eight != null && file_exists($propertyimage->image_eight)){
                        unlink($propertyimage->image_eight);
                    }
                    $file_info = $request->file('image_eight');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_eight  = $directory . $image_name;
                }

                if($request->image_nine){                    
                    if($propertyimage->image_nine != null && file_exists($propertyimage->image_nine)){
                        unlink($propertyimage->image_nine);
                    }
                    $file_info = $request->file('image_nine');
                    $image_ext = strtolower($file_info->getClientOriginalExtension());
                    $image_name = "property_" . time() . rand() . "." . $image_ext;                
                    $directory  = 'abasvumi/uploads/images/properties/';
                    $file_info->move($directory, $image_name);
                    $propertyimage->image_nine  = $directory . $image_name;
                }
                $propertyimage->update();
                return redirect()->back()->with("success","Property updated");
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

    /*
    * Destroy education
    */
    public function statusChange(Request $request) {
        $property = Property::find($request->id);
        $property->is_featured = $request->is_featured;
        $property->approval_status = $request->approval_status;
        $property->save();
        return $property;
        return response()->json([
            'status'        => 403,
            'data'          => []
        ]);

    }
    public function destroy(Request $request) {
        $property = Property::find($request->id);

        if(($property->image != null) && file_exists($property->image)){
            unlink($property->image);
        }
        $propertyimage = PropertyImage::where("property_id",$property->id)->first();
                       
        if($propertyimage->image_one != null && file_exists($propertyimage->image_one)){
            unlink($propertyimage->image_one);
        }
            
        if($propertyimage->image_two != null && file_exists($propertyimage->image_two)){
            unlink($propertyimage->image_two);
        }
                
        if($propertyimage->image_three != null && file_exists($propertyimage->image_three)){
            unlink($propertyimage->image_three);
        }
        
        if($propertyimage->image_four != null && file_exists($propertyimage->image_four)){
            unlink($propertyimage->image_four);
        }

        if($propertyimage->image_five != null && file_exists($propertyimage->image_five)){
            unlink($propertyimage->image_five);
        }                 
        if($propertyimage->image_six != null && file_exists($propertyimage->image_six)){
            unlink($propertyimage->image_six);
        }                  
        if($propertyimage->image_seven != null && file_exists($propertyimage->image_seven)){
            unlink($propertyimage->image_seven);
        }                  
        if($propertyimage->image_eight != null && file_exists($propertyimage->image_eight)){
            unlink($propertyimage->image_eight);
        }                   
        if($propertyimage->image_nine != null && file_exists($propertyimage->image_nine)){
            unlink($propertyimage->image_nine);
        }
        $property->delete();
        return redirect()->back();
    }
}
