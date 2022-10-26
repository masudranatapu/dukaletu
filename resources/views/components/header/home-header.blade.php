<header class="header header--two" id="sticky-menu">
    <div class="navigation-bar__top">
        <div class="container">
            <div class="navigation-bar">
                <div class="d-flex align-items-center">
                    <button class="toggle-icon  ">
                        <span class="toggle-icon__bar"></span>
                        <span class="toggle-icon__bar"></span>
                        <span class="toggle-icon__bar"></span>
                    </button>
                    <!-- Brand Logo -->
                    <a href="{{ route('frontend.index') }}" class="navigation-bar__logo">
                        <img src="{{ $settings->logo_image_url }}" alt="brand-logo" class="logo-dark">
                    </a>
                </div>
                <!-- Search Field -->
                <form action="{{ route('frontend.adlist.search') }}" method="GET">
                    <div class="navigation-bar__search-field">
                        <input type="text" placeholder="{{ __('ads_title_keyword') }}..." name="keyword" />
                        <button type="submit" class="navigation-bar__search-icon">
                            <!-- <x-svg.search-icon /> -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line><line x1="11" y1="8" x2="11" y2="14"></line><line x1="8" y1="11" x2="14" y2="11"></line></svg>
                        </button>
                    </div>
                </form>
                <!-- Action Buttons -->
                <div class="navigation-bar__buttons">
                    @if (auth('user')->check())
                        @php
                            $unread_messages = App\Models\Messenger::where('to_id', auth('user')->id())
                                ->where('body', '!=', '.')
                                ->where('read', 0)
                                ->count();
                        @endphp


                        <div class="navigation_icon d-none d-sm-block">
                            <a href="{{ route('frontend.favourites') }}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg>
                            </a>

                            <a href="{{ route('frontend.message') }}">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 17H2a3 3 0 0 0 3-3V9a7 7 0 0 1 14 0v5a3 3 0 0 0 3 3zm-8.27 4a2 2 0 0 1-3.46 0"></path></svg>
                            </a>
                        </div>



                        <a href="{{ route('frontend.dashboard') }}" class="user position-relative">
                            <div class="user__img-wrapper">
                                <img src="{{ auth('user')->user()->image_url }}"
                                    style="width: 40px; height: 40px; border-radius: 50%" alt="User Image">
                            </div>

                            <span id="unread_count_custom3"
                                class="text-danger unread-message-img {{ $unread_messages ? '' : 'd-none' }}"
                                amount="{{ $unread_messages }}">
                                {{ $unread_messages }}
                            </span>
                        </a>
                        <a href="{{ route('frontend.post') }}" class="btn login_required">
                            <!-- <span class="icon--left">
                                <x-svg.image-select-icon />
                            </span> -->
                            {{ __('post_ads') }}
                        </a>
                    @else

                        <div class="signin_btn d-none d-sm-block">
                            <a href="{{ route('users.login') }}" class="">{{ __('sign_in') }}</a>
                                <span>|</span>
                            <a href="{{ route('frontend.signup') }}" class="">{{ __('Register') }}</a>
                        </div>


                        <a href="{{ route('users.login') }}" class="ms-3 btn login_required">
                            <!-- <span class="icon--left">
                                <x-svg.image-select-icon />
                            </span> -->
                            {{ __('post_ads') }}
                        </a>
                    @endif
                </div>
                <!-- Responsive Navigation Menu  -->
                <x-frontend.responsive-menu />
            </div>
        </div>
    </div>


    {{-- <div class="navigation-bar__bottom-wrap">
        <div class="container navigation-bar__bottom justify-content-between">
            <div class="d-flex align-items-center">
                <ul class="category-menu">
                    <li class="category-menu__item">
                        <a href="#" class="category-menu__link">
                            {{ __('all_categories') }}
                            <span class="icon">
                                <x-svg.category-arrow-icon />
                            </span>
                        </a>
                        <ul class="category-menu__dropdown">
                            @foreach ($categories as $category)

                                <form method="GET" action="{{ route('frontend.adlist.search') }}"
                                    id="adFilterForm2" class="d-none">
                                    <input type="hidden" name="category" value="" id="adFilterInput2">
                                </form>

                                <li class="category-menu__dropdown__item">
                                    <a href="javascript:void(0)"
                                        onclick="adFilterFunctionTwo('{{ $category->slug }}')"
                                        class="category-menu__dropdown__link">
                                        <i class="category-icon {{ $category->icon }}" style="color: #66CCFF"></i>
                                        {{ $category->name }}
                                        @if ($category->subcategories->count() > 0)
                                            <span class="drop-icon">
                                                <x-svg.category-right-icon />
                                            </span>
                                        @endif
                                    </a>
                                    @if ($category->subcategories->count() > 0)
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
                    </li>
                </ul>
            </div>

           <x-frontend.language-switcher />


        </div>
    </div> --}}

</header>


