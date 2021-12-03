import React, {useState, useEffect, useCallback, useRef} from 'react'
import '../../../sass/home.scss'
import Footer from "./footer";
import CategoryCard from '../card/categoryCard'
import NavBar from "../card/NavBar";
import axios from "axios";
import {useStateValue} from "../../states/StateProvider";


const Home = () => {

    let User = JSON.parse(window.localStorage.getItem('user'));
    const [{user,basket,cart}, dispatch] = useStateValue();
    const [height, setHeight] = useState(false);
    const api = process.env.MIX_API;
    const [data, setData] = useState([])
    let orders = JSON.parse(window.localStorage.getItem('orders'))


    const getBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/byCategory`)
                .then(async (res) => {
                    setData(res.data)
                    console.log('new data',res.data)
                    console.log('new Red Data',orders)
                })
                .catch((error) => {
                    console.log(error);
                })
            dispatch({
                type:"SET_USER",
                item: {
                    name: User.user.name,
                    email: User.user.email,
                    id:User.user.id,
                    token:User.token,
                },
            })
        },
        [],
    );
    useEffect(async () => {
        getBooks().then(r => r)
    }, [getBooks]);

    useEffect(() => {
       console.log('basket and cart:',basket,cart)
    }, [cart,basket]);


    const ScrollHeight = () => {
        if (window.scrollY >= 400) {
            setHeight(true)
        } else {
            setHeight(false)
        }
    }

    window.addEventListener('scroll', ScrollHeight);
    const AdventureRef = useRef(null)
    return (
        <div>
            <div className={!height ? 'home' : 'home2'}>
                <NavBar
                    Adventure={AdventureRef}
                />
                <div className='bg'>
                </div>
                <div ref={AdventureRef}>
                    <CategoryCard
                        bookData={data}
                    />
                </div>
            </div>
            <Footer/>
        </div>
    )
}

export default Home
