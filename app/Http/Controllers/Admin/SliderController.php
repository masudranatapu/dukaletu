<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use Carbon\Carbon;

class SliderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $sliders = DB::table('sliders')->paginate(10);
        return view('admin.slider.index', compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('admin.slider.create');
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
        $this->validate($request, [
            'name' => 'required',
            'image' => 'required',
            'url' => 'required',
        ]);

        $slider_image = $request->file('image');
        $slug = 'slider';
        $slider_image_name = $slug.'-'.uniqid().'.'.$slider_image->getClientOriginalExtension();
        $upload_path = 'media/slider/';
        $slider_image->move($upload_path, $slider_image_name);

        $image_url = $upload_path.$slider_image_name;
        
        DB::table('sliders')->insert([
            'name'=> $request->name,
            'url'=> $request->url,
            'image' => $image_url,
            'status' => $request->status,
            'created_at' => Carbon::now(),
        ]);

        return redirect()->back()->with(['success' => 'Slider successfully create']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $slider = DB::table('sliders')->where('id', $id)->first();
        return view('admin.slider.edit', compact('slider'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $this->validate($request, [
            'name' => 'required',
            'url' => 'required',
        ]);

        $slider_image = $request->file('image');
        $slug = 'slider';
        if(isset($slider_image)) {
            $slider_image_name = $slug.'-'.uniqid().'.'.$slider_image->getClientOriginalExtension();
            $upload_path = 'media/slider/';
            $slider_image->move($upload_path, $slider_image_name);

            $sliderimage = DB::table('sliders')->where('id', $id)->first();
            if ($sliderimage->image) {
                unlink($sliderimage->image);
            }
            $image_url = $upload_path.$slider_image_name;
        }else {
            $sliderimage = DB::table('sliders')->where('id', $id)->first();
            $image_url = $sliderimage->image;
        }

        DB::table('sliders')->where('id', $id)->update([
            'name'=> $request->name,
            'url'=> $request->url,
            'image' => $image_url,
            'status' => $request->status,
            'created_at' => Carbon::now(),
        ]);

        return redirect()->route('admin.slider.index')->with(['success' => 'Slider successfully updated']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $slider = DB::table('sliders')->where('id', $id)->first();
        
        $deleteImage = $slider->image;

        if(file_exists($deleteImage)) {
            unlink($deleteImage);
        }
        
        DB::table('sliders')->where('id', $id)->delete();

        return redirect()->back()->with(['success' => 'Slider successfully delete']);
        
    }
}
