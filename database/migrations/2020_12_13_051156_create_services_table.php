<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('services', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("user_id")->nullable();
            $table->unsignedBigInteger("agent_id")->nullable();
            $table->unsignedBigInteger("developer_id")->nullable();
            $table->unsignedBigInteger("division_id")->nullable();
            $table->unsignedBigInteger("district_id")->nullable();
            $table->unsignedBigInteger("thana_id")->nullable();
            $table->unsignedBigInteger("area_id")->nullable();
            $table->unsignedBigInteger("block_id")->nullable();
            $table->unsignedBigInteger("service_type_id")->nullable();
            $table->string("title")->nullable();
            $table->string("bn_title")->nullable();
            $table->text("description")->nullable();
            $table->text("bn_description")->nullable();
            $table->text("address")->nullable();
            $table->string("type")->nullable(); #1=Flat,2=Plot,3=Apartment, 4=office, 5=Duplex
            $table->string("purpose")->nullable(); #1=Sale,2=Rent
            $table->string("status")->nullable(); #1=Popular,2=normal
            $table->decimal("price")->nullable();
            $table->decimal("interest_rate")->nullable();
            $table->decimal("sqft")->nullable();
            $table->string("lat")->nullable();
            $table->string("lon")->nullable();
            $table->string("baths")->nullable();
            $table->string("garage")->nullable();
            $table->string("balcony")->nullable();
            $table->string("amenities")->nullable();
            $table->string("educational_institutes")->nullable();
            $table->string("hospitals")->nullable();
            $table->string("restaurants")->nullable();
            $table->string("parks")->nullable();
            $table->string("religious")->nullable();
            $table->string("properties_thumbnail")->nullable();
            $table->string("video_link")->nullable();
            $table->string("admin_contact_no")->nullable();
            $table->string("agent_contact_no")->nullable();
            $table->string("developer_contact_no")->nullable();
            $table->string("contact_no_show")->nullable(); #1=admin,2=agent,3=develope
            $table->string("contact_email")->nullable();
            $table->boolean("approval_status")->default(false);
            $table->timestamps();
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('agent_id')->references('id')->on('agents');
            $table->foreign('developer_id')->references('id')->on('developers');
            $table->foreign('division_id')->references('id')->on('divisions');
            $table->foreign('district_id')->references('id')->on('districts');
            $table->foreign('thana_id')->references('id')->on('thanas');
            $table->foreign('area_id')->references('id')->on('areas');
            $table->foreign('block_id')->references('id')->on('blocks');
            $table->foreign('service_type_id')->references('id')->on('service_types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('services');
    }
}
