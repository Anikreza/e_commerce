import React, {useState, useEffect,useCallback} from "react";
import axios from "axios";
import {useStateValue} from "../../states/StateProvider";
import '../../../sass/orderStatus.scss'
import Test from "./Test";

const OrderStatus = () => {
    const api=process.env.MIX_API
    const [data, setData] = useState([])
    const [status, setStatus] = useState('')
    const [time, setTime] = useState('')
    let User = JSON.parse(window.localStorage.getItem('user'));
    const userID = User?.user.id;
    const [red, setdata] = useState({})

    const getOrdersStatus = useCallback(
        async () => {
            await axios.get(`${api}/cart/showStatus/` + userID
            ).then(response=>{
                console.log('status',response.data)
                setData(response.data)
                setStatus(response.data[0])
                setTime(response.data[0])
            })
        },
        [],
    );

    useEffect(async () => {
        getOrdersStatus().then(r => r)
    }, [getOrdersStatus]);


   async function groupBy(arr, property) {
        return arr.reduce(function(memo, x) {
            if (!memo[x[property]]) {
                memo[x[property]] = [];
            }
            memo[x[property]].push(x);
            return memo;
        }, {});
   }

    useEffect(() => {
        groupBy(data,'orderID').then(r=>console.log(r))
    }, [groupBy]);


    return (
        <div className='orderStatus'>
            {
                data.map(Data=>(
                    <div key={Data.orderID}>
                        <p>Order NO: {Data.orderID}</p>
                        <p>{Data.title}<span>({Data.quantity})</span></p>
                    </div>
                ))
            }
            <h2>ORDER STATUS: <span style={{color:'#974034', fontSize:'22px'}}>{status.status}</span> </h2>
            <h4>LAST UPDATED: <span style={{color:'darkgreen', fontSize:'22px'}}>{time.updated_at}</span></h4>
            <hr width='40%'/>
        </div>
    )
}

export default OrderStatus
