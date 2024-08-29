import React, { useState } from 'react'
import viteLogo from '/vite.svg'
import { Navigate, NavLink, useNavigate } from 'react-router-dom'
import Modal from './Modal'

export default function Header() {
  const [isOpen, setClose] = useState(false)
  const token = localStorage.getItem('authToken');
  const navigate = useNavigate();

  const handleLogout = () => {
    localStorage.removeItem('authToken');
    navigate('/home');
  }

  if (!token) {
    // Redirect to login page if not authenticated
    return <Navigate to="/login" />;
	}

  return (
    <header className="flex justify-between px-4 py-4 shadow-md md:px-8">
      <img src={viteLogo} alt="viteLogo" />
      <ul className="flex gap-4">
        <li>
          <NavLink
            className={({ isActive }) => isActive ? 'text-blue-700 underline' : undefined}
            to="/"
          >
            Home
          </NavLink>
        </li>
        <li>
          <NavLink
            className={({ isActive }) => isActive ? 'text-blue-700 underline' : undefined}
            to="/about"
          >
            About
          </NavLink>
        </li>
        {!token ? (
          <>
            <li>
              <NavLink
                className={({ isActive }) => isActive ? 'text-blue-700 underline' : undefined}
                to="/register"
              >
                Register
              </NavLink>
            </li>
            <li>
              <NavLink
                className={({ isActive }) => isActive ? 'text-blue-700 underline' : undefined}
                to="/login"
              >
                Log in
              </NavLink>
            </li>

          </>
        ) : (
          <li>
            <NavLink onClick={handleLogout}>
              Log out
            </NavLink>
          </li>
        )}
        <li>
          <button onClick={() => setClose(true)}>Sign In</button>
          <Modal isOpen={isOpen} setClose={setClose} />
        </li>
      </ul>
    </header>

  )
}
