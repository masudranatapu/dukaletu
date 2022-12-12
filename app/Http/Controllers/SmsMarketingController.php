<?php

namespace App\Http\Controllers;

use App\Models\SmsMarketing;
use App\Models\UserSmsStock;
use Google\Service\CloudSourceRepositories\Repo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Http;

class SmsMarketingController extends Controller
{
    public function sendSms(Request $request)
    {
        $request->validate([
            'numbers' => 'required|array',
            'description' => 'required'
        ]);

        dd($request->numbers);

        $stock = (int) Auth::user()->user_sms_stock;
        $message = $request->description;

        if ($stock > 0) {
            # code...
            $response = Http::post('https://quicksms.advantasms.com/api/services/sendsms', [
                'apikey' => Config::get('sms.apikey'),
                'partnerID' => Config::get('sms.partnerID'),
                'message' => $message,
                'shortcode' => Config::get('sms.shortcode'),
                'mobile' => $request->phone,
            ]);

            $smsMarketing = new SmsMarketing();
            $smsMarketing->sender_id = Auth::id();
            $smsMarketing->phone_number = $request->phone;
            $smsMarketing->status = $response->json()['responses'][0]['response-code'] == 200 ? true : false;
            $smsMarketing->save();
            if ($response->json()['responses'][0]['response-code'] == 200) {
                $userSmsStock = new UserSmsStock();
                $userSmsStock->user_id = Auth::id();
                $userSmsStock->stock = -1;
                $userSmsStock->status = "Out";
                $userSmsStock->save();
            }

            flashSuccess("SMS Send Successfully");
            return redirect()->back();
        } else {

            flashError("You don't have enough Sms left");
            return redirect()->back();
        }
    }
}
