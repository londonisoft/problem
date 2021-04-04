<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

use App\Models\PropertyType;
use Illuminate\Http\Request;
use App\Models\DhakaNeigbor;
use Validator;

class DhNeiborController extends Controller
{
    /**
     * get all property type
    */
    public function index(){
        $neibors = DhakaNeigbor::all();
        return view('abasvumi.dhNeibor.index', compact('neibors'));
    }

    /**
     * Store Service Type
    */
    public function store(Request $request){
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'name'  => 'required',
            'name_bn'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $propertyType           = new DhakaNeigbor();
            $propertyType->name     = $request->name;
            $propertyType->name_bn  = $request->name_bn;
            if($propertyType->save()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $propertyType
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
     * Update Service Type
    */
    public function update(Request $request){

        $validators=Validator::make($request->all(),[
            'name'  => 'required',
            'name_bn'  => 'required',
        ]);

        if($validators->fails()){
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        }else{
            $propertyType         = DhakaNeigbor::find($request->id);
            $propertyType->name         = $request->name;
            $propertyType->name_bn      = $request->name_bn;
            if($propertyType->update()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $propertyType
                ]);
            }else{
                return response()->json([
                    'status'        => 403,
                    'data'          => []
                ]);
            }
        }
    }
    public function statusChange(Request $request) {
        $property = DhakaNeigbor::find($request->id);
        $property->status = $request->status;
        $property->save();
        return $property;
        return response()->json([
            'status'        => 403,
            'data'          => []
        ]);

    }
    public function destroy(Request $request)
    {
        $block = DhakaNeigbor::find($request->id)->delete();
        return response()->json();
    }
}
