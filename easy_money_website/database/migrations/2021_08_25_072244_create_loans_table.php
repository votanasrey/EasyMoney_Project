<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLoansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('loans', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->double('loan_amount');
            $table->double('pay_amount');
            $table->timestamp('start_date');
            $table->timestamp('end_date');
            $table->timestamp('paid_at')->nullable();
            $table->enum('status', ['active', 'end', 'end Late']);
            $table->uuid('loan_request_id');
            $table->uuid('user_id');
            $table->timestamps();

            $table->foreign('loan_request_id')->references('id')->on('loan_requests');
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
        Schema::dropIfExists('loans');
    }
}
