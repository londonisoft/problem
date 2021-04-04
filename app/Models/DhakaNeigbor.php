<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DhakaNeigbor extends Model
{
    use HasFactory;

    public function areas () {
        return $this->belongsToMany(Area::class, 'dhaka_neigbor_areas' ,'dhaka_neigbor_id','area_id');
    }
}
