import axios from 'axios';
import React, { useContext, useState } from 'react'
import { BASE_URL } from './CallApi';
import { Link, useNavigate } from 'react-router-dom';
import { ThemeContext } from '../../contexts/ThemeContext';

export default function LoginController() {

	const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
	const [error, setError] = useState('');
	const navigate = useNavigate();
	const { login } = useContext(ThemeContext);
	const [loading, setLoading] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();
		setError('');
		setLoading(true);

        try {
            const response = await axios.post(`${BASE_URL}/login`, {
                email,
                password,
            });

			//localStorage.setItem('authToken', response.data.token);
			login(response.data.user, response.data.token);
			navigate('/home')

            // Redirect to a protected route or show a success message
        } catch (error) {
            setError('Invalid credentials');
		} finally {
			setLoading(false);
		}
    };

  return (
	 <div className="flex justify-center items-center min-h-screen bg-gray-100">
            <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md">
                <h2 className="text-2xl font-bold mb-6 text-center">Login</h2>
                <form onSubmit={handleSubmit} className="space-y-4">
                    <div>
                        <label className="block text-sm font-medium text-gray-700">Email</label>
					  <input
						    name="email"
                            type="email"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                            disabled={loading}
					  />
                    </div>
                    <div>
                        <label className="block text-sm font-medium text-gray-700">Password</label>
					  <input
						    name="password"
                            type="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                            disabled={loading}
					  />
                    </div>
                    {error && <p className="text-red-500 text-sm">{error}</p>}
                    <button
                        type="submit"
                        className="w-full py-2 px-4 bg-blue-500 text-white font-semibold rounded-md shadow-sm hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
                        disabled={loading}
				  >
                        {loading ? (
                            <svg className="animate-spin h-5 w-5 text-white mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z"></path>
                            </svg>
                        ) : (
                            'Login'
                        )}
				  </button>
				  <div className="flex justify-between">
					<Link className="text-blue-500" to="/forgate-password">Forgotten password?</Link>
					<Link className="text-blue-500" to="/register">Sign Up</Link>
				  </div>
                </form>
            </div>
        </div>
  )
}
