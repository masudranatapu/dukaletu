@extends('layouts.frontend.layout_one')

@section('title', __('sms_paln_billing'))

@section('content')
    <!-- breedcrumb section start  -->
    <x-frontend.breedcrumb-component :background="$cms->dashboard_plan_background">
        {{ __('overview') }}
        <x-slot name="items">
            <li class="breedcrumb__page-item">
                <a href="{{ route('frontend.dashboard') }}"
                    class="breedcrumb__page-link text--body-3">{{ __('dashboard') }}</a>
            </li>
            <li class="breedcrumb__page-item">
                <a class="breedcrumb__page-link text--body-3">/</a>
            </li>
            <li class="breedcrumb__page-item">
                <a class="breedcrumb__page-link text--body-3">{{ __('sms_paln_billing') }}</a>
            </li>
        </x-slot>
    </x-frontend.breedcrumb-component>
    <!-- breedcrumb section end  -->

    <!-- dashboard section start  -->
    <section class="section dashboard mb-5">
        <div class="container">
            @include('frontend.dashboard-alert')
            <div class="row">
                <div class="col-xl-3">
                    @include('layouts.frontend.partials.dashboard-sidebar')
                </div>
                <div class="col-xl-9">

                    @if (isset($currentPackage->smsPlan))

                        <div class="row dashboard__bill-two">
                            <div class="col-lg-12">
                                <div class="dashboard-card dashboard-card--benefits">
                                    <h2 class="dashboard-card__title">{{ __('sms_paln_billing') }}</h2>
                                    <ul class="dashboard__benefits">
                                        <li class="dashboard__benefits-left">
                                            <ul>
                                                <li class="dashboard__benefits-item">
                                                    <span class="icon">
                                                        <x-svg.check-icon width="12" height="12" stroke="#3db83a" />
                                                    </span>
                                                    <p class="text--body-4">{{ __('sms_remaining') }}
                                                        <span class="text-success">{{ Auth::user()->user_sms_stock }}</span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="dashboard__benefits-right">
                                            <ul>
                                                <li class="dashboard__benefits-item">
                                                    <span class="icon">
                                                        <x-svg.check-icon width="12" height="12" stroke="#3db83a" />
                                                    </span>
                                                    <p class="text--body-4">{{ __('package_name') }}
                                                        <span
                                                            class="text-danger">{{ $currentPackage->smsPlan->name }}</span>
                                                    </p>
                                                </li>


                                            </ul>
                                        </li>
                                        <li class="dashboard__benefits-right d-flex justify-content-end">
                                            <a class="btn btn-sm" href="{{ route('frontend.smsPricePlan') }}">Upgrade
                                                package</a>

                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>



                        <div class="row dashboard__bill-three">
                            <div class="col-lg-12">
                                <div class="invoice-table">
                                    <h4>{{ __('recent_invoice') }}</h4>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>{{ __('transaction_id') }}</th>
                                                <th>{{ __('plan_type') }}</th>
                                                <th>{{ __('payment_provider') }}</th>
                                                <th>{{ __('amount') }}</th>
                                                <th>{{ __('date') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            @foreach ($transactions as $transaction)
                                                <tr>
                                                    <td>{{ $transaction->order_id }}</td>
                                                    <td>{{ $transaction->package->name }}</td>
                                                    <td>{{ ucfirst($transaction->payment_provider) }}</td>
                                                    <td>{{ changeCurrency($transaction->amount) }}</td>
                                                    <td>{{ Carbon\Carbon::parse($transaction->created_at)->format('M d, Y g:i A') }}
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    @else
                        <div class="dashboard-card">
                            <div class="dashboard-card__title">
                                {{ __('sms_paln_billing') }}
                            </div>
                            <hr>
                            <div class="dashboard-post_content d-flex justify-content-center align-items-center"
                                style="height: 65vh;">
                                <a href="{{ route('frontend.smsPricePlan') }}" class="btn">Purchesed Package</a>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </section>
    <!-- dashboard section end  -->

@endsection


@section('frontend_style')
    <style>
        .header-table {
            position: relative;
            min-height: 45px;
            -webkit-transition: all 0.4s ease-in-out;
            transition: all 0.4s ease-in-out;
        }

        .dashboard-card--recentvoice__history .header-table {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }
    </style>
@endsection
