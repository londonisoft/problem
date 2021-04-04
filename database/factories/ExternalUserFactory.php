<?php

namespace Database\Factories;

use App\Models\ExternalUser;
use Illuminate\Database\Eloquent\Factories\Factory;
use Str;
class ExternalUserFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = ExternalUser::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $mobile = "017302330".rand(11,99);
        return [
            'name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'address' => $this->faker->text(100),
            'address_bn' =>$this->faker->text(100),
            'phone' => $mobile,
            'user_type' => rand(1, 3),
            'image' => 'img/fake/'.$this->faker->image('public/img/fake', 179, 214, null, false),
            'facebook_link'=>'https://facebook.com',
            'twitter_link'=>'https://twitter.com',
            'linkedin_link'=>'https://linkedin.com'
        ];
    }
}
