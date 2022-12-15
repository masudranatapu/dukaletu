<?php

use App\Http\Controllers\Auth\PhoneVerifyController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FilterController;
use App\Http\Controllers\MessangerController;
use App\Http\Controllers\Frontend\AdPostController;
use App\Http\Controllers\Auth\VerificationController;
use App\Http\Controllers\Frontend\DashboardController;
use App\Http\Controllers\Frontend\SellerDashboardController;
use App\Http\Controllers\Frontend\FrontendController;
use App\Http\Controllers\Frontend\UserPhoneBookController;
use App\Http\Controllers\PaymentsController;
use App\Http\Controllers\SmsMarketingController;
use App\Models\Frontend\UserPhoneBook;

// show website pages
Route::group(['as' => 'frontend.'], function () {
    Route::get('/', [FrontendController::class, 'index'])->name('index');

    Route::controller(FrontendController::class)->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('about', 'about')->name('about');
        Route::get('faq', 'faq')->name('faq');
        Route::get('privacy', 'privacy')->name('privacy');
        Route::get('terms-conditions', 'terms')->name('terms');
        Route::get('get-membership', 'getMembership')->name('getmembership');
        Route::get('price-plan', 'pricePlan')->name('priceplan');
        Route::get('price-plan-details/{plan_label}', 'pricePlanDetails')->name('priceplanDetails');
        Route::post('plan-purchase', 'planPurchase')->name('planPurchase');

        Route::get('sms-price-plan', 'smsPricePlan')->name('smsPricePlan');
        Route::get('sms-plan-details/{package}', 'smsPlanDetails')->name('smsPriceplanDetails');



        Route::get('contact', 'contact')->name('contact');
        Route::get('ad-list', 'adList')->name('adlist');
        Route::get('/ad/details/{ad:slug}', 'adDetails')->name('addetails');
        Route::get('/ad/gallery-details/{ad:slug}', 'adGalleryDetails')->name('ad.gallery.details');
        Route::get('blog', 'blog')->name('blog');
        Route::get('blog/{blog:slug}', 'singleBlog')->name('single.blog');
        Route::get('blog/comments/count/{post_id}', 'commentsCount');
        Route::post('ad/attachment/download/', 'attachmentDownload')->name('attachment.download');
        Route::post('/set/session', 'setSession')->name('set.session');
    });

    //seller dashboard
    Route::controller(SellerDashboardController::class)->group(function () {
        Route::get('/seller/{user:username}', 'profile')->name('seller.profile');
        Route::post('/seller/rate', 'rateReview')->name('seller.review');
        Route::post('/pre/signup', 'preSignup')->name('pre.signup');
        Route::post('/report', 'report')->name('seller.report');
    });

    Route::get('ad-list-search', [FilterController::class, 'search'])->name('adlist.search');
    Route::get('category/{slug}', [FilterController::class, 'adsByCategory'])->name('adlist.category.show');

    // customer dashboard
    Route::prefix('dashboard')->middleware(['auth:user', 'verified'])->group(function () {
        Route::get('/', [DashboardController::class, 'dashboard'])->name('dashboard');

        Route::controller(AdPostController::class)->prefix('post')->group(function () {
            // Ad Create
            Route::middleware(['checkplan', 'check_subscription'])->group(function () {
                Route::get('/', 'postStep1')->name('post');
                Route::post('/', 'storePostStep1')->name('post.store');
                Route::get('/step2', 'postStep2')->name('post.step2');
                Route::post('/step2', 'storePostStep2')->name('post.step2.store');
                Route::get('/step3', 'postStep3')->name('post.step3');
                Route::post('/step3', 'storePostStep3')->name('post.step3.store');
                Route::get('/step2/back/{slug?}', 'postStep2Back')->name('post.step2.back');
                Route::get('/step1/back/{slug?}', 'postStep1Back')->name('post.step1.back');
            });

            // Ad Edit
            Route::post('/gallery/images/{ad_gallery}', 'adGalleryDelete')->name('ad.gallery.delete');
            Route::get('/{ad:slug}', 'editPostStep1')->name('post.edit');
            Route::put('/{ad:slug}/update', 'UpdatePostStep1')->name('post.update');
            Route::get('/{ad:slug}/step2', 'editPostStep2')->name('post.edit.step2');
            Route::put('/step2/{ad:slug}/update', 'updatePostStep2')->name('post.step2.update');
            Route::get('/{ad:slug}/step3', 'editPostStep3')->name('post.edit.step3');
            Route::put('/step3/{ad:slug}/update', 'updatePostStep3')->name('post.step3.update');
            Route::get('/cancel/edit', 'cancelAdPostEdit')->name('post.cancel.edit');
        });

        // Messenger
        Route::controller(MessangerController::class)->group(function () {
            Route::get('message/{username?}', 'index')->name('message');
            Route::post('message/{username}', 'sendMessage')->name('message.store');
            Route::post('message/markas/read/{username}', 'messageMarkasRead')->name('message.markas.read');
        });

        Route::controller(DashboardController::class)->group(function () {
            Route::get('post-rules', 'postRules')->name('post.rules');
            Route::get('ad/{ad:slug}', 'editAd')->name('editad');
            Route::get('ads', 'myAds')->name('adds');
            Route::delete('delete-ads/{ad}', 'deleteMyAd')->name('delete.myad');
            Route::put('status-ads/{ad}', 'myAdStatus')->name('myad.status');
            Route::put('expire-ads/{ad}', 'markExpired')->name('myad.expire');
            Route::put('active-ad/{ad}', 'markActive')->name('myad.active');
            Route::get('favourites', 'favourites')->name('favourites');
            Route::get('plans-billing', 'plansBilling')->name('plans-billing');
            Route::get('sms-plan-billing', 'smsPlanBiling')->name('sms-plan-billing');
            Route::get('cancel/plan', 'cancelPlan')->name('cancel-plan');
            Route::get('account-setting', 'accountSetting')->name('account-setting');
            Route::put('profile', 'profileUpdate')->name('profile');
            Route::put('password', 'passwordUpdate')->name('password');
            Route::put('social', 'socialUpdate')->name('social.update');
            Route::post('wishlist', 'addToWishlist')->name('add.wishlist');
            Route::delete('account-delete/{customer}', 'deleteAccount')->name('account.delete');
        });

        // Sms Marketing
        Route::get('sms-marketing', [SmsMarketingController::class, 'marketing'])->name('sms-marketing');
        Route::post('sms/send', [SmsMarketingController::class, 'sendSms'])->name('smsMarketing.sendSms');
        Route::post('sms-marketing-get-number', [SmsMarketingController::class, 'marketingGetNumber'])->name('sms-marketing-getNumber');
        Route::get('expired-plan', [DashboardController::class, 'expiredPlan'])->name('expiredPlan');



        // user phone-book
        Route::get('/user-phonebook', [UserPhoneBookController::class, 'index'])->name('user-phoneBook');
        Route::get('/send-sms-single/{phone}/{page}', [UserPhoneBookController::class, 'show'])->name('send-sms-single');
        Route::post('/phonebook-insert/', [UserPhoneBookController::class, 'store'])->name('user-phoneBook.store');
        Route::post('/phonebook-delete/{userPhoneBook}', [UserPhoneBookController::class, 'destroy'])->name('user-phoneBook.destroy');
    });
});

// Verification Routes
Route::controller(VerificationController::class)->middleware('auth:user', 'set_lang')->group(function () {
    Route::get('/email/verify', 'show')->name('verification.notice');
    Route::get('/email/verify/{id}/{hash}', 'verify')->name('verification.verify')->middleware(['signed']);
    Route::post('/email/resend', 'resend')->name('verification.resend');
});

Route::post('/get-otp', [PhoneVerifyController::class, 'getOtp'])->name('getOtp');
Route::post('/verify-otp', [PhoneVerifyController::class, 'verifyOtp'])->name('verifyOtp');



Route::group(['prefix' => '/webhooks'], function () {
    //PESAPAL
    Route::get('donepayment', [PaymentsController::class, 'payment'])->name('paymentsuccess');
    Route::get('paymentconfirmation', [PaymentsController::class, 'paymentconfirmation']);
});
