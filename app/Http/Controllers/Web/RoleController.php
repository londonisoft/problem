<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Role;
use Illuminate\Http\Request;
use Validator;

class RoleController extends Controller
{
    /**
     * get all roles
    */
    public function index(){
        $roles = Role::all();
        return view('abasvumi.role.index', compact('roles'));
    }

    /**
     * store roles
    */
    public function store(Request $request){
        $validators = Validator::make($request->all(),[
            'name'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $role               = new Role();
            $role->name         = $request->name;
            $role->description  = isset($request->description) ? $request->description : Null;
            if($role->save()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $role
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
     * update roles
    */
    public function update(Request $request){
        $validators=Validator::make($request->all(),[
            'name'  => 'required',
        ]);
        if($validators->fails()){
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        }else{
            $role               = Role::find($request->id);
            $role->name         = $request->name;
            $role->description  = isset($request->description) ? $request->description : Null;
            if($role->update()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $role
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
     * destroy roles
    */
    public function destroy(Request $request)
    {
        $role = Role::find($request->id)->delete();
        return response()->json();
    }
}
