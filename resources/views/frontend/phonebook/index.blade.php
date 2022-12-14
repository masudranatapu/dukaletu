@extends('layouts.frontend.layout_one')

@section('title', __('user_phone_book'))

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
                <a class="breedcrumb__page-link text--body-3">{{ __('user_phone_book') }}</a>
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

                    <div class="row dashboard__bill-two">
                        <div class="col-lg-12">
                            <div class="dashboard-card dashboard-card--benefits">
                                <h2 class="dashboard-card__title">{{ __('plan_benefits') }}</h2>
                                <ul class="dashboard__benefits">

                                    <li class="dashboard__benefits-right">
                                        <ul>
                                            <li class="dashboard__benefits-item">
                                                <span class="icon">
                                                    <x-svg.check-icon width="12" height="12" stroke="#3db83a" />
                                                </span>
                                                <p class="text--body-4">{{ __('ads_remaining') }}
                                                    <span
                                                        class="text-success">{{ Auth::user()->user_sms_stock ?? 0 }}</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dashboard__benefits-right">
                                        <ul>
                                            <li class="dashboard__benefits-item my-2">
                                                <span class="icon">
                                                    <x-svg.check-icon width="12" height="12" stroke="#3db83a" />
                                                </span>
                                                <p class="text--body-4">{{ __('package_name') }}
                                                    <span class="text-danger">{{ $currentPackage->smsPlan->name }}</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row dashboard__bill-three">
                        <div class="col-lg-12">
                            <div class="invoice-table">
                                <h4>{{ __('user_phone_book') }}</h4>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>{{ __('phone_number') }}</th>
                                            <th class="d-flex justify-content-end">{{ __('send_message') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($userPhoneBooks as $phoneBooks)
                                            <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                <td>{{ $phoneBooks->phone_number }}</td>
                                                <td class="d-flex justify-content-end">
                                                    <a href="{{ route('frontend.send-sms-single', ['phone' => $phoneBooks->phone_number, 'page' => request()->page ?? 1]) }}"
                                                        class="btn btn-main">{{ __('send_message') }}</a>
                                                </td>
                                            </tr>
                                        @empty
                                        @endforelse
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center">

                                    {{ $userPhoneBooks->links() }}
                                </div>
                            </div>
                        </div>
                    </div>

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
