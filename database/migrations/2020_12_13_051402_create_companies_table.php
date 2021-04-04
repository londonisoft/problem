<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->id();
            $table->string("name")->nullable();
            $table->text("address")->nullable();
            $table->string("mobile_1")->nullable();
            $table->string("mobile_2")->nullable();
            $table->string("email_1")->nullable();
            $table->string("email_2")->nullable();
            $table->string("logo")->nullable();
            $table->string("favicon")->nullable();
            $table->string("owner_name")->nullable();
            $table->string("md_name")->nullable();
            $table->string("ceo_name")->nullable();
            $table->string("website_address")->nullable();
            $table->string("telephone")->nullable();
            $table->string("facebook")->nullable();
            $table->string("twitter")->nullable();
            $table->string("pinterest")->nullable();
            $table->string("linkedin")->nullable();
            $table->string("youtube")->nullable();
            $table->string("instagram")->nullable();
            $table->string("privacy_policy")->nullable();
            $table->string("terms_condition")->nullable();
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
        Schema::dropIfExists('companies');
    }
}
