import React, { useContext, useState } from 'react'
import { ThemeContext } from '../contexts/ThemeContext'
import { Link } from 'react-router-dom'
import NavBarMenu from '../components/menu/NavBarMenu';

export default function Home() {
  const { user } = useContext(ThemeContext);

  const capitalizeFirstLetter = (name) => {
    if (!name) return '';
    return name.charAt(0).toUpperCase() + name.slice(1);
  }

  return (
    <div className="flex min-h-screen">
      {/* Sidebar */}
      <NavBarMenu />

      {/* Main Content */}
      <div className="flex-1 p-6 bg-gray-100">
        <h1 className="text-xl">Welcome to Our Home {user ? capitalizeFirstLetter(user.name) : ''}</h1>
      </div>
    </div>
  )
}
