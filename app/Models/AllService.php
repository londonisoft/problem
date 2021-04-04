<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AllService extends Model
{
    use HasFactory;
    
    public function category () {
        return $this->belongsTo(ServiceCategory::class, 'service_category_id', 'id');
    }
    public function user () {
        return $this->belongsTo(ExternalUser::class, 'external_user_id', 'id');
    }
}
