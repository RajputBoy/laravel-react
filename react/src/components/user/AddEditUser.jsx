import React, { useEffect, useState } from 'react'
import { useLocation, useParams } from 'react-router-dom'
import NavBarMenu from '../menu/NavBarMenu';
import axios from 'axios';
import { BASE_URL } from '../services/CallApi';

export default function AddEditUser() {

	const user = useParams();

	const [loading, setLoading] = useState(false);
	const [success, setSuccess] = useState(false);
    const [error, setError] = useState('');
	const { state } = useLocation();

    const [preview, setPreview] = useState(null);

    const [user_data, setUserData] = useState({
        name: '',
        email: '',
        country: '',
        state: '',
        city: '',
        address: '',
        password: '',
        user_type: '',
        profile_image: null,
    });

    // UseEffect to set initial state
    useEffect(() => {
        if (user.user_id) {
            setUserData({
                name: state?.name || '',
                email: state?.email || '',
                country: state?.user_detail?.country || '',
                state: state?.user_detail?.state || '',
                city: state?.user_detail?.city || '',
                address: state?.user_detail?.address || '',
                user_type: state?.user_detail?.user_type || '',
                profile_image: state?.user_detail?.profile_image || null,
            });
        } else {
            setUserData({
                name: '',
                email: '',
                country: '',
                state: '',
                city: '',
                address: '',
                password: '',
                user_type: '',
                profile_image: null,
            });
        }
    }, [user, state]);

    const handleOnChange = (e) => {
        const { name, value } = e.target;
		setUserData(preFormData => ({ ...preFormData, [name]: value }));
        setUserData(preFormData => ({ ...preFormData, id: user.user_id }));
    };

    const handleImageChange = (e) => {
        const file = e.target.files[0];
        setUserData(preFormData => ({ ...preFormData, profile_image: file }));
        const reader = new FileReader();
        reader.onloadend = () => {
            setPreview(reader.result);
        };
        reader.readAsDataURL(file);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setError({});
        setLoading(true);
        const validationError = {};
        if (!user_data.name) {
            validationError.name = "Name field is require";
        }
        if (!user_data.country) {
            validationError.country = "Country field is require";
        }

        if (Object.keys(validationError).length > 0) {
            setError(validationError);
            setLoading(false);
            return;
        }
		try {
			const response = await axios.post(`${BASE_URL}/user/update`, user_data, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });
			setSuccess(true);
	    }catch(error) {
			if (error.response && error.response.status === 422) {
                setError(error.response.data);
            } else {
                console.error('Something went wrong:', error);
            }
		} finally {
			setLoading(false);
	    }
    };
    return (
        <>
            <div className="flex min-h-screen">
                <NavBarMenu />
                <div className="flex-1 p-6 bg-gray-100">
					<div>{!user.user_id ? "Add User" : "Edit User"}</div>
					<div>{ success && <p className='text-green-500 flex justify-center'>User Updated successfully!!</p>}</div>
                    <form onSubmit={handleSubmit} className="space-y-4">
                        <div>
                            <label className="block text-sm font-medium text-gray-700">Name</label>
                            <input
                                name="name"
                                type="text"
                                value={user_data.name}
                                onChange={handleOnChange}
                                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                disabled={loading}
							/>
							{error.name && <p className="text-red-500 text-sm mt-1">{error.name || error.name[0]}</p>}
                        </div>
                        <div>
                            <label className="block text-sm font-medium text-gray-700">Email</label>
                            <input
                                name="email"
                                type="text"
                                value={user_data.email}
                                onChange={handleOnChange}
                                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                disabled={loading}
							/>
							{error.email && <p className="text-red-500 text-sm mt-1">{error.email || error.email[0]}</p>}
                        </div>
                        <div>
                            <label className="block text-sm font-medium text-gray-700">Country</label>
                            <input
                                name="country"
                                type="text"
                                value={user_data.country}
                                onChange={handleOnChange}
                                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                disabled={loading}
							/>
							{error.country && <p className="text-red-500 text-sm mt-1">{error.country || error.country[0]}</p>}
                        </div>
                        <div>
                            <label className="block text-sm font-medium text-gray-700">State</label>
                            <input
                                name="state"
                                type="text"
                                value={user_data.state}
                                onChange={handleOnChange}
                                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                disabled={loading}
							/>
							{error.state && <p className="text-red-500 text-sm mt-1">{error.state[0]}</p>}
                        </div>
                        <div>
                            <label className="block text-sm font-medium text-gray-700">City</label>
                            <input
                                name="city"
                                type="text"
                                value={user_data.city}
                                onChange={handleOnChange}
                                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                disabled={loading}
							/>
							{error.city && <p className="text-red-500 text-sm mt-1">{error.city[0]}</p>}
                        </div>
                        <div>
                            <label className="block text-sm font-medium text-gray-700">Address</label>
                            <input
                                name="address"
                                type="text"
                                value={user_data.address}
                                onChange={handleOnChange}
                                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                disabled={loading}
							/>
							{error.address && <p className="text-red-500 text-sm mt-1">{error.address[0]}</p>}
                        </div>
                        <div>
                            <label className="block text-sm font-medium text-gray-700">Password</label>
                            <input
                                name="password"
                                type="text"
                                value={user_data.password}
                                onChange={handleOnChange}
                                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                disabled={loading}
							/>
							{error.password && <p className="text-red-500 text-sm mt-1">{error.password || error.password[0]}</p>}
                        </div>
                        <div>
                            <label className="block text-sm font-medium text-gray-700">Role</label>
                            <select
                                value={user_data.user_type}
                                onChange={handleOnChange}
                                className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                name="user_type"
                                disabled={loading}
                            >
                                <option value="" disabled>--Select User Type--</option>
                                <option value="user">User</option>
                                <option value="admin">Admin</option>
                                <option value="editor">Editor</option>
                                <option value="subscriber">Subscriber</option>
                                <option value="seller">Seller</option>
							</select>
							{error.user_type && <p className="text-red-500 text-sm mt-1">{error.user_type}</p>}
                        </div>
                        <div className='flex'>
                            <label className="block text-sm font-medium text-gray-700">Send User Notification</label>
                            <input
                                name="notification"
                                type="checkbox"
                                value={user_data.notification}
                                onChange={handleOnChange}
                                className="mt-1 block w-20 py-2"
                                disabled={loading}
							/> <label className='text-xs'>Send the new user an email about their account</label>

                        </div>
                        <div>
                            <label className="block text-sm font-medium text-gray-700">Profile Image</label>
                            <input
                                type="file"
                                name="profile_image"
                                accept="image/*"
                                onChange={handleImageChange}
                                className="mt-1 block w-full text-sm text-gray-900 border border-gray-300 rounded-md cursor-pointer focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                                disabled={loading}
							/>

                            {(preview || user_data.profile_image) && (
								<img
									src={preview || user_data.profile_image}
									alt="Profile Preview"
									className="mt-2 h-24 w-24 rounded-full object-cover"
								/>
							)}
                        </div>

                        <button
                            type="submit"
                            className="w-full py-2 px-4 bg-blue-500 text-white font-semibold rounded-md shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
                            disabled={loading}>
                            {loading ? (
                                <svg className="animate-spin h-5 w-5 text-white mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z"></path>
                                </svg>
                            ) : (
                                'Save'
                            )}
                        </button>
                    </form>
                </div>
            </div>
        </>
    );
}
