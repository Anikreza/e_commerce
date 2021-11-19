import React from 'react'
import { BrowserRouter as Router, Route, Link, NavLink, BrowserRouter } from "react-router-dom";

const SliderData = ({header, image, caption, link}) => {
    return (
        <div className='slider'>

            <Link to={link}>

                <div className='slider-image'>
                    <img src={image}/>
                </div>

                <div className='slider-header'>
                    <h2>{header}</h2>
                </div>

                <div className='slider-caption'>
                    <p> {caption}...</p>
                </div>


            </Link>

            <br/>


        </div>
    )
}

export default SliderData
