<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller {

	public function index() {
		echo 'Hello';
		die;
		return view( 'admin.index' );
	}
}
