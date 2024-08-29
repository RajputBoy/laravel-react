import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { BASE_URL } from '../services/CallApi';
import { Link } from 'react-router-dom';
import NavBarMenu from '../menu/NavBarMenu';
import { useDispatch, useSelector } from 'react-redux';
import { fetchData } from '../../store/ProductSlice';

export default function AllUsers() {
  const [success, setSuccess] = useState(false);
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [search, setSearch] = useState('');
  const dispatch = useDispatch();
  const { data, status, totalPage } = useSelector((state) => state.data);
  const perPage = 6;

  useEffect(() => {
    dispatch(fetchData({ currentPage, perPage, search }));
  }, [currentPage, perPage, search, dispatch]);

   useEffect(() => {
    if (data) {
      setTotalPages(totalPage); // Assuming the API returns the total number of pages
    }
  }, [data,currentPage]);


  const handleDelete = async (id) => {
    try {
      const response = await axios.post(`${BASE_URL}/user/delete`, { id })
      setSuccess(true);
      dispatch(fetchData({ currentPage, perPage })); // Re-fetch the user list
      } catch (error) {
      console.error('Failed to delete user:', error);
      }
  }

  const handleNextPage = () => {
    if (currentPage < totalPages) {
      setCurrentPage(currentPage + 1);
    }
  };

  const searchUsers = (e) => {
    const search_val = e.target.value;
    setSearch(search_val);
  }

  const handlePreviousPage = () => {
    if (currentPage > 1) {
      setCurrentPage(currentPage - 1);
    }
  };
  return (
    <>
    <div className="flex min-h-screen">
      {/* Sidebar */}
      <NavBarMenu />

      {/* Main Content */}
        <div className="flex-1 p-6 bg-gray-100">
          <div className="flex items-center mb-4">
            <h1 className="text-3xl font-bold">All Users</h1>
            <input
              type="text"
              placeholder="Search by name"
              name="search"
              value={search}
              onChange={searchUsers}
              className="ml-auto block w-50 px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
            />
          </div>
          <div>{success && <p className='text-green-500 flex justify-center'>User Deleted successfully!!</p>}</div>
        {data === null ? (
          <p className="text-red-500">Failed to load users.</p>
        ) : (
          <table className="min-w-full bg-white">
            <thead>
              <tr>
                <th className="py-2 px-4 border-b border-gray-200">S.No</th>
                <th className="py-2 px-4 border-b border-gray-200">Name</th>
                    <th className="py-2 px-4 border-b border-gray-200">Email</th>
                    <th className="py-2 px-4 border-b border-gray-200">Image</th>
                <th className="py-2 px-4 border-b border-gray-200">Actions</th>
              </tr>
            </thead>
            <tbody>
              {data.length > 0 ? data.map((user, index) => (
                <tr key={user.id}>
                  <td className="py-2 px-4 border-b border-gray-200">{index+1}</td>
                  <td className="py-2 px-4 border-b border-gray-200">{user.name}</td>
                  <td className="py-2 px-4 border-b border-gray-200">{user.email}</td>
                  <td className="py-2 px-4 border-b border-gray-200">
                  {(user.user_detail) && (
								<img
									src={user.user_detail.profile_image}
									alt="Profile Preview"
									className="mt-2 h-12 w-12 rounded-full object-cover"
								/>
							)}
                  </td>
                  <td className="py-2 px-4 border-b border-gray-200">
                    <Link
                      to={`/users/edit/${user.id}`}
                      className="text-blue-500 hover:underline mr-4"
                      state={user}
                    >
                      Edit
                    </Link>
                    <button
                      onClick={() => handleDelete(user.id)}
                      className="text-red-500 hover:underline"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
              )) : (
                <tr>
                  <td className="py-2 px-4 border-b border-gray-200 text-center" colSpan="4">
                    No users found.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
          )}
          {/* Pagination */}
            <div className="flex justify-center mt-4">
              <button
                onClick={handlePreviousPage}
                disabled={currentPage === 1}
                className="px-4 py-2 bg-blue-500 text-white rounded disabled:opacity-50"
              >
                Previous
              </button>
              <span className="px-4 py-2">{currentPage} of {totalPages}</span>
              <button
                onClick={handleNextPage}
                disabled={currentPage === totalPages}
                className="px-4 py-2 bg-blue-500 text-white rounded disabled:opacity-50"
              >
                Next
              </button>
            </div>
      </div>
      </div>
      </>
  );
}
