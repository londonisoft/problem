<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;
use DB;
class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $maxExternalUser = DB::table('external_users')->count();
        $product_categories = DB::table('product_categories')->count();
        $units = DB::table('units')->count();
        return [
            'external_user_id' => $this->faker->numberBetween(1, $maxExternalUser),
            'product_category_id' => $this->faker->numberBetween(1, $product_categories),
            'unit_id' => $this->faker->numberBetween(1, $units),
            'name' => $this->faker->text(80),
            'name_bn' => $this->faker->text(80),
            'description' => $this->faker->text(300),
            'description_bn' => $this->faker->text(300),
            'image' => 'img/fake/'.$this->faker->image('public/img/fake',640,480, null, false),
            'price' => $this->faker->randomFloat(null, 700, 5000),
            'status' => 1
        ];
    
    }
}
