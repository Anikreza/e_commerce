import React from 'react';
import { BrowserRouter as Router,Routes, Route} from 'react-router-dom';
import {useLocation} from "react-router-dom";
import Header from './base/Header';
import Register from '../Views/register';
import Login from "../Views/login";
import UploadProduct from './base/uploadProduct'
import Home from './base/home';
import '../../sass/app.scss';
import SingleProductCard from "./base/SingleProductCard";
import DisplayProducts from "./base/DisplayProducts";
import DisplayCart from "./base/DisplayCart";
import ShowOrders from "./base/ShowOrders";
import AdminOrderPage from "./base/AdminOrderPage";
import AdminEdit from "./base/AdminEdit";
import Mapper from "./card/Mapper";

function Index() {

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
                    <Route path='/book/:id/:title' element={<SingleProductCard/>}/>
                    <Route exact path='books/:id' element={<DisplayProducts/>}/>
                    <Route path='/cart' element={<DisplayCart/>}/>
                    <Route path='/orders' element={<ShowOrders/>}/>
                    <Route path='/adminOrders' element={<AdminOrderPage/>}/>
                    <Route path='/edit' element={<AdminEdit/>}/>
                </Routes>
            </Router>
        </div>
    );
}

export default Index;

