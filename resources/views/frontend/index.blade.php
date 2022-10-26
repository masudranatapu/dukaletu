@extends('layouts.frontend.layout_one')

@section('title', __('home'))

@section('frontend_style')
    @livewireStyles
@endsection

@section('meta')
    @php
    $data = metaData('home');
    @endphp

    <meta name="title" content="{{ $data->title }}">
    <meta name="description" content="{{ $data->description }}">

    <meta property="og:image" content="{{ $data->image_url }}" />
    <meta property="og:site_name" content="{{ config('app.name') }}">
    <meta property="og:title" content="{{ $data->title }}">
    <meta property="og:url" content="{{ route('frontend.index') }}">
    <meta property="og:type" content="article">
    <meta property="og:description" content="{{ $data->description }}">

    <meta name=twitter:card content={{ $data->image_url }} />
    <meta name=twitter:site content="{{ config('app.name') }}" />
    <meta name=twitter:url content="{{ route('frontend.index') }}" />
    <meta name=twitter:title content="{{ $data->title }}" />
    <meta name=twitter:description content="{{ $data->description }}" />
    <meta name=twitter:image content="{{ $data->image_url }}" />
@endsection

@section('content')
    <!-- banner section start  -->
    <div class="banner banner--two text-center" style="background-image:url('{{ asset($cms->home_main_banner) }}');">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="text--display-3 banner__title animate__animated animate__bounceInDown">
                        {{ $cms->home_title }}
                    </h2>
                    <p class="text--body-3 banner__brief">
                        {{ $cms->home_description }}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- banner section end   -->

    <div class="main_content mb-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 d-none d-lg-block">
                    <div class="sidebar_left position-sticky" style="top:5rem;">
                        <div class="category_wrapper">
                            <ul class="category-menu">
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Fashion <span>(100)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Electronices  <span>(75)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Services  <span>(58)</span>
                                        <span class="drop-icon">
                                            <x-svg.category-right-icon />
                                        </span>
                                    </a>
                                    <ul class="category-menu__subdropdown">
                                        <li class="category-menu__subdropdown__item">
                                            <a href="javascript:void(0)" class="category-menu__subdropdown__link">
                                                Subcategory Menu
                                            </a>
                                        </li>
                                        <li class="category-menu__subdropdown__item">
                                            <a href="javascript:void(0)" class="category-menu__subdropdown__link">
                                                Subcategory Menu
                                            </a>
                                        </li>
                                        <li class="category-menu__subdropdown__item">
                                            <a href="javascript:void(0)" class="category-menu__subdropdown__link">
                                                Subcategory Menu
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Collectables  <span>(01)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Music, Films  <span>(08)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Home & Garden  <span>(22)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Agriculture  <span>(16)</span>
                                    </a>
                                </li>
                                 <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Health & Beauty  <span>(01)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Diy, Prep, Tools  <span>(08)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Sports  <span>(22)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Vehicles  <span>(16)</span>
                                    </a>
                                </li>
                                 <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Property  <span>(01)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Category  <span>(08)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Category  <span>(22)</span>
                                    </a>
                                </li>
                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon fa fa-list" style="color: #b0b0b0"></i>
                                        Category  <span>(16)</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="sidebar_right">

                     <!-- Slider banner -->
                     <div class="banner_carousel mb-4">
                         <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                              <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="banner_img">
                                        <img src="{{ asset('1.jpg') }}" class="d-block w-100" alt="image">
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="banner_img">
                                        <img src="{{ asset('2.jpg') }}" class="d-block w-100" alt="image">
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="banner_img">
                                        <img src="{{ asset('3.jpg') }}" class="d-block w-100" alt="image">
                                    </div>
                                </div>
                              </div>
                              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 18l-6-6 6-6"/></svg>
                              </button>
                              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 18l6-6-6-6"/></svg>
                              </button>
                        </div>
                     </div>
                     <!-- Slider banner -->



                        <!-- recent-post section start  -->
                        @if ($settings->featured_ads_homepage)
                            <section class="section recent-post">
                                    <h2 class="text--heading-1 section__title">
                                        {{ __('featured_ads') }}
                                    </h2>
                                    <div class="row">
                                        @forelse ($recommendedAds as $ad)
                                            <x-frontend.single-ad :ad="$ad" :adfields="$ad->productCustomFields" className="col-xl-3 col-md-4 col-sm-6" />
                                        @empty
                                            <x-no-data-found />
                                        @endforelse
                                    </div>
                                    {{--  
                                        @if (count($recommendedAds) > 0)
                                            <div class="recent-post__btn">
                                                <a href="{{ route('frontend.adlist') }}" class="btn">
                                                    {{ __('view_all') }}
                                                    <span class="icon--right">
                                                        <x-svg.right-arrow-icon />
                                                    </span>
                                                </a>
                                            </div>
                                        @endif
                                    --}}
                            </section>
                        @endif
                        <!-- recent-post section end -->

                        <!-- recent-post section start  -->
                        @if ($settings->regular_ads_homepage)
                            <section class="section recent-post">
                                    <h2 class="text--heading-1 section__title">
                                        {{ __('regular_ads') }}
                                    </h2>
                                    <div class="row">
                                        @forelse ($latestAds as $ad)
                                             <x-frontend.single-ad :ad="$ad" :adfields="$ad->productCustomFields ?? ''" className="col-xl-3 col-md-4" />
                                        @empty
                                            <x-no-data-found />
                                        @endforelse
                                    </div>
                                    {{-- 
                                        @if (count($latestAds) > 0)
                                            <div class="recent-post__btn">
                                                <a href="{{ route('frontend.adlist') }}" class="btn">
                                                    {{ __('view_all') }}
                                                    <span class="icon--right">
                                                        <x-svg.right-arrow-icon />
                                                    </span>
                                                </a>
                                            </div>
                                        @endif
                                     --}}
                            </section>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <!-- recent-post section end -->

    <!-- top-category section start  -->

    <!-- <section class="section top-category bgcolor--gray-10">
        <div class="container">
            <h2 class="text--heading-1 section__title">
                {{ __('top_category') }}
            </h2>
            <div class="row">
                @forelse ($topCategories as $category)
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="categorylist-card">
                            <div class="categorylist-card__top">
                                <div class="categorylist-card__top-left">
                                    <h2 class="categorylist-card__title text--body-2-600">
                                        <a
                                            href="{{ route('frontend.adlist', ['category' => $category->slug]) }}">{{ $category->name }}</a>
                                    </h2>
                                    <span
                                        class="categorylist-card__item-available">({{ $category->ad_count ?? 0 }})</span>
                                </div>
                                <div class="categorylist-card__top-right">
                                    <div class="categorylist-card__icon">
                                        <i class="{{ $category->icon }}" style="font-size: 55px"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="categorylist-card__bottom">
                                <ul class="categorylist-card__list">

                                    {{-- Filter Form 1 --}}
                                    <form method="GET" action="{{ route('frontend.adlist.search') }}" id="adFilterForm"
                                        class="d-none">
                                        <input type="hidden" name="subcategory[]" value="" id="adFilterInput">
                                    </form>
                                    @forelse ($category->subcategories as $subcategory)
                                        <li class="categorylist-card__list-item">
                                            <a href="javascript:void(0)"
                                                onclick="adFilterFunction('{{ $subcategory->slug }}')"
                                                class="categorylist-card__list-link text--body-3">
                                                <span class="icon">
                                                    <x-svg.right-regular-icon />
                                                </span>
                                                {{ $subcategory->name }}
                                            </a>
                                        </li>
                                    @empty
                                        <div class="text-center">
                                            {{ __('no_subcategory_found') }}
                                        </div>
                                    @endforelse
                                </ul>
                            </div>
                        </div>
                    </div>
                @empty
                    <x-no-data-found />
                @endforelse
            </div>
        </div>
    </section> -->
    <!-- top-category section end  -->

    {{-- <!-- popular-loc section start  -->
   <!--  <section class="section popular-location">
        <div class="container">
            <h2 class="text--heading-1 section__title">
                {{ __('popular_location') }}
            </h2>
            <div class="row">
                @forelse ($topCountry as $country)
                    <div class="col-xl-3 col-md-6">
                        <x-frontend.location.single-popular-location :country="$country">
                        </x-frontend.location.single-popular-location>
                    </div>
                @empty
                    <x-no-data-found />
                @endforelse
            </div>
        </div>
    </section> -->
    <!-- popular-loc section end --> --}}

    <x-frontend.counter :totalAds="$totalAds" :verifiedUser="$verified_users" :proMember="$pro_members_count" :country="$country_location"></x-frontend.counter>

    <!-- download section start  -->
    {{--  
    @if ($mobile_setting->ios_download_url || $mobile_setting->android_download_url)
        <section class="download section pb-lg-0">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <img src="{{ $cms->home_mobile_app_banner }}" class="download__img-content w-100" />
                    </div>
                    <div class="col-lg-6">
                        <div class="download__content">
                            <h2 class="download__title text--heading-1">{{ __('download_our_mobile_app') }}</h2>
                            <p class="download__brief text--body-2">
                                {{ $cms->download_app }}
                            </p>
                            <div class="download__apps-store">
                                @if ($mobile_setting->android_download_url)
                                    <a target="_blank" href="{{ asset($mobile_setting->android_download_url) }}"
                                        class="app">
                                        <div class="app-logo">
                                            <x-svg.google-play-icon />
                                        </div>
                                        <div class="app-info">
                                            <h5 class="text--body-5">{{ __('get_it_now') }}</h5>
                                            <h2 class="text--body-3-600">{{ __('google_play') }}</h2>
                                        </div>
                                    </a>
                                @endif

                                @if ($mobile_setting->ios_download_url)
                                    <a target="_blank" href="{{ asset($mobile_setting->ios_download_url) }}"
                                        class="app">
                                        <div class="app-logo">
                                            <x-svg.apple-icon />
                                        </div>
                                        <div class="app-info">
                                            <h5 class="text--body-5">{{ __('get_it_now') }}</h5>
                                            <h2 class="text--body-3-600">{{ __('app_store') }}</h2>
                                        </div>
                                    </a>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
    --}}

    @if ($newsletter_enable)
        @include('layouts.frontend.partials.newsletter')
    @endif
@endsection

@section('frontend_script')
    <script type="module" src="{{ asset('frontend') }}/js/plugins/purecounter.js"></script>
    @stack('newslater_script')
    <script>
        // for filter form-1
        function adFilterFunction(slug) {
            $('#adFilterInput').val(slug);
            $('#adFilterForm').submit();
        }

        // for filter form-2
        function adFilterFunctionTwo(slug) {
            $('#adFilterInput2').val(slug);
            $('#adFilterForm2').submit();
        }

        // for filter form-3
        function adFilterFunctionThree(slug) {
            $('#adFilterInput3').val(slug);
            $('#adFilterForm3').submit();
        }
    </script>

    

@endsection
