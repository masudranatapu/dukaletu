<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Setting;
use Illuminate\Support\Str;
use Modules\Ad\Entities\Ad;
use Illuminate\Http\Request;
use Modules\Brand\Entities\Brand;
use App\Http\Traits\AdCreateTrait;
use Illuminate\Support\Facades\DB;
use Modules\Ad\Entities\AdGallery;
use App\Http\Controllers\Controller;
use Modules\Category\Entities\Category;
use Modules\CustomField\Entities\CustomField;
use Modules\CustomField\Entities\ProductCustomField;
use Illuminate\Support\Facades\File;
use App\Models\UserPlan;
use Google\Service\Fitness\Session;

class AdPostController extends Controller
{
    use AdCreateTrait;

    /**
     * Ad Create step 1.
     * @return void
     */
    public function postStep1()
    {
        $this->stepCheck();
        if (session('step1')) {
            $categories = Category::latest('id')->get();
            // $brands = Brand::latest('id')->get();
            $ad = session('ad');

            // return view('frontend.postad.step1', compact('categories', 'brands', 'ad'));
            return view('frontend.postad.step1', compact('categories', 'ad'));
        } else {
            return redirect()->route('frontend.post');
        }
    }

    /**
     * Ad Create step 2.
     *
     * @return void
     */
    public function postStep2()
    {
        if (session('step2')) {
            $ad = session('ad');

            $category = Category::with('customFields.values')->FindOrFail($ad->category_id);

            return view('frontend.postad.step2', compact('ad', 'category'));
        } else {
            return redirect()->route('frontend.post');
        }
    }

    /**
     * Ad Create step 3.
     *
     * @return void
     */
    public function postStep3()
    {
        if (session('step3')) {
            return view('frontend.postad.step3');
        } else {
            return redirect()->route('frontend.post');
        }
    }

    /**
     * Store Ad Create step 1.ul Islam <devboyarif@gmail.com>
     *  @param  Request $request
     * @return void
     */
    public function storePostStep1(Request $request)
    {

        $validatedData = $request->validate([
            'title' => 'required',
            'price' => 'required|numeric',
            'category_id' => 'required',
            'subcategory_id' => 'sometimes',
            'brand_id' => 'sometimes',
        ]);

        if ($request->featured) {
            $isfeatured = 1;
        } else {
            $isfeatured = 0;
        }

        try {
            if (empty(session('ad'))) {
                $ad = new Ad();
                $slug = Str::slug($request->title);

                $check = DB::table('ads')->where('slug', $slug)->first();
                $lastAD = Ad::orderBy('id', 'desc')->first();
                if ($check) {
                    $slug = $slug . '-' . (int)$lastAD->id + 1;
                }
                $ad['slug'] = $slug;
                $ad['featured'] = $isfeatured;
                // $ad['is_featured'] = $isfeatured;
                $ad->fill($validatedData);
                $request->session()->put('ad', $ad);
            } else {
                $ad = session('ad');
                $ad['slug'] = Str::slug($request->title);
                $ad['featured'] = $request->featured ?? 0;
                // $ad['is_featured'] = $isfeatured;
                $ad->fill($validatedData);
                $request->session()->put('ad', $ad);
            }

            $this->step1Success();
            return redirect()->route('frontend.post.step2');
        } catch (\Throwable $th) {

            $this->forgetStepSession();
            return redirect()->back()->with('error', 'Something went wrong while saving your ad.Please try again.');
        }
    }

