<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLoanRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('loan_requests', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->double('installment');
            $table->integer('term');
            $table->double('borrower_length_experience');
            $table->double('borrower_month_income');
            $table->double('home_ownership' );
            $table->double('address_state');
            $table->double('loan_amount');
            $table->string('bank_statement', 500);
            $table->double('loan_predict');
            $table->double('pay_amount')->nullable();
            $table->uuid('user_id');
            $table->enum('status', ['refused', 'pending', 'admin-approved', 'approved'])->default('pending');
            $table->timestamps();

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
        Schema::dropIfExists('loan_requests');
    }
}
