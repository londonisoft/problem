<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RealEstate extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function images () {
        return $this->hasMany(RealEstateImage::class);
    }
    public function details () {
        return $this->hasMany(RealEstateType::class);
    }
}