    /**
     * Store Ad Create step 2.
     *  @param  Request $request
     * @return void
     */
    public function storePostStep2(Request $request)
    {
        $validatedData = $request->validate([
            'phone' => 'sometimes',
            'show_phone' => 'sometimes',
        ]);

        session()->put('location', $request->location);
        $location = session()->get('location');

        if (!$location) {

            $request->validate([
                // 'phone_2' => 'sometimes',
                // 'location.neighborhood' => 'required',
                // 'location.locality' => 'required',
                // 'location.place' => 'required',
                // 'location.postcode' => 'required',
                // 'location.region' => 'required',
                'phone' => 'sometimes',
                'location.district' => 'required',
                'location.country' => 'required',
            ], [
                // 'location.neighborhood.required' => 'The neighborhood field isrequired',
                // 'location.locality.required' => 'The locality field isrequired',
                // 'location.place.required' => 'The place field isrequired',
                // 'location.postcode.required' => 'The postcode field isrequired',
                // 'location.region.required' => 'The region field isrequired',
                'location.district.required' => 'The City field isrequired',
                'location.country.required' => 'The country field isrequired',

            ]);
        }



        $category = Category::with('customFields.values')->FindOrFail($request->category);

        foreach ($category->customFields as $field) {

            if ($field->slug !== $request->has($field->slug) && $field->required) {
                if ($field->type != 'checkbox' && $field->type != 'checkbox_multiple') {
                    $request->validate([
                        $field->slug => 'required',
                    ]);
                }
            }
            if ($field->type == 'textarea') {
                $request->validate([
                    $field->slug => 'max:255',
                ]);
            }
            if ($field->type == 'url') {
                $request->validate([
                    $field->slug => 'url',
                ]);
            }
            if ($field->type == 'number') {
                $request->validate([
                    $field->slug => 'numeric',
                ]);
            }
            if ($field->type == 'date') {
                $request->validate([
                    $field->slug => 'date',
                ]);
            }
        }

        $newItem = [];
        foreach ($request->except('cf') as $key =>  $value) {

            $fileType = gettype($value);

            if ($fileType == 'object') {

                $image = uploadImage($value, '/custom-field/');

                $item = [$key => $image];
            } else {

                $item = [$key => $value];
            }

            array_push($newItem, $item);
        }

        session()->put('custom-field', $newItem);
        session()->put('custom-field-checkbox', $request->get('cf'));

        try {
            $ad = session('ad');
            $ad->fill($validatedData);
            $request->session()->put('ad', $ad);

            $this->step1Success2();
            return redirect()->route('frontend.post.step3');
        } catch (\Throwable $th) {
            $this->forgetStepSession();
            return redirect()->route('frontend.post')->with('error', 'Something went wrong while saving your ad.Please try again.');
        }
    }

    /**
     * Store Ad Create step 3.
     *  @param  Request $request
     * @return void
     */
    public function storePostStep3(Request $request)
    {
        //  dd($request->all());
        $maximum_ad_image_limit = setting('maximum_ad_image_limit');

        $validatedData = $request->validate([
            'description' => 'required',
            'images.*' => 'image|mimes:jpeg,png,jpg|max:2048'
        ]);

        if (!$request->hasFile('images')) {
            return redirect()->back()->with('error', 'Please upload at least 2 to ' . $maximum_ad_image_limit . ' images.');
        }

        $image_count = count($request->file('images'));
        if (($image_count < 2) || ($image_count > $maximum_ad_image_limit)) {
            return redirect()->back()->with('error', 'Please upload at least 2 to ' . $maximum_ad_image_limit . ' images.');
        }

        $ad = session('ad');
        $ad['description'] = $validatedData['description'];
        $ad['user_id'] = auth('user')->id();
        $ad['whatsapp'] = $ad['whatsapp'] ?? '';
        $request->session()->put('ad', $ad);
        $ad['status'] = setting('ads_admin_approval') ? 'pending' : 'active';
        $ad->save();

        // image uploading
        $images = $request->file('images');
        foreach ($images as $key => $image) {
            if ($key == 0 && $image && $image->isValid()) {

                $url = uploadImage($image, 'addss_image', true);
                $ad->update(['thumbnail' => $url]);
            }

            if ($image && $image->isValid()) {

                $url = uploadImage($image, 'adds_multiple', true);
                $ad->galleries()->create(['image' => $url]);
            }
        }

        // feature inserting
        // $features = $request->features;

        // dd(count($features) > 1);

        // if (isset($features)) {

        //     foreach ($features as $feature) {
        //         $ad->adFeatures()->create(['name' => $feature]);
        //     }
        // }

        $this->forgetStepSession();
        $this->adNotification($ad);
        !setting('ads_admin_approval') ? $this->userPlanInfoUpdate($ad->featured) : '';

        // ===================== For Custom Field   ================
        $customField  =  session()->get('custom-field'); // without checkbox
        $checkboxFields = session()->get('custom-field-checkbox'); // with checkbox

        if ($checkboxFields) {
            foreach ($checkboxFields as $key => $values) {
                $CustomField = CustomField::findOrFail($key)->load('customFieldGroup');

                if (gettype($values) == 'array') {
                    $imploded_value = implode(", ", $values);

                    $ad->productCustomFields()->create([
                        'custom_field_id' => $key,
                        'value' => $imploded_value,
                        'custom_field_group_id' => $CustomField->custom_field_group_id,
                    ]);
                } else {
                    $ad->productCustomFields()->create([
                        'custom_field_id' => $key,
                        'value' => $values ?? '0',
                        'custom_field_group_id' => $CustomField->custom_field_group_id,
                    ]);
                }
            }
        }

        $category = Category::with('customFields.values')->FindOrFail($ad->category_id);
        foreach ($category->customFields as $field) {

            $customField  =  session()->get('custom-field');
            $keys = array_keys($customField);

            for ($i = 0; $i < count($customField); $i++) {

                foreach ($customField[$keys[$i]] as $key => $value) {

                    if ($field->slug == $key) {
                        $CustomField = CustomField::findOrFail($field->id)->load('customFieldGroup');

                        $ad->productCustomFields()->create([
                            'custom_field_id' => $field->id,
                            'value' => $value,
                            'custom_field_group_id' => $CustomField->custom_field_group_id,
                        ]);
                    }
                }
            }
        }
        session()->forget('custom-field');

        // <!--  location  -->
        $location = session()->get('location');


        // $region = array_key_exists("region", $location) ? $location['region'] : '';
        // $country = array_key_exists("country", $location) ? $location['country'] : '';
        // $address = Str::slug($region . '-' . $country);

        $ad->update([
            'address' => array_key_exists("address", $location) ? $location['address'] : '',
            'district' => array_key_exists("district", $location) ? $location['district'] : '',
            'country' => array_key_exists("country", $location) ? $location['country'] : '',
            // 'neighborhood' => array_key_exists("neighborhood", $location) ? $location['neighborhood'] : '',
            // 'locality' => array_key_exists("locality", $location) ? $location['locality'] : '',
            // 'place' => array_key_exists("place", $location) ? $location['place'] : '',
            // 'postcode' => array_key_exists("postcode", $location) ? $location['postcode'] : '',
            // 'region' => array_key_exists("region", $location) ? $location['region'] : '',
            // 'long' => 0,
            // 'lat' => 0,
        ]);

        session()->forget('location');

        return view('frontend.postad.postsuccess', [
            'ad_slug' => $ad->slug,
            'mode' => 'create'
        ]);
    }

