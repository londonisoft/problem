<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRealEstatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('real_estates', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('external_user_id');
            $table->unsignedBigInteger("division_id")->nullable();
            $table->unsignedBigInteger("district_id")->nullable();
            $table->unsignedBigInteger("thana_id")->nullable();
            $table->string("title")->nullable();
            $table->string("bn_title")->nullable();
            $table->string("property_id")->nullable();
            $table->text("description")->nullable();
            $table->text("bn_description")->nullable();
            $table->text("address")->nullable();
            $table->text("address_bn")->nullable();
            $table->string("status")->nullable(); #1=Popular,2=normal
            $table->string("price")->nullable();
            $table->string("area")->nullable();
            $table->string("total_unit")->nullable();
            $table->string("lat")->nullable();
            $table->string("lon")->nullable();
            $table->tinyInteger("property_type_main")->nullable()->comment('1 = residential , 2 = commercial');
            $table->tinyInteger("property_type")->nullable()->comment('1 = Apartment, 2 = Penthouse, 3 = Plaza, 4 = Plot, 5 = Room, 6 = Duplex, 7 = Building');
            $table->string("amenit_ids")->nullable();
            $table->string("contact_no")->nullable();
            $table->string("contact_no_show")->nullable(); #1=admin,2=external_user
            $table->string("contact_email")->nullable();
            $table->boolean("approval_status")->default(false);
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
        Schema::dropIfExists('real_estates');
    }
}
