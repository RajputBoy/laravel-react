<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function register(Request $request)
    {

        // Validate incoming request
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Create user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $token = $user->createToken( 'Personal Access Token' )->accessToken;
        // Return success response
        return response()->json(['message' => 'User registered successfully!', 'user' => $user, 'token' => $token ], 201);
    }

    public function login(Request $request){

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

            return response()->json(['message' => 'User login successfully!', 'user' => $user, 'token' => $token ], 200);
		} else {
			return response()->json( array( 'error' => 'Unauthorized' ), 401 );
		}

    }
}

