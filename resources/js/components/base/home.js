import React, {useState, useRef} from 'react'
import '../../../sass/home.scss'
import Footer from "./footer";
import CategoryCard from '../card/categoryCard'


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
                </div>
                <CategoryCard title={'Historical Novels: Fascinate Your Past...'}/>
                <CategoryCard title={'Fictional Novels: Fascinate Your Thoughts...'}/>
            </div>
            <Footer/>
        </div>
    )
}

export default Home
