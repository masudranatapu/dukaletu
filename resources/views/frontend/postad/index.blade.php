@extends('layouts.frontend.layout_one')

@section('title', __('ad_post'))

@section('content')
    <!-- breedcrumb section start  -->
    <x-frontend.breedcrumb-component :background="$cms->dashboard_post_ads_background">
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
                <a class="breedcrumb__page-link text--body-3">{{ __('post_ads') }}</a>
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
                    <div class="dashboard-post">
                        <ul class="nav dashboard-post__nav mb-3">
                            {{-- Step 1 --}}
                            @if (request()->route()->getName() === 'frontend.post')
                                <a href="{{ route('frontend.post') }}">
                                    <x-frontend.ad.ad-step />
                                </a>
                            @else
                                <button disabled>
                                    <x-frontend.ad.ad-step />
                                </button>
                            @endif

                            {{-- Step 2 --}}
                            @if (request()->route()->getName() === 'frontend.post.step2')
                                <a href="{{ route('frontend.post.step2') }}">
                                    <x-frontend.ad.ad-step2 />
                                </a>
                            @else
                                <button disabled>
                                    <x-frontend.ad.ad-step2 />
                                </button>
                            @endif

                            {{-- Step 3 --}}
                            @if (request()->route()->getName() === 'frontend.post.step3')
                                <a href="{{ route('frontend.post.step3') }}">
                                    <x-frontend.ad.ad-step3 />
                                </a>
                            @else
                                <button disabled>
                                    <x-frontend.ad.ad-step3 />
                                </button>
                            @endif
                        </ul>
                        <div class="tab-content dashboard-post__content" id="pills-tabContent">
                            @yield('post-ad-content')
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @isset($ad->category_id)
            <input type="hidden" id="cat_id" value="{{ $ad->category_id }}">
        @else
            <input type="hidden" id="cat_id" value="">
        @endisset

        @isset($ad->subcategory_id)
            <input type="hidden" id="subct_id" value="{{ $ad->subcategory_id }}">
        @else
            <input type="hidden" id="subct_id" value="">
        @endisset
    </section>
    <!-- dashboard section end  -->
@endsection

@section('frontend_script')
    <script src="{{ asset('frontend') }}/js/axios.min.js"></script>
    <script>
        // session category wise subcategory
        var cat_id = document.getElementById('cat_id').value;
        var subct_id = document.getElementById('subct_id').value;

        if (cat_id) {
            cat_wise_subcat(cat_id)
        }
        // Brand
        $(document).ready(function(){
            var is_show_brand = $('#ad_category').find('option:selected').attr('data-is_show_brand');
            if (is_show_brand == '1') {
                $('#brand_div').show();
            } else {
                $('#brand_div').hide();
            }

        });

        // Category wise subcategories
        $('#ad_category').on('change', function() {
            var categoryID = $(this).val();
            var is_show_brand = $(this).find('option:selected').attr('data-is_show_brand');

            if (is_show_brand == '1') {
                $('#brand_div').show();
            } else {
                $('#brand_div').hide();
            }
            if (categoryID) {
                cat_wise_subcat(categoryID);
            }
        });


        // cat wise subcat function
        function cat_wise_subcat(categoryID) {
            axios.get('/get-sub-categories/' + categoryID).then((res => {
                if (res.data) {
                    $('#ad_subcategory').empty();
                    $.each(res.data, function(key, subcat) {
                        var matched = parseInt(subct_id) === subcat.id ? true : false

                        $('select[name="subcategory_id"]').append(
                            `<option ${matched ? 'selected':''} value="${subcat.id}">${subcat.name}</option>`
                        );
                    });
                } else {
                    $('#ad_subcategory').empty();
                }
            }))
        }
    </script>

    @stack('post-ad-scripts')
    @yield('post-ad-scripts')
@endsection

@section('frontend_style')
    <link rel="stylesheet" href="{{ asset('backend/css/zakirsoft.css') }}">
@endsection
