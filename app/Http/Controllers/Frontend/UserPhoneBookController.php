<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Frontend\UserPhoneBook;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserPlan;
use Google\Service\Directory\UserPhone;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Modules\Plan\Entities\Plan;

class UserPhoneBookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $data['currentPackage'] = User::with('smsPlan')->where('id', Auth::id())->first();



        $data['userPhoneBooks'] = UserPhoneBook::where('user_id', Auth::id())->orderBy('phone_number', 'asc')->paginate(25);



        return view('frontend.phonebook.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request->all());
        $request->validate([
            'phone' => 'required|max:9|min:9'
        ]);


        $find = UserPhoneBook::where('phone_number', $request->phone)->where('user_id', Auth::id())->first();

        if (isset($find)) {
            session()->flash('error', "The number you entered is alrady exist");
            if (request()->has('page')) {
                return redirect()->route('frontend.user-phoneBook', ['page' => request()->page ?? 1]);
            } else {
                return redirect()->back();
            }
        }



        $userPhoneBook = new UserPhoneBook();
        $userPhoneBook->user_id = Auth::id();
        $userPhoneBook->phone_number = $request->phone;
        $userPhoneBook->save();
        session()->flash('success', "Contact successfully added form your phonebook");

        if (request()->has('page')) {
            return redirect()->route('frontend.user-phoneBook', ['page' => request()->page ?? 1]);
        } else {
            return redirect()->back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\UserPhoneBook  $userPhoneBook
     * @return \Illuminate\Http\Response
     */
    // public function show($userPhoneBook, $page)
    // {
    //     $data['currentPackage'] = User::with('smsPlan')->where('id', Auth::id())->first();
    //     $data['userPhoneBook'] = $userPhoneBook;
    //     $data['page'] = $page;
    //     return view('frontend.phonebook.show', $data);
    // }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\UserPhoneBook  $userPhoneBook
     * @return \Illuminate\Http\Response
     */
    public function edit(UserPhoneBook $userPhoneBook)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\UserPhoneBook  $userPhoneBook
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, UserPhoneBook $userPhoneBook)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\UserPhoneBook  $userPhoneBook
     * @return \Illuminate\Http\Response
     */
    public function destroy(UserPhoneBook $userPhoneBook)
    {


        $userPhoneBook->delete();
        session()->flash('success', "Contact successfully removed form your phonebook");
        if (request()->has('page')) {
            return redirect()->route('frontend.user-phoneBook', ['page' => request()->page ?? 1]);
        } else {
            return redirect()->back();
        }
    }
}
