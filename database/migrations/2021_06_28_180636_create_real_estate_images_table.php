<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRealEstateImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('real_estate_images', function (Blueprint $table) {
			$table->id();
            $table->unsignedBigInteger("real_estate_id")->nullable();
            $table->unsignedBigInteger("external_user_id")->nullable();
            $table->string("image")->nullable();
            $table->string("image_type_id")->nullable()->comment('1= thumnail,2= floor plan');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('real_estate_images');
    }
}
