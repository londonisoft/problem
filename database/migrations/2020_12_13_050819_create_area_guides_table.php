<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAreaGuidesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('area_guides', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("area_id")->nullable();
            $table->string("title")->nullable();
            $table->string("bn_title")->nullable();
            $table->text("description")->nullable();
            $table->text("bn_description")->nullable();
            $table->string("image")->nullable();
            $table->string("video_link")->nullable();
            $table->string("type")->nullable(); # 1=Highlight, 2=Neighborhood, 3=Lifestyle
            $table->tinyInteger("status")->nullable();
            $table->timestamps();
            $table->foreign('area_id')->references('id')->on('areas');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('area_guides');
    }
}
