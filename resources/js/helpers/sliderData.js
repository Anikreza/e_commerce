import React from 'react'
import {BrowserRouter as Router, Route, Link, NavLink, BrowserRouter} from "react-router-dom";

const SliderData = ({title, image, author, link}) => {
    return (
        <div className='slider' onClick={()=>window.location.replace(link)} style={{cursor:'pointer'}}>
                <div className='slider-image'>
                    <img src={image}/>
                </div>
                <div className='slider-header'>
                    <h2>{title}</h2>
                </div>
                <div className='slider-caption'>
                    <p> {author}...</p>
                </div>
            <br/>
        </div>
    )
}

export default SliderData
