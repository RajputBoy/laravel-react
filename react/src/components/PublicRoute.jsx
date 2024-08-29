import React from 'react';
import { Navigate } from 'react-router-dom';

function PublicRoute({ children }) {
    const token = localStorage.getItem('authToken');

    if (token) {
        // If the user is authenticated, redirect to the home page
        return <Navigate to="/home" />;
    }

    // If not authenticated, allow access to the route
    return children;
}

export default PublicRoute;
