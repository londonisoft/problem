<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\PropertyImage;

class Property extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function images () {
        return $this->hasMany(PropertyImage::class);
    }
}
