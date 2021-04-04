<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public function category () {
        return $this->belongsTo(ProductCategory::class, 'product_category_id', 'id');
    }
    public function unit () {
        return $this->belongsTo(Unit::class, 'unit_id', 'id');
    }
    public function user () {
        return $this->belongsTo(ExternalUser::class, 'external_user_id', 'id');
    }
}
