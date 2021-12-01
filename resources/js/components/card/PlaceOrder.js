import React, {useState, useEffect, useCallback} from "react";
import '../../../sass/PlaceOrder.scss'
import {Link} from "react-router-dom";
import {useNavigate} from "react-router";
import {useStateValue} from "../../helpers/StateProvider";

const PlaceOrder = ({sum, userID}) => {

    const [{}, dispatch] = useStateValue();

    const api = process.env.MIX_API;
    const [name, setName] = useState('');
    const [address, setAddress] = useState('');
    const [mobile, setMobile] = useState('');
    const [status, setStatus] = useState(0)
    const disabled = '';
    const [data, setData] = useState([])
    const navigate=useNavigate()

    const toOrder= async (e)=>{
        e.preventDefault()
        dispatch({
            type: "SET_USER_DETAIL",
            item: {
                address: address,
                mobile: mobile,
                name: name,
            },
        });
        navigate('/orders')
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

            <form onSubmit={toOrder}>
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
                <button
                    disabled={name || mobile || address ? disabled : !disabled}
                    className={name && mobile && address ? 'button-glow' : 'button-dim'}
                >
                    Checkout Page
                </button>
            </form>
        </div>
    )
}

export default PlaceOrder
