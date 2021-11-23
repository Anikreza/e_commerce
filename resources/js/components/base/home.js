import React, {useState, useEffect, useCallback} from 'react'
import '../../../sass/home.scss'
import Footer from "./footer";
import CategoryCard from '../card/categoryCard'
import NavBar from "../card/NavBar";
import axios from "axios";
import {useStateValue} from "../../helpers/StateProvider";


const Home = () => {

    const [height, setHeight] = useState(false);
    const api = process.env.MIX_API;
    const [fantasyBookData, setFantasyBookData] = useState([]);
    const [adventureBookData, setAdventureBookData] = useState([]);
    const [romanceBookData, setRomanceBookData] = useState([]);
    const [data, setData]=useState([])

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
    return (
        <div>
            <div className={!height ? 'home' : 'home2'}>
                <NavBar/>
                <div className='bg'>
                </div>
                <CategoryCard
                    title={'Adventure Novels: Fascinate Your Destinies...'}
                    bookData={adventureBookData}
                />
                <CategoryCard
                    title={'Fantasy Novels: Fascinate Your Thoughts...'}
                    bookData={fantasyBookData}
                />
                <CategoryCard
                    title={'Romance Novels: Fascinate Your Nerves...'}
                    bookData={romanceBookData}
                />
            </div>
            <Footer/>
        </div>
    )
}

export default Home
