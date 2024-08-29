<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function users( Request $request ){

        $allUsers = User::all();
        return response()->json(['status'=>'Ok','users'=>$allUsers]);

    }
}
