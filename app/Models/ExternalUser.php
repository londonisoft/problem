<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class ExternalUser extends Authenticatable
{
    use HasFactory,Notifiable;
    use HasApiTokens;

    protected $guard = 'agent';

    protected $fillable = [
        'name', 'phone', 'password','user_type','address'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];
}
