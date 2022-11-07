<div class="col-md-8 col-lg-6 col-xl-5">
    <div class="registration-form">
        <h2 class="text-center text--heading-1 registration-form__title">{{ __('sign_up') }}</h2>
        {{-- Social Login --}}
        <x-auth.social-login />

        <div class="registration-form__wrapper">
            <form action="{{ route('customer.register') }}" method="POST">
                @csrf
                <div class="input-field">
                    <input value="{{ old('name') }}" type="text" placeholder="{{ __('full_name') }}" name="name"
                        class="@error('name') is-invalid border-danger @enderror" />
                    @error('name')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="input-field">
                    <input value="{{ old('username') }}" type="text" placeholder="{{ __('username') }}"
                        name="username" class="@error('username') is-invalid border-danger @enderror" />
                    @error('username')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="input-field">
                    <input value="{{ old('email', request('email')) }}" type="email"
                        placeholder="{{ __('email_address') }}" name="email"
                        class="@error('email') is-invalid border-danger @enderror" />
                    @error('email')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>

                <div class="input-field">

                    <div class="input-group">

                        <input type="text" value="{{ old('phone', request('phone')) }}"
                            class="form-control @error('phone') is-invalid border-danger @enderror"
                            placeholder="Phone Number" aria-label="Phone" id="phone"
                            aria-describedby="button-addon2" name="phone">
                        <button class="btn btn--lg" type="button" id="button-addon2"
                            onclick="verifyPhone()">{{ __('verify') }}</button>
                    </div>
                    <span class="text-danger" id="invalidPhone"></span>
                    @error('phone')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                    @error('otp')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="input-field" id="otpSection">

                    <div class="input-group">

                        <div id="otp" class=" inputs d-flex flex-row justify-content-center mt-2">
                            <input class="m-2 text-center form-control rounded w-25" type="text" id="first"
                                maxlength="1" name="otp[]" />
                            <input class="m-2 text-center form-control rounded w-25" type="text" id="second"
                                maxlength="1" name="otp[]" />
                            <input class="m-2 text-center form-control rounded w-25"
                                type="text" id="third" maxlength="1" name="otp[]" />
                            <input class="m-2 text-center form-control rounded w-25" type="text" id="fourth"
                                maxlength="1" name="otp[]" />
                            <input class="m-2 text-center form-control rounded w-25"
                                type="text" id="fifth" maxlength="1" name="otp[]" />
                            <input class="m-2 text-center form-control rounded w-25" type="text" id="sixth"
                                maxlength="1" name="otp[]" />
                        </div>
                        <div class="mt-4 text-center">
                            <button class="btn px-4 validate">Validate</button>
                            <span class="fw-bold text-center" id="coundown"></span>
                        </div>
                    </div>
                    @error('phone')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>


                <div class="input-field">
                    <input type="password" name="password" placeholder="{{ __('password') }}" id="password"
                        class="@error('password') is-invalid border-danger @enderror" />
                    <span class="icon icon--eye {{ $errors->has('password') ? 'height-45' : '' }}"
                        onclick="showPassword('password',this)">
                        <x-svg.eye-icon />
                    </span>
                    @error('password')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>
                <div class="input-field">
                    <input type="password" name="password_confirmation" placeholder="{{ __('confirm_password') }}"
                        id="cpassword" class="@error('password_confirmation') is-invalid border-danger @enderror" />
                    <span class="icon icon--eye {{ $errors->has('password_confirmation') ? 'height-45' : '' }}"
                        onclick="showPassword('cpassword',this)">
                        <x-svg.eye-icon />
                    </span>
                    @error('password_confirmation')
                        <span class="text-danger">{{ $message }}</span>
                    @enderror
                </div>

                <div class="registration-form__option">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="checkme" />
                        <label class="form-check-label" for="checkme">
                            {{ __('read_agree') }} <a
                                href="{{ route('frontend.privacy') }}">{{ __('privacy_policy') }}</a>
                            {{ __('and') }}
                            <a href="{{ route('frontend.terms') }}">
                                {{ __('terms_conditions') }}
                            </a>
                        </label>
                    </div>
                </div>
                <button class="btn  w-100 registration-form__btns" type="submit">
                    {{ __('sign_up') }}
                    <!-- <span class="icon--right">
                        <x-svg.right-arrow-icon stroke="#fff" />
                    </span> -->
                </button>
                <p class="text--body-3 registration-form__redirect">{{ __('have_account') }} ? <a
                        href="{{ route('users.login') }}">{{ __('sign_in') }}</a></p>
            </form>
        </div>
    </div>
