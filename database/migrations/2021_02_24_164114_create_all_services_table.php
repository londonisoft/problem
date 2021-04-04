<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAllServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::disableForeignKeyConstraints();
        Schema::create('all_services', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('external_user_id');
            $table->unsignedBigInteger('service_category_id');
            $table->string('name');
            $table->string('name_bn');
            $table->text('description');
            $table->text('description_bn');
            $table->string('image');
            $table->tinyInteger('status')->nullable();
            $table->tinyInteger('is_featured')->default(0);
            $table->timestamps();
            $table->foreign('external_user_id')->references('id')->on('external_users');
            $table->foreign('service_category_id')->references('id')->on('service_categories');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('all_services');
    }
}
