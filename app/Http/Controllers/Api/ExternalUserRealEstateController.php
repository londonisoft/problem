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
use App\Models\RealEstate;
use App\Models\RealEstateImage;
use App\Models\RealEstateType;
use App\Models\Thana;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;
use Image;

class ExternalUserRealEstateController extends Controller
{

    public function index() {
        try{
            $query = RealEstate::with('images:real_estate_id,image,image_type_id')->with('details')->where('external_user_id',auth()->user()->id);            
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

    
    public function store(Request $request) {
        $validator = Validator::make($request->all(),[
            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
            'title'           => 'required',
            'bn_title'        => 'required',
            'description'     => 'required',
            'bn_description'  => 'required',
            'address'         => 'required',
            'lat'             => 'required',
            'lon'             => 'required',
            'price'           => 'required',
            'area'            => 'required',
            'property_type'    => 'required'
        ],[
            'division_id.required' => 'Division is required',
            'district_id.required' => 'District is required',
            'thana_id.required'    => 'Thana is required',
            'title.required'       => 'Title is required',
            'bn_title.required'    => 'Bangla title is required',
            'description.required' => 'Description is required',
            'bn_description.required' => 'Bangla description is required',
            'address.required'     => 'Address is required',
            'lat.required'         => 'Lat is required',
            'lon.required'         => 'Lon is required',
            'price.required'       => 'price is required',
            'area.required'        => 'Area is required',
            'property_type.required' => 'RealEstate type is required'
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
            DB::beginTransaction();
            try {
                
                
                $property_id = 'Abasvumi - ID'.rand(100000,999999);
                
                $property                         = new RealEstate();
                $property->property_id            = $property_id;
                $property->external_user_id       = auth()->user()->id;
                $property->division_id            = $request->division_id;
                $property->district_id            = $request->district_id;
                $property->thana_id               = $request->thana_id;
                $property->amenit_ids             = json_encode($request->amenit_ids) ?? [];
                $property->title                  = $request->title;
                $property->bn_title               = $request->bn_title;
                $property->description            = $request->description;
                $property->bn_description         = $request->bn_description;
                $property->address                = $request->address;
				$property->total_unit            = $request->total_unit;
                $property->address_bn             = $request->address_bn;
                $property->lat                    = $request->lat;
                $property->lon                    = $request->lon;
                $property->price                  = $request->price;
                $property->area                   = $request->area;
                $property->contact_no             = $request->contact_no;
                $property->contact_email          = $request->contact_email;
                $property->contact_no_show        = 2;
                $property->property_type          = $request->property_type;
                $property->property_type_main     = $request->property_type_main;
                $property->status                 = 0;

                if ($property->save()) {

					foreach ($request->details as $detail) {
                        $type = new RealEstateType();
                        $type->real_estate_id = $property->id;
                        $type->external_user_id = auth()->user()->id;
                        $type->beds = $detail['beds'];
                        $type->price = $detail['price'];
                        $type->total_unit = $detail['total_unit'];
                        $type->area = $detail['area'];
                        $type->status = 1;
                        $type->save();
                    }
				
                    foreach ($request->images as $img) {
                        $property_image = RealEstateImage::find($img['id']);
                        $property_image->real_estate_id = $property->id;
                        $property_image->save();
                    }

                    $thum_img = $request->showThumnail;
                    $thumbnail_img = RealEstateImage::find($thum_img['id']);
                    $thumbnail_img->real_estate_id = $property->id;
                    $thumbnail_img->save();
                    DB::commit();

                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "RealEstate save succcessfully",
                        'data'        => $property
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
    public function update(Request $request) {
        $validator = Validator::make($request->all(),[
            'division_id'     => 'required',
            'district_id'     => 'required',
            'thana_id'        => 'required',
            'title'           => 'required',
            'bn_title'        => 'required',
            'description'     => 'required',
            'bn_description'  => 'required',
            'address'         => 'required',
            'lat'             => 'required',
            'lon'             => 'required',
            'price'           => 'required',
            'area'            => 'required',
            'property_type'    => 'required'
        ],[
            'division_id.required' => 'Division is required',
            'district_id.required' => 'District is required',
            'thana_id.required'    => 'Thana is required',
            'title.required'       => 'Title is required',
            'bn_title.required'    => 'Bangla title is required',
            'description.required' => 'Description is required',
            'bn_description.required' => 'Bangla description is required',
            'address.required'     => 'Address is required',
            'lat.required'         => 'Lat is required',
            'lon.required'         => 'Lon is required',
            'price.required'       => 'price is required',
            'area.required'        => 'Area is required',
            'property_type.required' => 'RealEstate type is required'
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
             try {
				DB::beginTransaction();

                $property = RealEstate::find($request->id);
                $property->external_user_id       = auth()->user()->id;
                $property->division_id            = $request->division_id;
                $property->district_id            = $request->district_id;
                $property->thana_id               = $request->thana_id;
                $property->amenit_ids             = json_encode($request->amenit_ids) ?? [];
                $property->title                  = $request->title;
                $property->bn_title               = $request->bn_title;
                $property->description            = $request->description;
                $property->total_unit            = $request->total_unit;
                $property->bn_description         = $request->bn_description;
                $property->address                = $request->address;
                $property->address_bn             = $request->address_bn;
                $property->lat                    = $request->lat;
                $property->lon                    = $request->lon;
                $property->price                  = $request->price;
                $property->area                   = $request->area;
                $property->contact_no             = $request->contact_no;
                $property->contact_email          = $request->contact_email;
                $property->contact_no_show        = 2;
                $property->property_type          = $request->property_type;
				$property->property_type_main     = $request->property_type_main;
                $property->status                 = 0;


                if ($property->update()) {

                	RealEstateType::where('real_estate_id',$property->id)->delete();

					foreach ($request->details as $detail) {
                        $type = new RealEstateType();
                        $type->real_estate_id = $property->id;
                        $type->external_user_id = auth()->user()->id;
                        $type->beds = $detail['beds'];
                        $type->price = $detail['price'];
                        $type->total_unit = $detail['total_unit'];
                        $type->area = $detail['area'];
                        $type->status = 1;
                        $type->save();
                    }

                    foreach ($request->images as $img) {
                        $property_image = RealEstateImage::find($img['id']);
                        $property_image->real_estate_id = $property->id;
                        $property_image->save();
                    }

                    $thum_img = $request->showThumnail;
                    $thumbnail_img = RealEstateImage::find($thum_img['id']);
                    $thumbnail_img->real_estate_id = $property->id;
                    $thumbnail_img->save();
                    DB::commit();

                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "RealEstate update succcessfully",
                        'data'        => $property
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

        $property_image = new RealEstateImage();
        $property_image->real_estate_id = 0;
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
            'message' => "RealEstate save succcessfully",
            'data'        => $property_image
        ]);
        
    }
    public function uploadProImg (Request $request) {

        $property_image = new RealEstateImage();
        $property_image->real_estate_id = 0;
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
            'message' => "RealEstate save succcessfully",
            'data'        => $property_image
        ]);
        
    }
    public function imageRemove (Request $request) {

       
            $img_id = $request->image_id;
            $propertyImage = RealEstateImage::find($img_id);

            // if($propertyImage->image != null && file_exists($propertyImage->image)){
            //     unlink($propertyImage->image);
            // }

            $propertyImage->delete();

            return response()->json([
                'success'   => true,
                'status_code' => 200,
                'message' => "RealEstate image remove succcessfully",
                'data'        => []
            ]);
       
       
        
    }

	public function view($id) {
        try{
            $property = RealEstate::with('images:id,real_estate_id,image,image_type_id')->with('details')->where('id',$id)->first();


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

}
