@extends('layouts.frontend.layout_one')

@section('title', __('price_and_billing'))

@php

    $phone_numbers = request()->get('phone_number');

@endphp

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
                <a class="breedcrumb__page-link text--body-3">{{ __('sms_merketing') }}</a>
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
                                    <h2 class="dashboard-card__title">{{ __('sms_merketing') }}</h2>
                                    <ul class="dashboard__benefits">

                                        <li class="dashboard__benefits-right">
                                            <ul>
                                                <li class="dashboard__benefits-item">
                                                    <span class="icon">
                                                        <x-svg.check-icon width="12" height="12" stroke="#3db83a" />
                                                    </span>
                                                    <p class="text--body-4">{{ __('sms_remaining') }}
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
                                                        <span
                                                            class="text-danger">{{ $currentPackage->smsPlan->name }}</span>
                                                        <span
                                                            title="Expire date">({{ date('d M, Y', strtotime($last_sms_purchase->expire_date)) }})</span>
                                                    </p>

                                                </li>
                                            </ul>
                                        </li>
                                        <li class="dashboard__benefits-right my-2">
                                            <ul>
                                                <li
                                                    class="dashboard__benefits-item d-flex justify-content-lg-end justify-content-sm-start">
                                                    <a href="{{ route('frontend.user-phoneBook') }}"
                                                        class="btn btn--lg">Phone Book
                                                        ({{ count($userPhoneBooks) ?? 0 }})</a>
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

                                    <div class="tab-content dashboard-post__content" id="pills-tabContent">
                                        <!-- Step 01 -->
                                        <div class="tab-pane fade show active" id="pills-basic" role="tabpanel"
                                            aria-labelledby="pills-basic-tab">
                                            <div class="dashboard-post__information step-information">

                                                <form action="{{ route('frontend.smsMarketing.sendSms') }}" method="post">
                                                    @csrf
                                                    <div class="dashboard-post__information-form">

                                                        <div class="input-select">
                                                            <x-forms.label name="Mobile number" required="true"
                                                                for="numbers" />
                                                            <select required name="numbers[]" id="numbers"
                                                                multiple="multiple"
                                                                class="form-control select-bg @error('numbers') border-danger @enderror">
                                                                @if (isset($userPhoneBooks))
                                                                    @foreach ($userPhoneBooks as $userPhoneBook)
                                                                        <option value="{{ $userPhoneBook->phone_number }}"
                                                                            @if (isset($phone_numbers) && count($phone_numbers) > 0) @if (in_array($userPhoneBook->phone_number, $phone_numbers))
                                                                             selected @endif
                                                                            @endif

                                                                            >
                                                                            {{ $userPhoneBook->phone_number }}
                                                                        </option>
                                                                    @endforeach
                                                                @endif
                                                            </select>
                                                            <span class="text-success">You can choose multiple number from
                                                                your phone book or write your number and press enter one by
                                                                one. without country code (+254)</span>
                                                            @error('numbers')
                                                                <span class="text-danger">{{ $message }}</span>
                                                            @enderror

                                                        </div>

                                                        <div class="input-field__group">
                                                            <div class="input-field--textarea">
                                                                <x-forms.label name="Message" for="description" />
                                                                <textarea required name="description" placeholder="{{ __('message') }}..." id="description"
                                                                    class="@error('description') border-danger @enderror"></textarea>
                                                                @error('description')
                                                                    <span class="text-danger">{{ $message }}</span>
                                                                @enderror

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
                    @else
                        <div class="dashboard-card">
                            <div class="dashboard-card__title">
                                {{ __('sms_merketing') }}
                            </div>
                            <hr>
                            <div class="dashboard-post_content d-flex justify-content-center align-items-center"
                                style="height: 65vh;">
                                <a href="{{ route('frontend.smsPricePlan') }}" class="btn">Purchase Package</a>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </section>
    <!-- dashboard section end  -->

    @if (Session::has('phone_number'))
        @for ($i = 0; $i < count(Session::get('phone_number')); $i++)
        @endfor
    @endif

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

    <link rel="stylesheet" href="{{ asset('backend/css/select2.min.css') }}">
@endsection


@section('frontend_script')
    <script src="{{ asset('backend/js/select2.min.js') }}"></script>
    <script>
        $(document).ready(function() {
            $('#numbers').select2({
                placeholder: "ex:203892212",
                allowClear: true,
                tags: true,
                maximumSelectionLength: 20
            });
        });
    </script>
    {{-- <script>
        $('#file-upload').submit(function(e) {
            e.preventDefault();
            var spinner =
                '<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>';
            $('#submitBtn').html(spinner).attr('disabled', true);
            let formData = new FormData(this);
            var fileInput =
                document.getElementById('file');

            var filePath = fileInput.value;


            console.log(filePath);


            if (filePath.length > 0) {
                $('#file-validation').html("");

                $.ajax({
                    type: 'POST',
                    url: "{{ route('frontend.sms-marketing-getNumber') }}",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: (response) => {
                        if (response) {
                            this.reset();
                            $('#submitBtn').html("upload").attr('disabled', false);
                            var mobileData = response.map((value, index) => {
                                return {
                                    id: value.phone_number,
                                    text: value.phone_number,
                                    selected: true
                                };
                            })
                            const uniqueNumber = [...new Map(mobileData.map((m) => [m.id, m]))
                                .values()
                            ];
                            console.log(uniqueNumber);

                            $('#numbers').select2({
                                data: uniqueNumber,
                                placeholder: "Select or write a number",
                                allowClear: true,
                                debug: true
                            });
                        }
                    },
                    error: function(response) {

                        $('#submitBtn').html("upload").attr('disabled', false);

                    }

                });
            } else {
                $('#file-validation').html("Please select a file");
                $('#submitBtn').html("upload").attr('disabled', false);

            }


        });
    </script> --}}

@endsection
