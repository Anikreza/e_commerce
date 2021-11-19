import React, {useState, useEffect} from 'react'
import {Link, NavLink} from 'react-router-dom'
import '../../../sass/header.scss'
import {IoIosArrowDropdown} from 'react-icons/io';
import a from '../../assets/logo.png'


const Header = () => {

    let admin=process.env.MIX_ADMIN;
    let user=JSON.parse(window.localStorage.getItem('user'));
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
                            <div className='nav-ul'>
                                <ul>
                                    <li className='home-logo'><NavLink to='/home' activeStyle={{
                                        fontWeight: "bold",
                                        color: 'rgb(29, 99, 27)'
                                    }}><img className='logo' src={a}/></NavLink></li>

                                    <li><NavLink to='/add' activeStyle={{
                                        fontWeight: "300",
                                        color: 'rgb(29, 99, 27)'
                                    }}> Add Product </NavLink></li>

                                    <li><NavLink to='/list' activeStyle={{
                                        fontWeight: "300", color: 'rgb(29, 99, 27)'
                                    }}>Product List </NavLink></li>
                                </ul>
                            </div>
                        </>
                        :
                        <>
                            <div className='nav-ul'>
                                <ul>
                                    <li className='home-logo'><NavLink to='/home' activeStyle={{
                                        fontWeight: "bold",
                                        color: 'rgb(29, 99, 27)'
                                    }}><img className='logo' src={a}/></NavLink></li>

                                    <li><NavLink to='/about' activeStyle={{
                                        fontWeight: "300",
                                        color: 'rgb(29, 99, 27)'
                                    }}>About</NavLink></li>

                                    <li><NavLink to='/list' activeStyle={{
                                        fontWeight: "300",
                                        color: 'rgb(29, 99, 27)'
                                    }}> Shop </NavLink></li>

                                    <li><NavLink to='/works' activeStyle={{
                                        fontWeight: "300",
                                        color: 'rgb(29, 99, 27)'
                                    }}>Works</NavLink></li>

                                    <li><NavLink to='/contact' activeStyle={{
                                        fontWeight: "300",
                                        color: 'rgb(29, 99, 27)'
                                    }}>Contact</NavLink></li>

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
                    <span className={modal ? 'modal-logout' : 'hide'}><button
                        onClick={logout}>LogOut</button> </span>
                </div>
                :
                <div className='user-name-nav'>
                    <NavLink to='/login'> Sign In</NavLink>
                </div>
            }
        </div>
    )
}
export default Header
