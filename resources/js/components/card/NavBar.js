import React, {useState, useEffect} from "react";
import '../../../sass/navbar.scss'
import {NavLink} from "react-router-dom";

const comp = ({Romance, Adventure, Thriller,Kids}) => {
    return (
        <div className='nav'>
            <div className='Ul'>
                <p onClick={()=>Adventure.current.scrollIntoView()}>Adventure</p>
                <p onClick={()=>Romance.current.scrollIntoView()} >Romance</p>
                <p onClick={()=>Thriller.current.scrollIntoView()}>Fantasy</p>
                <p onClick={()=>Kids.current.scrollIntoView()}>Kids</p>
            </div>
        </div>
    )
}

export default comp
