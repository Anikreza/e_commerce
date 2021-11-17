import React from 'react';
import { BrowserRouter as Router,Routes, Route} from 'react-router-dom';
import Header from '../components/Header'
import Register from '../Views/register'
import Login from "../Views/login";
import '../../sass/app.scss'

function Index() {
    return (
        <div>
            <Router>
                <Header/>
                <Routes>
                    <Route path='register' element={<Register/>}/>
                    <Route path='login' element={<Login/>}/>
                </Routes>
            </Router>
        </div>
    );
}

export default Index;

