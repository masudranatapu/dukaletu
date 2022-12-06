@extends('layouts.frontend.layout_one')

@section('title')
    {{ __('plan_details') }} ({{ $package->name }})
@endsection

@section('meta')
    @php
        $data = metaData('pricing');
    @endphp

    <meta name="title" content="{{ $data->title }}">
    <meta name="description" content="{{ $data->description }}">

    <meta property="og:image" content="{{ $data->image_url }}" />
    <meta property="og:site_name" content="{{ config('app.name') }}">
    <meta property="og:title" content="{{ $data->title }}">
    <meta property="og:url" content="{{ route('frontend.priceplan') }}">
    <meta property="og:type" content="article">
    <meta property="og:description" content="{{ $data->description }}">

    <meta name=twitter:card content={{ $data->image_url }} />
    <meta name=twitter:site content="{{ config('app.name') }}" />
    <meta name=twitter:url content="{{ route('frontend.priceplan') }}" />
    <meta name=twitter:title content="{{ $data->title }}" />
    <meta name=twitter:description content="{{ $data->description }}" />
    <meta name=twitter:image content="{{ $data->image_url }}" />
@endsection

@section('content')
    <!-- breedcrumb section start  -->
    <x-frontend.breedcrumb-component :background="$cms->pricing_plan_background">
        {{ __('overview') }}
        <x-slot name="items">
            <li class="breedcrumb__page-item">
                <a href="{{ route('frontend.priceplan') }}"
                    class="breedcrumb__page-link text--body-3">{{ __('package_details') }}</a>
            </li>
            <li class="breedcrumb__page-item">
                <a class="breedcrumb__page-link text--body-3">/</a>
            </li>
            <li class="breedcrumb__page-item">
                <a class="breedcrumb__page-link text--body-3">{{ __('package_details') }}</a>
            </li>
        </x-slot>
    </x-frontend.breedcrumb-component>
    <!-- breedcrumb section end  -->
    <section class="section benefits bgcolor--gray-10">
        <div class="container">
            <h2 class="text--heading-1 section__title">{{ __('package_details_and_benefits') }} </h2>
            <div class="row justify-content-center my-3">
                <div class="col-lg-12">
                    <div class="dashboard-card dashboard-card--benefits">
                        <h2 class="dashboard-card__title">{{ __('current_package_benefits') }}</h2>
                        <ul class="dashboard__benefits">
                            <li class="dashboard__benefits-left">
                                <ul>
                                    <li class="dashboard__benefits-item">
                                        <span class="icon">
                                            <x-svg.check-icon width="12" height="12" stroke="#3db83a" />
                                        </span>
                                        <p class="text--body-4">{{ __('post') }} {{ $package->amount_of_sms }}
                                            {{ __('sms') }}
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            @if (config('pesapal.active'))
                <div class="col-xl-6">
                    <div class="membership-card">
                        <div class="membership-card__icon" style="background-color: #e8f7ff">
                            <x-svg.paypal-icon />
                        </div>
                        <div class="membership-card__info">
                            <h2 class="membership-card__title text--body-1">{{ __('pesapal_payment') }}</h2>
                            <button id="pesapal_btn" class="mt-3 btn btn--lg price-plan__checkout-btn">
                                {{ __('pay_now') }}
                            </button>
                        </div>
                    </div>
                </div>
            @endif
        </div>
    </section>


    <form action="{{ route('paymentsuccess') }}" method="GET" class="d-none" id="pesapal-payment-form">
        @csrf
        <input type="hidden" name="plan_id" value="{{ $package->id }}">
        <input type="hidden" name="amount" value="{{ $package->price }}">
    </form>
@endsection
@section('frontend_script')
    <script>
        $('#pesapal_btn').on('click', function(e) {
            e.preventDefault();
            $('#pesapal-payment-form').submit();
        });
    </script>
@endsection
