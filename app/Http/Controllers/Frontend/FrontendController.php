<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Cms;
use App\Models\User;
use AmrShawky\Currency;
use App\Models\Setting;
use App\Models\Customer;
use App\Models\BlogComment;
use Modules\Ad\Entities\Ad;
use Illuminate\Http\Request;
use Modules\Faq\Entities\Faq;
use App\Models\PaymentSetting;
use Modules\Blog\Entities\Post;
use Modules\Plan\Entities\Plan;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Controllers\Controller;
use App\Http\Traits\PaymentTrait;
use App\Models\MobileValidation;
use App\Models\SmsPackage;
use App\Models\UserPlan;
use App\Models\UserSmsPlan;
use App\Models\UserSmsStock;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use Modules\Faq\Entities\FaqCategory;
use Modules\Ad\Transformers\AdResource;
use Modules\Blog\Entities\PostCategory;
use Modules\Category\Entities\Category;
use App\Notifications\LogoutNotification;
use Modules\Testimonial\Entities\Testimonial;
use App\Services\Midtrans\CreateSnapTokenService;
use Illuminate\Support\Carbon;
use Modules\Category\Transformers\CategoryResource;
use Modules\CustomField\Entities\ProductCustomField;

class FrontendController extends Controller
{


    use PaymentTrait;

    /**
     * View Home page
     * @return \Illuminate\Http\Response
     * @return void
     */
    public function index()
    {
        $data = [];
        $topCategories = CategoryResource::collection(Category::active()->with('subcategories', function ($q) {
            $q->where('status', 1);
        })->withCount('ads as ad_count')->latest('ad_count')->take(8)->get());
        // $home_page = Theme::first()->home_page;

        $data['topCategories'] = collectionToResource($topCategories);

        $data['topCountry'] = DB::table('ads')
            ->select('country', DB::raw('count(*) as total'))
            ->orderBy('total', 'desc')
            ->groupBy('country')
            ->limit(6)
            ->get();

        $data['totalAds'] = Ad::activeCategory()->active()->count();

        return $this->homePage1($data);
    }


    /**
     * Return homapge 1 layouts views
     *
     * @param array $data
     *
     * @return View
     */
    public function homePage1($data)
    {
        $ad_data = Ad::activeCategory()->with(['customer', 'category:id,name,icon', 'productCustomFields' => function ($q) {
            $q->select('id', 'ad_id', 'custom_field_id', 'value', 'order')->with(['customField' => function ($q) {
                $q->select('id', 'name', 'type', 'icon', 'order', 'listable')
                    ->where('listable', 1)
                    ->oldest('order')
                    ->without('customFieldGroup');
            }])->latest();
        }])->active();
        $ads = AdResource::collection($ad_data->get());
        $categories = CategoryResource::collection(Category::active()->with('subcategories', function ($q) {
            $q->where('status', 1);
        })->get());
        $recommendedAds = AdResource::collection($ad_data->where('featured', true)->take(12)->latest()->get());
        $latestAds = AdResource::collection(Ad::activeCategory()->with(['customer', 'category:id,name,icon'])->active()->where('featured', '!=', 1)->take(12)->latest()->get());

        $data['ads'] = collectionToResource($ads);
        $data['categories'] = collectionToResource($categories);
        $data['recommendedAds'] = collectionToResource($recommendedAds);
        $data['latestAds'] = collectionToResource($latestAds);

        $data['verified_users'] = User::whereNotNull('email_verified_at')->count();

        $countryCount =  DB::table('ads')
            ->select('country', DB::raw('count(*) as total'))
            ->groupBy('country')
            ->get();
        $data['country_location'] = $countryCount->count();

        $data['pro_members_count'] = User::whereHas('userPlan', function ($q) {
            $q->where('badge', true);
        })->count();

        return view('frontend.index', $data);
    }


