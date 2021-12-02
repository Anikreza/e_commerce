import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import '../../../sass/orderInfo.scss';
import OrderHistory from "../../helpers/OrderHistory";
import OrdersCard from "../card/OrdersCard";

const AdminOrderPage = () => {

    const [orders, setOrders] = useState([])
    const [data, setData] = useState([])
    const api = process.env.MIX_API;

    const getOrderDetail = useCallback(
        async () => {
            await axios.get(`${api}/admin/orderInfo`)
                .then(async (res) => {
                    setOrders(res.data)
                    console.log('damned result',res.data);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );

    useEffect(async () => {
        getOrderDetail().then(r => r)
    }, [getOrderDetail]);

    useEffect(() => {
        const unique = [];
        orders.map(x => unique.filter(a => a.user_id === x.user_id).length > 0 ? null : unique.push(x));
        setData(unique)
    }, [orders]);


    return (
        <div className='orderInfo'>
            <h2> Admin Dashboard</h2>
            {
                data?.map(data=>(
                        <OrdersCard
                            key={data.id}
                            name={data.name}
                            mobile={data.mobile}
                            email={data.email}
                            userID={data.user_id}
                            status={data.status}
                        />
                ))
            }
        </div>
    )
}

export default AdminOrderPage
