import React from 'react'
import {Link, NavLink} from 'react-router-dom'

const SliderData = ({title, image, author}) => {
    return (
        <div className='slider' style={{cursor:'pointer'}}>
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
