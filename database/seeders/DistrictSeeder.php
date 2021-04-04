<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Division;
use App\Models\District;
use Str;

class DistrictSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $districts = array(
            array('division_slug' => 'chattagram', 'name' => 'Comilla', 'name_bn' => 'কুমিল্লা', 'lat' => '23.4682747', 'lon' => '91.1788135', 'url' => 'www.comilla.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Feni', 'name_bn' => 'ফেনী', 'lat' => '23.023231', 'lon' => '91.3840844', 'url' => 'www.feni.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Brahmanbaria', 'name_bn' => 'ব্রাহ্মণবাড়িয়া', 'lat' => '23.9570904', 'lon' => '91.1119286', 'url' => 'www.brahmanbaria.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Rangamati', 'name_bn' => 'রাঙ্গামাটি', 'lat' => null, 'lon' => null, 'url' => 'www.rangamati.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Noakhali', 'name_bn' => 'নোয়াখালী', 'lat' => '22.869563', 'lon' => '91.099398', 'url' => 'www.noakhali.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Chandpur', 'name_bn' => 'চাঁদপুর', 'lat' => '23.2332585', 'lon' => '90.6712912', 'url' => 'www.chandpur.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Lakshmipur', 'name_bn' => 'লক্ষ্মীপুর', 'lat' => '22.942477', 'lon' => '90.841184', 'url' => 'www.lakshmipur.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Chattogram', 'name_bn' => 'চট্টগ্রাম', 'lat' => '22.335109', 'lon' => '91.834073', 'url' => 'www.chittagong.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Coxsbazar', 'name_bn' => 'কক্সবাজার', 'lat' => null, 'lon' => null, 'url' => 'www.coxsbazar.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Khagrachhari', 'name_bn' => 'খাগড়াছড়ি', 'lat' => '23.119285', 'lon' => '91.984663', 'url' => 'www.khagrachhari.gov.bd'),
            array('division_slug' => 'chattagram', 'name' => 'Bandarban', 'name_bn' => 'বান্দরবান', 'lat' => '22.1953275', 'lon' => '92.2183773', 'url' => 'www.bandarban.gov.bd'),
            array('division_slug' => 'rajshahi', 'name' => 'Sirajganj', 'name_bn' => 'সিরাজগঞ্জ', 'lat' => '24.4533978', 'lon' => '89.7006815', 'url' => 'www.sirajganj.gov.bd'),
            array('division_slug' => 'rajshahi', 'name' => 'Pabna', 'name_bn' => 'পাবনা', 'lat' => '23.998524', 'lon' => '89.233645', 'url' => 'www.pabna.gov.bd'),
            array('division_slug' => 'rajshahi', 'name' => 'Bogura', 'name_bn' => 'বগুড়া', 'lat' => '24.8465228', 'lon' => '89.377755', 'url' => 'www.bogra.gov.bd'),
            array('division_slug' => 'rajshahi', 'name' => 'Rajshahi', 'name_bn' => 'রাজশাহী', 'lat' => null, 'lon' => null, 'url' => 'www.rajshahi.gov.bd'),
            array('division_slug' => 'rajshahi', 'name' => 'Natore', 'name_bn' => 'নাটোর', 'lat' => '24.420556', 'lon' => '89.000282', 'url' => 'www.natore.gov.bd'),
            array('division_slug' => 'rajshahi', 'name' => 'Joypurhat', 'name_bn' => 'জয়পুরহাট', 'lat' => null, 'lon' => null, 'url' => 'www.joypurhat.gov.bd'),
            array('division_slug' => 'rajshahi', 'name' => 'Chapainawabganj', 'name_bn' => 'চাঁপাইনবাবগঞ্জ', 'lat' => '24.5965034', 'lon' => '88.2775122', 'url' => 'www.chapainawabganj.gov.bd'),
            array('division_slug' => 'rajshahi', 'name' => 'Naogaon', 'name_bn' => 'নওগাঁ', 'lat' => null, 'lon' => null, 'url' => 'www.naogaon.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Jashore', 'name_bn' => 'যশোর', 'lat' => '23.16643', 'lon' => '89.2081126', 'url' => 'www.jessore.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Satkhira', 'name_bn' => 'সাতক্ষীরা', 'lat' => null, 'lon' => null, 'url' => 'www.satkhira.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Meherpur', 'name_bn' => 'মেহেরপুর', 'lat' => '23.762213', 'lon' => '88.631821', 'url' => 'www.meherpur.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Narail', 'name_bn' => 'নড়াইল', 'lat' => '23.172534', 'lon' => '89.512672', 'url' => 'www.narail.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Chuadanga', 'name_bn' => 'চুয়াডাঙ্গা', 'lat' => '23.6401961', 'lon' => '88.841841', 'url' => 'www.chuadanga.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Kushtia', 'name_bn' => 'কুষ্টিয়া', 'lat' => '23.901258', 'lon' => '89.120482', 'url' => 'www.kushtia.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Magura', 'name_bn' => 'মাগুরা', 'lat' => '23.487337', 'lon' => '89.419956', 'url' => 'www.magura.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Khulna', 'name_bn' => 'খুলনা', 'lat' => '22.815774', 'lon' => '89.568679', 'url' => 'www.khulna.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Bagerhat', 'name_bn' => 'বাগেরহাট', 'lat' => '22.651568', 'lon' => '89.785938', 'url' => 'www.bagerhat.gov.bd'),
            array('division_slug' => 'khulna', 'name' => 'Jhenaidah', 'name_bn' => 'ঝিনাইদহ', 'lat' => '23.5448176', 'lon' => '89.1539213', 'url' => 'www.jhenaidah.gov.bd'),
            array('division_slug' => 'barisal', 'name' => 'Jhalakathi', 'name_bn' => 'ঝালকাঠি', 'lat' => null, 'lon' => null, 'url' => 'www.jhalakathi.gov.bd'),
            array('division_slug' => 'barisal', 'name' => 'Patuakhali', 'name_bn' => 'পটুয়াখালী', 'lat' => '22.3596316', 'lon' => '90.3298712', 'url' => 'www.patuakhali.gov.bd'),
            array('division_slug' => 'barisal', 'name' => 'Pirojpur', 'name_bn' => 'পিরোজপুর', 'lat' => null, 'lon' => null, 'url' => 'www.pirojpur.gov.bd'),
            array('division_slug' => 'barisal', 'name' => 'Barisal', 'name_bn' => 'বরিশাল', 'lat' => null, 'lon' => null, 'url' => 'www.barisal.gov.bd'),
            array('division_slug' => 'barisal', 'name' => 'Bhola', 'name_bn' => 'ভোলা', 'lat' => '22.685923', 'lon' => '90.648179', 'url' => 'www.bhola.gov.bd'),
            array('division_slug' => 'barisal', 'name' => 'Barguna', 'name_bn' => 'বরগুনা', 'lat' => null, 'lon' => null, 'url' => 'www.barguna.gov.bd'),
            array('division_slug' => 'sylhet', 'name' => 'Sylhet', 'name_bn' => 'সিলেট', 'lat' => '24.8897956', 'lon' => '91.8697894', 'url' => 'www.sylhet.gov.bd'),
            array('division_slug' => 'sylhet', 'name' => 'Moulvibazar', 'name_bn' => 'মৌলভীবাজার', 'lat' => '24.482934', 'lon' => '91.777417', 'url' => 'www.moulvibazar.gov.bd'),
            array('division_slug' => 'sylhet', 'name' => 'Habiganj', 'name_bn' => 'হবিগঞ্জ', 'lat' => '24.374945', 'lon' => '91.41553', 'url' => 'www.habiganj.gov.bd'),
            array('division_slug' => 'sylhet', 'name' => 'Sunamganj', 'name_bn' => 'সুনামগঞ্জ', 'lat' => '25.0658042', 'lon' => '91.3950115', 'url' => 'www.sunamganj.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Narsingdi', 'name_bn' => 'নরসিংদী', 'lat' => '23.932233', 'lon' => '90.71541', 'url' => 'www.narsingdi.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Gazipur', 'name_bn' => 'গাজীপুর', 'lat' => '24.0022858', 'lon' => '90.4264283', 'url' => 'www.gazipur.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Shariatpur', 'name_bn' => 'শরীয়তপুর', 'lat' => null, 'lon' => null, 'url' => 'www.shariatpur.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Narayanganj', 'name_bn' => 'নারায়ণগঞ্জ', 'lat' => '23.63366', 'lon' => '90.496482', 'url' => 'www.narayanganj.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Tangail', 'name_bn' => 'টাঙ্গাইল', 'lat' => null, 'lon' => null, 'url' => 'www.tangail.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Kishoreganj', 'name_bn' => 'কিশোরগঞ্জ', 'lat' => '24.444937', 'lon' => '90.776575', 'url' => 'www.kishoreganj.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Manikganj', 'name_bn' => 'মানিকগঞ্জ', 'lat' => null, 'lon' => null, 'url' => 'www.manikganj.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Dhaka', 'name_bn' => 'ঢাকা', 'lat' => '23.7115253', 'lon' => '90.4111451', 'url' => 'www.dhaka.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Munshiganj', 'name_bn' => 'মুন্সিগঞ্জ', 'lat' => null, 'lon' => null, 'url' => 'www.munshiganj.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Rajbari', 'name_bn' => 'রাজবাড়ী', 'lat' => '23.7574305', 'lon' => '89.6444665', 'url' => 'www.rajbari.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Madaripur', 'name_bn' => 'মাদারীপুর', 'lat' => '23.164102', 'lon' => '90.1896805', 'url' => 'www.madaripur.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Gopalganj', 'name_bn' => 'গোপালগঞ্জ', 'lat' => '23.0050857', 'lon' => '89.8266059', 'url' => 'www.gopalganj.gov.bd'),
            array('division_slug' => 'dhaka', 'name' => 'Faridpur', 'name_bn' => 'ফরিদপুর', 'lat' => '23.6070822', 'lon' => '89.8429406', 'url' => 'www.faridpur.gov.bd'),
            array('division_slug' => 'rangpur', 'name' => 'Panchagarh', 'name_bn' => 'পঞ্চগড়', 'lat' => '26.3411', 'lon' => '88.5541606', 'url' => 'www.panchagarh.gov.bd'),
            array('division_slug' => 'rangpur', 'name' => 'Dinajpur', 'name_bn' => 'দিনাজপুর', 'lat' => '25.6217061', 'lon' => '88.6354504', 'url' => 'www.dinajpur.gov.bd'),
            array('division_slug' => 'rangpur', 'name' => 'Lalmonirhat', 'name_bn' => 'লালমনিরহাট', 'lat' => null, 'lon' => null, 'url' => 'www.lalmonirhat.gov.bd'),
            array('division_slug' => 'rangpur', 'name' => 'Nilphamari', 'name_bn' => 'নীলফামারী', 'lat' => '25.931794', 'lon' => '88.856006', 'url' => 'www.nilphamari.gov.bd'),
            array('division_slug' => 'rangpur', 'name' => 'Gaibandha', 'name_bn' => 'গাইবান্ধা', 'lat' => '25.328751', 'lon' => '89.528088', 'url' => 'www.gaibandha.gov.bd'),
            array('division_slug' => 'rangpur', 'name' => 'Thakurgaon', 'name_bn' => 'ঠাকুরগাঁও', 'lat' => '26.0336945', 'lon' => '88.4616834', 'url' => 'www.thakurgaon.gov.bd'),
            array('division_slug' => 'rangpur', 'name' => 'Rangpur', 'name_bn' => 'রংপুর', 'lat' => '25.7558096', 'lon' => '89.244462', 'url' => 'www.rangpur.gov.bd'),
            array('division_slug' => 'rangpur', 'name' => 'Kurigram', 'name_bn' => 'কুড়িগ্রাম', 'lat' => '25.805445', 'lon' => '89.636174', 'url' => 'www.kurigram.gov.bd'),
            array('division_slug' => 'mymensingh', 'name' => 'Sherpur', 'name_bn' => 'শেরপুর', 'lat' => '25.0204933', 'lon' => '90.0152966', 'url' => 'www.sherpur.gov.bd'),
            array('division_slug' => 'mymensingh', 'name' => 'Mymensingh', 'name_bn' => 'ময়মনসিংহ', 'lat' => null, 'lon' => null, 'url' => 'www.mymensingh.gov.bd'),
            array('division_slug' => 'mymensingh', 'name' => 'Jamalpur', 'name_bn' => 'জামালপুর', 'lat' => '24.937533', 'lon' => '89.937775', 'url' => 'www.jamalpur.gov.bd'),
            array('division_slug' => 'mymensingh', 'name' => 'Netrokona', 'name_bn' => 'নেত্রকোণা', 'lat' => '24.870955', 'lon' => '90.727887', 'url' => 'www.netrokona.gov.bd'),
        );

        foreach ($districts as $district) {
            $ds = $district['division_slug'];
            $divisionId = Division::where('slug', $ds)->first()->id;
            District::create([
                'division_id' => $divisionId,
                'name' => $district['name'],
                'bn_name' => $district['name_bn'],
                'lat' => $district['lat'],
                'lon' => $district['lon'],
                'url' => $district['url'],
                'slug' => Str::slug($district['name']),
                'status' => 1,
            ]);
        }
    }
}
