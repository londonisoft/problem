<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class UserProfileRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'   => 'required',
            'email'  => 'required',
            'phone'  => 'required',
        ];
    }

    public function messages() {
        return [
            'name.required'  => 'Name field required',
            'email.required' => 'Email field required',
            'phone.required' => 'Phone field required',
        ];
    }
}
