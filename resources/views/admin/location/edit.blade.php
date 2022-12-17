@extends('admin.layouts.app')

@section('title')
    {{ __('Country Edit') }}
@endsection

@section('breadcrumbs')
@endsection
@section('style')
    <link rel="stylesheet" href="{{ asset('backend/plugins/bootstrap-switch/css/bootstrap4/bootstrap-switch.css') }}">
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center justify-content-between">
                            <h3 class="card-title" style="line-height: 36px;">{{ __('Edit Country') }}</h3>
                            <div class="d-flex align-items center">
                                <a href="{{ route('admin.location.index') }}" class="btn bg-primary">
                                    <i class="fas fa-arrow-left"></i> &nbsp;
                                    {{ __('Back') }}
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-responsive">
                        <form action="{{ route('admin.location.update', ['location' => $location->id]) }}" method="post">
                            @method('PUT')
                            @csrf
                            <div class="row">

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="name">Country name</label>
                                        <input type="text" name="name" required id="name"
                                            value="{{ old('name') ?? $location->location }}" class="form-control">
                                        @error('name')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-3 d-flex align-items-center">

                                    <button class="btn btn-success">Save</button>
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
    <script src="{{ asset('backend/plugins/bootstrap-switch/js/bootstrap-switch.js') }}"></script>
    <script>
        $("[name='status']").bootstrapSwitch();
        $('input[name="status"]').on('switchChange.bootstrapSwitch', function(event, state) {

            console.log(state);
        });
    </script>
@endsection
