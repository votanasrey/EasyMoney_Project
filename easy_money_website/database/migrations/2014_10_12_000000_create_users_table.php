<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->index()->unique();
            $table->string('first_name', 30);
            $table->string('last_name', 30);
            $table->enum('gender', ['Male', 'Female', 'Other']);
            $table->timestamp('date_of_birth');
            $table->string('phone_number')->unique();
            $table->string('address');
            $table->boolean('kyc_verified')->default(false);
            $table->string('user_profile', 200)->nullable();
            $table->timestamp('phone_number_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
