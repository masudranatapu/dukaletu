@extends('admin.layouts.app')

@section('title')
    {{ __('Slider') }}
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
                            <h3 class="card-title" style="line-height: 36px;">{{ __('Slider List') }}</h3>
                            <div class="d-flex align-items center">
                                <a href="{{ route('admin.slider.create') }}" class="btn bg-primary">
                                    <i class="fas fa-plus mr-1"></i> &nbsp;
                                    {{ __('Create Slider') }}
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover text-nowrap">
                            <thead>
                                <tr>
                                    <th width="5%">#</th>
                                    <th>{{ __('name') }}</th>
                                    <th>{{ __('Image') }}</th>
                                    <th>{{ __('URL') }}</th>
                                    <th>{{ __('Status') }}</th>
                                    <th width="10%">{{ __('Action') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($sliders as $key => $slider)
                                    <tr>
                                        <td>{{ $key + 1}}</td>
                                        <td>{{$slider->name}}</td>
                                        <td>
                                            <img width="80" height="80" src="{{asset($slider->image)}}" alt="">
                                        </td>
                                        <td>
                                            <a target="__blank" href="{{$slider->url}}">Slider url</a>
                                        </td>
                                        <td>
                                            @if($slider->status == 1)
                                                <span class="badge bg-success">Inactive</span>
                                            @else
                                                <span class="badge bg-info">Inactive</span>
                                            @endif
                                        </td>
                                        <td>
                                            <a href="{{ route('admin.slider.edit', $slider->id) }}" class="btn btn-success">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="{{ route('admin.slider.destroy', $slider->id) }}" class="btn btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="10" class="text-center">
                                            No Data 
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                        {{ $sliders->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')

@endsection