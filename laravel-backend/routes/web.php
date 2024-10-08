<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\AdminController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get(
	'/',
	function () {
		return Inertia::render(
			'Welcome',
			array(
				'canLogin'       => Route::has( 'login' ),
				'canRegister'    => Route::has( 'register' ),
				'laravelVersion' => Application::VERSION,
				'phpVersion'     => PHP_VERSION,
			)
		);
	}
);

Route::get(
	'/dashboard',
	function () {
		return Inertia::render( 'Dashboard' );
	}
)->middleware( array( 'auth', 'verified' ) )->name( 'dashboard' );

Route::middleware( 'auth' )->group(
	function () {
		Route::get( '/profile', array( ProfileController::class, 'edit' ) )->name( 'profile.edit' );
		Route::patch( '/profile', array( ProfileController::class, 'update' ) )->name( 'profile.update' );
		Route::delete( '/profile', array( ProfileController::class, 'destroy' ) )->name( 'profile.destroy' );
	}
);

Route::get( '/admin', array( AdminController::class, 'index' ) )->middleware( 'admin' );

require __DIR__ . '/auth.php';
