<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\User;
use App\Models\Transaction;
use Illuminate\Support\Arr;
use App\Models\SmsMarketing;
use App\Models\UserSmsStock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use App\Models\Frontend\UserPhoneBook;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Session;
use Rap2hpoutre\FastExcel\Facades\FastExcel;
use Google\Service\CloudSourceRepositories\Repo;


class SmsMarketingController extends Controller
{
    public function marketing()
    {



        $data['currentPackage'] = User::with('smsPlan')->where('id', Auth::id())->first();

        $data['userPhoneBooks'] = UserPhoneBook::where('user_id', Auth::id())->get();
        $todate = date('Y-m-d');

        if (isset($data['currentPackage'])) {
            $data['last_sms_purchase'] = UserSmsStock::where('user_id', Auth::id())->where('status', 'IN')->orderBy('id', 'desc')->first();


            if (isset($data['last_sms_purchase']) && strtotime($data['last_sms_purchase']->expire_date) < time()) {
                DB::table('user_sms_stocks')->insert([
                    'user_id' => Auth::id(),
                    'stock' => '-' . Auth::user()->user_sms_stock,
                    'status' => 'OUT',
                    'created_at' => now(),
                ]);
            }
        }

        return view('frontend.sms-merketing', $data);
    }
    public function marketingGetNumber(Request $request)
    {
        $request->validate([
            'file' => 'required|max:2048',
        ]);


        try {

            $fileName = time() . '.' . $request->file->getClientOriginalExtension();
            $array = $request->file->move(public_path('file'), $fileName);
            $users = FastExcel::import(public_path('file/') . $fileName, function ($data) {

                return $data['number'];
            });





            $uniqe_number = array_values(array_filter(array_unique($users->toArray())));




            // Session::put('phone_number', $uniqe_number);


            for ($i = 0; $i < count($uniqe_number); $i++) {


                $dataBaseCheck = UserPhoneBook::where('user_id', Auth::id())->where('phone_number', $uniqe_number[$i])->first();

                if (!isset($dataBaseCheck)) {


                    if (substr($uniqe_number[$i], 0, 3) != "254" && strlen((string)$uniqe_number[$i]) == 9) {
                        $userPhoneNumber = new UserPhoneBook();
                        $userPhoneNumber->user_id = Auth::id();
                        $userPhoneNumber->phone_number = $uniqe_number[$i];
                        $userPhoneNumber->save();
                    }
                }
            }
            $userPhoneBooks = UserPhoneBook::where('user_id', Auth::id())->get();

            return response()->json($userPhoneBooks);
        } catch (Exception $th) {
            return response()->json($th);
        }
    }
    public function sendSms(Request $request)
    {
        $request->validate([
            'numbers' => 'required|array',
            'description' => 'required'
        ]);





        $stock = (int) Auth::user()->user_sms_stock;
        $message = $request->description;

        if (count($request->numbers) > 0) {


            if ($stock > count($request->numbers)) {

                for ($i = 0; $i < count($request->numbers); $i++) {

                    $new_data[] = [
                        "partnerID" => Config::get('sms.partnerID'),
                        "apikey" => Config::get('sms.apikey'),
                        "pass_type" => "plain",
                        "clientsmsid" => 13434,
                        "mobile" => trim("+254" . $request->numbers[$i]),
                        "message" => $request->description,
                        "shortcode" => Config::get('sms.shortcode')
                    ];
                }


                $response = Http::post('https://quicksms.advantasms.com/api/services/sendbulk/', ["smslist" => $new_data]);


                // for ($i = 0; $i < count($request->numbers); $i++) {
                //     $smsMarketing = new SmsMarketing();
                //     $smsMarketing->sender_id = Auth::id();
                //     $smsMarketing->phone_number = (int)trim($request->numbers[$i]);
                //     $smsMarketing->status = $response->json()['responses'][0]['response-code'] == 200 ? true : false;
                //     $smsMarketing->save();
                // }



                if ($response->json()['responses'][0]['response-code'] == 200) {
                    $userSmsStock = new UserSmsStock();
                    $userSmsStock->user_id = Auth::id();
                    $userSmsStock->stock = '-' . count($request->numbers);
                    $userSmsStock->status = "OUT";
                    $userSmsStock->save();
                }


                flashSuccess("SMS Send Successfully");
                if (isset($request->page)) {
                    return redirect()->route('frontend.user-phoneBook', ['page' => $request->page ?? 1]);
                } else {


                    Session::forget('phone_number');
                    return redirect()->back();
                }
            } else {

                flashError("You don't have enough SMS left");
                return redirect()->back();
            }
        } else {
            flashError("Please select a number");
            return redirect()->back();
        }
    }
}
