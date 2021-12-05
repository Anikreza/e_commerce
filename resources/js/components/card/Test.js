import React, {useState, useEffect} from "react";
import {Link} from "react-router-dom";
import OrdersOnProcess from "./OrderOnProcess";

const comp = ({title,quantity,orderID,status,data}) => {

    const [uniquea, setUnique] = useState([])


    useEffect(() => {
        let res=data.map(Data=>Data.map(d=>d.title))

        let res2=data.filter(obj=>obj.orderID===orderID)

      //  console.log(res)
        console.log(res2)
    }, [data]);

    return (
        <div>
            <br/>
            <div>
                <Link to={`/order/`+orderID}>Order NO: {orderID}</Link>
                {
                    uniquea.map(d=>(
                        <OrdersOnProcess
                            title={d.title}
                            quantity={d.quantity}
                        />
                    ))
                }
                <h2>ORDER STATUS: <span style={{color:'#974034', fontSize:'22px'}}>{status}</span> </h2>
            </div>
        </div>
    )
}

export default comp
