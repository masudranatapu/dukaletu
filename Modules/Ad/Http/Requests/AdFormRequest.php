<?php

namespace Modules\Ad\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AdFormRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if ($this->method() === 'POST') {
            return [
                'title' => 'required',
                'price' => 'required|numeric',
                'featured' => 'sometimes',
                'category_id' => 'required',
                'subcategory_id' => 'sometimes',
                // 'brand_id' => 'required',
                'phone' => 'sometimes',
                'phone_2' => 'sometimes',
                'description' => 'required',
                'thumbnail' => 'required',
                'user_id' => "required",
                'address' => "required",
                'district' => "required",
                'country' => "required",

            ];
        } else {
            return [
                'title' => "required",
                'price' => 'required|numeric',
                'featured' => 'sometimes',
                'category_id' => 'required',
                'subcategory_id' => 'sometimes',
                // 'brand_id' => 'required',
                'phone' => 'sometimes',
                'phone_2' => 'sometimes',
                'description' => 'required',
                'user_id' => "required",
                'address' => "required",
                'district' => "required",
                'country' => "required",
            ];
        }
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
}
