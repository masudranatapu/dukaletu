<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Config;

class AdminSms extends Controller
{
    public function index()
    {
        $response = Http::post('https://quicksms.advantasms.com/api/services/getbalance?', [
            'apikey' => Config::get('sms.apikey'),
            'partnerID' => Config::get('sms.partnerID'),

        ]);

        $data = json_decode($response->body(), true);
        $balence = $data['credit'];

        return view('admin.sms.sms-dashboard', compact('balence'));
    }
}
