import React, { useContext } from 'react'
import { ThemeContext } from '../contexts/ThemeContext';

export default function About() {

  const { user } = useContext(ThemeContext);

  return (
    <h1 className='text-xl'>We are ProCodrrs</h1>
  )
}
