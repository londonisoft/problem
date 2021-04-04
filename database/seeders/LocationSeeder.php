<?php

namespace Database\Seeders;

use App\Lib\Locations;
use App\Models\District;
use App\Models\Division;
use App\Models\Upazila;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class LocationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
//        $divisions = Locations::divisions();
        $upazilas = Locations::upazilas();
//        $districts = Locations::districts();

//        DB::table('divisions')->insert($divisions);
//        DB::table('districts')->insert($districts);
        $this->call(DivisionSeeder::class);
        $this->call(DistrictSeeder::class);
        $this->call(ThanaSeeder::class);
        DB::table('upazilas')->insert($upazilas);
    }
}
