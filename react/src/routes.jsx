import App from './App.jsx'
import './index.css'
import { Navigate, createBrowserRouter } from 'react-router-dom'
import LoginController from './components/services/LoginController.jsx'
import ProtectedRoute from './components/ProtectedRoute.jsx'
import PublicRoute from './components/PublicRoute.jsx'
import ForgatePassword from './components/user/ForgatePassword.jsx'
import AllUsers from './components/user/AllUsers.jsx'
import AddEditUser from './components/user/AddEditUser.jsx'
import PostsList from './components/posts/PostsList.jsx'
import ErrorPage from './ErrorPage.jsx'
import About from './pages/About.jsx'
import Contact from './pages/Contact.jsx'
import React, { Suspense, lazy } from 'react';

const Home = lazy(() => import('./pages/Home.jsx'));

const routes = createBrowserRouter([
  {
    path: '/',
    element: <App />,
    errorElement: <ErrorPage />,
    children: [
      {
        path: '/',
        element: <Navigate to="/home" />,
      },
      {
        path: '/home',
        element: (
          <Suspense fallback={<div>Loading...</div>}>
            <Home />
          </Suspense>
        ),
      },
      {
        path: '/about',
        element: <About />,
      },
      {
        path: '/register',
        element: <PublicRoute><Contact /></PublicRoute> ,
      },
      {
        path: '/login',
        element: <PublicRoute><LoginController /></PublicRoute>,
      },
      {
        path: '/forgate-password',
        element: <ForgatePassword />,
      },
      {
        path: '/users',
        element: <AllUsers />,
      },
      {
        path: '/users/add',
        element: <AddEditUser />,
      },
      {
        path: '/users/edit/:user_id',
        element: <AddEditUser />,
      },
      {
        path: 'admin/posts',
        element: <PostsList />,
      },
    ],
  },
]);

export default routes;
