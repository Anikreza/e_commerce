import React, {useState, useEffect,useCallback} from "react";
import axios from "axios";

const ShowOrders = () => {

    let user = JSON.parse(window.localStorage.getItem('user'));
    const userID = user.user.id;
    const api = process.env.MIX_API;
    const [data, setData] = useState([])

    const getOrders = useCallback(
        async () => {
            await axios.get(`${api}/productOrder/show/`+userID)
                .then(async (res) => {
                    setData(res.data.productOrder)
                    console.log('orderResult:',res.data.productOrder);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );

    useEffect(async () => {
        getOrders().then(r => r)
    }, [getOrders]);


    return (
        <div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
           <h2>Order page</h2>

        </div>
    )
}

export default ShowOrders
