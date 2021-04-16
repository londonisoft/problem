<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomeLoansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('home_loans', function (Blueprint $table) {
			$table->id();
            $table->string('name')->nullable();
            $table->string('mobile')->nullable();
            $table->string('email')->nullable();
            $table->string('property_id')->nullable();
            $table->string('total_price')->nullable();
            $table->string('loan_priod')->nullable();
            $table->string('down_payment')->nullable();
            $table->string('interest_rate')->nullable();
            $table->string('monthly_payment')->nullable();
            $table->string('total_pay_over')->nullable();
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
        Schema::dropIfExists('home_loans');
    }
}
