import React, {useState, useEffect, useCallback} from "react";
import '../../../sass/PlaceOrder.scss'
import {Link} from "react-router-dom";

const PlaceOrder = ({sum, userID}) => {

    const api = process.env.MIX_API;
    const [name, setName] = useState('');
    const [address, setAddress] = useState('');
    const [mobile, setMobile] = useState('');
    const [status, setStatus] = useState(0)
    const disabled='';

    const SendOrder = async (e) => {
        e.preventDefault()
        console.log(userID, sum, mobile, name, address)
        const Data = {userID, sum, mobile, name, address}
        if (userID && sum && mobile && name && address) {
            let result = await fetch(`${api}/productOrder/store`, {
                method: 'POST',
                body: JSON.stringify(Data),
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                }
            }).then(response => {
                setStatus(response.status)
                if (response.status === 500) {
                    alert('You Already Added This to Your List')
                }
            })
            //window.location.href('/orders')
        } else {
            alert('Please Provide All The Information')
        }

    }

    return (
        <div className='PlaceOrder'>
            <div className='givenInfo'>
                <h2>SubTotal: <span>${sum.toFixed(2)}</span></h2>
                <hr/>
                <h4>Delivery Charge: <span>$7</span></h4>
                <hr/>
                <h5>Payable Total: <span>${(sum + 7).toFixed(2)}</span></h5>
            </div>

            <form onSubmit={SendOrder}>
                <input
                    name='name'
                    onChange={(e) => setName(e.target.value)}
                    type='text'
                    placeholder='Name'/>
                <input name='mobile'
                       type='text'
                       onChange={(e) => setMobile(e.target.value)}
                       placeholder='Mobile'/>
                <input
                    name='address'
                    type='text'
                    onChange={(e) => setAddress(e.target.value)}
                    placeholder='Address'/>
                <button disabled={name || mobile || address? disabled:!disabled}> Place Order</button>
            </form>
           <Link to='/orders'> <button className='goButton' > Checkout Page</button></Link>
        </div>
    )
}

export default PlaceOrder
