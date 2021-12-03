import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import '../../../sass/cartPage.scss';
import {RiDeleteBin6Line} from 'react-icons/ri';
import CartCard from "../card/CartCard";
import PlaceOrder from "../card/PlaceOrder";
import {useStateValue} from "../../states/StateProvider";


const DisplayCart = () => {

    const [{ user,basket }, dispatch] = useStateValue();
    const [data, setData] = useState([])

    const userID =user.id;
    const [sum, setSum] = useState(0)

    const getSum = useCallback(
        async () => {
            const unique = [];
            basket.map(x => unique.filter(a =>a.product_id=== x.product_id).length > 0 ? null : unique.push(x));
            setData(unique)

            const sum = data.reduce((amount, books) => (books.price * books.quantity) + amount, 0);
            setSum(sum)
        },
        [data],
    );

    useEffect(() => {
        getSum().then(r => r)
    }, [getSum]);

    async function DeleteCart(){
        dispatch({
            type: "EMPTY_BASKET",
        });
    }
    return (
        <div className='cartPage'>
            <PlaceOrder
                sum={sum}
                userID={userID}
            />
            <div className='cartBox'>
                <div className='PayOut'>
                    <h1>Your Cart ({data.length})</h1>
                        <RiDeleteBin6Line
                            size='29px'
                            style={{marginTop:'15px', marginLeft:'10px', cursor:'pointer'}}
                            onClick={DeleteCart}
                        />
                    <h2>Sub Total: <span>${sum.toFixed(2)}</span></h2>
                </div>

                <hr/>
                <div>
                    {
                        data.map(Data => (
                            <CartCard
                                key={Data.id}
                                image={Data.image}
                                title={Data.title}
                                author={Data.author}
                                price={Data.price}
                                quantity={Data.quantity}
                                stock={Data.stock}
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
