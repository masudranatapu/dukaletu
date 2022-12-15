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
                                <h2 class="dashboard-card__title">{{ __('sms_merketing') }}</h2>
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
                            <div class="dashboard-post m-0">

                                <div id="pills-tabContent" class="tab-content dashboard-post__content">
                                    <div class="invoice-table">
                                        <h4 class="p-0">{{ __('user_phone_book') }}</h4>

                                        <form action="{{ route('frontend.smsMarketing.sendSms') }}" method="post">
                                            @csrf
                                            <div class="dashboard-post__information-form">

                                                <input type="hidden" name="page" value="{{ $page }}">
                                                <div class="input-field__group">
                                                    <div class="input-field">
                                                        <x-forms.label name="phone_number" required="true" for="adname" />
                                                        <input required value="{{ $userPhoneBook ?? '' }}" name="numbers[]"
                                                            readonly type="number" placeholder="{{ __('phone_number') }}"
                                                            id="adname"
                                                            class="@error('number') border-danger @enderror" />

                                                        <div class="input-field--textarea">
                                                            <x-forms.label name="Marketing Content" for="description" />
                                                            <textarea required name="description" placeholder="{{ __('whats_your_thought') }}..." id="description"
                                                                class="@error('description') border-danger @enderror"></textarea>
                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="text-light">

                                                    <button type="submit" class="btn btn--lg">
                                                        Send

                                                    </button>
                                                </div>
                                        </form>
                                    </div>
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
