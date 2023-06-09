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
    @php
        $sliders = DB::table('sliders')->where('status', 1)->get();
    @endphp

    <div class="banner banner--two text-center" style="background-image:url('{{ $cms->home_main_banner }}');">
        <div class="container">
            <div class="row d-none d-sm-block">
                <div class="col-12">
                    <h2 class="text--display-3 banner__title animate__animated animate__bounceInDown">
                        {{ $cms->home_title }}
                    </h2>
                    <p class="text--body-3 banner__brief">
                        {{ $cms->home_description }}
                    </p>
                </div>
            </div>
            <div class="row d-block d-sm-none">
                <div class="col-12">
                    <form action="{{ route('frontend.adlist.search') }}" method="GET">
                        <div class="mobile_search_box">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Ads tittle, keyword..." name="keyword" required="">
                                <button type="submit" class="input-type-text">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line><line x1="11" y1="8" x2="11" y2="14"></line><line x1="8" y1="11" x2="14" y2="11"></line></svg>
                            </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="main_content mb-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 d-none d-lg-block">
                    <div class="sidebar_left position-sticky" style="top:5rem;">
                        <div class="category_wrapper">
                            <ul class="category-menu">
                                @foreach ($categories as $category)
                                    <form method="GET" action="{{ route('frontend.adlist.search') }}" id="adFilterForm2" class="d-none">
                                        <input type="hidden" name="category" value="" id="adFilterInput2">
                                    </form>
                                    <li class="category-menu__dropdown__item">
                                        <a href="javascript:void(0)"
                                        onclick="adFilterFunctionTwo('{{ $category->slug }}')"
                                            class="category-menu__dropdown__link">
                                            <i class="category-icon {{ $category->icon }}" style="color: #b0b0b0"></i>
                                            {{ $category->name }}
                                            @if(count($category->subcategories) > 0)
                                                <span class="drop-icon">
                                                    <x-svg.category-right-icon />
                                                </span>
                                            @endif
                                        </a>
                                        @if (isset($category->subcategories))
                                            <ul class="category-menu__subdropdown">
                                                @foreach ($category->subcategories as $subcategory)

                                                    <form method="GET" action="{{ route('frontend.adlist.search') }}"
                                                        id="adFilterForm3" class="d-none">
                                                        <input type="hidden" name="subcategory[]" value=""
                                                            id="adFilterInput3">
                                                    </form>

                                                    <li class="category-menu__subdropdown__item">
                                                        <a href="javascript:void(0)"
                                                            onclick="adFilterFunctionThree('{{ $subcategory->slug }}')"
                                                            class="category-menu__subdropdown__link">
                                                            {{ $subcategory->name }}
                                                        </a>
                                                    </li>

                                                @endforeach
                                            </ul>
                                        @endif
                                    </li>
                                 @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">

                    <div class="sidebar_right">
                        <div class="banner_carousel mb-4">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    @foreach($sliders as $key => $slider)
                                        <div class="carousel-item @if($key == 0) active @endif">
                                            <div class="banner_img">
                                                <img src="{{ asset($slider->image) }}" class="d-block w-100" alt="{{$slider->name}}">
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 18l-6-6 6-6"/></svg>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 18l6-6-6-6"/></svg>
                                </button>
                            </div>
                        </div>

                        <section class="section popular-category d-block d-sm-none" style="padding-top: 0px !important; padding-bottom: 25px;">
                            <h2 class="text--heading-1 section__title">
                                        {{ __('popular_category') }}
                                </h2>
                            <div class="">
                                <div class="row g-2">
                                    @foreach ($topCategories as $category)
                                        <div class="col-4">
                                            <div class="category-card">
                                                <div class="category-card__icon">
                                                    <i class="{{ $category->icon }}" style="font-size: 40px"></i>
                                                </div>
                                                {{-- Filter Form --}}
                                                <form method="GET" action="{{ route('frontend.adlist.search') }}" id="adFilterForm"
                                                    class="d-none">
                                                    <input type="hidden" name="category" value="" id="adFilterInput">
                                                </form>
                                                <a href="javascript:void(0)" onclick="adFilterFunction('{{ $category->slug }}')">
                                                    <h5 class="text--body-2 category-card__title"> {{ $category->name }} </h5>
                                                </a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </section>

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
                            </section>
                        @endif

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
                            </section>
                        @endif

                    </div>
                </div>
            </div>
        </div>
    </div>

    <x-frontend.counter :totalAds="$totalAds" :verifiedUser="$verified_users" :proMember="$pro_members_count" :country="$country_location"></x-frontend.counter>

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