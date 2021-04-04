<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\ExternalUser;
use Validator;
use Illuminate\Http\Request;
use DB;
class SupplierController extends Controller
{
    public function index() {
        $external_users = DB::table('external_users')
                    ->select('external_users.*')->where('user_type', 3)
                    ->get();

        return view("abasvumi.supplier.index",compact("external_users"));
    }
    public function statusChange(Request $request) {
        $property = ExternalUser::find($request->id);
        $property->is_featured = $request->is_featured;
        $property->status = $request->status;
        $property->save();
        return $property;
        return response()->json([
            'status'        => 403,
            'data'          => []
        ]);

    }
    public function destroy(Request $request) {
        $property = ExternalUser::find($request->id);
        $property->delete();
        return redirect()->back();
    }
}

