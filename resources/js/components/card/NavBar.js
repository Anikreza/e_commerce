import React, {useState, useEffect} from "react";
import '../../../sass/navbar.scss'
import {NavLink} from "react-router-dom";

const comp = ({Romance, Adventure, Fantasy}) => {
    return (
        <div className='nav'>
            <div className='Ul'>
                <p onClick={()=>Adventure.current.scrollIntoView()}>Adventure</p>
                <p onClick={()=>Romance.current.scrollIntoView()} >Romance</p>
                <p onClick={()=>Fantasy.current.scrollIntoView()}>Fantasy</p>
            </div>
        </div>
    )
}

export default comp
