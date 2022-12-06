@extends('admin.layouts.app')

@section('title')
    {{ __('Sms Package') }}
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
                            <h3 class="card-title" style="line-height: 36px;">{{ __('Create Package') }}</h3>
                            <div class="d-flex align-items center">
                                <a href="{{ route('admin.sms.package.index') }}" class="btn bg-primary">
                                    <i class="fas fa-arrow-left"></i> &nbsp;
                                    {{ __('Back') }}
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="card-body table-responsive">
                        <form action="{{ route('admin.sms.package.update', ['package' => $package->id]) }}" method="post">
                            @method('PUT')
                            @csrf
                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="name">Package Name</label>
                                        <input type="text" name="name" id="name" class="form-control"
                                            value="{{ $package->name }}">
                                        @error('name')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="price">Package Price</label>
                                        <input type="number" name="price" id="price" class="form-control"
                                            value="{{ $package->price }}">
                                        @error('price')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="name">Amount of Sms</label>
                                        <input type="number" name="amount" id="amount" class="form-control"
                                            value="{{ $package->amount_of_sms }}">
                                        @error('amount')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="name">Validity (in Days)</label>
                                        <input type="number" name="validity" id="validity"
                                            value="{{ $package->validity }}" class="form-control">
                                        @error('validity')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-1">
                                    <label for="status">Status</label>
                                    <div class="form-group ">
                                        <input type="checkbox" data-on-color="success" data-off-color="danger"
                                            data-handle-width="auto" name="status"
                                            @if ($package->status) checked @endif>
                                        @error('status')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12 d-flex justify-content-center">
                                    <button type="submit" class="btn btn-success">Save</button>
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
