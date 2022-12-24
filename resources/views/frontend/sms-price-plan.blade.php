@extends('layouts.frontend.layout_one')

@section('title', __('price_and_plan'))

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
        {{ __('price_plan') }}
        <x-slot name="items">
            <li class="breedcrumb__page-item">
                <a class="breedcrumb__page-link text--body-3">{{ __('price_plan') }}</a>
            </li>
        </x-slot>
    </x-frontend.breedcrumb-component>
    <!-- breedcrumb section end  -->

    <!-- price-plan section start  -->
    <section class="section price-plan">
        <div class="container">
            <h2 class="price-plan__title text--heading-1">{{ __('get_sms_right_now') }}</h2>
            {{-- <p class="price-plan__brief text--body-3">
                Lorem ipsum dolor sit amet consectetur
            </p> --}}
            <div class="tab-content" id="nav-tabContent">
                <!-- Monthly -->
                <div class="tab-pane fade show active" id="nav-monthly" role="tabpanel" aria-labelledby="nav-monthly-tab">
                    <div class="row">
                        @forelse ($packages as $package)
                            <div class="col-xl-4 col-lg-6">
                                <div class="plan-card">
                                    <div class="plan-card__top">
                                        <h2 class="plan-card__title text--body-1"> {{ $package->name }} </h2>
                                        {{-- <p class="plan-card__description">
                                            {{ $package->description }}
                                        </p> --}}
                                        <div class="plan-card__price">
                                            <h3 style="color: #3db83a;">{{ $package->amount_of_sms }} SMS
                                                 / <small style="font-size: 16px;" >{{ changeCurrency($package->price) }}</small>
                                                </h3>
                                        </div>
                                        @if (auth('user')->check())
                                            <a href="{{ route('frontend.smsPriceplanDetails', ['package' => $package->id]) }}"
                                                class="plan-card__select-pack btn btn--bg w-100 text-white">
                                                {{ __('choose_plan') }}
                                                <span class="icon--right">
                                                    <x-svg.right-arrow-icon />
                                                </span>
                                            </a>
                                        @else
                                            <a href="{{ route('users.login') }}"
                                                class="plan-card__select-pack btn btn--bg w-100 login_required text-white">
                                                {{ __('choose_plan') }}
                                                <span class="icon--right">
                                                    <x-svg.right-arrow-icon />
                                                </span>
                                            </a>
                                        @endif
                                    </div>
                                    {{-- <div class="plan-card__bottom">
                                        <div class="plan-card__package">
                                            <div class="plan-card__package-list active">
                                                <span class="icon">
                                                    <x-svg.check-icon />
                                                </span>
                                                <h5 class="text--body-3">{{ __('post') }} {{ $package->amount_of_sms }}
                                                    {{ __('sms') }}</h5>
                                            </div>
                                        </div>
                                    </div> --}}
                                </div>
                            </div>

                        @empty
                            <x-no-data-found />
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- price-plan section end  -->
@endsection

@section('frontend_script')
    <script type="module" src="{{ asset('frontend') }}/js/plugins/bvselect.js"></script>
@endsection
