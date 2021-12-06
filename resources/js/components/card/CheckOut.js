import React, {useState} from 'react'
import axios from "axios";

const GridCard = ({title, author, quantity, price, description, image}) => {

    const url = process.env.MIX_URL;

    return (
        <div className='column'>
            <hr/>
            <div className='content'>
                <img src={`${url}/` + image}/>
                <p className='quantity'>Quantity: {quantity}</p>
                <p className='Price'>Price: ${price.toFixed(2)}</p>
            </div>
            <hr/>
        </div>
    )
}

export default GridCard

