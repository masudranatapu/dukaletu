@extends('admin.layouts.app')

@section('title')
    {{ __('SMS Package') }}
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
                            <h3 class="card-title" style="line-height: 36px;">{{ __('SMS Purchased Transaction History') }}
                            </h3>
                        </div>
                    </div>

                    <div class="card-body table-responsive p-0">
                        <table class="table table-bordered">
                            <thead>
                                <th>#</th>
                                <th>{{ __('order_id') }}</th>
                                <th>{{ __('username') }}</th>
                                <th>{{ __('package_name') }}</th>
                                <th>{{ __('payment_provider') }}</th>
                                <th>{{ __('amount') }}</th>
                                <th>{{ __('status') }}</th>
                                <th>{{ __('date') }}</th>
                                {{-- <th class="text-center">{{ __('action') }}</th> --}}
                            </thead>
                            <tbody>

                                @foreach ($transactions as $transaction)
                                    <tr>

                                        <td>{{ $loop->iteration ?? '' }}</td>
                                        <td>{{ $transaction->transaction_id ?? '' }}</td>
                                        <td>{{ $transaction->customer->username ?? '' }}</td>
                                        <td>{{ $transaction->package->name ?? '' }}</td>
                                        <td>{{ Str::ucfirst($transaction->payment_provider) ?? '' }}</td>
                                        <td>{{ $transaction->amount ?? '' }}</td>
                                        <td>{{ $transaction->payment_status ?? '' }}</td>
                                        <td>{{ Carbon\Carbon::parse($transaction->created_at)->format('M d, Y g:i A') ?? '' }}
                                        </td>
                                        {{-- <td class="text-center">
                                            <a href="#" class="btn btn-info"><i class="fas fa-eye"></i></a>
                                        </td> --}}
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
