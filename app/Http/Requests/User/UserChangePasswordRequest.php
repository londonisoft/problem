<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class UserChangePasswordRequest extends FormRequest
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
            'old_password'          => 'required',
            'password'              => 'required|confirmed',
            'password_confirmation' => 'required',
        ];
    }

    public function messages() {
        return [
            "old_password.required" => "Old password is required",
            "password.required" => "Password is required",
            "password_confirmation.required" => "Confirm password required",
            "password_confirmation.confirmed" => "New and confirm password not match",
        ];
    }

}
