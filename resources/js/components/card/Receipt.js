import React, {useState, useEffect, useCallback} from "react";
import {useStateValue} from "../../states/StateProvider";
import {useNavigate} from "react-router";
import {toJSON} from "lodash/seq";

const comp = ({name, email, userID, basketData}) => {

    const api = process.env.MIX_API;
    let User = JSON.parse(window.localStorage.getItem('user'));
    const [sum, setSum] = useState(0)
    const [{user, cart, basket, userDetail}, dispatch] = useStateValue();
    const [data, setData] = useState([])
    const [alreadyAdded, setAlreadyAdded] = useState('')
    const [orderPlaced, setOrderPlaced] = useState('')
    const [logInFirst, setLogInFirst] = useState('')
    const [addSomething, setAddSomething] = useState('')
    const [response, setResponse] = useState('')
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
            console.log(res.statusText)
        })
    }

    const SendOrder = async (e) => {
        e.preventDefault()
        if (User?.token) {
            if (data.length > 0) {
                await fetch(`${api}/cart/store/` + 1, {
                    body: JSON.stringify(data),
                    method: 'POST'
                }).then(response => response.json())
                    .then(json => setOrderPlaced(json.message))
                    .catch(error=>console.log(error))
                dispatch({
                    type: "EMPTY_BASKET",
                });
            } else {
                setAddSomething('You Have nothing in your list')
            }

            //navigate('/home')
        } else {
            setLogInFirst('Please Log In First')
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
                        <p>{Data.title}<span> ({Data.quantity})  ${(Data.quantity * Data.price)}</span></p>
                    </div>
                ))
            }
            <h4>Total Payable: ${sum}</h4>
            <br/>
            <button onClick={SendOrder}>Checkout</button>
            {
                (orderPlaced) ?
                    <p>{orderPlaced}</p>
                    :
                    ''
            } {
            (alreadyAdded) ?
                <p>{alreadyAdded}</p>
                :
                ''
        } {
            (logInFirst) ?
                <p>{logInFirst}</p>
                :
                ''
        } {
            (addSomething) ?
                <p>{addSomething}</p>
                :
                ''
        }
        </div>
    )
}

export default comp
