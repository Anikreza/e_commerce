import React, {useState, useEffect,useCallback} from "react";
import axios from "axios";

const OrderStatus = ({userID}) => {
    const api=process.env.MIX_API
    const [data, setData] = useState('')

    const getOrdersStatus = useCallback(
        async () => {
            await axios.get(`${api}/cart/showStatus/` + userID
            ).then(response=>{
                console.log('status',response.data)
                setData(response.data)
            })
        },
        [],
    );

    useEffect(async () => {
        getOrdersStatus().then(r => r)
    }, [getOrdersStatus]);

    return (
        <div>

            <h2>{data.status}</h2>
        </div>
    )
}

export default OrderStatus
