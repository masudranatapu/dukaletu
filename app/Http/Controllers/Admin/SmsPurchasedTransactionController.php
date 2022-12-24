<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\Request;

class SmsPurchasedTransactionController extends Controller
{
    public function index()
    {
        $transactions = Transaction::with(['package', 'customer'])->whereNotNull('sms_plan_id')->latest()->paginate(15);

        return view('admin.sms.transections.index', compact('transactions'));
    }
}
