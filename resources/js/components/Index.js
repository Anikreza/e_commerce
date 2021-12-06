import React from 'react';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';
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
import OrderStatus from "./card/OrderStatus";
import AllBooksHome from "./base/AllBooksHome";

function Index() {

    let admin = process.env.MIX_ADMIN;
    let User = JSON.parse(window.localStorage.getItem('user'));
    let user = User?.user.email

    return (
        <div className='index-app'>
            <Router>
                <Header/>
                <Routes>
                    <Route path='/register' element={<Register/>}/>
                    <Route path='/login' element={<Login/>}/>

                    {
                        (user !== admin) &&
                        <Route path='/home' element={<Home/>}/>
                    } {
                    (user !== admin) &&
                    <Route path='/book/:id/:title' element={<SingleProductCard/>}/>

                } {
                    (user !== admin) &&
                    <Route path='/orderStatus' element={<OrderStatus/>}/>
                } {
                    (user !== admin) &&
                    <Route path='/allBooks' element={<AllBooksHome/>}/>

                } {
                    (user !== admin) &&
                    <Route path='/orders' element={<ShowOrders/>}/>
                }
                    {
                        (user !== admin) &&
                        <Route path='/cart' element={<DisplayCart/>}/>
                    }
                    {

                        (user !== admin) &&
                        <Route path='/' element={<Home/>}/>
                    }

                    {
                        (user === admin) &&
                        <Route path='/add' element={<UploadProduct/>}/>
                    }
                    {
                        (user === admin) &&
                        <Route path='/adminOrders' element={<AdminOrderPage/>}/>
                    }
                    {
                        (user === admin) &&
                        <Route path='/edit' element={<AdminEdit/>}/>
                    }
                </Routes>
            </Router>
        </div>
    );
}

export default Index;

