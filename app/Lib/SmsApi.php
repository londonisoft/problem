<?php

namespace App\Lib;

use Illuminate\Support\Facades\DB;

class SmsApi 
{
    public $token;

    public function __construct() {
        $this->token = "543860787c651aceb1da61af336d888d";
    }

    public static function send($sms_array=[])
    {
        $to = $sms_array['mobile'];
        $message = $sms_array['message'];
        $api_token = "543860787c651aceb1da61af336d888d";
        $url = "http://api.greenweb.com.bd/api.php?json";
        
        $data= array(
            'to'=>"$to",
            'message'=>"$message",
            'token'=>"$api_token"
        );

        try {

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL,$url);
            curl_setopt($ch, CURLOPT_ENCODING, '');
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $smsresult = curl_exec($ch);
            echo curl_error($ch);
            
        } catch (\Exception $e) {}
        
    }
   
}