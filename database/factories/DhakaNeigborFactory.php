<?php

namespace Database\Factories;

use App\Models\DhakaNeigbor;
use Illuminate\Database\Eloquent\Factories\Factory;

class DhakaNeigborFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = DhakaNeigbor::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->text(10),
            'name_bn' => $this->faker->text(10),
            'status' => 1
        ];
    }
}
