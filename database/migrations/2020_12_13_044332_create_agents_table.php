<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAgentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('agents', function (Blueprint $table) {
            $table->id();
            $table->string("name")->nullable();
            $table->string("email",100)->unique()->nullable();
            $table->string('password');
            $table->string("phone",100)->nullable();
            $table->string("address")->nullable();
            $table->string("user_type")->nullable()->comment("1=agents, 2=developers, 3=supplers  ");
            $table->string("image")->nullable();
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
        Schema::dropIfExists('agents');
    }
}
