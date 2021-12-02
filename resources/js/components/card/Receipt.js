import React, {useState, useEffect,useCallback} from "react";
import {useStateValue} from "../../helpers/StateProvider";
import {useNavigate} from "react-router";

const comp = ({name, email, userID, basketData}) => {

    const api = process.env.MIX_API;
    let User = JSON.parse(window.localStorage.getItem('user'));
    const [sum, setSum] = useState(0)
    const [{user, cart, basket, userDetail}, dispatch] = useStateValue();
    const [data, setData] = useState([])
    const navigate = useNavigate();

    useEffect(() => {
        const unique = [];
        cart.map(x => unique.filter(a => a.product_id === x.product_id).length > 0 ? null : unique.push(x));
        setData(unique)
        const sum = basketData.reduce((amount, books) => (books.price * books.quantity) + amount, 7);
        setSum(sum)
    }, [basketData, cart]);


    async function updateUser() {
        await fetch(`${api}/updateUser/` + userID, {
            method: 'POST',
            body: JSON.stringify(userDetail),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(res => {
            alert(res.statusText)
        })
    }

    const SendOrder = async (e) => {
        e.preventDefault()
        if (User?.token) {
            await fetch(`${api}/cart/store`, {
                body: JSON.stringify(data),
                method: 'POST'
            }).then(response => {
                if (response.status === 500) {
                    alert('You Already Added This to Your List')
                } else {
                    alert('Order Placed')
                }
            })
            dispatch({
                type: "EMPTY_BASKET",
            });
           navigate('/home')
        } else {
            alert('Please Log In First')
            navigate('/login')
        }
        updateUser().then(r => r)
    }

    return (
        <div>
            <h4>{userDetail.name}</h4>
            <h4>{userDetail.mobile}</h4>
            <h4>{userDetail.address}</h4>
            {
                basketData.map(Data => (
                    <div key={Data.title}>
                        <p><span></span>{Data.title}<span> ({Data.quantity})  ${(Data.quantity * Data.price)}</span></p>
                    </div>
                ))
            }
            <h4>Total Payable: ${sum}</h4>
            <br/>
            <button onClick={SendOrder}>Checkout</button>
        </div>
    )
}

export default comp
