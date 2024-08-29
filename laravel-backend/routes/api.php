<?php

use App\Http\Controllers\API\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\UserDetailController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
// return $request->user();
// });

// Route::middleware( 'auth:api' )->get(
// '/user',
// function ( Request $request ) {
// return $request->user();
// }
// );

Route::group(
	array( 'middleware' => array( 'auth:api' ) ),
	function () {
		Route::get(
			'/user',
			function( Request $request ) {
				return $request->user();
			}
		);

		Route::get(
			'test',
			function() {
				echo 'Hello Test';
			}
		);

		Route::get(
			'test-one',
			function() {
				echo 'Hello Test 2';
			}
		);
	}
);

// Route::post( 'login', array( AuthController::class, 'login' ) );
// Route::post( 'register', array( AuthController::class, 'register' ) );

Route::post( '/register', [ RegisterController::class, 'register' ] );
Route::post( '/login', [ RegisterController::class, 'login' ] );
Route::get( '/users', [ UserDetailController::class, 'users' ] );
Route::post( 'user/update', [ UserDetailController::class, 'update' ] );
Route::post( 'user/delete', [ UserDetailController::class, 'destroy' ] );
