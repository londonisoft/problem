<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Validator;
class SupplierUserController extends Controller
{
/**
     * All Supplier
    */
    public function index(){
        $suppliers = Supplier::get();        
        return view('abasvumi.supplier_user.index', compact('suppliers'));
    }

    /**
     * Store Supplier
    */
    public function store(Request $request){
        
        $validators = Validator::make($request->all(),[
            'name'        => 'required',
            'phone'       => 'required',
            'address'     => 'required',
            'type'        => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $supplier               = new Supplier();
            $supplier->name         = $request->name;
            $supplier->email        = $request->email;
            $supplier->phone        = $request->phone;
            $supplier->address      = $request->address;
            $supplier->experiance   = $request->experiance;
            $supplier->type         = $request->type;
            if($supplier->save()){
                
                $supplier= Supplier::where('suppliers.id', $supplier->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $supplier
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
     * Update Supplier
    */
    public function update(Request $request){
        $validators=Validator::make($request->all(),[
            'name'        => 'required',
            'phone'       => 'required',
            'address'     => 'required',
            'type'        => 'required',
        ]);
        if($validators->fails()){
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        }else{
            $supplier               = Supplier::find($request->id);
            $supplier->name         = $request->name;
            $supplier->email        = $request->email;
            $supplier->phone        = $request->phone;
            $supplier->address      = $request->address;
            $supplier->experiance   = $request->experiance;
            $supplier->type         = $request->type;
            
            if($supplier->update()){
                $supplier= Supplier::where('suppliers.id', $supplier->id)->first();
                return response()->json([
                    'status'    => 201,
                    'data'      => $supplier
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
     * Destroy Supplier
    */
    public function destroy(Request $request)
    {
        $supplier = Supplier::find($request->id);
        $supplier->delete();
        return response()->json();
    }
}
