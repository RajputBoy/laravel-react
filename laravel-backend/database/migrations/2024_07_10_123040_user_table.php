<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class() extends Migration
{
	/**
	 * Run the migrations.
	 */
	public function up(): void {
		// Migration for user table
		Schema::create(
			'user',
			function ( Blueprint $table ) {
				$table->id();
				$table->string( 'username' );
				$table->string( 'password' );
				$table->timestamps();
			}
		);
	}

	/**
	 * Reverse the migrations.
	 */
	public function down(): void {
		Schema::dropIfExists( 'user' );
	}
};
