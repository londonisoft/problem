<?php

namespace Database\Factories;
use DB;
use App\Models\AllService;
use Illuminate\Database\Eloquent\Factories\Factory;

class AllServiceFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = AllService::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $maxExternalUser = DB::table('external_users')->count();
        $service_categories = DB::table('service_categories')->count();
        return [
            'external_user_id' => $this->faker->numberBetween(1, $maxExternalUser),
            'service_category_id' => $this->faker->numberBetween(1, $service_categories),
            'name' => $this->faker->text(80),
            'name_bn' => $this->faker->text(80),
            'description' => $this->faker->text(300),
            'description_bn' => $this->faker->text(300),
            'image' => 'img/fake/'.$this->faker->image('public/img/fake',640,480, null, false),
            'status'=>1
        ];
    }
}
