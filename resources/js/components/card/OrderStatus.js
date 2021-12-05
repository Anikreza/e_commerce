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
    const [reducedData, setReducedData] = useState([])
    let users=[]

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


   async function groupBy(array, property) {
        return array.reduce(function(key, i) {
            if (!key[i[property]]) {
                key[i[property]] = [];
            }
            key[i[property]].push(i);
            return key;
        }, []);
   }

    useEffect(async () => {
        groupBy(data,'orderID').then(async r => {
            users = r.filter(obj => obj.title === data.title && obj.orderID === data.orderID)
           // setReducedData(r)
            console.log('new',users)
            setReducedData(users)
            console.log('red',reducedData)
            // Object.values(r).map(val => console.log( val.map(d=>d)));
                 //console.log('red',red)
        })
    }, [data]);

    const [uniquea, setUnique] = useState([])

    useEffect(() => {
        const unique = [];
        data.map(x => unique.filter(a => a.orderID === x.orderID).length > 0 ? null : unique.push(x));
        setUnique(unique)
    }, [data]);

    return (
        <div className='orderStatus'>
            {
               uniquea.map(d=>(
                    <Test
                        data={reducedData}
                        key={d.id}
                        title={d.title}
                        quantity={d.quantity}
                        status={d.status}
                        orderID={d.orderID}
                    />
                ))
            }
            {/*<h2>ORDER STATUS: <span style={{color:'#974034', fontSize:'22px'}}>{status?.status}</span> </h2>*/}
            <h4>LAST UPDATED: <span style={{color:'darkgreen', fontSize:'22px'}}>{time?.updated_at}</span></h4>
            <hr width='40%'/>
        </div>
    )
}

export default OrderStatus
