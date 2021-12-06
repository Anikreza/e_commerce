import React, {useState, useEffect, useCallback} from "react";
import {RiAddFill, RiDeleteBin6Line} from "react-icons/ri";
import axios from "axios";
import PlaceOrder from "./PlaceOrder";
import {useStateValue} from "../../states/StateProvider";
import {Link} from "react-router-dom";

const CartCard = ({image, title, author, quantity, price, sum, stock, productID}) => {

    const [{ user,basket }, dispatch] = useStateValue();
    const url = process.env.MIX_URL;
    const api = process.env.MIX_API;
    const [updatedQuantity, setUpdatedQuantity] = useState(quantity)

    useEffect(() => {
        update().then(r => r)
    }, [updatedQuantity]);


    async function update() {
        dispatch({
            type: "INCREMENT_QUANTITY",
            id:productID ,
            value: updatedQuantity
        });
    }


    function Increase() {
        if (stock > updatedQuantity) {
            setUpdatedQuantity(updatedQuantity + 1)
        } else {
            alert('Out Of Stock!!!')
        }
    }

    function Decrease() {
        if (stock > 0 && updatedQuantity >= 1) {
            setUpdatedQuantity(updatedQuantity - 1)
        }
    }

    async function Delete() {
        dispatch({
            type: "REMOVE_FROM_BASKET",
            quantity:quantity,
            id:productID
        });
    }

    return (
        <div className='cart'>
            <div className='cartProducts'>
                <div style={{display: 'flex', flexDirection: 'column'}}>
                    <img src={`${url}/` + image} alt=''/>
                </div>
                <div className='bookInfo'>
                    <p>{title}</p>
                    <h4>{author}</h4>
                    <h5><RiDeleteBin6Line onClick={Delete} style={{cursor:'pointer'}} size='20px'/></h5>
                </div>
                <div className='PricingInfo'>
                    <div style={{display: 'flex'}}>
                        <button className='quantityButton'>
                            <p1 onClick={Decrease}>-</p1>
                            <span> {updatedQuantity} </span>
                            <p2 onClick={Increase}>+</p2>
                        </button>
                        <h6>${(price * updatedQuantity).toFixed(2)}</h6>
                    </div>
                </div>
            </div>
            <hr/>

        </div>
    )
}

export default CartCard
