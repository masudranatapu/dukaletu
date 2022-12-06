<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminSms extends Controller
{
    public function index()
    {
        return view('admin.sms.sms-dashboard');
    }
}
