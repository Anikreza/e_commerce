import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import '../../../sass/orderInfo.scss';
import {useNavigate} from "react-router";
import OrdersCard from "../card/OrdersCard";
import Mapper from "../card/Mapper";

const AdminOrderPage = () => {

    const [orders, setOrders] = useState([])
    const [Data, setData] = useState([])
    const api = process.env.MIX_API;
    const navigate=useNavigate()

    const getOrderDetail = useCallback(
        async () => {
            await axios.get(`${api}/admin/orderInfo`)
                .then(async (res) => {
                    setOrders(res.data)
                    window.localStorage.setItem('orders',JSON.stringify(res.data))
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );

    useEffect(async () => {
        getOrderDetail().then(r => r)
    }, [getOrderDetail,orders]);

    return (
        <div className='orderInfo'>
            <h2> Admin Dashboard</h2>
            <Mapper
                data={orders}
            />
        </div>
    )
}

export default AdminOrderPage
