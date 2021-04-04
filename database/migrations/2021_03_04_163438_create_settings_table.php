<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->text('home_title')->nullable();
            $table->text('home_title_bn')->nullable();
            $table->text('home_description')->nullable();
            $table->text('home_description_bn')->nullable();
            $table->string('total_agent')->nullable();
            $table->string('total_developer')->nullable();
            $table->string('total_supplier')->nullable();
            $table->string('total_sale')->nullable();
            $table->string('total_rent')->nullable();
            $table->string('footer_text')->nullable();
            $table->string('footer_text_bn')->nullable();
            $table->string('facebook_link')->nullable();
            $table->string('twitter_link')->nullable();
            $table->string('google_link')->nullable();
            $table->string('linkedin_link')->nullable();
            $table->string('email')->nullable();
            $table->string('mobile')->nullable();
            $table->text('address')->nullable();
            $table->text('address_bn')->nullable();
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
        Schema::dropIfExists('settings');
    }
}
