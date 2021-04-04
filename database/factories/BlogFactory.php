<?php

namespace Database\Factories;

use App\Models\Blog;
use Illuminate\Database\Eloquent\Factories\Factory;
use DB;
class BlogFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Blog::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $categories = DB::table('categories')->count();
        return [
            'category_id' => $this->faker->numberBetween(1, $categories),
            'title' => $this->faker->text(100),
            'bn_title' => $this->faker->text(100),
            'description' => $this->faker->text(500),
            'bn_description' => $this->faker->text(500),
            'image' => 'img/fake/'.$this->faker->image('public/img/fake',640,480, null, false),
            'status' => 1
        ];
    }
}
