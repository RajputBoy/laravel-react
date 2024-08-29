import React, { useState } from 'react'
import { Link } from 'react-router-dom';
import { HomeIcon, UserGroupIcon, DocumentIcon, CogIcon, UsersIcon, PlusIcon } from '@heroicons/react/24/outline'; // Update import paths for v2

export default function NavBarMenu() {
  const [isUsersMenuOpen, setIsUsersMenuOpen] = useState(false);
  const [isSidebarMinimized, setIsSidebarMinimized] = useState(false);
	const toggleUsersMenu = () => {
    setIsUsersMenuOpen(!isUsersMenuOpen);
  };

  const toggleSidebar = () => {
    setIsSidebarMinimized(!isSidebarMinimized);
  };

  return (
    <div className={`bg-gray-800 text-white flex flex-col ${isSidebarMinimized ? 'w-16' : 'w-50'}`}>
      <div className="p-4 flex items-center justify-between">
        {!isSidebarMinimized && <h4>Menu</h4>}
        <button
          onClick={toggleSidebar}
          className="text-white focus:outline-none"
        >
          {isSidebarMinimized ? '>' : '<'}
        </button>
      </div>
      <nav className="flex-1 px-2 space-y-2">
        <Link to="/home" className="block px-4 py-2 rounded hover:bg-gray-700 flex items-center">
          <HomeIcon className="h-6 w-6" />
          {!isSidebarMinimized && <span className="ml-1 text-[15px]">Dashboard</span>}
        </Link>
        <Link to="/admin/posts" className="block px-4 py-2 rounded hover:bg-gray-700 flex items-center">
          <DocumentIcon className="h-6 w-6" />
          {!isSidebarMinimized && <span className="ml-1 text-[15px]">Posts</span>}
        </Link>

        {/* Users Dropdown */}
        <div>
          <button
            onClick={toggleUsersMenu}
            className="block w-full text-left px-4 py-2 rounded hover:bg-gray-700 flex items-center"
          >
            <UserGroupIcon className="h-6 w-6" />
            {!isSidebarMinimized && <span className="ml-1 text-[15px]">Users</span>}
          </button>
          {isUsersMenuOpen && !isSidebarMinimized && (
            <div className="ml-4 space-y-2">
              <Link to="/users" className="block px-4 py-2 rounded hover:bg-gray-700 flex items-center">
                <UsersIcon className="h-6 w-6" />
                <span className="ml-1 text-[15px]">All Users</span>
              </Link>
              <Link to="/users/add" className="block px-4 py-2 rounded hover:bg-gray-700 flex items-center">
                <PlusIcon className="h-6 w-6" />
                <span className="ml-1 text-[15px]">Add User</span>
              </Link>
            </div>
          )}
        </div>

        <Link to="/settings" className="block px-4 py-2 rounded hover:bg-gray-700 flex items-center">
          <CogIcon className="h-6 w-6" />
          {!isSidebarMinimized && <span className="ml-1 text-[15px]">Settings</span>}
        </Link>
      </nav>
    </div>
  );
}
