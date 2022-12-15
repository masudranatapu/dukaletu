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
                                                    <span class="text-danger">{{ $currentPackage->smsPlan->name }}</span>
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dashboard__benefits-right">
                                        <ul class="float-end">
                                            <li class="dashboard__benefits-item my-2">

                                                <p class="text--body-4 "><a href="{{ asset('frontend/csv/demo.csv') }}"
                                                        download=""
                                                        class="btn btn-main">{{ __('demo_csv_download') }}</a>
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <hr>



                                <div class="accordion accordion-flush" id="accordionFlushExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="flush-headingOne">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
                                                aria-expanded="false" aria-controls="flush-collapseOne">
                                                {{ __('upload_csv_file') }}
                                            </button>
                                        </h2>
                                        <div id="flush-collapseOne" class="accordion-collapse collapse "
                                            aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                            <div class="accordion-body">
                                                <form action="{{ route('frontend.sms-marketing-getNumber') }}"
                                                    method="POST" id="file-upload" enctype="multipart/form-data">
                                                    @csrf
                                                    <div class="input-group">
                                                        <input type="file" name="file" class="form-control"
                                                            id="file" aria-describedby="#submitBtn"
                                                            aria-label="Upload Csv">
                                                        <button class="btn btn--lg" type="submit"
                                                            id="submitBtn">{{ __('upload_csv_file') }}</button>
                                                    </div>
                                                    <span class="text-danger" id="file-validation"></span>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="flush-headingTwo">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
                                                aria-expanded="true" aria-controls="flush-collapseTwo">
                                                {{ __('save_your_number_to_phonebook') }}
                                            </button>
                                        </h2>
                                        <div id="flush-collapseTwo" class="accordion-collapse collapse show"
                                            aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                            <div class="accordion-body">
                                                <form action="{{ route('frontend.user-phoneBook.store') }}" method="POST"
                                                    id="file-upload" enctype="multipart/form-data">
                                                    @csrf
                                                    <div class="input-group">
                                                        <input type="hidden" name="page"
                                                            value="{{ request()->page ?? 1 }}">
                                                        <input type="tel" required
                                                            oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');"
                                                            class="form-control" id="file"
                                                            aria-describedby="#submitBtn" name="phone"
                                                            value="{{ old('phone') }}" placeholder="ex:203892212">
                                                        <button class="btn btn--lg" type="submit"
                                                            id="submitBtn">{{ __('save') }}</button>
                                                    </div>
                                                    <span class="text-success">
                                                        <p>Please enter 9-digit phone number without country code (+254)
                                                        </p>
                                                    </span>
                                                    @error('phone')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form action="{{ route('frontend.sms-marketing') }}" method="GET" >
                    <div class="row dashboard__bill-three">
                        <div class="col-lg-12">
                            <div class="invoice-table">
                                <h4>{{ __('phone_book') }} <button type="submit" class="btn btn-sm btn-success float-end ">Send bulk</button> </h4>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>{{ __('phone_number') }}</th>
                                            <th class="float-end">{{ __('Action') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($userPhoneBooks as $phoneBooks)
                                            <tr>
                                                <td>
                                                    <input type="checkbox" name="phone_number[]" value="{{ $phoneBooks->phone_number }}" />
                                                    {{ $loop->iteration }}</td>
                                                <td>{{ $phoneBooks->phone_number }}</td>
                                                <td class="">

                                                    <div class="d-flex justify-content-end">
                                                        <a class="btn-sm mx-1"
                                                            href="{{ route('frontend.sms-marketing', ['phone_number[]' => $phoneBooks->phone_number, 'page' => request()->page ?? 1]) }}"
                                                            class="">{{ __('send_message') }}</a>


                                                        <a  class="btn-sm mx-1" href="{{ route('frontend.user-phoneBook.destroy', ['userPhoneBook' => $phoneBooks->id, 'page' => request()->page ?? 1 ]) }}" onclick="return confirm('Are you sure?')">Delete</a>
                                                    </div>

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
                </form>

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


@section('frontend_script')


    <script>
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
                            console.log(response);
                            this.reset();
                            $('#submitBtn').html("upload").attr('disabled', false);
                            location.reload();
                            toastr.success('Contact upload successfully');
                            // var mobileData = response.map((value, index) => {
                            //     return {
                            //         id: value.phone_number,
                            //         text: value.phone_number,
                            //         selected: true
                            //     };
                            // })
                            // const uniqueNumber = [...new Map(mobileData.map((m) => [m.id, m]))
                            //     .values()
                            // ];
                            // console.log(uniqueNumber);

                            // $('#numbers').select2({
                            //     data: uniqueNumber,
                            //     placeholder: "Select a Number",
                            //     allowClear: true,
                            //     debug: true
                            // });

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
    </script>

@endsection
