import React, {useState, useEffect, useCallback} from 'react'
import axios from "axios";
import {Link, NavLink} from 'react-router-dom'
import DivCarousel from "react-multi-carousel";
import 'react-multi-carousel/lib/styles.css';
import SliderData from "../../helpers/sliderData";



const categoryCard = ({title, bookData}) => {

    const responsive = {
        superLargeDesktop: {
            // the naming can be any, depends on you.
            breakpoint: {max: 4000, min: 3000},
            items: 5
        },
        desktop: {
            breakpoint: {max: 3000, min: 1024},
            items: 5
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
                <h2>{title}</h2>
            </div>
                <DivCarousel
                className='carousel'
                swipeable={true}
                draggable={false}
                showDots={false}
                responsive={responsive}
                ssr={true} // means to render carousel on server-side.
                infinite={true}
                autoPlay={true}
                autoPlaySpeed={5000}
                keyBoardControl={true}
                customTransition="all .5"
                transitionDuration={500}
                containerClass="carousel-container"
                removeArrowOnDeviceType={["tablet", "mobile"]}
                dotListClass="custom-dot-list-style"
                itemClass="carousel-item-padding-10-px"
                deviceType={'desktop'}>
                {
                    bookData.map((data) =>
                        (
                                <SliderData
                                    key={data.id}
                                    id={data.id}
                                    image={data.product_img}
                                    title={data.title}
                                    author={data.author}
                                    stock={data.products_in_stock}
                                    productID={data.id}
                                    price={data.price}
                                />
                        ))
                }
            </DivCarousel>
        </div>
    )
}

export default categoryCard
