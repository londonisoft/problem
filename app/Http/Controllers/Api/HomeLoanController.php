<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\Models\HomeLoan;

class HomeLoanController extends Controller
{
    public function store(Request $request) {
        $validator = Validator::make($request->all(),[
            'name'     => 'required',
            'mobile'     => 'required',
            'total_price'     => 'required',
            'loan_priod'     => 'required',
            'down_payment'     => 'required',
            'interest_rate'     => 'required',
            'monthly_payment'     => 'required',
            'total_pay_over'     => 'required'
        ]);

        if ($validator->fails()) {
            return ([
                'success' => false,
                'errors' => $validator->errors()
            ]);
        } else {
            
                $homeLoan                 = new HomeLoan();
                $homeLoan->name           = $request->name;
                $homeLoan->mobile         = $request->mobile;
                $homeLoan->email          = $request->email;
                $homeLoan->property_id    = $request->property_id;
                $homeLoan->total_price    = $request->total_price;
                $homeLoan->loan_priod     = $request->loan_priod;
                $homeLoan->down_payment   = $request->down_payment;
                $homeLoan->interest_rate  = $request->interest_rate;
                $homeLoan->monthly_payment = $request->monthly_payment;
                $homeLoan->total_pay_over = $request->total_pay_over;
              
                $homeLoan->save();
                    
				return response()->json([
					'success'   => true,
					'status_code' => 200,
					'message' => "Home loan save succcessfully",
					'data'        => $homeLoan
				]);
                
        }
        
    }
}
