import React, {useState, useEffect, useCallback} from "react";
import '../../../sass/PlaceOrder.scss'
import {Link} from "react-router-dom";
import {useNavigate} from "react-router";
import {useStateValue} from "../../states/StateProvider";

const PlaceOrder = ({sum, userID}) => {

    const [{}, dispatch] = useStateValue();
    let User = JSON.parse(window.localStorage.getItem('user'));

    const admin = process.env.MIX_ADMIN;
    const [name, setName] = useState('');
    const [error, setError] = useState('');
    const [address, setAddress] = useState('');
    const [district, setDistrict] = useState('demo');
    const [deliveryFee, setDeliveryFee] = useState(0);
    const [mobile, setMobile] = useState('');
    const disabled = '';
    const navigate = useNavigate()

    const toOrder = async (e) => {
        e.preventDefault()
        if (User?.user.email === admin) {
            setError('You Cant do that')
        } else if (name && mobile && address && district) {
            dispatch({
                type: "SET_USER_DETAIL",
                item: {
                    address: address+district,
                    mobile: mobile,
                    name: name,
                },
            });
            navigate('/orders')
        } else {
            setError('Please Choose Your City')
        }
    }

    useEffect(() => {
        if (district !== 'Dhaka') {
            setDeliveryFee(10)
        } else if (district === 'demo') {
            setDeliveryFee(0)
        } else {
            setDeliveryFee(5)
        }
        setError('')
    }, [district]);


    return (
        <div className='PlaceOrder'>
            {
                (error) ?
                    <p>{error}</p>
                    :
                    ''
            }
            <select onChange={(e) => setDistrict(e.target.value)}>
                <option value='demo'>Choose Your City</option>
                <option value='Dhaka'> Dhaka</option>
                <option value='Outside Dhaka'>Outside Dhaka</option>
            </select>
            <div className='givenInfo'>
                <h2>SubTotal: <span>${sum.toFixed(2)}</span></h2>
                <hr/>
                <h4>Delivery Charge: <span>${deliveryFee}</span></h4>
                <hr/>
                <h5>Payable Total: <span>${(sum + deliveryFee).toFixed(2)}</span></h5>
            </div>

            <form onSubmit={toOrder}>
                <input
                    name='name'
                    onChange={(e) => setName(e.target.value)}
                    type='text'
                    placeholder='Name'/>
                <input name='mobile'
                       type='number'
                       maxLength='11'
                       onChange={(e) => setMobile(e.target.value)}
                       placeholder='Mobile'/>
                <input
                    name='address'
                    type='text'
                    onChange={(e) => setAddress(e.target.value)}
                    placeholder='Address'/>
                <button
                    disabled={name && mobile && address ? disabled : !disabled}
                    className={name && mobile && address ? 'button-glow' : 'button-dim'}
                >
                    Proceed To Checkout
                </button>
            </form>
        </div>
    )
}

export default PlaceOrder
