<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title')->nullable();
            $table->string('author')->nullable();
            $table->string('product_img')->nullable();
            $table->float('price')->nullable();
            $table->bigInteger('products_in_stock')->nullable();
            $table->bigInteger('order_number')->nullable();
            $table->longText('description')->nullable();

            $table->unsignedBigInteger('category_book_type_id')->nullable();
            $table->foreign('category_book_type_id')->references('id')->on('category_book_types');

            $table->unsignedBigInteger('category_cover_type_id')->nullable();
            $table->foreign('category_cover_type_id')->references('id')->on('category_cover_types');
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
        Schema::dropIfExists('products');
    }
}
