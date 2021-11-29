import React, {useState, useEffect} from "react";
import {useStateValue} from "../../helpers/StateProvider";

const comp = ({name,phone, address,data,userID}) => {

    const [{user,basket}, dispatch] = useStateValue();
    const api = process.env.MIX_API;
    const [sum,setSum]=useState(0)

    useEffect(() => {
        const sum = basket.reduce((amount, books) => (books.price * books.quantity) + amount, 7);
        setSum(sum)
    }, [basket]);


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
                    <div key={Data.title}>
                        <p><span></span>{Data.title}<span> ({Data.quantity})  ${(Data.quantity*Data.price)}</span></p>
                    </div>
                ))
            }
            <h4>Total Payable: ${sum}</h4>
            <br/>
            <button onClick={makeOrder}>Checkout</button>
        </div>
    )
}

export default comp
