<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    /**
     * show login page
     */
    public function login(){
      
        return view('abasvumi.auth.login');
    }

    /**
     * sign in to admin panel
     */
    public function signin(Request $request){ 
        $this->validate($request, [
            'email'     => 'required|email',
            'password'  => 'required'
        ]);
        $user = User::where('email', $request->email)->first();
        if($user != null){
            $remember = $request->has('remember') ? true : false;
            if(Auth::attempt(['email'=>$request->email,'password'=>$request->password], $remember)){
                $user = Auth::user();
                Auth::login($user,true);
                return redirect()->route('dashboard')->with('message','Successfully logged in !');
            }else{
                return redirect()->route('admin.login')->with('error_message','Email/Password is wrong !');
            }
        }else{
            return redirect()->route('admin.login')->with('error_message','You are not admin');;
        }
    }

    /**
     * sign out from admin panel
     */
    public function logout(Request $request){
        if(Auth::check()){
            Auth::logout();
        }
        return redirect()->route('admin.login');
    }
}
