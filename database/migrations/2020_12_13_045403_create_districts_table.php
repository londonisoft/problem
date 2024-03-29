<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDistrictsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('districts', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("division_id")->nullable();
            $table->string("name")->nullable();
            $table->string("bn_name")->nullable();
            $table->string("url")->nullable();
            $table->string("lat")->nullable();
            $table->string("lon")->nullable();
            $table->string("slug")->nullable();
            $table->tinyInteger("status")->default(1);
            $table->timestamps();
            $table->foreign('division_id')->references('id')->on('divisions');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('districts');
    }
}
