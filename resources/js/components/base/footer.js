import React from 'react'
import '../../../sass/footer.scss'
import { AiFillFacebook } from 'react-icons/ai';
import { AiFillTwitterSquare } from 'react-icons/ai';
import { IoLogoYoutube } from 'react-icons/io';
import { FaInstagramSquare } from 'react-icons/fa';
import { FaPatreon } from 'react-icons/fa';
import logo from '../../assets/logo.png'


const Footer = () => {
    return (
        <div className='footer'>
            <div className='f-content'>

                <img src={logo} className='footer-logo'/>
                <div>
                    <a href='https://www.youtube.com/channel/UC2BR_6GXKLCMX9SEETnO7KQ' target='blank'><IoLogoYoutube className='yticon' size='30px' color='black'/></a>
                    <a href='https://www.facebook.com/Anikreza22/' target='blank'> <AiFillFacebook className='fbicon' size='30px' color='black'/></a>
                    <a href='https://www.instagram.com/anikrezain/?hl=en' target='blank'><FaInstagramSquare className='inicon' size='30px' color='black'/></a>
                    <a href='https://twitter.com/TanvirRezaAnik1' target='blank'> <AiFillTwitterSquare className='ttricon' size='30px' color='black'/></a>
                    <a href='https://www.patreon.com/user?u=36041123' target='blank'> <FaPatreon className='pticon' size='30px' color='black' /></a>
                </div>
                <p1>Copyright ©2021 3dClubBD</p1>
            </div>
        </div>
    )
}

export default Footer
