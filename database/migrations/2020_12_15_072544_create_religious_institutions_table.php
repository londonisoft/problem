<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReligiousInstitutionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('religious_institutions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("division_id")->nullable();
            $table->unsignedBigInteger("district_id")->nullable();
            $table->unsignedBigInteger("thana_id")->nullable();
            $table->string("name")->nullable();
            $table->string("bn_name")->nullable();
            $table->text("description")->nullable();
            $table->text("bn_description")->nullable();
            $table->string('lat')->nullable();
            $table->string('lon')->nullable();
            $table->string('type')->nullable(); # 1=Muslim, 2=Hindu, 3=Christian
            $table->string('image')->nullable();
            $table->timestamps();
            $table->foreign('division_id')->references('id')->on('divisions');
            $table->foreign('district_id')->references('id')->on('districts');
            $table->foreign('thana_id')->references('id')->on('thanas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('religious_institutions');
    }
}
