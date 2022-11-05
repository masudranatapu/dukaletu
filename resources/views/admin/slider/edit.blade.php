@extends('admin.layouts.app')

@section('title')
    {{ __('Edit Slider') }}
@endsection

@section('breadcrumbs')

@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center justify-content-between">
                            <h3 class="card-title" style="line-height: 36px;">{{ __('Slider Edit') }}</h3>
                            <div class="d-flex align-items center">
                                <a href="{{ route('admin.slider.index') }}" class="btn bg-primary">
                                    <i class="fas fa-plus mr-1"></i> &nbsp;
                                    {{ __('Back') }}
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.slider.update', $slider->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Slider Name</label>
                                        <input type="text" name="name" class="form-control" value="{{$slider->name}}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select name="status" class="form-control">
                                            <option @if($slider->status == 1) sleected @endif value="1">Active</option>
                                            <option @if($slider->status == 0) sleected @endif value="0">Inactive</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label> Image</label>
                                    <input type="file" name="image" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label> URL</label>
                                    <input type="text" name="url" class="form-control" value="{{$slider->url}}" placeholder="URL">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')

@endsection