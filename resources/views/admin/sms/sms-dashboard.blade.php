@extends('admin.layouts.app')

@section('title')
    {{ __('SMS') }}
@endsection

@section('breadcrumbs')
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        Sms Balence
                    </div>
                    <div class="card-body">
                        <h3 class="text-center"><strong>Balence : </strong>{{ $balence }} Unit</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection