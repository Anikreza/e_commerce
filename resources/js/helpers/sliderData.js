import React, {useState, useEffect} from 'react'
import {Link, NavLink} from 'react-router-dom'
import AddToList from '../helpers/addToList'
import {Rating} from "react-simple-star-rating";


const SliderData = ({title, image, author, stock, productID, price}) => {


    function see() {
        console.log(`rating`)
    }

    return (
        <div className='slider' style={{cursor: 'pointer'}}>
            {/*<ReactTooltip />*/}
            {/*<p data-tip="hello world">Tooltip</p>*/}
            <Link to={`/book/${productID}/${title}`}>
                <div className='slider-image'>
                    <img src={image}/>
                </div>
                <div className='info'>
                    <div className='slider-header'>
                        <h2>{title}</h2>
                    </div>
                    {/*<div className='slider-caption'>*/}
                    {/*    <p> {author}...</p>*/}
                    {/*</div>*/}
                    <div className='slider-price'>
                        <p> ${price}...</p>
                    </div>
                    <Rating
                        style={{marginLeft: '65%'}}
                        ratingValue={40}
                        onClick={see}
                        fillColor={'#3f9875'}
                        size={16}
                        readonly={true}
                        allowHalfIcon={true}
                        allowHover={false}
                        emptyColor={'#dfe3e1'}
                    />

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
            </Link>
        </div>
    )
}
export default SliderData
