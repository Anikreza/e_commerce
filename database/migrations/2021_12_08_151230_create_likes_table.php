<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLikesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('likes', function (Blueprint $table) {
                $table->increments('id');
                $table->integer('user_id');
                $table->integer('product_id');
                $table->integer('review_id');

//                $table->unsignedBigInteger('user_id');
//                $table->foreign('user_id')->references('id')->on('users');
//                $table->unsignedBigInteger('product_id');
//                $table->foreign('product_id')->references('id')->on('products');
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
        Schema::dropIfExists('likes');
    }
}