    /**
     * Ad Edit step 1.
     * @return void
     */
    public function editPostStep1(Ad $ad)
    {
        if (auth('user')->id() == $ad->user_id) {
            $this->stepCheck();
            session(['edit_mode' => true]);

            if (session('step1') && session('edit_mode')) {
                $ad = collectionToResource($this->setAdEditStep1Data($ad));
                $categories = Category::latest('id')->get();
                $brands = Brand::latest('id')->get();

                return view('frontend.postad_edit.step1', compact('ad', 'categories', 'brands'));
            } else {
                return redirect()->route('frontend.dashboard');
            }
        }

        abort(404);
    }

    /**
     * Ad Edit step 2.
     *
     * @return void
     */
    public function editPostStep2(Ad $ad)
    {
        $fields = $ad->productCustomFields;

        $lat = $ad->lat;
        $long = $ad->long;

        if (auth('user')->id() == $ad->user_id) {

            $ad = collectionToResource($this->setAdEditStep2Data($ad));

            if (session('step2') && session('edit_mode')) {

                return view('frontend.postad_edit.step2', compact('lat', 'long', 'ad', 'fields'));
            } else {
                return redirect()->route('frontend.dashboard');
            }
        }

        abort(404);
    }

    /**
     * Edit Ad step 3.
     *
     * @return void
     */
    public function editPostStep3(Ad $ad)
    {
        $ad->load(['adFeatures', 'galleries' => function ($q) use ($ad) {
            return $q->where('ad_id', $ad->id);
        }]);


        if (auth('user')->id() == $ad->user_id) {
            $ad = collectionToResource($this->setAdEditStep3Data($ad));

            if (session('step3') && session('edit_mode')) {
                return view('frontend.postad_edit.step3', compact('ad'));
            } else {
                return redirect()->route('frontend.dashboard');
            }
        }

        abort(404);
    }

