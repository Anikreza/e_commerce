import React, {useState, useEffect} from "react";

const OrdersOnProcess = ({title,quantity}) => {
    return (
        <div>
            <p>{title}<span>({quantity})</span></p>
        </div>
    )
}

export default OrdersOnProcess
