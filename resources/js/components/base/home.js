import React, {useState, useEffect, useCallback, useRef} from 'react'
import '../../../sass/home.scss'
import Footer from "./footer";
import CategoryCard from '../card/categoryCard'
import NavBar from "../card/NavBar";
import axios from "axios";
import {useStateValue} from "../../states/StateProvider";
import ImageGrid from "../../Views/ImageGrid";
import {BounceLoader, BeatLoader, BarlLoader} from 'react-spinners'

const Home = () => {

    let User = JSON.parse(window.localStorage.getItem('user'));
    const [{user, basket, cart}, dispatch] = useStateValue();
    const [height, setHeight] = useState(false);
    const api = process.env.MIX_API;
    const [adventureBooks, setAdventureBooks] = useState([])
    const [thrillerBooks, setThrillerBooks] = useState([])
    const [romanceBooks, setRomanceBooks] = useState([])
    const [kidsBooks, setKidsBooks] = useState([])
    const [bestSellers, setBestSellers] = useState([])
    const [loading, setLoading] = useState(true)


    const getBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/byCategory`)
                .then(async (res) => {
                    setAdventureBooks(res.data.AdventureBooks)
                    setThrillerBooks(res.data.ThrillerBooks)
                    setRomanceBooks(res.data.RomanceBooks)
                    setKidsBooks(res.data.KidsBooks)
                    setBestSellers(res.data.BestSellers)
                    console.log('new data', res.data)
                    setLoading(false)
                })
                .catch((error) => {
                    console.log(error);
                })
            dispatch({
                type: "SET_USER",
                item: {
                    name: User.user.name,
                    email: User.user.email,
                    id: User.user.id,
                    token: User.token,
                },
            })
        },
        [],
    );
    useEffect(async () => {
        getBooks().then(r => r)
    }, [getBooks]);

    useEffect(() => {
        console.log('basket and cart:', basket, cart)
    }, [cart, basket]);


    const ScrollHeight = () => {
        if (window.scrollY >= 260) {
            setHeight(true)
        } else {
            setHeight(false)
        }
    }

    window.addEventListener('scroll', ScrollHeight);
    const AdventureRef = useRef(null)
    const RomanceRef = useRef(null)
    const ThrillerRef = useRef(null)
    const KidsRef = useRef(null)
    return (
        <div>
            <div className={!height ? 'home' : 'home2'}>
                <NavBar
                    Adventure={AdventureRef}
                    Romance={RomanceRef}
                    Thriller={ThrillerRef}
                    Kids={KidsRef}
                />
                <div className='bg'>
                    {
                        (!loading) ?
                            <ImageGrid
                                bookData={bestSellers.slice(0, 5)}
                            />
                            :
                            <div className='loader-position-top'>
                                <BeatLoader size={20} color={'rgb(150,73,73)'}/>
                            </div>
                    }
                </div>
                <div className='home-bg'>
                </div>
                <div>
                    {
                        (!loading) ?
                            <CategoryCard
                                title={'Top 10 Best Selling Books Of All Time...'}
                                bookData={bestSellers.slice(0, 10)}
                            />
                            :
                            <div className='loader-position-middle'>
                                <BeatLoader size={20} color={'grey'}/>
                            </div>
                    }
                </div>
                <div ref={AdventureRef}>
                    <CategoryCard
                        title={'Adventure Books...'}
                        bookData={adventureBooks}
                    />
                </div>
                <div ref={RomanceRef}>
                    <CategoryCard
                        title={'Romance Books...'}
                        bookData={romanceBooks}
                    />
                </div>
                <div ref={ThrillerRef}>
                    <CategoryCard
                        title={'Thriller Books...'}
                        bookData={thrillerBooks}
                    />
                </div>
                <div ref={KidsRef}>
                    <CategoryCard
                        title={'Books For Kids...'}
                        bookData={kidsBooks}
                    />
                </div>
            </div>
            <Footer/>
        </div>
    )
}

export default Home
