import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import {useStateValue} from "./StateProvider";

const OrderHistory = ({title,author,quantity,name,address,price,phone,api,userID}) => {

    const [{ basket }, dispatch] = useStateValue();

    const getOrders = useCallback(
        async () => {
            dispatch({
                type: "ADD_TO_BASKET",
                item: {
                    title: title,
                    author: author,
                    quantity: quantity,
                    name: name,
                    address: address,
                    price: price,
                    phone: phone,
                    userID: userID,
                    status:'Order Placed',
                },
            });
        },
        [],
    );

    useEffect(async () => {
        getOrders().then(r => r)
        console.log('basket:',basket)
    }, [getOrders]);

    return (
        <div>

        </div>
    )
}

export default OrderHistory
