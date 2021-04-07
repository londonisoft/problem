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
use App\Models\Property;
use App\Models\ReligiousInstitution;
use App\Models\Restaurant;
use App\Models\Serviceimage;
use App\Models\PopularPlace;
use App\Models\ServiceType;
use App\Models\Thana;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PropertyController extends Controller
{
    /**
     * sortBy:
     * 1 = New to Old
     * 2 = Old to New
     * 3 = Price High to Low
     * 4 = Price Low to High
     */
    public function index(Request $request) {
        try{
            $query = Property::select('id','price','title','bn_title','district_id','division_id','thana_id','garage','balcony','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id');
//                    ->leftJoin('service_types','service_types.id','services.service_type_id')
//                    ->leftJoin('divisions','divisions.id','services.division_id')
//                    ->leftJoin('districts','districts.id','services.district_id')
//                    ->leftJoin('thanas', 'thanas.id','services.thana_id')
//                    ->select('services.*','service_types.name as service_type_name','divisions.name as division_name','districts.name as district_name','thanas.name as thana_name');

            if ($request->filled('sortBy')) {
                if ($request->sortBy == 1) {
                    $query->orderBy('created_at', 'desc');
                }
                if ($request->sortBy == 2) {
                    $query->orderBy('created_at', 'asc');
                }
                if ($request->sortBy == 3) {
                    $query->orderBy('price', 'desc');
                }
                if ($request->sortBy == 3) {
                    $query->orderBy('price', 'asc');
                }
            } else {
                $query->orderBy('created_at', 'desc');
            }

            if ($request->advanced) {
                $query->where('advanced', $request->advanced);
            }
            if ($request->area) {
                $area = explode(',', $request->area);
                $from = $area[0];
                $to = $area[1];

                $query->whereBetween('sqft', [$from, $to]);
            }
            if ($request->price) {
                $price = explode(',', $request->price);
                $from = $price[0];
                $to = $price[1];

                $query->whereBetween('price', [$from, $to]);
            }
            if ($request->baths) {
                $query->where('baths', $request->baths);
            }
            if ($request->beds) {
                $query->where('beds', $request->beds);
            }
            if ($request->keywords) {
                $query->where('title', 'like', '%' . $request->keywords . '%')
                    ->orWhere('bn_title', 'like', '%' . $request->keywords . '%')
                    ->orWhere('description', 'like', '%' . $request->keywords . '%')
                    ->orWhere('bn_description', 'like', '%' . $request->keywords . '%')
                    ->orWhere('address', 'like', '%' . $request->keywords . '%');
            }
            if ($request->location) {
                $query->where('location', $request->location);
            }
            if ($request->propertyType) {
                $query->where('property_type', $request->propertyType);
            }
            if ($request->purpose) {
                $query->where('purpose', $request->purpose);
            }
            /* if ($request->priceFrom && $request->priceTo) {
                $query->whereBetween('price', [$request->priceFrom, $request->priceTo]);
            }
            if ($request->areaFrom && $request->areaTo) {
                $query->whereBetween('area', [$request->areaFrom, $request->areaTo]);
            } */

            $services = $query->paginate(config('app.perPage'));

        }catch (\Exception $error) {
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

    public function view($id) {
        try{
            $property = Property::with('images:property_id,image,image_type_id')->where('id',$id)->first();

//            $propertyAmenities             = json_decode($property->amenities);
//            $propertyEducationalInstitutes = json_decode($property->educational_institutes);
//            $propertyHospitals             = json_decode($property->hospitals);
//            $propertyRestaurants           = json_decode($property->restaurants);
//            $propertyParks                 = json_decode($property->parks);
//            $propertyReligious             = json_decode($property->religious);
            //return $propertyReligious;

            $divisions    = Division::all();
            $districts    = District::where("division_id",$property->division_id)->get();
            $thanas       = Thana::where("district_id",$property->district_id)->get();
            $areas        = Area::all();
            $blocks       = Block::all();
            $propertyTypes = ServiceType::all();

            $amenities    = Ameniti::select('id','name')->get();
            $educations   = EducationalInstitute::select('id','name')->get();
            $hospitals    = Hospital::select('id','name')->get();
            $restaurants  = Restaurant::select('id','name')->get();
            $parks        = Park::select('id','name')->get();
            $religious    = ReligiousInstitution::select('id','name')->get();

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
            'divisions'   => $divisions,
            'districts'   => $districts,
            'thanas'      => $thanas,
//            'serviceAmenities'        => $propertyAmenities,
//            'serviceEduInstitutes'    => $propertyEducationalInstitutes,
//            'servicehospitals'    => $propertyHospitals,
//            'serviceRestaurants'    => $propertyRestaurants,
//            'serviceParks'    => $propertyParks,
//            'serviceReligious'    => $propertyReligious,
            'areas'         => $areas,
            'blocks'        => $blocks,
            'serviceTypes'  => $propertyTypes,
            'amenities'     => $amenities,
            'educations'    => $educations,
            'hospitals'     => $hospitals,
            'restaurants'   => $restaurants,
            'parks'         => $parks,
            'religious'     => $religious
        ]);
    }

    public function propertyByStatus(Request $request)
    {
        $status = $request->status;
        $category = $request->category;
        if ($status == 'featured') {
            $query = Property::select('id','price','price','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id')->orderBy('id', 'desc');
            $services = $query->take(4)->get();
            return response()->json([
                'status_code' => 200,
                'data'        => $services,
            ]);
        }
    }
    public function propertyByStatusCategory(Request $request)
    {
        $status = $request->status;
        $category = $request->category;
        if ($status == 'featured') {
            $query = Property::select('id','price','price','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id')->orderBy('id', 'desc');
            $services = $query->take(4)->get();
            return response()->json([
                'status_code' => 200,
                'data'        => $services,
            ]);
        }
        if ($status == 'latest') {
            if ($category === 'sale') {
                $query = Property::select('id','price','price','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id')->where('purpose', 1)->orderBy('id', 'desc');
            } elseif ($category === 'rent') {
                $query = Property::select('id','price','price','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id')->where('purpose', 2)->orderBy('id', 'desc');
            } else {
                $query = Property::select('id','price','price','address_bn','address','beds','baths','sqft','created_at')->with('images:property_id,image,image_type_id')->orderBy('id', 'desc');
            }
            
            $services = $query->take(10)->get();
            return response()->json([
                'status_code' => 200,
                'data'        => $services,
            ]);
        }
    }
    public function popularPlace()
    {
        $popular_place = PopularPlace::get();
        return response()->json([
            'status_code' => 200,
            'data'        => $popular_place,
        ]);    
        
    }
    public function homeAgent()
    {
        $data =DB::table('external_users')->select("*")->where('user_type', 2)->take(5)->get();
        return response()->json([
            'status_code' => 200,
            'data'        => $data,
        ]);    
        
    }
    public function homeTestimonial()
    {
        $data =DB::table('testimonials')->select("*")->take(10)->get();
        return response()->json([
            'status_code' => 200,
            'data'        => $data,
        ]);    
        
    }
    public function homeBrand()
    {
        $data =DB::table('brands')->select("*")->take(10)->get();
        return response()->json([
            'status_code' => 200,
            'data'        => $data,
        ]);    
        
    }
}