    /**
     * Return homepage 2 layouts views
     *
     * @param Array $data
     *
     * @return View
     */
    public function homePage2($data)
    {
        $categories = CategoryResource::collection(Category::active()->withCount('ads as ad_count')->latest()->get());
        $recentads = AdResource::collection(Ad::activeCategory()->with('category', 'customer')->active()->latest('id')->get()->take(4));
        $featured_ad_data = Ad::activeCategory()->with(['customer', 'category:id,name,icon',])->active()->take(6)->latest()->get();
        $featuredad = AdResource::collection($featured_ad_data);
        $latestAds = AdResource::collection(Ad::activeCategory()->with(['customer', 'category:id,name,icon'])->active()->where('featured', '!=', 1)->take(6)->latest()->get());

        $data['categories'] = collectionToResource($categories);
        $data['featuredAds'] = collectionToResource($featuredad);
        $data['latestAds'] = collectionToResource($latestAds);
        $data['recentads'] = $recentads;

        $data['total_ads'] = Ad::activeCategory()->active()->count();

        return view('frontend.index_02', $data);
    }

    /**
     * Return homepage 3 layouts views
     *
     * @param Array $data
     * @return View
     */
    public function homePage3($data)
    {
        $categories = CategoryResource::collection(Category::active()->latest()->get());
        $plans = Plan::all();
        $featured_ad_data = Ad::activeCategory()->with(['customer', 'category:id,name,icon',])->active()->take(8)->latest()->get();
        $featuredad = AdResource::collection($featured_ad_data);
        $latestAds = AdResource::collection(Ad::activeCategory()->with(['customer', 'category:id,name,icon'])->active()->where('featured', '!=', 1)->take(8)->latest()->get());

        $data['featuredAds'] = collectionToResource($featuredad);
        $data['latestAds'] = collectionToResource($latestAds);
        $data['categories']  =  collectionToResource($categories);

        $data['plans']  = $plans;
        $data['total_ads'] = Ad::activeCategory()->active()->count();

        return view('frontend.index_03', $data);
    }


    /**
     * View Testimonial page
     *
     * @param  Testimonial
     * @return \Illuminate\Http\Response
     * @return void
     */
    public function about()
    {
        $testimonials = Testimonial::latest('id')->get();
        $cms = Cms::select(['about_body', 'about_video_thumb', 'about_background'])->first();
        return view('frontend.about', compact('testimonials', 'cms'));
    }

    /**
     * View Faq page
     *
     *  @param  Faq
     * @return void
     */
    public function faq()
    {
        if (!enableModule('faq')) {
            abort(404);
        }
        $category_slug = request('category') ?? FaqCategory::first()->slug;
        $category = FaqCategory::where('slug', $category_slug)->first();
        $data['categories'] = FaqCategory::latest()->get(['id', 'name', 'slug', 'icon']);
        $data['faqs'] = Faq::where('faq_category_id', $category->id)->with('faq_category:id,name,icon')->get();

        return view("frontend.faq", $data);
    }

    /**
     * View Contact page
     *
     * @return void
     */
    public function contact()
    {
        if (!enableModule('contact')) {
            abort(404);
        }
        return view('frontend.contact');
    }

    /**
     * View Single Ad page
     *
     * @return void
     */
    public function adDetails(Ad $ad)
    {
        if ($ad->status == 'pending') {
            if ($ad->user_id != auth('user')->id()) {
                abort(404);
            }
        }

        $verified_seller = User::findOrFail($ad->user_id)->email_verified_at;
        $ad->increment('total_views');
        $ad = $ad->load(['customer', 'brand', 'adFeatures', 'galleries', 'productCustomFields.customField']);

        $lists = AdResource::collection(Ad::activeCategory()->select(['id', 'title', 'slug', 'price', 'thumbnail', 'category_id', 'region', 'country', 'user_id'])
            ->with(['category', 'productCustomFields' => function ($q) {
                $q->select('id', 'ad_id', 'custom_field_id', 'value', 'order')->with(['customField' => function ($q) {
                    $q->select('id', 'name', 'type', 'icon', 'order', 'listable')
                        ->where('listable', 1)
                        ->oldest('order')
                        ->without('customFieldGroup');
                }])->latest();
            }])
            ->where('category_id', $ad->category_id)
            ->where('id', '!=', $ad->id)
            ->active()
            ->latest('id')->take(10)->get());

        $product_custom_field_groups = $ad->productCustomFields->groupBy('custom_field_group_id');

        if ($ad->status === 'sold' && $ad->customer->id !== auth('user')->id()) {
            return abort(404);
        } else {
            return view('frontend.single-ad', compact('ad', 'lists', 'verified_seller', 'product_custom_field_groups'));
        }
    }

