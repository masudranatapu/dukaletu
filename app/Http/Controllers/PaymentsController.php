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
<<<<<<< HEAD
    public function payment()
    { 

        try{
            // $apiLink = "https://www.pesapal.com/API/PostPesapalDirectOrderV4";
            // $payments = new Transaction();
            // $payments->user_id = 1; //Business ID
            // $payments->transaction_id = Pesapal::random_reference();
            // $payments->order_id = Pesapal::random_reference();
            // $payments->plan_id = 1;

            // $payments->payment_status = "paid"; //if user gets to iframe then exits, i prefer to have that as a new/lost transaction, not pending
            // $payments->amount = 10;
            // $payments->save();

            // $details = array(
            //     'amount' => $payments->amount,
            //     'description' => 'Test Transaction',
            //     'type' => 'MERCHANT',
            //     'first_name' => 'Fname',
            //     'last_name' => 'Lname',
            //     'email' => 'test@test.com',
            //     'phonenumber' => '254-723232323',
            //     'reference' => $payments->transactionid,
            //     'height' => '400px',
            //     'currency' => 'kes'
            // );
            // $iframe = Pesapal::makePayment($details);

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

        }catch(Exception $e){
            $dd($e);
        }

=======
    use PaymentTrait;

    public function payment(Request $request)
    { //initiates payment

        $apiLink = config('pesapal.live') ? "https://www.pesapal.com/API/PostPesapalDirectOrderV4" : "https://www.pesapal.com/API/PostPesapalDirectOrderV4";

        $plan_id = $request->plan_id;
        $amount = $request->amount;
        $payments = new Transaction();
        $payments->user_id = Auth::user()->id; //Business ID
        $payments->transaction_id = Pesapal::random_reference();
        $payments->order_id = Pesapal::random_reference();
        $payments->plan_id = $plan_id;
        $payments->payment_provider = 'pesapal';

        $payments->payment_status = "unpaid"; //if user gets to iframe then exits, i prefer to have that as a new/lost transaction, not unpaid
        $payments->amount = $amount;
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
            'currency' => 'KES',
            'width' => '100%',
            'height' => '100%',
            'plan_id' => $request->plan_id,
        );
        $iframe = Pesapal::makePayment($details);
        // dd($iframe);
>>>>>>> 63e50d1af11162c38513c44a60b706ebf7b6d6aa
        return view('frontend.payment', compact('iframe'));
    }
    public function paymentsuccess($trackingid, $merchant_reference) //just tells u payment has gone thru..but not confirmed
    {
        $trackingid = $trackingid;
        $ref = $merchant_reference;

        $payments = Transaction::where('id', $ref)->first();
        // dd($payments);
        $payments->trackingid = $trackingid;
        $payments->payment_status = 'paid';
        $payments->save();
        return true;
    }
    //This method just tells u that there is a change in pesapal for your transaction..
    //u need to now query status..retrieve the change...CANCELLED? CONFIRMED?
    public function paymentconfirmation(Request $request)
    {
<<<<<<< HEAD
        dd(1);
=======
        // return view('welcome');
>>>>>>> 63e50d1af11162c38513c44a60b706ebf7b6d6aa
        $trackingid = $request->input('pesapal_transaction_tracking_id');
        $merchant_reference = $request->input('pesapal_merchant_reference');
        $pesapal_notification_type = $request->input('pesapal_notification_type');

        //use the above to retrieve payment status now..
        // $this->checkpaymentstatus($trackingid, $merchant_reference, $pesapal_notification_type);
        $status = Pesapal::getMerchantStatus($merchant_reference);
        if ($status == 'COMPLETED') {
            $payments = Transaction::where('id', $merchant_reference)->first();
            $payments->trackingid = $trackingid;
            $payments->payment_status = 'paid';
            $payments->save();
            $plan = Plan::where('id', $payments->plan_id)->first();
            $this->userPlanInfoUpdate($plan);
            return redirect()->route('frontend.plans-billing')->with('success', 'Payment successfully done.');
        } else {
            // dd($status);
            return redirect()->route('frontend.plans-billing')->with('error', 'The transaction is failed');
        }
    }
    //Confirm status of transaction and update the DB
    public function checkpaymentstatus($trackingid, $merchant_reference, $pesapal_notification_type)
    {
        $status = Pesapal::getMerchantStatus($merchant_reference);
        if ($status == 'COMPLETED') {
            $payments = Transaction::where('id', $merchant_reference)->first();
            $payments->trackingid = $trackingid;
            $payments->payment_status = 'paid';
            $payments->save();
            $plan = Plan::where('id', $payments->plan_id)->first();
            $this->userPlanInfoUpdate($plan);
            return redirect('/')->with('success', 'Payment successfully done.');
        } else {
            return redirect()->route('frontend.plans-billing')->with('error', 'The transaction is failed');
        }
    }
}
