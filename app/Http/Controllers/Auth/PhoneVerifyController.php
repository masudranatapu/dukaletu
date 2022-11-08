<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\MobileValidation;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Http;

class PhoneVerifyController extends Controller
{
    public function getOtp(Request $request)
    {


        $userFind = User::where('phone', $request->phone)->first();

        if (isset($userFind)) {
            return response()->json(['message' => "This phone number is already registered try another phone.", 'status' => "faild"]);
        } else {

            $six_digit_random_number = random_int(100000, 999999);
            $message = "Use " . $six_digit_random_number . " as your one time pin for DUKALETU. It will be disabled for the next 30 second";



            $find = MobileValidation::where('phone_number', $request->phone)->first();

            if (isset($find)) {
                # code...

                if ($find->attempt >= 5 && Carbon::parse($find->updated_at)->isToday()) {
                    return response()->json(['message' => "You already attempt 5 times please try again tommrow", 'status' => "faild"]);
                } elseif (isset($find) && $find->attempt < 5) {
                    $response = Http::post('https://quicksms.advantasms.com/api/services/sendsms', [
                        'apikey' => '5f5eaecf7f4be0c848d058982f9fb59a',
                        'partnerID' => '6002',
                        'message' => $message,
                        'shortcode' => 'DUKALETU',
                        'mobile' => $request->phone,
                    ]);

                    if ($response->json()['responses'][0]['response-code'] == 200) {
                        $find->phone_number = $request->phone;
                        $find->otp_code = $six_digit_random_number;
                        $find->expired_in = Carbon::now()->addSeconds(30);
                        $find->attempt = $find->attempt + 1;
                        $find->save();
                        return response()->json(['message' => $find, 'status' => "success"], 200);
                    }
                }
            } else {
                $response = Http::post('https://quicksms.advantasms.com/api/services/sendsms', [
                    'apikey' => '5f5eaecf7f4be0c848d058982f9fb59a',
                    'partnerID' => '6002',
                    'message' => $message,
                    'shortcode' => 'DUKALETU',
                    'mobile' => $request->phone,
                ]);

                if ($response->json()['responses'][0]['response-code'] == 200) {


                    $mobileValidation = new MobileValidation();
                    $mobileValidation->phone_number = $request->phone;
                    $mobileValidation->otp_code = $six_digit_random_number;
                    $mobileValidation->expired_in = Carbon::now()->addSeconds(30);
                    $mobileValidation->attempt = 1;
                    $mobileValidation->save();
                    return response()->json(['message' => $mobileValidation, 'status' => "success"], 200);
                }
            }
        }
    }



    public function verifyOtp(Request $request)
    {
        // return response()->json($request->phone);

        $otp = implode("", $request->otp);
        $find = MobileValidation::where('phone_number', $request->phone)->latest()->first();
        if (Carbon::now()->isBefore($find->expired_in) && $find->otp_code == $otp) {

            return response()->json("success");
        } else {
            return response()->json("fail");
        }
    }
}