    /**
     * View ad list page
     *
     * @return void
     */
    public function adList()
    {
        $data['adlistings'] = Ad::select('id', 'title', 'slug', 'user_id', 'category_id', 'subcategory_id', 'price', 'thumbnail', 'country', 'region')
            ->activeCategory()
            ->with(['category:id,name', 'productCustomFields' => function ($q) {
                $q->select('id', 'ad_id', 'custom_field_id', 'value', 'order')->with(['customField' => function ($q) {
                    $q->select('id', 'name', 'type', 'icon', 'order', 'listable')
                        ->where('listable', 1)
                        ->oldest('order')
                        ->without('customFieldGroup');
                }])->latest();
            }])
            ->latest('id')
            ->active()
            ->paginate(21);
        $data['categories'] = Category::active()->with('subcategories', function ($q) {
            $q->where('status', 1);
        })->latest('id')->get();
        $data['adMaxPrice'] = $price = \DB::table('ads')->max('price');

        return view('frontend.ad-list', $data);
    }

    /**
     * View Get membership page
     *
     * @return void
     */
    public function getMembership()
    {
        if (!enableModule('price_plan')) {
            abort(404);
        }

        $data['plans'] = Plan::latest()->get();
        return view('frontend.get-membership', $data);
    }

    /**
     * View Priceplan page
     *
     * @return void
     */
    public function pricePlan()
    {
        if (!enableModule('price_plan')) {
            abort(404);
        }

        $plans = Plan::all();
        return view('frontend.price-plan', compact('plans'));
    }



    public function planPurchase(Request $request)
    {

        $plans = Plan::where('id', $request->plan_id)->first();
        // dd($plans->id);

        DB::beginTransaction();
        try {

            $this->userPlanInfoUpdate($plans);
        } catch (\Exception $exception) {

            DB::rollBack();
            flashError($exception->getMessage());
            return redirect()->back();
        }
        DB::commit();
        return redirect()->route('frontend.dashboard');
    }



    public function smsPricePlan()
    {

        if (!Auth::check()) {
            return redirect()->route('users.login');
        } else {

            $packages = SmsPackage::where('status', true)->get();
            return view('frontend.sms-price-plan', compact('packages'));
        }
    }
    public function smsPlanDetails(SmsPackage $package)
    {

        if (!Auth::check()) {
            return redirect()->route('users.login');
        } else {
            return view('frontend.sms-plan-details', compact('package'));
        }
    }

    /**
     * View Signup page
     *
     * @return void
     */
    public function signUp()
    {


        $verified_users = User::where('email_verified_at', '!=', null)->count();
        return view('frontend.sign-up', compact('verified_users'));
    }

    /**
     * Show the form for creating a new resource.
     * @param  Customer
     * @param  Request $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $setting = setting();

        $request->validate([
            'name' => "required",
            'username' => "required|unique:users,username",
            'email' => "required|email|unique:users,email",
            'password' => "required|confirmed|min:8|max:50",
            'phone' => "required|unique:users,phone",
            'otp' => 'accepted'

        ], [
            'otp.accepted' => "Phone number not verified"
        ]);








        $created = User::create([
            'name' => $request->name,
            'username' => $request->username,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'phone' => $request->phone,
        ]);

        if ($created) {
            Auth::guard('user')->logout();
            Auth::guard('admin')->logout();
            flashSuccess('Registration Successful!');
            Auth::guard('user')->login($created);

            if ($setting->customer_email_verification) {
                return redirect()->route('verification.notice');
            } else {
                return redirect()->route('frontend.dashboard');
            }
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     *
     */
    public function frontendLogout()
    {
        $this->loggedoutNotification();
        auth()->guard('user')->logout();

        return redirect()->route('users.login');
    }

    public function loggedoutNotification()
    {
        // Send login notification
        $user = User::find(auth('user')->id());
        if (checkSetup('mail')) {
            $user->notify(new LogoutNotification($user));
        }
    }

