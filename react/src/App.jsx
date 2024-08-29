import { Outlet } from 'react-router-dom'
import './App.css'
import Header from './components/Header'
import { ThemeProvider } from './contexts/ThemeContext'
import { Provider } from 'react-redux'
import { store } from './store'

function App() {
  return (
    <>
      <Provider store={store}>
      <ThemeProvider>
      <Header />
      <main className="py-15 px-4 md:px-25">
        <Outlet />
        </main>
        </ThemeProvider>
        </Provider>
    </>
  )
}

export default App
