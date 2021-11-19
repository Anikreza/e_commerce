import React from 'react';
import { BrowserRouter as Router,Routes, Route} from 'react-router-dom';
import {useStateValue} from "../helpers/StateProvider";
import Header from './base/Header';
import Register from '../Views/register';
import Login from "../Views/login";
import UploadProduct from './card/uploadProduct'
import Home from './base/home';
import '../../sass/app.scss';

function Index() {
    const [{user}, dispatch] = useStateValue();
    let User=JSON.parse(user);
    return (
        <div className='index-app'>
            <Router>
                <Header/>
                <Routes>
                    <Route exact path='/' element={<Home/>}/>
                    <Route path='/home' element={<Home/>}/>
                    <Route path='/register' element={<Register/>}/>
                    <Route path='/login' element={<Login/>}/>
                    <Route path='/add' element={<UploadProduct/>}/>
                </Routes>
            </Router>
        </div>
    );
}

export default Index;

