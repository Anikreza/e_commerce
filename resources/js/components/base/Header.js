import React, {useState, useEffect} from 'react'
import {Link, NavLink} from 'react-router-dom'
import '../../../sass/header.scss'
import {IoIosArrowDropdown} from 'react-icons/io';
import a from '../../assets/logo.png'
import SearchCard from "../card/SearchCard";
import CartBox from "../card/CartBox";
import { BiAddToQueue } from 'react-icons/bi';
import { FaRegEdit } from 'react-icons/fa';

const Header = () => {

    let admin = process.env.MIX_ADMIN;
    let user = JSON.parse(window.localStorage.getItem('user'));
    const [modal, setModal] = useState(false);
    const logout = (e) => {
        window.localStorage.clear();
    }
    return (

        <div>
            <div className='navbar'>
                {
                    (user?.user.email === admin) ?
                        <>
                            <CartBox/>
                            <div className='nav-ul'>
                                <ul>
                                    <li className='home-logo-admin'>
                                        <NavLink to='/home'>
                                            <img className='logo' src={a}/>
                                        </NavLink>
                                    </li>

                                    <li><NavLink to='/add'>
                                        <BiAddToQueue size='29px' color='#363636'/>
                                    </NavLink></li>

                                    <li><NavLink to='/edit'>
                                        <FaRegEdit size='27px' color='#363636'/>
                                    </NavLink></li>
                                </ul>
                            </div>
                        </>
                        :
                        <>
                            <CartBox/>
                            <div className='nav-ul'>
                                <ul>
                                    <li className='home-logo'><NavLink to='/home' activeStyle={{
                                        fontWeight: "bold",
                                        color: 'rgb(29, 99, 27)'
                                    }}><img className='logo' src={a}/></NavLink></li>
                                    <SearchCard/>
                                </ul>
                            </div>
                        </>
                }
            </div>

            {(user?.token) ?
                <div className='user-name-nav' style={{cursor: 'pointer'}} onClick={() => setModal(!modal)}>
                    <p>
                        {user?.user.name}
                        <span><IoIosArrowDropdown style={{cursor: 'pointer'}} color='black'/> </span>
                    </p>
                    <span className={modal ? 'modal-logout' : 'hide'}>
                        <NavLink to='/cart' className='modal-cart'> Your Cart</NavLink>
                        <br/>
                        <hr/>
                        <button onClick={logout}>Log Out</button>
                    </span>
                </div>
                :
                <div className='user-name-nav'>
                    <NavLink to='/login'> Log In</NavLink>
                </div>
            }
            <hr/>
        </div>
    )
}
export default Header
