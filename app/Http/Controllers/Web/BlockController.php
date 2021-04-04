<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Block;
use Illuminate\Http\Request;
use Validator;

class BlockController extends Controller
{
/**
     * get all blocks
    */
    public function index(){
        $blocks = Block::all();
        return view('abasvumi.block.index', compact('blocks'));
    }

    /**
     * store blocks
    */
    public function store(Request $request){
        //return $request->all();
        $validators = Validator::make($request->all(),[
            'name'  => 'required',
            'bn_name'  => 'required',
        ]);

        if($validators->fails()) {
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        } else {
            $block               = new Block();
            $block->name         = $request->name;
            $block->bn_name      = $request->bn_name;
            if($block->save()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $block
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
     * update blocks
    */
    public function update(Request $request){

        $validators=Validator::make($request->all(),[
            'name'  => 'required',
            'bn_name'  => 'required',
        ]);

        if($validators->fails()){
            return response()->json(['errors'=>$validators->getMessageBag()->toArray()]);
        }else{
            $block               = Block::find($request->id);
            $block->name         = $request->name;
            $block->bn_name      = $request->bn_name;
            if($block->update()){
                return response()->json([
                    'status'    => 201,
                    'data'      => $block
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
     * destroy block
    */
    public function destroy(Request $request)
    {
        $block = Block::find($request->id)->delete();
        return response()->json();
    }
}
