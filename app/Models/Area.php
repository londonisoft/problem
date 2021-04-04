<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    use HasFactory;

    public function dhakaNeibor () {
        return $this->belongsToMany(DhakaNeigbor::class, 'dhaka_neigbor_areas');
    }
}
