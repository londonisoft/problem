<?php

namespace Database\Factories;

use App\Models\AreaGuide;
use Illuminate\Database\Eloquent\Factories\Factory;
use DB;
class AreaGuideFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = AreaGuide::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        							
        $areas = DB::table('areas')->count();
        return [
            'area_id' => $this->faker->numberBetween(1, $areas),
            'title' => $this->faker->text(100),
            'bn_title' => $this->faker->text(100),
            'description' => $this->faker->text(500),
            'bn_description' => $this->faker->text(500),
            'video_link' => 'https://www.youtube.com/watch?v=errT-_IvDVg',
            'image' => 'img/fake/'.$this->faker->image('public/img/fake',640,480, null, false),
            'type' => rand(1,5),
            'status' => 1
        ];
    }
}
