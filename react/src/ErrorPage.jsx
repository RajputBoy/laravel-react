import React from 'react';
import { useRouteError } from 'react-router-dom';
import Header from './components/Header';

const ErrorPage = () => {
	const error = useRouteError();
	return (
		<div>
			<Header />
			<div>Something went wrong {error.status} !!</div>
		</div>
	);
};

export default ErrorPage;
