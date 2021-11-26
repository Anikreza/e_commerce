import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import '../../../sass/cartPage.scss';
import {RiDeleteBin6Line} from 'react-icons/ri';
import CartCard from "../card/CartCard";
import PlaceOrder from "../card/PlaceOrder";

const DisplayCart = () => {

    let user = JSON.parse(window.localStorage.getItem('user'));
    const userID = user.user.id;
    const [data, setData] = useState([])
    const [sum, setSum] = useState(0)
    const [quantity, setQuantity] = useState('')
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

    const getSum = useCallback(
        async () => {
            const sum = data.reduce((amount, books) => (books.price * books.quantity) + amount, 0);
            setSum(sum)
        },
        [data, quantity,getCart],
    );

    useEffect(() => {
        getSum().then(r => r)
    }, [getSum, data, getCart, quantity]);

    return (
        <div className='cartPage'>
            <PlaceOrder
                sum={sum}
                userID={userID}
            />
            <div className='cartBox'>
                <div className='PayOut'>
                    <h1>Your Cart ({data.length})</h1>
                    <h2>Total Payable: <span>${sum.toFixed(2)}</span></h2>
                </div>

                <hr/>
                <div>
                    {
                        data.map(Data => (
                            <CartCard
                                data={data}
                                key={Data.id}
                                image={Data.product_img}
                                title={Data.title}
                                author={Data.author}
                                price={Data.price}
                                quantity={Data.quantity}
                                stock={Data.products_in_stock}
                                productID={Data.product_id}
                                sum={sum}
                            />
                        ))
                    }
                </div>
            </div>
        </div>
    )
}

export default DisplayCart
