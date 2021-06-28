<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\RealEstate;
use DB;

class RealEstateController extends Controller
{

	public function index(Request $request) {
        try{
            $query = RealEstate::select('id','price','title','bn_title','district_id','division_id','thana_id','address_bn','address','area','created_at')->with('images:real_estate_id,image,image_type_id');
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
            
			// $area = explode(',', $request->area_id);
			// foreach($area as $key => $element) {
			// 	if($key == 0) {
			// 		$query->where('area_id', 'like', '%'.$element.'%');
			// 	} else {
			// 		$query->orWhere('area_id', 'like', '%'.$element.'%');
			// 	}
			//  }

            if ($request->area) {
                $area = explode(',', $request->area);
                $from = $area[0];
                $to = $area[1];
				if ($from || $to) {
                	$query->whereBetween('sqft', [$from, $to]);
				}
            }
            if ($request->price) {
                $price = explode(',', $request->price);
                $from = $price[0];
                $to = $price[1];
				if ($from || $to) {
					$query->whereBetween('price', [$from, $to]);
				}
            }
            if ($request->baths) {
                $query->where('baths', $request->baths);
            }
            if ($request->division_id) {
                $query->where('division_id', $request->division_id);
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
