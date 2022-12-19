<?php

namespace App\Http\Controllers;


use Knox\Pesapal\Facades\Pesapal;
use App\Payment;
use App\Http\Requests;
use App\Models\Transaction;
use Illuminate\Http\Request;
use App\Http\Traits\PaymentTrait;
use App\Models\SmsPackage;
use App\Models\User;
use App\Models\UserSmsPlan;
use App\Models\UserSmsStock;
use Illuminate\Support\Facades\Auth;
use Modules\Plan\Entities\Plan;

class PaymentsController extends Controller
{
    use PaymentTrait;

    public function payment(Request $request)
    { //initiates payment

        $apiLink = config('pesapal.live') ? "https://www.pesapal.com/API/PostPesapalDirectOrderV4" : "https://www.pesapal.com/API/PostPesapalDirectOrderV4";

        if ($request->type == "plan") {
            session()->forget('purchase_for');
            session()->put('purchase_for', $request->type);
            # code...
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
        } else {
            //sms payment
            session()->forget('purchase_for');
            session()->put('purchase_for', $request->type);
            $plan_id = $request->plan_id;
            $amount = $request->amount;
            $payments = new Transaction();
            $payments->user_id = Auth::user()->id; //Business ID
            $payments->transaction_id = Pesapal::random_reference();
            $payments->order_id = Pesapal::random_reference();
            $payments->sms_plan_id = $plan_id;
            $payments->payment_provider = 'pesapal';
            $payments->payment_status = "unpaid"; //if user gets to iframe then exits, i prefer to have that as a new/lost transaction, not unpaid
            $payments->amount = $amount;
            $payments->save();
            // dd($payments);

            $details = array(
                'amount' => $payments->amount,
                'description' => 'Sms Purchase',
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
        }
        $iframe = Pesapal::makePayment($details);
        // dd($iframe);
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

        // return view('welcome');
        $trackingid = $request->input('pesapal_transaction_tracking_id');
        $merchant_reference = $request->input('pesapal_merchant_reference');
        $pesapal_notification_type = $request->input('pesapal_notification_type');

        //use the above to retrieve payment status now..
        // $this->checkpaymentstatus($trackingid, $merchant_reference, $pesapal_notification_type);
        $status = Pesapal::getMerchantStatus($merchant_reference);

        if ($status == 'COMPLETED') {
            $payments = Transaction::where('id', $merchant_reference)->first();
            $payments->trackingid = $trackingid;
            $payments->payment_status = 'success';
            $payments->save();
            if (session('purchase_for') == 'plan') {
                # code...
                $plan = Plan::where('id', $payments->plan_id)->first();
                $this->userPlanInfoUpdate($plan);
                return redirect()->route('frontend.plans-billing')->with('success', 'Payment successfully done.');
            } else {
                //sms payment
                $package = SmsPackage::where('id', $payments->sms_plan_id)->first();

                $user = User::find(Auth::id());
                $user->sms_plan_id = $package->id;
                $user->save();

                // $userSmsPlan = new UserSmsPlan();
                // $userSmsPlan->sms_plan_id = $package->id;
                // $userSmsPlan->user_id = Auth::id();
                // $userSmsPlan->save();

                $userSmsStock = new UserSmsStock();
                $userSmsStock->user_id = Auth::id();
                $userSmsStock->stock = $package->amount_of_sms;
                $userSmsStock->status = "IN";
                $userSmsStock->expire_date =  date("Y-m-d", strtotime('+'.$package->validity.' day'));
                $userSmsStock->save();
                return redirect()->route('frontend.dashboard')->with('success', 'Payment successfully done');
            }
        } elseif ("FAILED") {
            $payments = Transaction::where('id', $merchant_reference)->first();
            $payments->trackingid = $trackingid;
            $payments->payment_status = 'failed';
            $payments->save();


            if (session('purchase_for') == 'plan') {

                $plan = Plan::where('id', $payments->plan_id)->first();
                $this->userPlanInfoUpdate($plan);
                return redirect()->route('frontend.plans-billing')->with('success', 'Payment successfully done');
            } else {
                $package = SmsPackage::where('id', $payments->sms_plan_id)->first();

                $user = User::find(Auth::id());
                $user->sms_plan_id = $package->id;
                $user->save();



                // $userSmsPlan = new UserSmsPlan();
                // $userSmsPlan->sms_plan_id = $package->id;
                // $userSmsPlan->user_id = Auth::id();
                // $userSmsPlan->save();

                $userSmsStock = new UserSmsStock();
                $userSmsStock->user_id = Auth::id();
                $userSmsStock->stock = $package->amount_of_sms;
                $userSmsStock->status = "IN";
                $userSmsStock->expire_date = date("Y-m-d", strtotime('+'.$package->validity.' day'));
                $userSmsStock->save();
                return redirect()->route('frontend.dashboard')->with('success', 'Payment successfully done');
            }



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
