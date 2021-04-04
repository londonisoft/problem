<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Agent;
use Validator;
use Illuminate\Http\Request;

class AgentUserController extends Controller
{
    /**
     * All Agents
    */
    public function index(){
        $agents = Agent::get();        
        return view('abasvumi.agent_user.index', compact('agents'));
    }

    /**
     * Store agent
    */
    public function store(Request $request){
        
        $validators = Validator::make($request->all(),[
            'name'     => 'required',
            'email'    => 'required|unique:agents',
            'phone'    => 'required|unique:agents',
            'password' => 'required',
            'image'    => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $agent               = new Agent();
            $agent->name         = $request->name;
            $agent->email        = $request->email;
            $agent->phone        = $request->phone;
            $agent->password     = bcrypt($request->password);
            if($request->image){
                $image          = $request->file('image');
                $image_name     = time().".".$image->getClientOriginalExtension();
                $directory      = 'abasvumi/uploads/images/agent/';
                $image->move($directory, $image_name);
                $image_url      = $directory.$image_name;
                $agent->image   = $image_url;
            }
            if($agent->save()){
                
                    $agent= Agent::where('agents.id', $agent->id)->first();
                    return response()->json([
                        'status'    => 201,
                        'data'      => $agent
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
     * Update agent
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
            $agent               = Agent::find($request->id);
            $agent->name         = $request->name;
            $agent->email        = $request->email;
            $agent->phone        = $request->phone;
            if($request->password != null){
                $agent->password = bcrypt($request->password);
            }
            if($request->image){
                if($agent->image != null && file_exists($agent->image)){
                    unlink($agent->image);
                }
                $image          = $request->file('image');
                $image_name     = time().".".$image->getClientOriginalExtension();
                $directory      = 'abasvumi/uploads/images/agent/';
                $image->move($directory, $image_name);
                $image_url      = $directory.$image_name;
                $agent->image   = $image_url;
            }
            if($agent->update()){
                $agent= Agent::where('agents.id', $agent->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $agent
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
     * Destroy agent
    */
    public function destroy(Request $request)
    {
        $agent = Agent::find($request->id);
        if(($agent->image != null) && file_exists($agent->image)){
            unlink($agent->image);
        }
        $agent->delete();
        return response()->json();
    }
}
