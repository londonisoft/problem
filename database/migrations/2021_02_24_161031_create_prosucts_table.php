<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProsuctsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();
        Schema::create('prosucts', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('external_user_id');
            $table->unsignedBigInteger('product_category_id');
            $table->unsignedBigInteger('unit_id');
            $table->string('name');
            $table->string('name_bn');
            $table->text('description');
            $table->text('description_bn');
            $table->string('image');
            $table->string('price');
            $table->timestamps();
            $table->foreign('external_user_id')->references('id')->on('external_users');
            $table->foreign('product_category_id')->references('id')->on('product_categories');
            $table->foreign('unit_id')->references('id')->on('units');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('prosucts');
    }
}
