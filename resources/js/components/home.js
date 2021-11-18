import React, {useState, useRef} from 'react'
import '../../sass/home.scss'
import logo from '../assets/logo.png'
import a from '../assets/g.jpg'
import b from '../assets/b.jpg'
import c from '../assets/c.jpg'
import d from '../assets/d.png'
import Footer from "./footer";


const Home = () => {

    const [height, setHeight] = useState(false);
    const ScrollHeight = () => {
        if (window.scrollY >= 450) {
            setHeight(true)
        } else {
            setHeight(false)
        }
    }

    window.addEventListener('scroll', ScrollHeight);


    return (
        <div>
            <div className={!height ? 'home' : 'home2'}>
                <div className='bg'>
                    <h2> COMMITTED TO THINK DIFFERENT</h2>
                </div>
                <div className='home-content'>
                    <div className='service'>
                        <img src={logo}/>
                        <h1>SERVICES</h1>
                        <div className='services'>
                            <h3>3D MODELING</h3>
                            <p>Whether residential or commercial, our team produces high quality models for both
                                exterior
                                and interior designs.</p>
                        </div>
                        <div className='services'>
                            <h3>3D MODELING</h3>
                            <p>Photorealistic architecture 3D model images</p>
                        </div>
                        <div className='services'>
                            <h3>3D MODELING</h3>
                            <p>Eminent architecture 3D models help clients save a lot of time and effort during
                                construction </p>
                        </div>
                    </div>
                </div>
                <div className='works' style={{cursor: 'pointer'}} onClick={() => window.location.replace('/works')}>
                    <h2>Works</h2>
                    <div className='row'>
                        <div className='column'>
                            <div className='contenta'>
                                <img height='300px' src={a}/>
                            </div>
                        </div>
                        <div className='column'>
                            <div className='contenta'>
                                <img height='300px' src={b}/>
                            </div>
                        </div>
                        <div className='column'>
                            <div className='contenta'>
                                <img height='300px' src={c}/>
                            </div>
                        </div>
                        <div className='column'>
                            <div className='contenta'>
                                <img height='300px' src={d}/>
                            </div>
                        </div>
                    </div>
                </div>

                <div className='about-home'>
                    <p> shdfhj sdbfh jhdf dsjhbv hdjgh jfhg fjh fjdh fjdhbfdj ngvjfdbv gfdjhgv fjdhbghfdb gj dhj</p>
                    <p> shdfhj sdbfh jhdf dsjhbv hdjgh jfhg fjh fjdh fjdhbfdj ngvjfdbv gfdjhgv fjdhbghfdb gj dhj</p>
                    <p> shdfhj sdbfh jhdf dsjhbv hdjgh jfhg fjh fjdh fjdhbfdj ngvjfdbv gfdjhgv fjdhbghfdb gj dhj</p>
                    <p> shdfhj sdbfh jhdf dsjhbv hdjgh jfhg fjh fjdh fjdhbfdj ngvjfdbv gfdjhgv fjdhbghfdb gj dhj</p>
                </div>
            </div>
            <Footer/>
        </div>
    )
}

export default Home
