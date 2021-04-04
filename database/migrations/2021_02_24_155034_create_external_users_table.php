<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExternalUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('external_users', function (Blueprint $table) {
            $table->id();
            $table->string("name")->nullable();
            $table->string("name_bn")->nullable();
            $table->string("email",100)->unique()->nullable();
            $table->string('password');
            $table->string("phone",100)->nullable();
            $table->text("address")->nullable();
            $table->integer("user_type")->nullable()->comment("1=agents, 2=developers, 3=supplers");
            $table->string("image")->nullable();
            $table->text("address_bn")->nullable();
            $table->string("facebook_link")->nullable();
            $table->string("twitter_link")->nullable();
            $table->string("linkedin_link")->nullable();
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
        Schema::dropIfExists('external_users');
    }
}
