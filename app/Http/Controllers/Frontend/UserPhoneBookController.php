<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Frontend\UserPhoneBook;
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
        $data['userPhoneBooks'] = UserPhoneBook::where('user_id', Auth::id())->paginate(6);


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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\UserPhoneBook  $userPhoneBook
     * @return \Illuminate\Http\Response
     */
    public function show($userPhoneBook, $page)
    {
        $data['currentPackage'] = User::with('smsPlan')->where('id', Auth::id())->first();
        $data['userPhoneBook'] = $userPhoneBook;
        $data['page'] = $page;
        return view('frontend.phonebook.show', $data);
    }

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
        //
    }
}
