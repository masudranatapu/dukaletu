<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Pesapal Consumer Key
    |--------------------------------------------------------------------------
    |
    | The key obtained after creating your PesaPal demo or live account
    | When committing this to a repository, remove the default value
    | and put it into your online PESAPAL_KEY config variable
    |
    */
    'consumer_key' => env('PESAPAL_CONSUMER_KEY', "pUTsW5X684mpQo49IrI1BZ/UJ7YxG9ci"),

    /*
   |--------------------------------------------------------------------------
   | Pesapal Consumer Secret
   |--------------------------------------------------------------------------
   |
   | The secret key obtained after creating your PesaPal demo or live account
   | When committing this to a repository, remove the default value and
   | put it into your online PESAPAL_SECRET configuration variable
   |
   */
    'consumer_secret' => env('PESAPAL_CONSUMER_SECRET', "rYukfNytkusTHJ8HPnQ9Okzlx38="),

    /*
   |--------------------------------------------------------------------------
   | Pesapal Account Type
   |--------------------------------------------------------------------------
   |
   | true if your account was obtained from https://www.pesapal.com and
   | false if your account was obtained from https://demo.pesapal.com
   |
   */
    'live' => env('PESAPAL_LIVE'),

    /*
   |--------------------------------------------------------------------------
   | Callback URL
   |--------------------------------------------------------------------------
   |
   | This is the full url pointing to the page that the iframe
   | redirects to after processing the order on pesapal.com
   |
   */
    'callback_route' => env('PESAPAL_CALLBACK_ROUTE', "paymentsuccess"),

    'active' => env('PESAPAL_ACTIVE', true)
];
