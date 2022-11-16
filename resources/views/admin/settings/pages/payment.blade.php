@extends('admin.settings.setting-layout')
@section('title')
    {{ __('payment_gateway_setting') }}
@endsection

@section('website-settings')
    <div class="row">
        <div class="col-sm-6">
            {{-- paypal settings --}}
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <h3 class="card-title" style="line-height: 36px;">{{ __('pesapal_settings') }}</h3>
                        <div class="form-group row">
                            <input {{ env('PESAPAL_ACTIVE') ? 'checked' : '' }} type="checkbox" name="pesapal"
                                data-bootstrap-switch value="1">

                        </div>
                    </div>
                </div>
                @if (env('PESAPAL_ACTIVE'))
                    <div class="card-body">
                        <form class="form-horizontal" action="{{ route('settings.payment.update') }}" method="POST"
                            enctype="multipart/form-data">
                            @method('PUT')
                            @csrf
                            <input type="hidden" value="pesapal" name="type">
                            <div class="form-group row">
                                <x-forms.label name="{{ __('live_mode') }}" class="col-sm-3" />
                                <div class="col-sm-9">
                                    <input id="paylive" {{ env('PESAPAL_MODE') == 'live' ? 'checked' : '' }}
                                        type="checkbox" name="pesapal_live_mode" button="button1"
                                        oldvalue="{{ env('PESAPAL_MODE') }}" data-bootstrap-switch value="1">
                                </div>
                            </div>
                            @if (env('PESAPAL_MODE') == 'sandbox')
                                <div class="form-group row">
                                    <x-forms.label name="{{ __('client_id') }}" class="col-sm-3" />
                                    <div class="col-sm-9">
                                        <input
                                            onkeyup="ButtonDisabled('button1', 'pesapal_customer_key' , '{{ env('PESAPAL_CONSUMER_KEY') }}')"
                                            value="{{ env('PESAPAL_CONSUMER_KEY') }}" name="pesapal_client_id"
                                            type="text"
                                            class="form-control @error('pesapal_customer_key') is-invalid @enderror"
                                            autocomplete="off">
                                        @error('pesapal_customer_key')
                                            <span class="invalid-feedback"
                                                role="alert"><span>{{ $message }}</span></span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <x-forms.label name="{{ __('client_secret') }}" class="col-sm-3" />
                                    <div class="col-sm-9">
                                        <input
                                            onkeyup="ButtonDisabled('button1', 'pesapal_customer_secret' , '{{ env('PESAPAL_CONSUMER_SECRET') }}')"
                                            value="{{ env('PESAPAL_CONSUMER_SECRET') }}" name="pesapal_customer_secret"
                                            type="text"
                                            class="form-control @error('pesapal_customer_secret') is-invalid @enderror"
                                            autocomplete="off">
                                        @error('pesapal_customer_secret')
                                            <span class="invalid-feedback"
                                                role="alert"><span>{{ $message }}</span></span>
                                        @enderror
                                    </div>
                                </div>
                            @else
                                <div class="form-group row">
                                    <x-forms.label name="{{ __('client_id') }}" class="col-sm-3" />
                                    <div class="col-sm-9">
                                        <input
                                            onkeyup="ButtonDisabled('button1', 'pesapal_customer_key' , '{{ env('PESAPAL_CONSUMER_KEY') }}')"
                                            value="{{ env('PESAPAL_CONSUMER_KEY') }}" name="pesapal_customer_key"
                                            type="text"
                                            class="form-control @error('pesapal_customer_key') is-invalid @enderror"
                                            autocomplete="off">
                                        @error('pesapal_customer_key')
                                            <span class="invalid-feedback"
                                                role="alert"><span>{{ $message }}</span></span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <x-forms.label name="{{ __('client_secret') }}" class="col-sm-3" />
                                    <div class="col-sm-9">
                                        <input
                                            onkeyup="ButtonDisabled('button1', 'pesapal_customer_secret' , '{{ env('PESAPAL_CONSUMER_SECRET') }}')"
                                            value="{{ env('PESAPAL_CONSUMER_SECRET') }}" name="pesapal_customer_secret"
                                            type="text"
                                            class="form-control @error('pesapal_customer_secret') is-invalid @enderror"
                                            autocomplete="off">
                                        @error('pesapal_customer_secret')
                                            <span class="invalid-feedback"
                                                role="alert"><span>{{ $message }}</span></span>
                                        @enderror
                                    </div>
                                </div>
                            @endif
                            @if (userCan('setting.update'))
                                <div class="form-group row">
                                    <div class="offset-sm-3 col-sm-9">
                                        <button id="button1" type="submit" class="btn btn-success"><i
                                                class="fas fa-sync"></i>
                                            {{ __('update') }}</button>
                                    </div>
                                </div>
                            @endif
                        </form>
                    </div>
                @endif
            </div>
        </div>

        <div class="col-sm-6">
            {{-- paypal settings --}}
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <h3 class="card-title" style="line-height: 36px;">{{ __('paypal_settings') }}</h3>
                        <div class="form-group row">
                            <input {{ env('PAYPAL_ACTIVE') ? 'checked' : '' }} type="checkbox" name="paypal"
                                data-bootstrap-switch value="1">
                        </div>
                    </div>
                </div>
                @if (env('PAYPAL_ACTIVE'))
                    <div class="card-body">
                        <form class="form-horizontal" action="{{ route('settings.payment.update') }}" method="POST"
                            enctype="multipart/form-data">
                            @method('PUT')
                            @csrf
                            <input type="hidden" value="paypal" name="type">
                            <div class="form-group row">
                                <x-forms.label name="{{ __('live_mode') }}" class="col-sm-3" />
                                <div class="col-sm-9">
                                    <input id="paylive" {{ env('PAYPAL_MODE') == 'live' ? 'checked' : '' }}
                                        type="checkbox" name="paypal_live_mode" button="button1"
                                        oldvalue="{{ env('PAYPAL_MODE') }}" data-bootstrap-switch value="1">
                                </div>
                            </div>
                            @if (env('PAYPAL_MODE') == 'sandbox')
                                <div class="form-group row">
                                    <x-forms.label name="{{ __('client_id') }}" class="col-sm-3" />
                                    <div class="col-sm-9">
                                        <input
                                            onkeyup="ButtonDisabled('button1', 'paypal_client_id' , '{{ env('PAYPAL_SANDBOX_CLIENT_ID') }}')"
                                            value="{{ env('PAYPAL_SANDBOX_CLIENT_ID') }}" name="paypal_client_id"
                                            type="text"
                                            class="form-control @error('paypal_client_id') is-invalid @enderror"
                                            autocomplete="off">
                                        @error('paypal_client_id')
                                            <span class="invalid-feedback"
                                                role="alert"><span>{{ $message }}</span></span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <x-forms.label name="{{ __('client_secret') }}" class="col-sm-3" />
                                    <div class="col-sm-9">
                                        <input
                                            onkeyup="ButtonDisabled('button1', 'paypal_client_secret' , '{{ env('PAYPAL_SANDBOX_CLIENT_SECRET') }}')"
                                            value="{{ env('PAYPAL_SANDBOX_CLIENT_SECRET') }}" name="paypal_client_secret"
                                            type="text"
                                            class="form-control @error('paypal_client_secret') is-invalid @enderror"
                                            autocomplete="off">
                                        @error('paypal_client_secret')
                                            <span class="invalid-feedback"
                                                role="alert"><span>{{ $message }}</span></span>
                                        @enderror
                                    </div>
                                </div>
                            @else
                                <div class="form-group row">
                                    <x-forms.label name="{{ __('client_id') }}" class="col-sm-3" />
                                    <div class="col-sm-9">
                                        <input
                                            onkeyup="ButtonDisabled('button1', 'paypal_client_id' , '{{ env('PAYPAL_LIVE_CLIENT_ID') }}')"
                                            value="{{ env('PAYPAL_LIVE_CLIENT_ID') }}" name="paypal_client_id"
                                            type="text"
                                            class="form-control @error('paypal_client_id') is-invalid @enderror"
                                            autocomplete="off">
                                        @error('paypal_client_id')
                                            <span class="invalid-feedback"
                                                role="alert"><span>{{ $message }}</span></span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <x-forms.label name="{{ __('client_secret') }}" class="col-sm-3" />
                                    <div class="col-sm-9">
                                        <input
                                            onkeyup="ButtonDisabled('button1', 'paypal_client_secret' , '{{ env('PAYPAL_LIVE_CLIENT_SECRET') }}')"
                                            value="{{ env('PAYPAL_LIVE_CLIENT_SECRET') }}" name="paypal_client_secret"
                                            type="text"
                                            class="form-control @error('paypal_client_secret') is-invalid @enderror"
                                            autocomplete="off">
                                        @error('paypal_client_secret')
                                            <span class="invalid-feedback"
                                                role="alert"><span>{{ $message }}</span></span>
                                        @enderror
                                    </div>
                                </div>
                            @endif
                            @if (userCan('setting.update'))
                                <div class="form-group row">
                                    <div class="offset-sm-3 col-sm-9">
                                        <button id="button1" type="submit" class="btn btn-success"><i
                                                class="fas fa-sync"></i>
                                            {{ __('update') }}</button>
                                    </div>
                                </div>
                            @endif
                        </form>
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script src="{{ asset('backend') }}/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <script>
        $("input[data-bootstrap-switch]").each(function() {
            $(this).bootstrapSwitch('state', $(this).prop('checked'));
        })

        $(function() {
            $('[data-toggle="tooltip"]').tooltip()
        })

        $('#button1').prop('disabled', true);
        $('#button2').prop('disabled', true);
        $('#button3').prop('disabled', true);
        $('#button4').prop('disabled', true);
        $('#button5').prop('disabled', true);
        $('#button6').prop('disabled', true);
        $('#button7').prop('disabled', true);
        $('#button8').prop('disabled', true);
        $('#button9').prop('disabled', true);

        function ButtonDisabled(id, input, data) {
            let inputVal = $('[name=' + input + ']').val();
            if (inputVal == data) {
                $('#' + id).prop('disabled', true);
            } else {
                $('#' + id).prop('disabled', false);
            }
        }

        $("input[data-bootstrap-switch]").on('switchChange.bootstrapSwitch', function(event, state) {
            let input = $(this).attr('name');
            let status = state ? 1 : 0;
            $("input[name=" + input + "]").val(status);

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "{{ route('settings.payment.status.update') }}",
                data: {
                    'type': input,
                    'status': status
                },
                success: function(response) {
                    setTimeout(() => {
                        window.location.reload();
                    }, 500);
                }
            });
        });

        $("#paylive").on('switchChange.bootstrapSwitch', function(event, state) {

            let oldData = event.target.attributes.oldvalue.value;
            let newData = event.currentTarget.checked ? 'live' : 'sandbox';
            let button = event.target.attributes.button.value;

            if (oldData == newData) {
                $('#' + button).prop('disabled', true);
            } else {
                $('#' + button).prop('disabled', false);
            }
        });
    </script>
@endsection

@section('style')
    <link rel="stylesheet" href="{{ asset('backend') }}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
@endsection
