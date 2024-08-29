<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller {

	public function login( Request $request ) {
		$request->validate(
			array(
				'email'    => 'required|email',
				'password' => 'required',
			)
		);

		$credentials = $request->only( 'email', 'password' );

		if ( Auth::attempt( $credentials ) ) {
			$user  = Auth::user();
			$token = $user->createToken( 'Personal Access Token' )->accessToken;
			return response()->json( array( 'token' => $token ), 200 );
		} else {
			return response()->json( array( 'error' => 'Unauthorized' ), 401 );
		}
	}

	public function register( Request $request ) {

		$request->validate(
			array(
				'name'     => 'required|string|max:255',
				'email'    => 'required|string|email|max:255|unique:users',
				'password' => 'required|string',
			)
		);

		$user = User::create(
			array(
				'name'     => $request->name,
				'email'    => $request->email,
				'password' => bcrypt( $request->password ),
			)
		);

		$token = $user->createToken( 'Personal Access Token' )->accessToken;
		return response()->json( array( 'token' => $token ), 201 );
	}
}