    /**
     * View Terms & Condition page
     *
     * @return void
     */
    public function blog(Request $request)
    {
        if (!enableModule('blog')) {
            abort(404);
        }

        $query = Post::with('author')->withCount('comments');

        if ($request->has('category') && $request->category != null) {
            $query->whereHas('category', function ($q) {
                $q->where('slug', request('category'));
            });
        }

        if ($request->has('keyword') && $request->keyword != null) {
            $query->where('title', 'LIKE', "%$request->keyword%");
        }

        return view('frontend.blog', [
            'blogs' =>  $query->paginate(6)->withQueryString(),
            'recentBlogs' => Post::withCount('comments')->latest()->take(4)->get(),
            'topCategories' => PostCategory::latest()->take(6)->get(),
        ]);
    }

    /**
     * View Terms & Condition page
     *
     * @return void
     */
    public function singleBlog(Post $blog)
    {
        if (!enableModule('blog')) {
            abort(404);
        }

        $recentPost =  Post::withCount('comments')->latest('id')->take(6)->get();
        $categories = PostCategory::latest()->take(6)->get();
        $blog->load('author', 'category')->loadCount('comments');

        return view('frontend.blog-single', compact('blog', 'categories', 'recentPost'));
    }

    /**
     * View Privacy Policy page
     *
     * @return void
     */
    public function privacy()
    {
        return view('frontend.privacy')->withCms(Cms::select(['privacy_body', 'privacy_background'])->first());
    }

    /**
     * View Terms & Condition page
     *
     * @return void
     */
    public function terms()
    {
        return view('frontend.terms')->withCms(Cms::select(['terms_body', 'terms_background'])->first());
    }

    /**
     *
     * @param int $post_id
     * @return array
     */
    public function commentsCount($post_id)
    {
        return BlogComment::where('post_id', $post_id)->count();
    }

    /**
     *
     * @param int $post_id
     * @return array
     */
    public function pricePlanDetails($plan_label)
    {
        if (request('email')) {
            $user = User::where('email', request('email'))->firstOrFail();
            Auth::guard('user')->login($user);
        }

        if (!request('email') && !auth('user')->check()) {
            abort(404);
        }

        // session data storing
        $plan = Plan::where('label', $plan_label)->first();
        session(['stripe_amount' => currencyConversion($plan->price) * 100]);
        session(['razor_amount' => currencyConversion($plan->price, null, 'INR', 1) * 100]);
        session(['ssl_amount' => currencyConversion($plan->price, null, 'BDT', 1)]);
        session(['plan' => $plan]);

        // midtrans snap token
        if (config('zakirsoft.midtrans_active') && config('zakirsoft.midtrans_id') && config('zakirsoft.midtrans_key') && config('zakirsoft.midtrans_secret')) {
            $usd = $plan->price;
            $amount = (int) Currency::convert()
                ->from(config('zakirsoft.currency'))
                ->to('IDR')
                ->amount($usd)
                ->round(2)
                ->get();

            $order['order_no'] = uniqid();
            $order['total_price'] = $amount;

            $midtrans = new CreateSnapTokenService($order);
            $snapToken = $midtrans->getSnapToken();

            session(['midtrans_details' => [
                'order_no' => $order['order_no'],
                'total_price' => $order['total_price'],
                'snap_token' => $snapToken,
                'plan_id' => $plan->id,
            ]]);
        }

        return view('frontend.plan-details', [
            'plan' => $plan,
            'mid_token' => $snapToken ?? null,
        ]);
    }

    public function adGalleryDetails(Ad $ad)
    {
        $ad->load('galleries');
        return view('frontend.single-ad-gallery', compact('ad'));
    }

    public function attachmentDownload(Request $request)
    {
        $field = ProductCustomField::with('customField')->FindOrFail($request->field);
        $file = public_path() . $field->value;

        if (file_exists($file)) {

            return response()->download($file);
        }
        flashWarning('File not found .');
        return redirect()->back();
    }

    public function setSession(Request $request)
    {
        $request->session()->put('location', $request->input());
        return response()->json(true);
    }
}