    /**
     * Update Ad step 1.ul Islam <devboyarif@gmail.com>
     *  @param  Request $request
     * @return void
     */
    public function UpdatePostStep1(Request $request, Ad $ad)
    {
        $request->validate([
            'title' => "required",
            'price' => 'required|numeric',
            'category_id' => 'required',
            // 'brand_id' => 'sometimes',
        ]);

        if ($ad->is_featured) {

            $isfeatured = 1;
            if ($request->featured) {
                $checkedfeatured = 1;
            } else {
                $checkedfeatured = 0;
            }
        } else {

            if ($request->featured) {
                $isfeatured = 1;

                $userplan = UserPlan::where('user_id', $ad->user_id)->first();
                UserPlan::where('id', $userplan->id)->update([
                    'featured_limit' => $userplan->featured_limit - 1,
                ]);

                $checkedfeatured = 1;
            } else {

                $isfeatured = 'no';
                $checkedfeatured = 0;
            }
        }

        $ad->update([
            'title' => $request->title,
            // 'slug' => Str::slug($request->title),
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'brand_id' => $request->brand_id,
            'price' => $request->price,
            'featured' => $checkedfeatured,
            // 'is_featured' => $isfeatured,
        ]);


        if ($request->cancel_edit) {
            $this->forgetStepSession();
            return redirect()->route('frontend.dashboard');
        } else {
            $this->step1Success();
            return redirect()->route('frontend.post.edit.step2', $ad->slug);
        }
    }

    /**
     * Update Ad step 2.
     *  @param  Request $request
     * @return void
     */
    public function updatePostStep2(Request $request, Ad $ad)
    {
        $request->validate([
            // 'phone_2' => 'sometimes',
            // 'location.neighborhood' => 'required',
            // 'location.locality' => 'required',
            // 'location.place' => 'required',
            // 'location.postcode' => 'required',
            // 'location.region' => 'required',
            'phone' => 'sometimes',
            'location.district' => 'required',
            'location.country' => 'required',
            'location.address' => 'required',
        ], [
            // 'location.neighborhood.required' => 'The neighborhood field isrequired',
            // 'location.locality.required' => 'The locality field isrequired',
            // 'location.place.required' => 'The place field isrequired',
            // 'location.postcode.required' => 'The postcode field isrequired',
            // 'location.region.required' => 'The region field isrequired',
            'location.district.required' => 'The City field isrequired',
            'location.country.required' => 'The country field isrequired',

        ]);

        $this->updateCustomField($request, $ad);

        $ad->update([
            'phone' => $request->phone,
            'show_phone' => $request->show_phone,
            // 'phone_2' => $request->phone_2,
            'whatsapp' => $request->whatsapp,
        ]);

        // <!--  location  -->
        $location = session()->get('location');

        if (!isset($location)) {
            $location = session()->put('location', $request->location);
        }
        $location = session()->get('location');



        if ($location) {

            // $region = array_key_exists("region", $location) ? $location['region'] : '';
            // $country = array_key_exists("country", $location) ? $location['country'] : '';
            // $address = Str::slug($region . '-' . $country);

            $ad->update([
                // 'neighborhood' => array_key_exists("neighborhood", $location) ? $location['neighborhood'] : '',
                // 'locality' => array_key_exists("locality", $location) ? $location['locality'] : '',
                // 'place' => array_key_exists("place", $location) ? $location['place'] : '',
                // 'postcode' => array_key_exists("postcode", $location) ? $location['postcode'] : '',
                // 'region' => array_key_exists("region", $location) ? $location['region'] : '',
                'address' => array_key_exists("address", $location) ? $location['address'] : '',
                'district' => array_key_exists("district", $location) ? $location['district'] : '',
                'country' => array_key_exists("country", $location) ? $location['country'] : '',
                'long' => 0,
                'lat' => 0,
            ]);
            session()->forget('location');
        }


        if ($request->cancel_edit) {
            $this->forgetStepSession();
            return redirect()->route('frontend.dashboard');
        } else {
            $this->step1Success2();
            return redirect()->route('frontend.post.edit.step3', $ad->slug);
        }
    }

