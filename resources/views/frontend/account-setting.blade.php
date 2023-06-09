@extends('layouts.frontend.layout_one')

@section('title', __('account_setting'))

@section('content')
    <!-- breedcrumb section start  -->
    <x-frontend.breedcrumb-component :background="$cms->dashboard_account_setting_background">
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
                <a class="breedcrumb__page-link text--body-3">{{ __('settings') }}</a>
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
                    <div class="dashboard-setting">
                        <!-- Account Information -->
                        <div class="dashboard-setting__box account-information">
                            <h2 class="text--body-2-600">{{ __('account_information') }}</h2>
                            <form action="{{ route('frontend.profile') }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                @method('put')
                                <div class="user-info">
                                    <div class="img">
                                        <div class="img-wrapper">
                                            <img src="{{ $user->image_url }}" alt="user-img" id="image">
                                        </div>
                                        <input name="image"
                                            onchange="document.getElementById('image').src = window.URL.createObjectURL(this.files[0])"
                                            id="hiddenImgInput" type="file" hidden
                                            accept="image/png, image/jpg, image/jpeg" />
                                        <button onclick="$('#hiddenImgInput').click()" class="btn btn--bg text-white"
                                            type="button">{{ __('choose_image') }}</button>
                                    </div>
                                </div>
                                <div class="input-field__group">
                                    <div class="input-field">
                                        <x-forms.label name="full_name" for="Fname" />
                                        <input name="name" value="{{ $user->name }}" type="text"
                                            placeholder="{{ __('full_name') }}" id="Fname"
                                            class="@error('name') is-invalid border-danger @enderror">
                                        @error('name')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="input-field">
                                        <x-forms.label name="phone_number" for="telephonee" />
                                        <input name="phone" value="{{ $user->phone ? $user->phone : '' }}"
                                            type="tel" id="telephonee" placeholder="{{ __('phone') }}"
                                            class="@error('phone') is-invalid border-danger @enderror">
                                        @error('phone')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="input-field__group">
                                    <div class="input-field">
                                        <x-forms.label name="email" for="email" />
                                        <input name="email" value="{{ $user->email }}" type="email"
                                            placeholder="{{ __('email_address') }}" id="email"
                                            class="@error('email') is-invalid border-danger @enderror">
                                        @error('email')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                    <div class="input-field">
                                        <x-forms.label name="website_links_optional" for="web" />
                                        <input name="web" value="{{ $user->web ? $user->web : '' }}" type="text"
                                            placeholder="{{ __('website_url') }}" id="web"
                                            class="@error('web') is-invalid border-danger @enderror">
                                        @error('web')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <button class="btn" type="submit">{{ __('save_changes') }}</button>
                            </form>
                        </div>
                        <!-- Social Media -->
                        <form action="{{ route('frontend.social.update') }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="dashboard-setting__box change-password">
                                <h2 class="text--body-2-600">{{ __('social_media') }}</h2>
                                <div id="multiple_feature_part">
                                    <div class="input-field__group">
                                        <div class="input-field">
                                            <x-forms.label name="social_media" for="feature" />
                                            <div>
                                                <div class="input-field">
                                                    <select name="social_media[]"
                                                        class="form-control select-bg @error('social_media') border-danger @enderror">
                                                        <option value="" class="d-none">{{ __('select_one') }}</option>
                                                        <option value="facebook">Facebook</option>
                                                        <option value="twitter">Twitter</option>
                                                        <option value="instagram">Instagram</option>
                                                        <option value="youtube">Youtube</option>
                                                        <option value="linkedin">Linkedin</option>
                                                        <option value="pinterest">Pinterest</option>
                                                        <option value="reddit">Reddit</option>
                                                        <option value="github">Github</option>
                                                        <option value="website">Website</option>
                                                        <option value="other">Other</option>
                                                    </select>
                                                    @error('social_media')
                                                        <span class="invalid-feedback">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-field">
                                            <x-forms.label name="url" for="feature" />
                                            <div>
                                                <div class="input-field">
                                                    <input name="url[]" type="url"
                                                        placeholder="{{ __('url') }}" id="adname"
                                                        class="@error('title') border-danger @enderror" />
                                                </div>
                                            </div>
                                        </div>
                                        <a role="button" onclick="add_features_field()"
                                            class="btn bg-primary text-light"><i class="fas fa-plus"></i></a>
                                    </div>
                                    @foreach ($social_medias as $media)
                                    <div class="input-field__group">
                                        <div class="input-field">
                                            <x-forms.label name="social_media" for="feature" />
                                            <div>
                                                <div class="input-field">
                                                    <select name="social_media[]"
                                                        class="form-control select-bg @error('social_media') border-danger @enderror">
                                                        <option value="" class="d-none">{{ __('select_one') }}</option>
                                                        <option {{ $media->social_media == 'facebook' ? 'selected':''}} value="facebook">Facebook</option>
                                                        <option {{ $media->social_media == 'twitter' ? 'selected':''}} value="twitter">Twitter</option>
                                                        <option {{ $media->social_media == 'instagram' ? 'selected':''}} value="instagram">Instagram</option>
                                                        <option {{ $media->social_media == 'youtube' ? 'selected':''}} value="youtube">Youtube</option>
                                                        <option {{ $media->social_media == 'linkedin' ? 'selected':''}} value="linkedin">Linkedin</option>
                                                        <option {{ $media->social_media == 'pinterest' ? 'selected':''}} value="pinterest">Pinterest</option>
                                                        <option {{ $media->social_media == 'reddit' ? 'selected':''}} value="reddit">Reddit</option>
                                                        <option {{ $media->social_media == 'github' ? 'selected':''}} value="github">Github</option>
                                                        <option {{ $media->social_media == 'other' ? 'selected':''}} value="other">Other</option>
                                                    </select>
                                                    @error('social_media')
                                                        <span class="invalid-feedback">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-field">
                                            <x-forms.label name="url" for="feature" />
                                            <div>
                                                <div class="input-field">
                                                    <input name="url[]" type="url"
                                                        placeholder="{{ __('url') }}"
                                                        class="@error('title') border-danger @enderror" value="{{ $media->url }}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <a role="button" id="remove_item" class="btn bg-danger text-light"><i class="fas fa-times"></i></a>
                                    </div>
                                    @endforeach
                                </div>

                                <button class="btn" type="submit">
                                    {{ __('save_changes') }}
                                </button>
                            </div>
                        </form>
                        <!-- change Password -->
                        <div class="dashboard-setting__box change-password">
                            <h2 class="text--body-2-600">{{ __('change_password') }}</h2>
                            <form action="{{ route('frontend.password') }}" method="POST">
                                @csrf
                                @method('PUT')
                                <div class="input-field__group">
                                    <div class="input-field">
                                        <x-forms.label name="current_password" for="cpassword" />
                                        <input name="current_password" type="password"
                                            placeholder="{{ __('password') }}" id="cpassword"
                                            class="@error('current_password') is-invalid border-danger @enderror">
                                        @error('current_password')
                                            <span style="font-size: 12px" class="text-danger">{{ $message }}</span>
                                        @enderror
                                        <span class="icon icon--eye" onclick="showPassword('cpassword',this)"
                                            @error('current_password') style="top: 50%;" @enderror>
                                            <x-svg.eye-icon />
                                        </span>
                                    </div>
                                    <div class="input-field">
                                        <x-forms.label name="new_password" for="npassword" />
                                        <input name="password" type="password" placeholder="{{ __('password') }}"
                                            id="npassword" class="@error('password') is-invalid border-danger @enderror">
                                        @error('password')
                                            <span style="font-size: 12px" class="text-danger">{{ $message }}</span>
                                        @enderror

                                        <span class="icon icon--eye" onclick="showPassword('npassword',this)"
                                            @error('password') style="top: 50%;" @enderror>
                                            <x-svg.eye-icon />
                                        </span>
                                    </div>
                                    <div class="input-field">
                                        <x-forms.label name="confirm_password" for="confirmpass" />
                                        <input name="password_confirmation" type="password"
                                            placeholder="{{ __('password') }}" id="confirmpass"
                                            class="@error('password_confirmation') is-invalid border-danger @enderror">
                                        @error('password_confirmation')
                                            <span style="font-size: 12px" class="text-danger">{{ $message }}</span>
                                        @enderror

                                        <span class="icon icon--eye" onclick="showPassword('confirmpass',this)"
                                            @error('password_confirmation') style="top: 50%;" @enderror>
                                            <x-svg.eye-icon />
                                        </span>
                                    </div>
                                </div>
                                <button class="btn" type="submit">
                                    {{ __('save_changes') }}
                                </button>
                            </form>
                        </div>
                        <!-- Delete Account -->
                        <div class="dashboard-setting__box delete-account">
                            <h2 class="text--body-2-600">{{ __('delete_account') }}</h2>
                            <p class="delete-account__details text--body-3">
                                {{ __('delete_account_alert') }}
                            </p>
                            <form action="{{ route('frontend.account.delete', auth()->id()) }}" method="POST" onclick="return confirm('{{ __('are_you_sure') }}?')">
                                @csrf
                                @method('delete')
                                <button type="submit" class="btn btn-danger" style="background: #dc3545 !important;">
                                    <span class="icon--left">
                                        <x-svg.delete-icon />
                                    </span>
                                    {{ __('delete_account') }}
                                </button>
                            </form>
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
        .input-field .icon {
            top: 50% !important;
        }
    </style>
