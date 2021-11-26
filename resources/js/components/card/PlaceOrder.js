import React, {useState, useEffect,useCallback} from "react";
import '../../../sass/PlaceOrder.scss'

const PlaceOrder = ({sum,userID}) => {

    const api = process.env.MIX_API;
    const [name, setName] = useState('');
    const [address, setAddress] = useState('');
    const [mobile, setMobile] = useState('');


    const SendOrder = useCallback(
        async (e) => {
            e.preventDefault()
            const Data = {userID,sum,mobile,name,address}
            let result = fetch(`${api}/productOrder/add`, {
                method: 'POST',
                body: JSON.stringify(Data),
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                }
            })
        },
        [],
    );

    useEffect(() => {
        console.log('cartID',cartID)
    }, [SendOrder]);


    return (
        <div className='PlaceOrder'>
            <div className='givenInfo'>
                <h2>SubTotal: <span>${sum}</span></h2>
                <hr/>
                <h4>Delivery Charge: <span>$7</span></h4>
                <hr/>
                <h5>Payable Total: <span>${sum+7}</span></h5>
            </div>

            <form>
                <input name='name' type='text' placeholder='Name'/>
                <input name='mobile' type='text' placeholder='Mobile'/>
                <input name='address' type='text' placeholder='Address'/>
                <button onClick={SendOrder}> Place Order</button>
            </form>
        </div>
    )
}

export default PlaceOrder
