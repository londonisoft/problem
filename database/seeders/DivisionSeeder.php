<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Division;
use Str;
class DivisionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $divisions = array(
            array('name' => 'Chattagram', 'name_bn' => 'চট্টগ্রাম', 'url' => 'www.chittagongdiv.gov.bd'),
            array('name' => 'Rajshahi', 'name_bn' => 'রাজশাহী', 'url' => 'www.rajshahidiv.gov.bd'),
            array('name' => 'Khulna', 'name_bn' => 'খুলনা', 'url' => 'www.khulnadiv.gov.bd'),
            array('name' => 'Barisal', 'name_bn' => 'বরিশাল', 'url' => 'www.barisaldiv.gov.bd'),
            array('name' => 'Sylhet', 'name_bn' => 'সিলেট', 'url' => 'www.sylhetdiv.gov.bd'),
            array('name' => 'Dhaka', 'name_bn' => 'ঢাকা', 'url' => 'www.dhakadiv.gov.bd'),
            array('name' => 'Rangpur', 'name_bn' => 'রংপুর', 'url' => 'www.rangpurdiv.gov.bd'),
            array('name' => 'Mymensingh', 'name_bn' => 'ময়মনসিংহ', 'url' => 'www.mymensinghdiv.gov.bd'),
        );

        foreach ($divisions as $division) {
            Division::create([
                'name' => $division['name'],
                'bn_name' => $division['name_bn'],
                'url' => $division['url'],
                'slug' => Str::slug($division['name']),
                'status' => 1
            ]);
        }
    }
}
