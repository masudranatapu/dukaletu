<?php

namespace App\Http\Controllers;


use Pesapal;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Models\Transaction;
use Illuminate\Support\Facades\Auth;
use App\Payment;

class PaymentsController extends Controller
{
    public function payment()
    { //initiates payment

        $apiLink = config('pesapal.is_live') ? "https://pay.pesapal.com/v3" : "https://cybqa.pesapal.com/pesapalv3";

        $payments = new Transaction();
        $payments->user_id = 1; //Business ID
        $payments->transaction_id = Pesapal::random_reference();
        $payments->order_id = Pesapal::random_reference();
        $payments->plan_id = 1;

        $payments->payment_status = "paid"; //if user gets to iframe then exits, i prefer to have that as a new/lost transaction, not pending
        $payments->amount = 10;
        $payments->save();

        $details = array(
            'amount' => $payments->amount,
            'description' => 'Test Transaction',
            'type' => 'MERCHANT',
            'first_name' => 'Fname',
            'last_name' => 'Lname',
            'email' => 'test@test.com',
            'phonenumber' => '254-723232323',
            'reference' => $payments->transactionid,
            'height' => '400px',
            'currency' => 'kes'
        );
        $iframe = Pesapal::makePayment($details);


        return view('frontend.payment', compact('iframe'));
    }
    public function paymentsuccess(Request $request) //just tells u payment has gone thru..but not confirmed
    {
        $trackingid = $request->input('tracking_id');
        $ref = $request->input('merchant_reference');

        // $payments = Transaction::where('transaction_id', $ref)->first();
        // // $payments->trackingid = $trackingid;
        // // $payments->status = 'PENDING';
        // $payments->save();
        //go back home
        $payments = Transaction::all();
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
        $payments = Payment::where('trackingid', $trackingid)->first();
        $payments->status = $status;
        $payments->payment_method = "PESAPAL"; //use the actual method though...
        $payments->save();
        return "success";
    }
}