</div>
@push('component_style')
    <style>
        .height-45 {
            height: 45px !important;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            margin: 0
        }
    </style>
@endpush

@push('component_script')
    <script src="{{ asset('frontend/js/axios.min.js') }}"></script>
    <script>
        $('document').ready(function() {
            $('#otpSection').hide();
        })

        function verifyPhone() {
            let phone = $('input[name="phone"]').val();



            if (phone == null || phone == "") {
                $('#invalidPhone').html("Phone number can't be empty");
            } else {

                $('#invalidPhone').html("");

                $('#button-addon2').attr('disabled', true);
                $('#phone').attr('disabled', true);


                axios.post("{{ route('getOtp') }}", {
                        phone: phone
                    })
                    .then(function(response) {
                        console.log(response.data);

                        if (response.data.status == "success") {
                            $('#otpSection').show();
                            var timerId = setInterval(countdown, 1000);
                            var timeLeft = 30;
                            var elem = document.getElementById('coundown');

                            function countdown() {
                                if (timeLeft == -1) {
                                    clearTimeout(timerId);
                                    $('#button-addon2').attr('disabled', false);
                                    $('#phone').attr('disabled', false);
                                    $('#otpSection').hide();



                                } else {
                                    elem.innerHTML = timeLeft + ' seconds remaining';
                                    timeLeft--;
                                    $('#button-addon2').attr('disabled', true);
                                    $('#phone').attr('disabled', true);


                                }
                            }

                        } else if (response.data.status == "faild") {

                            $('#otpSection').html(response.data.message);

                        }

                    })
                    .catch(function(error) {
                        console.log(error);
                    });





            }

        }
        document.addEventListener("DOMContentLoaded", function(event) {

            function OTPInput() {
                const inputs = document.querySelectorAll('#otp > *[id]');
                for (let i = 0; i < inputs.length; i++) {
                    inputs[i].addEventListener('keydown', function(event) {
                        if (event.key === "Backspace") {
                            inputs[i].value = '';
                            if (i !== 0) inputs[i - 1].focus();
                        } else {
                            if (i === inputs.length - 1 && inputs[i].value !== '') {
                                return true;
                            } else if (event.keyCode > 47 && event.keyCode < 58) {
                                inputs[i].value = event.key;
                                if (i !== inputs.length - 1) inputs[i + 1].focus();
                                event.preventDefault();
                            } else if (event.keyCode > 64 && event.keyCode < 91) {
                                inputs[i].value = String.fromCharCode(event.keyCode);
                                if (i !== inputs.length - 1) inputs[i + 1].focus();
                                event.preventDefault();
                            }
                        }
                    });
                }
            }
            OTPInput();


        });


        $('.validate').click(function(event){
            event.preventDefault();

            let otp=$("input[name='otp[]']").map(function(){return $(this).val();}).get();
            let phone = $('input[name="phone"]').val();


            axios.post("{{ route('verifyOtp') }}", {
                        otp: otp,
                        phone:phone
                    })
                    .then(function(response) {
                        console.log(response.data);
                        if(response.data == "success"){

                            $('#otpSection').html('<input type="hidden" name="otp" value="true">');
                            $('input[name="phone"]').attr('disabled', true);

                        }
                        // else{
                        //     $('#otpSection').html('<input type="hidden" name="otp" value="false">');
                        // }

                    }).catch(function(error){

                    })

        })
    </script>
@endpush