@endsection

@section('frontend_script')
    <script src="{{ asset('frontend') }}/js/plugins/passwordType.js"></script>
    <script type="text/javascript">
        // feature field
        function add_features_field() {
            $("#multiple_feature_part").append(`
            <div class="input-field__group">
                <div class="input-field">
                    <x-forms.label name="social_media" for="feature" />
                    <div>
                        <div class="input-field">
                            <select name="social_media[]"
                                class="form-control select-bg @error('social_media') border-danger @enderror">
                                <option value="" class="d-none">{{ __('select_one') }}</option>
                                <option value="facebook">Facebook</option>
                                <option value="twitter">Twitter</option>
                                <option value="instagram">Instagram</option>
                                <option value="youtube">Youtube</option>
                                <option value="linkedin">Linkedin</option>
                                <option value="pinterest">Pinterest</option>
                                <option value="reddit">Reddit</option>
                                <option value="github">Github</option>
                                <option value="website">Website</option>
                                <option value="other">Other</option>
                            </select>
                            @error('social_media')
                                <span class="invalid-feedback">{{ $message }}</span>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="input-field">
                    <x-forms.label name="url" for="feature" />
                    <div id="multiple_feature_part">
                        <div class="input-field">
                            <input name="url[]" type="url"
                                placeholder="{{ __('url') }}" id="adname"
                                class="@error('title') border-danger @enderror" />
                        </div>
                    </div>
                </div>
                <a role="button" id="remove_item"
                        class="btn bg-danger text-light"><i class="fas fa-times"></i></a>
            </div>
        `);
        }

        $(document).on("click", "#remove_item", function() {
            $(this).parent('div').remove();
        });
    </script>
@endsection
