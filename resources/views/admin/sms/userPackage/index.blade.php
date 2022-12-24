@extends('admin.layouts.app')

@section('title')
    {{ __('User Sms History') }}
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
                            <h3 class="card-title" style="line-height: 36px;">{{ __('User Sms History') }}
                            </h3>
                        </div>
                    </div>

                    <div class="card-body table-responsive p-0">
                        <table class="table table-bordered">
                            <thead>
                                <th>#</th>

                                <th>{{ __('username') }}</th>
                                <th>{{ __('package_name') }}</th>
                                <th>{{ __('sms_used') }}</th>
                                <th>{{ __('sms_left') }}</th>
                                {{-- <th class="text-center">{{ __('action') }}</th> --}}
                            </thead>
                            <tbody>
                                @foreach ($users as $user)
                                    <tr>

                                        <td>{{ $loop->iteration ?? '' }}</td>
                                        <td>{{ $user->username ?? '' }}</td>
                                        <td>{{ $user->smsPlan->name ?? '' }}</td>
                                        <td>{{ $user->user_sms_stock ?? '' }}</td>
                                        <td>{{ ($user->smsPlan->amount_of_sms ?? 0) - ($user->user_sms_stock ?? 0) }}</td>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>

                        </table>
                        <div class="d-flex justify-content-center">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
