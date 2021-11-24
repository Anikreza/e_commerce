import React, {useState, useEffect,useCallback} from "react";
import axios from "axios";

const DisplayCart = () => {

    let user=JSON.parse(window.localStorage.getItem('user'));
    const userID=user.user.id;
    const [data, setData] = useState([])
    const api = process.env.MIX_API;

    const getCart = useCallback(
        async () => {
            await axios.get(`${api}/cart/show/` + userID)
                .then(async (res) => {
                    setData(res.data);
                    console.log('cartData', res.data);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );

    useEffect(async () => {
        getCart().then(r => r)
    }, [getCart]);

    return (
        <div>
            {
                data.map(Data=>(
                    <div key={data.id}>
                        <p>{Data.id}</p>
                        <p>{Data.id}</p>
                        <p>{Data.id}</p>
                        <p>{Data.id}</p>
                        <p>{Data.id}</p>
                        <p>{Data.id}</p>
                        <p>{Data.id}</p>
                    </div>
                ))
            }
        </div>
    )
}

export default DisplayCart
