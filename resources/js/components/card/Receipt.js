import React, {useState, useEffect} from "react";

const comp = ({name,phone, address,total,data,userID}) => {

    const api = process.env.MIX_API;
    const [message, setMessage] = useState('');

    async function makeOrder() {
        let Data = {userID};
        await fetch(`${api}/productOrder/delete`, {
            method: 'DELETE',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(res=>{
            alert('Order Placed')
            window.location.replace('/home')
        })
    }
    return (
        <div>
            <h4>{name}</h4>
            <h4>{phone}</h4>
            <h4>{address}</h4>
            {
                data.map(Data=>(
                    <div>
                        <p>{Data.title}<span> ({Data.quantity})(${Data.price})</span></p>
                    </div>
                ))
            }
            <h4>Total Payable: ${total}</h4>
            <br/>
            <button onClick={makeOrder}>Checkout</button>
        </div>
    )
}

export default comp
