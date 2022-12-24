<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserSmsPlanController extends Controller
{
    public function index()
    {
        $users = User::with('smsPlan')->get();


        return view('admin.sms.userPackage.index', compact('users'));
    }
}
