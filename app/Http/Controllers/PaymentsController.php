<?php

namespace App\Http\Controllers;


use Pesapal;
use App\Payment;
use App\Http\Requests;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Http\Traits\PaymentTrait;
use Illuminate\Support\Facades\Auth;
use Modules\Plan\Entities\Plan;

class PaymentsController extends Controller
{
    use PaymentTrait;

    public function payment(Request $request)
    { //initiates payment

        $apiLink = config('pesapal.live') ? "https://www.pesapal.com/API/PostPesapalDirectOrderV4" : "https://www.pesapal.com/API/PostPesapalDirectOrderV4";

        $payments = new Transaction();
        $payments->user_id = Auth::user()->id; //Business ID
        $payments->transaction_id = Pesapal::random_reference();
        $payments->order_id = Pesapal::random_reference();
        $payments->plan_id = $request->plan_id;
        $payments->payment_provider = 'pesapal';

        $payments->payment_status = "unpaid"; //if user gets to iframe then exits, i prefer to have that as a new/lost transaction, not unpaid
        $payments->amount = $request->amount;
        $payments->save();
        // dd($payments);

        $details = array(
            'amount' => $payments->amount,
            'description' => 'Plan Purchase',
            'type' => 'MERCHANT',
            'first_name' => Auth::user()->name ?? '',
            'last_name' => '',
            'email' => Auth::user()->email ?? '',
            'phonenumber' => Auth::user()->phone ?? '',
            'reference' => $payments->id,
            'height' => '400px',
            'currency' => 'KES'
        );
        $iframe = Pesapal::makePayment($details);

        // dd($iframe);
        return view('frontend.payment', compact('iframe'));
    }
    public function paymentsuccess(Request $request) //just tells u payment has gone thru..but not confirmed
    {
        $trackingid = $request->input('tracking_id');
        $ref = $request->input('merchant_reference');

        $payments = Transaction::where('id', $ref)->first();
        $payments->trackingid = $trackingid;
        $payments->payment_status = 'unpaid';
        $payments->save();
        //go back home
        // $payments = Transaction::all();
        return redirect()->back();
    }
    //This method just tells u that there is a change in pesapal for your transaction..
    //u need to now query status..retrieve the change...CANCELLED? CONFIRMED?
    public function paymentconfirmation(Request $request)
    {
        $trackingid = $request->input('pesapal_transaction_tracking_id');
        $merchant_reference = $request->input('pesapal_merchant_reference');
        $pesapal_notification_type = $request->input('pesapal_notification_type');

        //use the above to retrieve payment status now..
        $this->checkpaymentstatus($trackingid, $merchant_reference, $pesapal_notification_type);
    }
    //Confirm status of transaction and update the DB
    public function checkpaymentstatus($trackingid, $merchant_reference, $pesapal_notification_type)
    {
        $status = Pesapal::getMerchantStatus($merchant_reference);
        $payments = Transaction::where('trackingid', $trackingid)->first();
        $payments->payment_status = 'paid';
        $payments->payment_method = "PESAPAL"; //use the actual method though...
        $payments->save();
        $plan = Plan::where('id', $payments->plan_id)->first();
        $this->userPlanInfoUpdate($plan);
        return "success";
    }
}
