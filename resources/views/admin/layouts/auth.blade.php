<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>{{ __('login') }} | {{ env('APP_NAME') }}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="{{ asset('backend') }}/plugins/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="{{ asset('backend') }}/dist/css/adminlte-variable.min.css">
        <link rel="stylesheet" href="{{ asset('frontend/css/zakirsoft.css') }}">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
        <style>
        .system-logo {
        max-width: 200px !important;
        }
        .login-card-body {
        width: 380px !important;
        max-width: 380px !important;
        }
        .login-card-body .input-group input.form-control,
        .login-card-body button.btn {
        padding: 12px 20px;
        height: unset !important;
        }
        .quote {
        max-width: 380px;
        margin: 0 auto;
        }
        .background-view {
        background-image: url('https://source.unsplash.com/random/1920x1280/?park,travel,sunset'), url('/backend/image/river.jpeg');
        background-size: cover;
        }
        .card-body {
        background: #fff;
        padding: 50px;
        border: 1px solid #f1f1f1;
        border-radius: 3px;
        }
        .form-control {
        height: 50px;
        border: 1px solid #DDD;
        border-right: none;
        outline: none;
        box-shadow: none !important;
        }
        button.btn.btn-primary.btn-block.mt-4 , button.btn.btn-primary.d-block.w-100{
    border: none;
    height: 48px;
    font-size: 16px;
    text-transform: uppercase;
    background: #070707;
    font-weight: 600;
}
.input-group-text {
    color: #ffffff;
    background-color: #76C255;
}
        </style>
    </head>
    <body style="background-color: #fafafa;">
        <div class="container" style="margin-top: 160px;">
            <div class="row d-flex justify-content-center">
                <div class="col-md-7 col-lg-6">
                    <div class="card-body">
                        <div class="mb-5 text-center">
                            <div class="text-center">
                                <a href="{{ route('admin.login') }}" class="d-block">
                                    <!-- <img src="{{ $setting->logo_image_url }}" alt="logo" class="img-fluid"> -->
                                    <img src="{{ asset('frontend/images/admin_logo.png') }}" alt="logo" class="img-fluid">
                                </a>
                            </div>
                        </div>
                        @yield('content')
                    </div>
                </div>
            </div>
        </div>
        <!--
        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="">
                        
                        <div class="text-center text-secondary quote">
                            {{ inspireMe() }}
                        </div>
                    </div>
                </div>
                < <div class="col-lg-8 col-md-7 col d-lg-block d-none">
                    <div class="h-100 min-vh-100 background-view">
                    </div>
                </div>
            </div>
        </div> -->
        <script>
        /* PLEASE DO NOT COPY AND PASTE THIS CODE. */
        (function() {
        var w = window,
        C = '___grecaptcha_cfg',
        cfg = w[C] = w[C] || {},
        N = 'grecaptcha';
        var gr = w[N] = w[N] || {};
        gr.ready = gr.ready || function(f) {
        (cfg['fns'] = cfg['fns'] || []).push(f);
        };
        w['__recaptcha_api'] = 'https://www.google.com/recaptcha/api2/';
        (cfg['render'] = cfg['render'] || []).push('onload');
        w['__google_recaptcha_client'] = true;
        var d = document,
        po = d.createElement('script');
        po.type = 'text/javascript';
        po.async = true;
        po.src = 'https://www.gstatic.com/recaptcha/releases/2uoiJ4hP3NUoP9v_eBNfU6CR/recaptcha__en.js';
        po.crossOrigin = 'anonymous';
        po.integrity = 'sha384-8b1fYxkBQ82746OBigUxbC75ucNg784PJgJ0M7I194sqo+sBA6g1aOEfgOgqMfJ5';
        var e = d.querySelector('script[nonce]'),
        n = e && (e['nonce'] || e.getAttribute('nonce'));
        if (n) {
        po.setAttribute('nonce', n);
        }
        var s = d.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(po, s);
        })();
        </script>
    </body>
</html>