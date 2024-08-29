<?php

namespace App\Http\Controllers;

use App\Models\UserDetail;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;

class UserDetailController extends Controller
{

  public function users(Request $request) {
    // Get currentPage and perPage from the request, with default values
    $currentPage = $request->input('page', 1); // Default to page 1 if not provided
    $perPage = $request->input('perPage', 10); // Default to 10 items per page if not provided
    $searchKey = $request->input('searchKey', '');

    // Build the query
    $query = User::with('userDetail');

    // Apply search filter if searchKey is provided
    if (!empty($searchKey)) {
        $query->where('name', 'like', "%{$searchKey}%")
              ->orWhere('email', 'like', "%{$searchKey}%");
    }

    // Order by id in descending order
    $query->orderBy('id', 'desc');
    // Use Eloquent's paginate method
    $allUsers = $query->paginate($perPage, ['*'], 'page', $currentPage);

    return response()->json(['status' => 'Ok', 'users' => $allUsers]);
}



    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(UserDetail $userDetail)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UserDetail $userDetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, UserDetail $userDetail)
    {
    // Validate incoming request
    $validator = Validator::make($request->all(), [
        'name' => 'required|string',
         'email' => [
            'required',
            'string',
            'max:255',
            Rule::unique('users')->ignore($request->id), // Ignore current user ID
        ],
        'country' => 'required|string|max:255',
        'state' => 'required|string|max:255',
        'city' => 'required|string',
        'address' => 'required|string',
        'password' => 'required|string|min:8',
        'user_type' => 'required|string',
    ]);

    if ($validator->fails()) {
        return response()->json($validator->errors(), 422);
    }

    $exit_user = User::where('id', $request->id)->first();

    // Create user
    if( ! $exit_user ){
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
    }else{
        $user = $exit_user->update([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
    }

    try {
        DB::beginTransaction(); // Start transaction

        $userDetail = UserDetail::where('user_id', $request->id)->first();

        $profileImagePath = $userDetail ? $userDetail->profile_image : null;

        // Handle profile image upload if present
        if ($request->hasFile('profile_image')) {
            $image = $request->file('profile_image');
            $imageName = time() . '_' . $image->getClientOriginalName();
            $profileImagePath = $image->storeAs('profile_images', $imageName, 'public');
        }

        // Update or create user detail
        if (!$userDetail) {

            $user_update = UserDetail::create([
                'user_id' => $request->id,
                'country' => $request->country,
                'state' => $request->state,
                'city' => $request->city,
                'address' => $request->address,
                'user_type' => $request->user_type,
                'profile_image' => $profileImagePath,
            ]);
        } else {
            $user_update = $userDetail->update([
                'user_id' => $request->id,
                'country' => $request->country,
                'state' => $request->state,
                'city' => $request->city,
                'address' => $request->address,
                'user_type' => $request->user_type,
                'profile_image' => $profileImagePath,
            ]);
        }

        if ($user_update) {
            DB::commit(); // Commit transaction
            return response()->json(['status' => 'Ok'], 201);
        }
    } catch (\Exception $e) {
        DB::rollBack(); // Rollback transaction if something goes wrong

        // Return error response with exception message
        return response()->json(['error' => 'An error occurred: ' . $e->getMessage()], 500);
    }
}

    /**
     * Remove the specified resource from storage.
     */
    public function destroy( Request $request, UserDetail $userDetail)
    {
        if($request->id){
            try{
             // Deleting a user by ID
             $user = User::find($request->id);
             $user->delete();
             UserDetail::where('user_id', $request->id)->delete();
             return response()->json(['status' => 'Ok'], 201);
            }catch(\Exception $e){
                return response()->json(['error' => 'An error occurred: ' . $e->getMessage()], 500);
            }
        }
    }
}
