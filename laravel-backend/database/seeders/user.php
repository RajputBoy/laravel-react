<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use DB;

class user extends Seeder {

	/**
	 * Run the database seeds.
	 */
	public function run(): void {
		// Seeder for user table
		DB::table( 'user' )->insert(
			array(
				'username' => 'developer',
				'password' => bcrypt( 'Test@Password123#' ),
			)
		);
	}
}
