import React, {useState, useEffect,useCallback} from "react";
import OrdersCard from "./OrdersCard";
import axios from "axios";
import {forEach} from "lodash/collection";

const Mapper = ({data}) => {

    const [Data, setData] = useState([])
    let orders = JSON.parse(window.localStorage.getItem('orders'))


    const getOrderDetail = useCallback(
        async () => {
            const RedData=data.reduce((groupedInfo,item)=>{
                if(groupedInfo[item.user_id]==null) {
                    groupedInfo[item.user_id]=[]
                }
                else{
                    groupedInfo[item.user_id].push(item)
                }
                return groupedInfo
            },[])
            setData(RedData)
            console.log('reduced Data:',Data)
            console.log('Non reduced Data:',orders)
        },
        [data],
    );

    useEffect(async () => {
        getOrderDetail().then(response => response)
    }, [getOrderDetail]);

    return (
        <div >
            {
                orders?.map(key =>
                    (
                        <OrdersCard
                            status={key.status}
                            quantity={key.quantity}
                            title={key.title}
                            email={key.email}
                            mobile={key.mobile}
                            stock={key.products_in_stock}
                            price={key.price}
                            orderID={key.orderID}
                            userID={key.user_id}
                            name={key.name}
                        />
                    )
                )
            }
        </div>
    )
}

export default Mapper
