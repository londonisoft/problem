<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ExternalUser;
use App\Models\Property;

use DB;
class ExternalUserController extends Controller
{
    public function agents(Request $request) {
        try{
            $query =DB::table('external_users')->select("*");
            
            if ($request->name) {
                $query->where('name', 'like', '%' .$request->name. '%');
            }

            if ($request->phone) {
                $query->where('phone', 'like', '%' .$request->phone. '%');
            }

            $query->where('user_type', 1);
            
            if ($request->shortOrder) {
                $query->orderBy('id', $request->shortOrder);
            }

            $data = $query->paginate(config('app.perPage'));
            
        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
        return response()->json([
            'status_code' => 200,
            'data'        => $data,
        ]);

    }
    public function developers(Request $request) {
        try{
            $query =DB::table('external_users')->select("*");
            
            if ($request->name) {
                $query->where('name', 'like', '%' .$request->name. '%');
            }

            if ($request->phone) {
                $query->where('phone', 'like', '%' .$request->phone. '%');
            }

            $query->where('user_type', 2);
            
            if ($request->shortOrder) {
                $query->orderBy('id', $request->shortOrder);
            }

            $data = $query->paginate(config('app.perPage'));
            
        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
        return response()->json([
            'status_code' => 200,
            'data'        => $data,
        ]);

    }
    public function suppliers(Request $request) {
        try{
            $query =DB::table('external_users')->select("*");
            
            if ($request->name) {
                $query->where('name', 'like', '%' .$request->name. '%');
            }

            if ($request->phone) {
                $query->where('phone', 'like', '%' .$request->phone. '%');
            }

            $query->where('user_type', 3);
            
            if ($request->shortOrder) {
                $query->orderBy('id', $request->shortOrder);
            }

            $data = $query->paginate(config('app.perPage'));
            
        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
        return response()->json([
            'status_code' => 200,
            'data'        => $data,
        ]);

    }
    public function developerView($id) {
        try{
            $externalUser = ExternalUser::find($id);


        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }

        return response()->json([
            'status_code' => 200,
            'data'    => $externalUser,
        ]);
    }
    public function developerProperty($id) {
        try{
            $query = Property::with('images:property_id,image,image_type_id');            
            $properties = $query->where('external_user_id', $id)->orderBy('id', 'desc')->take(2)->get();

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
    public function favorite (Request $request) {
        $query = Property::with('images:property_id,image,image_type_id');            
        $query->whereIn('id',$request->id);
        $properties = $query->get();

        return response()->json([
            'status_code' => 200,
            'data'        => $properties,
        ]);
    }
}
