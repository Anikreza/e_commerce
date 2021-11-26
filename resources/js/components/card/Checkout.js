import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";

const Checkout = ({stock,productID,quantity}) => {

    const api = process.env.MIX_API;
    const [updatedStock, setUpdatedStock] = useState(0)

    useEffect(() => {
        setUpdatedStock(stock-quantity)
    }, [stock]);




    const updateStock= (e)=>  {
        e.preventDefault()
        const Data = {quantity,productID,updatedStock}
        let result = fetch(`${api}/cart/updateStock`, {
            method: 'POST',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
        console.log('updatedStock',stock,quantity,updatedStock)
    }

    return (
        <div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
                <form onSubmit={updateStock}>
                    <button  id='submit'>ORDER</button>
                    <p>{quantity}</p>
                    <p>{quantity}</p>
                    <p>{quantity}</p>
                    <p>{quantity}</p>
                </form>
        </div>
    )
}

export default Checkout
