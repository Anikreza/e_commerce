import React, {useState, useEffect} from "react";
import DivCarousel from "react-multi-carousel";
import 'react-multi-carousel/lib/styles.css';
import SliderData from "../../helpers/sliderData";
import logo from '../../assets/logo.png'
import a from '../../assets/toj.jpg'
import b from '../../assets/ny.jpg'
import c from '../../assets/aqotwf.jpg'
import d from '../../assets/wap.jpg'
import e from '../../assets/ww.jpg'

const comp = ({title}) => {
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
                <h2>{title}</h2>
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
                deviceType={'desktop'}
            >
                <div>
                    <SliderData link={'/nagaland'} image={a} header={'The Children of Jocasta'}
                                caption={'by Natalie Haynes'}/>
                </div>
                <div>
                    <SliderData link={'/ourgirls'} image={b} header={'New York'}
                                caption={' by Edward Rutherfurd'}/>
                </div>
                <div>
                    <SliderData link={'/hillroute'} image={c} header={'All Quiet on the Western Front'}
                                caption={'by Erich Maria Remarque'}/>
                </div>
                <div>
                    <SliderData link={'/hillroute'} image={d} header={'War and Peace'}
                                caption={'by Leo Tolstoy'}/>
                </div>
                <div>
                    <SliderData link={'/hillroute'} image={e} header={'White Is for Witching'}
                                caption={'by Helen Oyeyemi'}/>
                </div>
            </DivCarousel>
        </div>
    )
}

export default comp
