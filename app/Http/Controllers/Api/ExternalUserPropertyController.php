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
use App\Models\Property;
use App\Models\PropertyImage;
use App\Models\PropertyType;
use App\Models\Thana;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
use Image;

class ExternalUserPropertyController extends Controller
{

    public function index() {
        try{
            $query = Property::with('images:property_id,image,image_type_id')->where('external_user_id',auth()->user()->id);            
            $properties = $query->paginate(config('app.perPage'));

        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        

        return response()->json([
            'status_code' => 200,
            'data'        => $properties,
        ]);

    }

    /*
    * Property Store
    */
    public function store(Request $request) {
        $validator = Validator::make($request->all(),[
            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
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
            'property_type'    => 'required',
            'purpose'         => 'required',
        ],[
            'division_id.required' => 'Division is required',
            'district_id.required' => 'District is required',
            'thana_id.required'    => 'Thana is required',
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
            'property_type.required' => 'Property type is required',
            'purpose.required'     => 'Purpose is required',
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
           // DB::beginTransaction();
           // try {
                
                
                $property_id = 'Abasvumi - ID'.rand(100000,999999);
                
                $property                         = new Property();
                $property->property_id            = $property_id;
                $property->external_user_id       = auth()->user()->id;
                $property->division_id            = $request->division_id;
                $property->district_id            = $request->district_id;
                $property->thana_id               = $request->thana_id;
                $property->area_id                = $request->area_id;
                $property->block_id               = $request->block_id;
                $property->amenit_ids             = json_encode($request->amenit_ids) ?? [];
                $property->title                  = $request->title;
                $property->bn_title               = $request->bn_title;
                $property->short_description      = $request->short_description;
                $property->short_description_bn   = $request->short_description_bn;
                $property->description            = $request->description;
                $property->bn_description         = $request->bn_description;
                $property->address                = $request->address;
                $property->address_bn             = $request->address_bn;
                $property->lat                    = $request->lat;
                $property->lon                    = $request->lon;
                $property->interest_rate          = $request->interest_rate;
                $property->price                  = $request->price;
                $property->sqft                   = $request->sqft;
                $property->beds                   = $request->beds;
                $property->baths                  = $request->baths;
                $property->garage                 = $request->garage;
                $property->balcony                = $request->balcony;
                $property->video_link             = $request->video_link;
                $property->contact_no             = $request->contact_no;
                $property->contact_email          = $request->contact_email;
                $property->contact_no_show        = 2;
                $property->property_type          = $request->property_type;
                $property->property_type_main     = $request->property_type_main;
                $property->purpose                = $request->purpose;
                $property->status                 = 0;

                if ($property->save()) {
                    foreach ($request->images as $img) {
                        $property_image = PropertyImage::find($img['id']);
                        $property_image->property_id = $property->id;
                        $property_image->save();
                    }

                    $thum_img = $request->showThumnail;
                    $thumbnail_img = PropertyImage::find($thum_img['id']);
                    $thumbnail_img->property_id = $property->id;
                    $thumbnail_img->save();
                  //  DB::commit();

                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "Property save succcessfully",
                        'data'        => $property
                    ]);
                }

            /*} catch (\Exception $ex) {
                DB::rollBack();

                return response()->json([
                    'success'      => false,
                    'status_code'  => 500,
                    'message'        => $ex,
                ]);
            }*/
        }
        
    }
    public function update(Request $request) {
        $validator = Validator::make($request->all(),[
            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
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
            'property_type'    => 'required',
            'purpose'         => 'required',
        ],[
            'division_id.required' => 'Division is required',
            'district_id.required' => 'District is required',
            'thana_id.required'    => 'Thana is required',
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
            'property_type.required' => 'Property type is required',
            'purpose.required'     => 'Purpose is required',
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
            // try {
             
                $property = Property::find($request->id);
                $property->external_user_id       = auth()->user()->id;
                $property->division_id            = $request->division_id;
                $property->district_id            = $request->district_id;
                $property->thana_id               = $request->thana_id;
                $property->area_id                = $request->area_id;
                $property->block_id               = $request->block_id;
                $property->amenit_ids             = json_encode($request->amenit_ids) ?? [];
                $property->title                  = $request->title;
                $property->bn_title               = $request->bn_title;
                $property->short_description      = $request->short_description;
                $property->short_description_bn   = $request->short_description_bn;
                $property->description            = $request->description;
                $property->bn_description         = $request->bn_description;
                $property->address                = $request->address;
                $property->address_bn             = $request->address_bn;
                $property->lat                    = $request->lat;
                $property->lon                    = $request->lon;
                $property->interest_rate          = $request->interest_rate;
                $property->price                  = $request->price;
                $property->sqft                   = $request->sqft;
                $property->beds                   = $request->beds;
                $property->baths                  = $request->baths;
                $property->garage                 = $request->garage;
                $property->balcony                = $request->balcony;
                $property->video_link             = $request->video_link;
                $property->contact_no             = $request->contact_no;
                $property->contact_email          = $request->contact_email;
                $property->contact_no_show        = 2;
                $property->property_type          = $request->property_type;
				$property->property_type_main     = $request->property_type_main;
                $property->purpose                = $request->purpose;
                $property->status                 = 0;

                //PropertyImage::where('property_id',$property->id)->delete();

                if ($property->update()) {
                    foreach ($request->images as $img) {
                        $property_image = PropertyImage::find($img['id']);
                        $property_image->property_id = $property->id;
                        $property_image->save();
                    }

                    $thum_img = $request->showThumnail;
                    $thumbnail_img = PropertyImage::find($thum_img['id']);
                    $thumbnail_img->property_id = $property->id;
                    $thumbnail_img->save();
                    // DB::commit();

                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "Property update succcessfully",
                        'data'        => $property
                    ]);
                }

            // } catch (\Exception $ex) {
            //     DB::rollBack();

            //     return response()->json([
            //         'success'      => false,
            //         'status_code'  => 500,
            //         'message'        => $ex,
            //     ]);
            // }
        }
        
    }
  

    public function uploadThumnail (Request $request) {

        $property_image = new Propertyimage();
        $property_image->property_id = 0;
        $property_image->external_user_id = auth()->user()->id;
        $property_image->image_type_id = 1;

        $image_ext = strtolower($request->image->getClientOriginalExtension());
        $image_name = "abasvumi/uploads/properties/property_" . time() . rand() . "." . $image_ext;   
        $img = Image::make($request->file('image')->getRealPath());
        $img->resize(760, 486);
        $img->insert('ab.png', 'center');
        $img->save($image_name);
        $property_image->image  = $image_name;
        $property_image->save();
        

        return response()->json([
            'success'   => true,
            'status_code' => 200,
            'message' => "Property save succcessfully",
            'data'        => $property_image
        ]);
        
    }
    public function uploadProImg (Request $request) {

        $property_image = new PropertyImage();
        $property_image->property_id = 0;
        $property_image->external_user_id = auth()->user()->id;
        $property_image->image_type_id = 2;

        $image_ext = strtolower($request->image->getClientOriginalExtension());
        $image_name = "abasvumi/uploads/properties/property_" . time() . rand() . "." . $image_ext;   
        $img = Image::make($request->file('image')->getRealPath());
        $img->resize(760, 486);
        $img->insert('ab.png', 'center');
        $img->save($image_name);
        $property_image->image  = $image_name;
        $property_image->save();

        return response()->json([
            'success'   => true,
            'status_code' => 200,
            'message' => "Property save succcessfully",
            'data'        => $property_image
        ]);
        
    }
    public function imageRemove (Request $request) {

       
            $img_id = $request->image_id;
            $propertyImage = PropertyImage::find($img_id);

            // if($propertyImage->image != null && file_exists($propertyImage->image)){
            //     unlink($propertyImage->image);
            // }

            $propertyImage->delete();

            return response()->json([
                'success'   => true,
                'status_code' => 200,
                'message' => "Property image remove succcessfully",
                'data'        => []
            ]);
       
       
        
    }

    public function view($id) {
        try{
            $property = Property::with('images:id,property_id,image,image_type_id')->where('id',$id)->first();


        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }

        return response()->json([
            'status_code' => 200,
            'property'    => $property,
        ]);
    }

       /**
     * Property edit
     */

    public function edit($id) {
        try{
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
            $property_image = PropertyImage::where("property_id",$id)->first();

        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }

        return response()->json([
            'status_code' => 200,
            'property'    => $property,
            'divisions'        => $divisions,
            'districts'        => $districts,
            'thanas'        => $thanas,
            'propertyAmenities'        => $propertyAmenities,
            'propertyEduInstitutes'    => $propertyEducationalInstitutes,
            'propertyhospitals'    => $propertyHospitals,
            'propertyRestaurants'    => $propertyRestaurants,
            'propertyParks'    => $propertyParks,
            'propertyReligious'    => $propertyReligious,
            'areas'    => $areas,
            'blocks'    => $blocks,
            'propertyTypes'    => $propertyTypes,
            'amenities'    => $amenities,
            'educations'    => $educations,
            'hospitals'    => $hospitals,
            'restaurants'    => $restaurants,
            'parks'    => $parks,
            'religious'    => $religious,
            'property_image'    => $property_image,
        ]);
    }



}
