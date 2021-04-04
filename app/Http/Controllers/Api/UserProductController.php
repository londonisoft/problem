<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use Validator;
use DB;
use Image;
class UserProductController extends Controller
{
    public function index() {
        try{
            $query = Product::select('products.*','product_categories.name as category_name','product_categories.name_bn as category_name_bn');
            $query->leftJoin('product_categories', 'products.product_category_id', '=', 'product_categories.id')->where('external_user_id',auth()->user()->id);       
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
    * Product Store
    */
    public function store(Request $request) {
        $validator = Validator::make($request->all(),[
            'name'     => 'required',
            'name_bn'     => 'required',
            'description'     => 'required',
            'description_bn'     => 'required',
            'unit_id'     => 'required',
            'price'     => 'required',
            'product_category_id'     => 'required',
            'image'     => 'required'
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
            DB::beginTransaction();
            try {
                
                $product                         = new Product();
                $product->external_user_id       = auth()->user()->id;
                $product->product_category_id    = $request->product_category_id;
                $product->unit_id                = $request->unit_id ;
                $product->name                   = $request->name;
                $product->name_bn                = $request->name_bn;
                $product->description            = $request->description;
                $product->description_bn         = $request->description_bn;
                $product->price                  = $request->price;
                $product->image                  = '';
                $product->status                 = 0;

                if ($product->save()) {
                    
                    $image_ext = strtolower($request->file('image')->getClientOriginalExtension());
                    $image_name = "abasvumi/uploads/products/product_" . time() . rand() . "." . $image_ext;   
                    $img = Image::make($request->file('image')->getRealPath());
                    $img->insert('ab.png', 'center');
                    $img->save($image_name);
                    $product->image  = $image_name;
                    $product->update();

                    DB::commit();

                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "Product save succcessfully",
                        'data'        => $product
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

    public function view($id) {
        try{
            $product = DB::table('properties')->where('id',$id)->first();

            return response()->json([
                'success'   => true,
                'status_code' => 200,
                'message' => "Product found success",
                'data'        => $product
            ]);
        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }

        return response()->json([
            'status_code' => 200,
            'product'    => $product,
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

       /**
     * Product edit
     */

    public function edit(Request $request) {
        try{
            $product = DB::table('products')->where('id', $request->id)->first();

            return response()->json([
                'success'   => true,
                'status_code'   => 200,
                'message'  => 'Data found found.',
                'data'    => $product,
            ]);

        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
    }

    /*
    * Update product
    */
    public function update (Request $request) {
        $validator = Validator::make($request->all(),[
            'name'     => 'required',
            'name_bn'     => 'required',
            'description'     => 'required',
            'description_bn'     => 'required',
            'unit_id'     => 'required',
            'price'     => 'required',
            'product_category_id'     => 'required',
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
            DB::beginTransaction();
            try {
                $product                         = Product::find($request->id);
                if ($product) {
                    $product->product_category_id    = $request->product_category_id;
                    $product->unit_id                = $request->unit_id ;
                    $product->name                   = $request->name;
                    $product->name_bn                = $request->name_bn;
                    $product->description            = $request->description;
                    $product->description_bn         = $request->description_bn;
                    $product->price                  = $request->price;
                    $product->save();
                        
                    if ($file_info = $request->file('image')) {
                        if($product->image != null && file_exists($product->image)){
                            unlink($product->image);
                        }
                        
                        $image_ext = strtolower($file_info->getClientOriginalExtension());
                        $image_name = "abasvumi/uploads/products/product_" . time() . rand() . "." . $image_ext;   
                        $img = Image::make($request->file('image')->getRealPath());
                        $img->insert('ab.png', 'center');
                        $img->save($image_name);
                        $product->image  = $image_name;
                        $product->update();
                    }

                    DB::commit();

                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "Product update succcessfully",
                        'data'        => $product
                    ]);
                    
                } else {
                    return response()->json([
                        'success'      => false,
                        'status_code'  => 500,
                        'message'        => 'Data not found',
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
    public function delete (Request $request) {
        try {
            $product = Product::find($request->id);
            $query = Product::select('products.*','product_categories.name as category_name','product_categories.name_bn as category_name_bn');
            $query->leftJoin('product_categories', 'products.product_category_id', '=', 'product_categories.id');       
            $products = $query->paginate(config('app.perPage'));
            
            if ($product) {
                if($product->image != null && file_exists($product->image)){
                    unlink($product->image);
                }
                $product->delete();
                return response()->json([
                    'success'   => true,
                    'status_code' => 200,
                    'message' => "Product update succcessfully",
                    'data'        => $products
                ]);
            } else {
                return response()->json([
                    'success'      => false,
                    'status_code'  => 500,
                    'message'        => 'Data not found',
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
