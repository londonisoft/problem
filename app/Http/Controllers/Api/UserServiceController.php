<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AllService;
use Validator;
use DB;
use Image;

class UserServiceController extends Controller
{
    public function index() {
        try{
            $query = AllService::select('all_services.*','service_categories.name as service_category_name','service_categories.name_bn as service_category_name_bn');
            $query->leftJoin('service_categories', 'all_services.service_category_id', '=', 'service_categories.id')->where('external_user_id',auth()->user()->id);       
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
    * AllService Store
    */
    public function store(Request $request) {
        $validator = Validator::make($request->all(),[
            'name'     => 'required',
            'name_bn'     => 'required',
            'description'     => 'required',
            'description_bn'     => 'required',
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
                
                $service                         = new AllService();
                $service->external_user_id       = auth()->user()->id;
                $service->name                   = $request->name;
                $service->name_bn                = $request->name_bn;
                $service->description            = $request->description;
                $service->description_bn         = $request->description_bn;
                $service->image                  = '';
                $service->service_category_id    = $request->service_category_id;
                $service->status                 = 0;

                if ($service->save()) {
                    
                    $image_ext = strtolower($request->file('image')->getClientOriginalExtension());
                    $image_name = "abasvumi/uploads/services/service_" . time() . rand() . "." . $image_ext;   
                    $img = Image::make($request->file('image')->getRealPath());
                    $img->insert('ab.png', 'center');
                    $img->save($image_name);
                    $service->image  = $image_name;
                    $service->update();

                    DB::commit();

                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "AllService save succcessfully",
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

       /**
     * AllService edit
     */

    public function edit(Request $request) {
        try{
            $service = DB::table('all_services')->where('id', $request->id)->first();

            return response()->json([
                'success'   => true,
                'status_code'   => 200,
                'message'  => 'Data found found.',
                'data'    => $service,
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
    * Update service
    */
    public function update (Request $request) {
        $validator = Validator::make($request->all(),[
            'name'     => 'required',
            'name_bn'     => 'required',
            'description'     => 'required',
            'description_bn'     => 'required',
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
            DB::beginTransaction();
            try {
                $service                         = AllService::find($request->id);
                if ($service) {
                    $service->name                   = $request->name;
                    $service->name_bn                = $request->name_bn;
                    $service->service_category_id            = $request->service_category_id;
                    $service->description            = $request->description;
                    $service->description_bn         = $request->description_bn;
                    $service->save();
                        
                    if ($file_info = $request->file('image')) {

                        if($service->image != null && file_exists($service->image)){
                            unlink($service->image);
                        }

                        $image_ext = strtolower($file_info->getClientOriginalExtension());
                        $image_name = "abasvumi/uploads/services/service_" . time() . rand() . "." . $image_ext;   
                        $img = Image::make($request->file('image')->getRealPath());
                        $img->insert('ab.png', 'center');
                        $img->save($image_name);
                        $service->image  = $image_name;
                        $service->update();
                    }
                   

                    DB::commit();


                    return response()->json([
                        'success'   => true,
                        'status_code' => 200,
                        'message' => "AllService update succcessfully",
                        'data'        => $service
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
            $service = AllService::find($request->id);
            
            if ($service) {
                if($service->image != null && file_exists($service->image)){
                    unlink($service->image);
                }

                $service->delete();
                return response()->json([
                    'success'   => true,
                    'status_code' => 200,
                    'message' => "AllService update succcessfully",
                    'data'        => $all_services
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