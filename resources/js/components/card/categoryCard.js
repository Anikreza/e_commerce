import React, {useState, useEffect, useCallback} from 'react'
import axios from "axios";
import {Link, NavLink} from 'react-router-dom'
import DivCarousel from "react-multi-carousel";
import 'react-multi-carousel/lib/styles.css';
import SliderData from "../../helpers/sliderData";
import logo from '../../assets/logo.png'
import a from '../../assets/toj.jpg'
import b from '../../assets/ny.jpg'
import c from '../../assets/aqotwf.jpg'
import d from '../../assets/wap.jpg'
import e from '../../assets/ww.jpg'


const comp = ({title, bookData}) => {

    const responsive = {
        superLargeDesktop: {
            // the naming can be any, depends on you.
            breakpoint: {max: 4000, min: 3000},
            items: 5
        },
        desktop: {
            breakpoint: {max: 3000, min: 1024},
            items: 3
        },
        tablet: {
            breakpoint: {max: 1024, min: 464},
            items: 2
        },
        mobile: {
            breakpoint: {max: 464, min: 0},
            items: 1
        }
    };

    return (
        <div className='category-box'>
            <div className='title-level'>
                <h2>title here....</h2>
            </div>
                <DivCarousel
                className='carousel'
                swipeable={false}
                draggable={false}
                showDots={true}
                responsive={responsive}
                ssr={true} // means to render carousel on server-side.
                infinite={true}
                autoPlay={true}
                autoPlaySpeed={5000}
                keyBoardControl={true}
                customTransition="all .5"
                transitionDuration={600}
                containerClass="carousel-container"
                removeArrowOnDeviceType={["tablet", "mobile"]}
                dotListClass="custom-dot-list-style"
                itemClass="carousel-item-padding-10-px"
                deviceType={'desktop'}>
                {
                    bookData.map((data) =>
                        (
                            <div>
                                <Link to={`/book/${data.id}/${data.title}`}>
                                <SliderData
                                    key={data.id}
                                    id={data.id}
                                    image={data.product_img}
                                    title={data.title}
                                    author={data.author}
                                />
                            </Link>
                            </div>
                        ))
                }
            </DivCarousel>
        </div>
    )
}

export default comp
