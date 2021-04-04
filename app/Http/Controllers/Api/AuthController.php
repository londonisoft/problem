<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ExternalUser;
use App\Lib\SmsApi;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Validator;

class AuthController extends Controller
{

    /**
     * ExternalUser register
     */
    public function ExternalUserRegister(Request $request){

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|unique:external_users',
            'phone' => 'required|unique:external_users',
            'password' => 'required',
            'user_type' => 'required',
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
            $code = rand(100000, 999999);

            $ExternalUser                     = new ExternalUser();
            $ExternalUser->name        = $request->name;
            $ExternalUser->email       = $request->email;
            $ExternalUser->phone       = $request->phone;
            $ExternalUser->user_type   = $request->user_type;
            $ExternalUser->otp         = $code;
            $ExternalUser->password    = bcrypt($request->password);

            if($ExternalUser->save()){
                $tokenResult = $ExternalUser->createToken($ExternalUser->name)->plainTextToken;
                $array['message'] = "Abasvumi verification code ".$code.'.';
                $array['mobile'] = $request->phone;
                SmsApi::send($array);
                return response()->json([
                    'success' => true,
                    'status_code' => 200,
                    'id' => $ExternalUser->id,
                ]);
            }else{
                return response()->json([
                    'success' => false,
                    'status_code' => 403,
                    'id' => '',
                ]);
            }        
        }
    }

    /**
     * ExternalUser login
     */
    public function ExternalUserLogin(Request $request)
    {
        try {
            $request->validate([
                'phone' => 'required',
                'password' => 'required'
            ]);
            

            $ExternalUser = ExternalUser::where('phone', $request->phone)->first();

            // if ($ExternalUser) {
            //     if ($ExternalUser->status === 0) {
            //         return response()->json([
            //             'success'      => false,
            //             'status_code'   => 419,
            //             'message'       => 'Your acount not active.'
            //         ]);
            //     }
            // } else {
            //     return response()->json([
            //         'success'      => false,
            //         'status_code'   => 404,
            //         'message'       => 'Invalid phone or password.'
            //     ]);
            // }

            


            $credentials = request(['phone','password']);
            if (!Auth::guard('externalUsers')->attempt($credentials)) {
                return response()->json([
                    'success'      => false,
                    'status_code'   => 500,
                    'message'       => 'Invalid phone or password.'
                ]);
            }


            if ( ! Hash::check($request->password, $ExternalUser->password, [])) {
                throw new \Exception('Error in Login');
            }

            $tokenResult = $ExternalUser->createToken('admin')->plainTextToken;

            return response()->json([
                'success'      => true,
                'status_code'   => 200,
                'access_token'  => $tokenResult,
                'token_type'    => 'Bearer',
            ]);

        } catch (Exception $error) {
            return response()->json([
                'success'      => false,
                'status_code'  => 500,
                'error'        => $error,
                'message'      => 'Error in Login',
            ]);
        }
    }

    /**
     * ExternalUser Logout
     */
    public function ExternalUserLogout(Request $request){
        $this->guard('ExternalUser')->logout();

        return response()->json(['message' => 'Successfully logged out']);

        /*$request->user()->currentAccessToken()->delete();
        return response()->json([
            'status_code'   => 200,
            'message'       => 'Logout successfully',
        ]);*/
    }
    
    /**
     * ExternalUser profile edit.
    */
    public function ExternalUserProfileEdit() {
        
        try{
            
            $ExternalUser = Auth::user();
            
            if(empty($ExternalUser)){
                return response([
                    'success' => false,
                    'message' => 'Data not found.'
                ]);
            }

        }catch (Exception $error) {
            return response()->json([
                'success'   => false,
                'status_code'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }   
                        
        return response()->json([
            'success'   => true,
            'status_code' => 200,
            'data'        => $ExternalUser,
        ]);

    }

    /**
     * ExternalUser update.
    */
    public function ExternalUserProfileUpdate(Request $request) {
        
        $request->validate([
            'name' => 'required',
            'email' => 'required',
        ],[
            "name.required"  => "Name is required",
            "email.required" => "Email is required",
        ]);
        
        try{

            //$ExternalUser               = ExternalUser::find(Auth::guard("ExternalUser")->user()->id);
            $ExternalUser         = ExternalUser::find($request->id);
            $ExternalUser->name   = $request->name;
            $ExternalUser->email  = $request->email;
            $ExternalUser->name_bn  = $request->name_bn;
            $ExternalUser->address  = $request->address;
            $ExternalUser->address_bn  = $request->address_bn;
            $ExternalUser->facebook_link  = $request->facebook_link;
            $ExternalUser->twitter_link  = $request->twitter_link;
            $ExternalUser->linkedin_link  = $request->linkedin_link;
            $ExternalUser->biography  = $request->biography;
            $ExternalUser->biography_bn  = $request->biography_bn;
            
            if($request->image){
                if($ExternalUser->image != null && file_exists($ExternalUser->image)){
                    unlink($ExternalUser->image);
                }
                $image          = $request->file('image');
                $image_name     = time().".".$image->getClientOriginalExtension();
                $directory      = 'abasvumi/uploads/images/ExternalUser/';
                $image->move($directory, $image_name);
                $image_url      = $directory.$image_name;
                $ExternalUser->image   = $image_url;
            }

            if($ExternalUser->update()){
                return response()->json([
                    'success'   => true,
                    'message'  => 'Profile update success.',
                    'data'    => $ExternalUser
                ]);
            }

        }catch (Exception $error) {
            return response()->json([
                'success'   => false,
                'message'  => 'Data not found.',
                'errors'    => $error->getMessage(),
            ]);
        }
        
    }

    
    /**
     * Update ExternalUser password.
    */
    
    public function ExternalUserPasswordUpdate(Request $request) {

        $this->validate($request, [
            'old_password'          => 'required',
            'password'              => 'required|confirmed',
            'password_confirmation' => 'required',
        ],[
            "old_password.required"           => "Old password is required",
            "password.required"               => "Password is required",
            "password_confirmation.required"  => "Confirm password required",
            "password_confirmation.confirmed" => "New and confirm password not match",
        ]);
        
        try {

            //$ExternalUser = ExternalUser::find("id",Auth::guard("ExternalUser")->user()->id);
            $ExternalUser = ExternalUser::find($request->id);

            if(Hash::check(trim(strip_tags($request->old_password)), $ExternalUser->password)) {
                $ExternalUser->password = bcrypt($request->password);
                
                if($ExternalUser->update()){
                    return response()->json([
                        'status_code' => 200,
                        'message'     => 'Password successfully updated.',
                    ]);
                }

            }else{
                return response()->json([
                    'status_code' => false,
                    'message'     => 'Sorry! Your old password not match.'
                ]);
            }
        }catch (Exception $error) {
            return response()->json([
                'status_code'   => false,
                'message'  => 'Password not updated.',
                'errors'    => $error->getMessage(),
            ]);
        }
    }

    public function verifyOtp (Request $request) {
        $validator = Validator::make($request->all(), [
            'otp' => 'required',
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {

            $ExternalUser = ExternalUser::find($request->id);

            if ($ExternalUser) {
                if ($ExternalUser->otp === $request->otp) {
                    $ExternalUser->otp  = '';
                    $ExternalUser->status  = 1;
                    $ExternalUser->save();
                    return response()->json([
                        'success' => true,
                        'status_code' => 200,
                        'message' => 'Otp verify success.'
                    ]);
                } else {
                    return response()->json([
                        'success' => false,
                        'status_code' => 404,
                        'message' => 'Your OTP is invalid.'
                    ]);
                }
            } else {
                return response()->json([
                    'success' => false,
                    'status_code' => 403,
                    'message' => 'user not found'
                ]);
            }
        }
    }
    
    
}
