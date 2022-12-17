<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin\Location;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class LocationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $locations = Location::all();
        return view('admin.location.index', compact('locations'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.location.create');
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
            'name' => 'required|unique:locations,location'
        ]);


        $location = new Location();
        $location->location = $request->name;
        $location->status = true;
        $location->save();
        Session::flash('success', "country create success");
        return redirect()->route('admin.location.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Admin\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function show(Location $location)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Admin\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function edit(Location $location)
    {
        return view('admin.location.edit', compact('location'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Admin\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Location $location)
    {
        $request->validate([
            'name' => 'required|unique:locations,location,' . $location->id
        ]);

        $location->location = $request->name;
        $location->status = true;
        $location->save();
        Session::flash('success', "Country update success");
        return redirect()->route('admin.location.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Admin\Location  $location
     * @return \Illuminate\Http\Response
     */
    public function destroy(Location $location)
    {

        $location->delete();
        Session::flash('success', "Country deleted success");
        return redirect()->route('admin.location.index');
    }


    public function changeStatus(Request $request)
    {

        $location = Location::find($request->id);
        $location->status = ($request->status) ? 1 : 0;
        $location->save();
        // return response()->json($location);
        return response()->json("success");
    }
}
