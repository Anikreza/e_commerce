import React, {useEffect,useState, useCallback} from 'react'
import { AiOutlineShoppingCart } from 'react-icons/ai';
import axios from "axios";
import '../../../sass/cartPage.scss'
const Cartbox = () => {

    const [data,setData]=useState([])
    let user = JSON.parse(window.localStorage.getItem('user'));
    const userID = user?.user.id;
    const api = process.env.MIX_API;

    const getCart = useCallback(
        async () => {
            await axios.get(`${api}/cart/show/` + userID)
                .then(async (res) => {
                    setData(res.data);
                    console.log('cartData', res.data);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );

    useEffect(async () => {
        getCart().then(r => r)
    }, [getCart,data]);
    return (

        <div className='cartbox'>
            <AiOutlineShoppingCart  onClick={()=>window.location.pathname='/cart'} size='28px' color='black'
            /><span> {data.length}</span>
        </div>
    )
}

export default Cartbox
