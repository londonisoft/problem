<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDhakaNeigborAreasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dhaka_neigbor_areas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('dhaka_neigbor_id');
            $table->unsignedBigInteger('area_id');
            $table->timestamps();

            $table->foreign('dhaka_neigbor_id')->references('id')->on('dhaka_neigbors');
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
        Schema::dropIfExists('dhaka_neigbor_areas');
    }
}
