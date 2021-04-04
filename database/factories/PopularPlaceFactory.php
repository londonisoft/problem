<?php

namespace Database\Factories;

use App\Models\PopularPlace;
use Illuminate\Database\Eloquent\Factories\Factory;

class PopularPlaceFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = PopularPlace::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->text(100),
            'name_bn' => $this->faker->text(100),
            'property' => rand(100, 1000),
            'image' => 'img/fake/'.$this->faker->image('public/img/fake',640,480, null, false),
            'status' => 1
        ];
    }
}
