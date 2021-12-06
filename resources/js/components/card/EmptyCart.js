import React, {useState, useEffect} from "react";
import {Link} from "react-router-dom";
import { RiAddFill } from 'react-icons/ri';

const EmptyCart = () => {
    return (
        <div className='empty'>
            <h2>YOUR CART IS EMPTY</h2>
            <div className='toHome'>
                <Link to={'/allBooks'}> <span><RiAddFill size='22px' color='green'/></span> ADD SOMETHING</Link>
            </div>
            <div className='toStatus'>
                <Link to={'/orderStatus'}> CHECK CURRENT ORDER STATUS</Link>
            </div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <hr/>
        </div>
    )
}

export default EmptyCart
