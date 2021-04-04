<?php

namespace Database\Factories;

use App\Models\Property;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\DB;

class PropertyFactory extends Factory
{
    protected $model = Property::class;

    public function definition()
    {
        $maxExternalUser = DB::table('external_users')->count();
        $maxDivision = DB::table('divisions')->count();
        $maxDistrict = DB::table('districts')->count();
        $maxUpazila = DB::table('upazilas')->count();
        $maxArea    = DB::table('areas')->count();
        $maxBlock   = DB::table('blocks')->count();

        return [
            'external_user_id' => $this->faker->numberBetween(1, $maxExternalUser),
            'division_id' => $this->faker->numberBetween(1, $maxDivision),
            'district_id' => $this->faker->numberBetween(1, $maxDistrict),
            'thana_id' => $this->faker->numberBetween(1, $maxUpazila),
            'area_id' => $this->faker->numberBetween(1, $maxArea),
            'block_id' => $this->faker->numberBetween(1, $maxBlock),
            'title' => $this->faker->text(30),
            'bn_title' => $this->faker->text(30),
            'short_description' => $this->faker->text(500),
            'short_description_bn' => $this->faker->text(500),
            'description' => $this->faker->text(1000),
            'bn_description' => $this->faker->text(1000),
            'address' => $this->faker->address,
            'address_bn' => $this->faker->address,
            'status' => $this->faker->numberBetween(1, 2),
            'price' => $this->faker->randomFloat(2, 999999, 9999999),
            'interest_rate' => $this->faker->randomFloat(null, 1, 30),
            'sqft' => $this->faker->randomFloat(2, 700, 5000),
            'lat' => $this->faker->latitude,
            'lon' => $this->faker->longitude,
            'beds' => $this->faker->numberBetween(2, 50),
            'baths' => $this->faker->numberBetween(1, 6),
            'purpose' => $this->faker->numberBetween(1, 2),
            'advanced' => $this->faker->numberBetween(0, 1),
            'property_type' => $this->faker->numberBetween(1, 7),
            'garage' => $this->faker->numberBetween(1, 3),
            'balcony' => $this->faker->numberBetween(1, 10),
            'parks' => $this->faker->numberBetween(1, 10),
            'amenities' => $this->faker->text(200),
            'educational_institutes' => $this->faker->realText(200),
            'hospitals' => $this->faker->realText(200),
            'restaurants' => $this->faker->realText(200),
            'religious' => $this->faker->realText(200),
            'video_link' => 'https://www.youtube.com/watch?v=errT-_IvDVg',
            'contact_no' => $this->faker->phoneNumber,
            'contact_no_show' => $this->faker->numberBetween(1, 2),
            'contact_email' => $this->faker->unique()->safeEmail,
            'approval_status' => $this->faker->boolean(80)
        ];
    }
}
