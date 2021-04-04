<?php

namespace Database\Seeders;

use App\Models\Property;
use App\Models\ServiceCategory;
use App\Models\AllService;
use App\Models\Unit;
use App\Models\ProductCategory;
use App\Models\Product;
use App\Models\ExternalUser;
use App\Models\Block;
use App\Models\Area;
use App\Models\AreaGuide;
use App\Models\Brand;
use App\Models\Category;
use App\Models\DhakaNeigbor;
use App\Models\PopularPlace;
use App\Models\Blog;
use App\Models\User;
use Illuminate\Database\Seeder;
use DB;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        User::factory()->count(1)->create();
        ExternalUser::factory(10)->create();
        $this->call([
            LocationSeeder::class
        ]);
        
        Area::factory()->count(5)->create();
        AreaGuide::factory()->count(5)->create();
        Brand::factory()->count(5)->create();
        Category::factory()->count(5)->create();
        DhakaNeigbor::factory()->count(5)->create();
        PopularPlace::factory()->count(5)->create();
        Blog::factory()->count(5)->create();

        Block::factory()->count(5)->create();
        Property::factory()->count(5)->create();
        ServiceCategory::factory()->count(5)->create();
        AllService::factory()->count(5)->create();
        Unit::factory()->count(5)->create();
        ProductCategory::factory()->count(5)->create();
        Product::factory()->count(5)->create();
    }
}
