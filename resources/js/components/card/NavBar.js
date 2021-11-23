import React, {useState, useEffect} from "react";
import '../../../sass/navbar.scss'
import {NavLink} from "react-router-dom";

const comp = () => {
    return (
        <div className='nav'>
            <div className='Ul'>
                <NavLink to='/books/Adventure' activeStyle={{
                    fontWeight: "300", color: 'rgb(29, 99, 27)'
                }}>Adventure </NavLink>

                <NavLink to='/books/Romance' activeStyle={{
                    fontWeight: "300", color: 'rgb(29, 99, 27)'
                }}>Romance </NavLink>

                <NavLink to='/books/Fantasy' activeStyle={{
                    fontWeight: "300", color: 'rgb(29, 99, 27)'
                }}>Fantasy </NavLink>
            </div>
        </div>
    )
}

export default comp
