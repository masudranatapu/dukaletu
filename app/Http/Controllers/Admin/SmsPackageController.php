<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SmsPackage;
use App\Models\Transaction;
use Illuminate\Http\Request;

class SmsPackageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $smsPackages = SmsPackage::paginate(10);
        return view('admin.sms.package.index', compact('smsPackages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        return view('admin.sms.package.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric',
            'amount' => 'required|numeric',
            'validity' => 'required|numeric',

        ]);
        $smsPackage = new SmsPackage();
        $smsPackage->name = $request->name;
        $smsPackage->price = $request->price;
        $smsPackage->amount_of_sms = $request->amount;
        $smsPackage->status = true;
        $smsPackage->validity = $request->validity;
        $smsPackage->save();
        flashSuccess('Package Save Successfully');
        return redirect()->route('admin.sms.package.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SmsPackage  $smsPackage
     * @return \Illuminate\Http\Response
     */
    public function show(SmsPackage $smsPackage)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SmsPackage  $smsPackage
     * @return \Illuminate\Http\Response
     */
    public function edit(SmsPackage $package)
    {

        return view('admin.sms.package.edit', compact('package'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SmsPackage  $smsPackage
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SmsPackage $package)
    {
        $request->validate([
            'name' => 'required',
            'price' => 'required|numeric',
            'amount' => 'required|numeric',
            'validity' => 'required|numeric',

        ]);

        $package->name = $request->name;
        $package->price = $request->price;
        $package->amount_of_sms = $request->amount;
        $package->status = true;
        $package->validity = $request->validity;

        $package->save();
        flashSuccess('Package Updated Successfully');
        return redirect()->route('admin.sms.package.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SmsPackage  $smsPackage
     * @return \Illuminate\Http\Response
     */
    public function destroy(SmsPackage $package)
    {
        $result = Transaction::where('sms_plan_id', $package->id)->get();

        if (count($result)) {
            flashError('Package already in used');
            return redirect()->route('admin.sms.package.index');
        } else {
            $package->delete();
            flashSuccess('Package Delete Successfully');
            return redirect()->route('admin.sms.package.index');
        }
    }

    public function statusChange(Request $request)
    {
        $smsPackage = SmsPackage::find($request->id);
        $smsPackage->status = (bool)$request->status;
        $smsPackage->save();
        return response()->json('success');
    }
}
