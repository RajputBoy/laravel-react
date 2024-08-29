import { createContext, useEffect, useState } from "react";
import { BASE_URL } from "../components/services/CallApi";
import axios from "axios";

export const ThemeContext = createContext();

export const  ThemeProvider = ({ children }) => {

    const [user, setUser] = useState(null);

    useEffect(() => {
        const token = localStorage.getItem('authToken');

        if (token) {
            axios.get(`${BASE_URL}/user`, {
                headers: {
                    Authorization: `Bearer ${token}`,
                },
            })
                .then(response => {
                setUser(response.data);
            })
            .catch(() => {
                setUser(null);
                localStorage.removeItem('authToken');
            });
        }
    }, []);

    const login = (userData, token) => {
        setUser(userData);
        localStorage.setItem('authToken', token);
    };

    const logout = () => {
        setUser(null);
        localStorage.removeItem('authToken');
    };

    return (
        <ThemeContext.Provider value={{ user, setUser, login, logout }}>
            {children}
        </ThemeContext.Provider>
    );

}
