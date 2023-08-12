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
            $table->uuid('id')->primary();
            $table->string('title');
            $table->double('price');
            $table->string('description', 700);
            $table->boolean('is_sold')->default(false);
//            $table->uuid('category_id');
            $table->string('category');
            $table->uuid('user_id');
            $table->timestamps();

//            $table->foreign('category_id')->references('id')->on('categories');
            $table->foreign('user_id')->references('uuid')->on('users');
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
