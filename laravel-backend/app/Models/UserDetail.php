<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class UserDetail extends Model
{
    use HasFactory;

    /**
	 * The attributes that are mass assignable.
	 *
	 * @var array<int, string>
	 */
	protected $fillable = array(
        'user_id',
		'country',
		'state',
		'city',
        'address',
        'user_type',
        'profile_image',
	);

    /**
     * Get the profile image attribute.
     *
     * @param  string  $value
     * @return string
     */
    public function getProfileImageAttribute($value)
    {
        // Assuming you want to prepend the storage path to the image
        return asset('public/storage/' . $value);
    }

}
