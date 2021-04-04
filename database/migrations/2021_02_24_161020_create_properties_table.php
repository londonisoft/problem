<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePropertiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();
        Schema::create('properties', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('external_user_id');
            $table->unsignedBigInteger("division_id")->nullable();
            $table->unsignedBigInteger("district_id")->nullable();
 //           $table->unsignedBigInteger("upazila_id")->nullable();
            $table->unsignedBigInteger("thana_id")->nullable();
            $table->unsignedBigInteger("area_id")->nullable();
            $table->unsignedBigInteger("block_id")->nullable();
            $table->string("title")->nullable();
            $table->string("bn_title")->nullable();
            $table->string("property_id")->nullable();
            $table->text("short_description")->nullable();
            $table->text("short_description_bn")->nullable();
            $table->text("description")->nullable();
            $table->text("bn_description")->nullable();
            $table->text("address")->nullable();
            $table->text("address_bn")->nullable();
            $table->string("status")->nullable(); #1=Popular,2=normal
            $table->double("price")->nullable();
            $table->double("interest_rate")->nullable();
            $table->double("sqft")->nullable();
            $table->string("lat")->nullable();
            $table->string("lon")->nullable();
            $table->string("beds")->nullable();
            $table->integer("baths")->nullable();
            $table->tinyInteger("purpose")->nullable()->comment('1 = Sale, 2 = Rent');
            $table->tinyInteger("advanced")->nullable()->comment('0 = Any, 1 = Video Tour');
            $table->tinyInteger("property_type")->nullable()->comment('1 = Apartment, 2 = Penthouse, 3 = Plaza, 4 = Plot, 5 = Room, 6 = Duplex, 7 = Building');
            $table->integer("garage")->nullable();
            $table->integer("balcony")->nullable();
            $table->string("amenit_ids")->nullable();
            $table->string("education_ids")->nullable();
            $table->string("hospital_ids")->nullable();
            $table->string("restaurant_ids")->nullable();
            $table->string("park_ids")->nullable();
            $table->string("religious_ids")->nullable();
            $table->string("video_link")->nullable();
            $table->string("contact_no")->nullable();
            $table->string("contact_no_show")->nullable(); #1=admin,2=external_user
            $table->string("contact_email")->nullable();
            $table->tinyInteger("is_featured")->default(0);
            $table->boolean("approval_status")->default(false);
            $table->timestamps();
            $table->foreign('external_user_id')->references('id')->on('external_users');
            $table->foreign('division_id')->references('id')->on('divisions');
            $table->foreign('district_id')->references('id')->on('districts');
            $table->foreign('thana_id')->references('id')->on('thanas');
//            $table->foreign('upazila_id')->references('id')->on('thanas');
            $table->foreign('area_id')->references('id')->on('areas');
            $table->foreign('block_id')->references('id')->on('blocks');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('properties');
    }
}
