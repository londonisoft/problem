<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\UserProfileRequest;
use App\Models\Role;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Validator;

class AdminUserController extends Controller
{
    /**
     * get supper admin & admin user
    */
    public function index(){
        $users = User::join('roles','roles.id','users.role_id')
                        ->select('users.*','roles.name as role_name')
                        ->where('roles.id',1)
                        ->orWhere('roles.id',2)
                        ->get();
        $roles = Role::all();
        return view('abasvumi.admin_user.index', compact('users','roles'));
    }

    /**
     * get system user
    */
    public function systemUser(){
        $users = User::join('roles','roles.id','users.role_id')
                        ->select('users.*','roles.name as role_name')
                        ->where('roles.id','!=',1)
                        ->Where('roles.id','!=',2)
                        ->get();
        $roles = Role::all();
        return view('abasvumi.admin_user.system_user', compact('users','roles'));
    }

    /**
     * store user
    */
    public function store(Request $request){
        $validators = Validator::make($request->all(),[
            'name'   => 'required',
            'email'  => 'required',
            'phone'  => 'required',
            'password'  => 'required',
            'role_id'=> 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $user               = new User();
            $user->name         = $request->name;
            $user->email        = $request->email;
            $user->phone        = $request->phone;
            $user->role_id      = $request->role_id;
            $user->password     = bcrypt($request->password);
            if($request->image){
                $image          = $request->file('image');
                $image_name     = time().".".$image->getClientOriginalExtension();
                $directory      = 'abasvumi/uploads/images/user/';
                $image->move($directory, $image_name);
                $image_url      = $directory.$image_name;
                $user->image   = $image_url;
            }
            if($user->save()){
                if($user->role_id == 1 || $user->role_id == 2){
                    $user= User::join('roles','roles.id','users.role_id')
                            ->select('users.*','roles.name as role_name')
                            ->where('users.id', $user->id)
                            ->first();
                    return response()->json([
                        'status'    => 201,
                        'data'      => $user
                    ]);
                }
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

     /**
     * update user
    */
    public function update(Request $request){
        $validators=Validator::make($request->all(),[
            'name'   => 'required',
            'email'  => 'required',
            'phone'  => 'required',
            'role_id'=> 'required',
        ]);
        if($validators->fails()){
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        }else{
            $user               = Role::find($request->id);
            $user->name         = $request->name;
            $user->email        = $request->email;
            $user->phone        = $request->phone;
            $user->role_id      = $request->role_id;
            if($request->image){
                if($user->image != null && file_exists($user->image)){
                    unlink($user->image);
                }
                $image          = $request->file('image');
                $image_name     = time().".".$image->getClientOriginalExtension();
                $directory      = 'abasvumi/uploads/images/user/';
                $image->move($directory, $image_name);
                $image_url      = $directory.$image_name;
                $user->image   = $image_url;
            }
            if($user->update()){
                $user= User::join('roles','roles.id','users.role_id')
                        ->select('users.*','roles.name as role_name')
                        ->where('users.id', $user->id)
                        ->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $user
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }

    /**
     * destroy user
    */
    public function destroy(Request $request)
    {
        $user = User::find($request->id);
        if(($user->image != null) && file_exists($user->image)){
            unlink($user->image);
        }
        $user->delete();
        return response()->json();
    }

    /**
     * Profile edit.
    */
    public function profileEdit() {
        return view('abasvumi.admin_user.profile_edit');
    }

    /**
     * Profile update.
    */
    public function profileUpdate(UserProfileRequest $request) {

        $user               = User::find(Auth::guard("web")->user()->id);
        $user->name         = $request->name;
        $user->email        = $request->email;
        $user->phone        = $request->phone;
        if($request->image){
            if($user->image != null && file_exists($user->image)){
                unlink($user->image);
            }
            $image          = $request->file('image');
            $image_name     = time().".".$image->getClientOriginalExtension();
            $directory      = 'abasvumi/uploads/images/user/';
            $image->move($directory, $image_name);
            $image_url      = $directory.$image_name;
            $user->image   = $image_url;
        }
        if($user->update()){
            return redirect()->back()->with("success","Profile updated.");
        }

    }

    /**
     * Password change.
    */
    public function passwordChange() {
        return view('abasvumi.admin_user.change_password');
    }

    /**
     * Update password page view.
    */
    
    public function passwordUpdate(Request $request) {

        $this->validate($request, [
            'oldPassword'           => 'required',
            'password'              => 'required|confirmed',
            'password_confirmation' => 'required',
        ],[
            "oldPassword.required" => "Old password is required",
            "password.required" => "Password is required",
            "password_confirmation.required" => "Confirm password required",
            "password_confirmation.confirmed" => "New and confirm password not match",
        ]);
        
        try {

            $user = User::where("id",Auth::guard("web")->user()->id)->first();

            if(Hash::check(trim(strip_tags($request->oldPassword)), $user->password)) {
                $user->password = bcrypt($request->password);
                $user->update();
                return redirect()->back()->with("success","Password changed Successfully");
            }else{
                return redirect()->back()->with('warning', "Sorry! Your old password not match!");
            }
        }catch(Exception $e){
            return redirect()->back()->with("error","Something want wrong!");
        }
    }

}