    /**
     * Update Ad step 3.
     *  @param  Request $request
     * @return void
     */
    public function updatePostStep3(Request $request, Ad $ad)
    {
        $request->validate([
            'description' => 'required',
        ]);

        $ad->update(['description' => $request->description]);

        // // feature inserting
        // $ad->adFeatures()->delete();
        // foreach ($request->features as $feature) {
        //     if ($feature) {
        //         $ad->adFeatures()->create(['name' => $feature]);
        //     }
        // }

        $thumbnail = $request->file('thumbnail');
        $old_thumb = $request->old_thumbnail;
        if ($thumbnail && $thumbnail->isValid()) {
            $thumb =  uploadImage($thumbnail, 'addds_image', true);


            if (File::exists($old_thumb)) {
                @unlink($old_thumb);
            }
            $tr = $ad->update(['thumbnail' => $thumb]);
            // dd($old_thumb);
        }
        // dd($tr);

        // image uploading
        $images = $request->file('images');
        if ($images) {
            foreach ($images as $image) {
                if ($image && $image->isValid()) {

                    $url = uploadImage($image, 'adds_multiple', true);
                    $ad->galleries()->create(['image' => $url]);
                }
            }
        }

        $this->forgetStepSession();
        $this->adNotification($ad, 'update');

        return view('frontend.postad.postsuccess', [
            'ad_slug' => $ad->slug,
            'mode' => 'update',
        ]);
        // return view('frontend.postad.custom-field-edit', compact('ad'));
    }

    /**
     * Cancel Ad Edit.
     * @return void
     */
    public function cancelAdPostEdit()
    {
        $this->forgetStepSession();
        return redirect()->route('frontend.dashboard');
    }

    public function adGalleryDelete($ad_gallery)
    {
        $ad_gallery = AdGallery::find($ad_gallery);
        if ($ad_gallery) {
            $ad_gallery->delete();
        }
    }

    protected function updateCustomField($request, Ad $ad)
    {
        $category = Category::with('customFields.values')->FindOrFail($ad->category_id);

        foreach ($category->customFields as $field) {
            if ($field->slug !== $request->has($field->slug) && $field->required) {
                if ($field->type != 'checkbox' && $field->type != 'checkbox_multiple') {
                    $request->validate([
                        $field->slug => 'required',
                    ]);
                }
            }
            if ($field->type == 'textarea') {
                $request->validate([
                    $field->slug => 'max:255',
                ]);
            }
            if ($field->type == 'url') {
                $request->validate([
                    $field->slug => 'url',
                ]);
            }
            if ($field->type == 'number') {
                $request->validate([
                    $field->slug => 'numeric',
                ]);
            }
            if ($field->type == 'date') {
                $request->validate([
                    $field->slug => 'date',
                ]);
            }
        }

        // First Delete If Custom Field Value exist for this Ad
        $field_values = ProductCustomField::where('ad_id', $ad->id)->get();
        foreach ($field_values as $item) {

            if (file_exists($item->value)) {
                unlink($item->value);
            }
            $item->delete();
        }

        $checkboxFields = [];
        if (request()->filled('cf')) {
            $checkboxFields = request()->get('cf');
        }

        // Checkbox Fields
        if ($checkboxFields) {
            foreach ($checkboxFields as $key => $values) {
                $CustomField = CustomField::findOrFail($key)->load('customFieldGroup');

                if (gettype($values) == 'array') {
                    $imploded_value = implode(", ", $values);

                    $ad->productCustomFields()->create([
                        'custom_field_id' => $key,
                        'value' => $imploded_value,
                        'custom_field_group_id' => $CustomField->custom_field_group_id,
                    ]);
                } else {
                    $ad->productCustomFields()->create([
                        'custom_field_id' => $key,
                        'value' => $values ?? '0',
                        'custom_field_group_id' => $CustomField->custom_field_group_id,
                    ]);
                }
            }
        }

        // then insert
        foreach ($category->customFields as $field) {

            if ($field->slug == $request->has($field->slug)) {
                $CustomField = CustomField::findOrFail($field->id)->load('customFieldGroup');

                // check data type for confirm it is image
                $fileType = gettype(request($field->slug));

                if ($fileType == 'object') {
                    $image = uploadImage(request($field->slug), '/custom-field/');
                }

                $ad->productCustomFields()->create([
                    'custom_field_id' => $field->id,
                    'value' => $fileType == 'object' ? $image : request($field->slug),
                    'custom_field_group_id' => $CustomField->custom_field_group_id,
                ]);
            }
        }

        return true;
    }
}
