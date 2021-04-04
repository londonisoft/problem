<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Developers;
use Illuminate\Http\Request;
use Validator;

class DeveloperUserController extends Controller
{
    /**
     * All Developers
    */
    public function index(){
        $developers = Developers::get();        
        return view('abasvumi.developer_user.index', compact('developers'));
    }

    /**
     * Store Developer
    */
    public function store(Request $request){
        
        $validators = Validator::make($request->all(),[
            'name'     => 'required',
            'email'    => 'required|unique:developers',
            'phone'    => 'required|unique:developers',
            'password' => 'required',
            'image'    => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $developer               = new Developers();
            $developer->name         = $request->name;
            $developer->email        = $request->email;
            $developer->phone        = $request->phone;
            $developer->password     = bcrypt($request->password);
            if($request->image){
                $image          = $request->file('image');
                $image_name     = time().".".$image->getClientOriginalExtension();
                $directory      = 'abasvumi/uploads/images/developer/';
                $image->move($directory, $image_name);
                $image_url      = $directory.$image_name;
                $developer->image   = $image_url;
            }
            if($developer->save()){
                
                $developer= Developers::where('developers.id', $developer->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $developer
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
     * Update Developer
    */
    public function update(Request $request){
        $validators=Validator::make($request->all(),[
            'name'   => 'required',
            'email'  => 'required',
            'phone'  => 'required',
        ]);
        if($validators->fails()){
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        }else{
            $developer               = Developers::find($request->id);
            $developer->name         = $request->name;
            $developer->email        = $request->email;
            $developer->phone        = $request->phone;
            if($request->password != null){
                $developer->password = bcrypt($request->password);
            }
            if($request->image){
                if($developer->image != null && file_exists($developer->image)){
                    unlink($developer->image);
                }
                $image          = $request->file('image');
                $image_name     = time().".".$image->getClientOriginalExtension();
                $directory      = 'abasvumi/uploads/images/developer/';
                $image->move($directory, $image_name);
                $image_url      = $directory.$image_name;
                $developer->image   = $image_url;
            }
            if($developer->update()){
                $developer= Developers::where('developers.id', $developer->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $developer
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
     * Destroy Developer
    */
    public function destroy(Request $request)
    {
        $developer = Developers::find($request->id);
        if(($developer->image != null) && file_exists($developer->image)){
            unlink($developer->image);
        }
        $developer->delete();
        return response()->json();
    }
}
