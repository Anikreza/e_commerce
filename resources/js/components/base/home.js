import React, {useState, useEffect, useCallback, useRef} from 'react'
import '../../../sass/home.scss'
import Footer from "./footer";
import CategoryCard from '../card/categoryCard'
import NavBar from "../card/NavBar";
import axios from "axios";
import {useStateValue} from "../../helpers/StateProvider";
import Cartbox from "../card/CartBox";


const Home = () => {

    const [height, setHeight] = useState(false);
    const api = process.env.MIX_API;
    const [fantasyBookData, setFantasyBookData] = useState([]);
    const [adventureBookData, setAdventureBookData] = useState([]);
    const [romanceBookData, setRomanceBookData] = useState([]);
    const [data, setData] = useState([])

    const getBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/byCategory`)
                .then(async (res) => {
                    setFantasyBookData(res.data.fantasyBooks)
                    setAdventureBookData(res.data.adventureBooks)
                    setRomanceBookData(res.data.romanceBooks)
                    console.log('bookData', res.data);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );
    useEffect(async () => {
        getBooks().then(r => r)
    }, [getBooks]);


    const ScrollHeight = () => {
        if (window.scrollY >= 400) {
            setHeight(true)
        } else {
            setHeight(false)
        }
    }
    window.addEventListener('scroll', ScrollHeight);
    const AdventureRef = useRef(null)
    const FantasyRef = useRef(null)
    const RomaneRef = useRef(null)
    return (
        <div>
            <div className={!height ? 'home' : 'home2'}>
                <NavBar
                    Adventure={AdventureRef}
                    Romance={RomaneRef}
                    Fantasy={FantasyRef}
                />
                <div className='bg'>
                </div>
                <div ref={AdventureRef}>
                    <CategoryCard
                        title={'Adventure Novels: Fascinate Your Destinies...'}
                        bookData={adventureBookData}
                    />
                </div>
                <div ref={FantasyRef}>
                    <CategoryCard
                        title={'Fantasy Novels: Fascinate Your Thoughts...'}
                        bookData={fantasyBookData}
                    />
                </div>
                <div ref={RomaneRef}>
                    <CategoryCard
                        title={'Romance Novels: Fascinate Your Nerves...'}
                        bookData={romanceBookData}
                    />
                </div>

            </div>
            <Footer/>
        </div>
    )
}

export default Home
