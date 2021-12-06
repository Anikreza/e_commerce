import React, {useState, useEffect} from 'react'
import {Link, NavLink} from 'react-router-dom'
import AddToList from '../helpers/addToList'


const SliderData = ({title, image, author, stock, productID, price}) => {


    return (
        <div className='slider' style={{cursor: 'pointer'}}>
            {/*<ReactTooltip />*/}
            {/*<p data-tip="hello world">Tooltip</p>*/}
            <Link to={`/book/${productID}/${title}`}>
                <div className='slider-image'>
                    <img src={image}/>
                </div>
                <div className='slider-header'>
                    <h2>{title}</h2>
                </div>
                <div className='slider-caption'>
                    <p> {author}...</p>
                </div>
                <div className='slider-price'>
                    <p> ${price}...</p>
                </div>
            </Link>
                <AddToList
                    title={title}
                    image={image}
                    author={author}
                    stock={stock}
                    productID={productID}
                    price={price}
                />
            <br/>
        </div>
    )
}
export default SliderData
