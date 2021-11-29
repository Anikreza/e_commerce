import React, {useState, useEffect} from "react";
import {useStateValue} from "../../helpers/StateProvider";

const AdminOrderPage = () => {

    const [{user, basket }, dispatch] = useStateValue();
    return (
        <div>
            {
                basket?.map(data=>(
                    <div>
                        <p>{data.title}</p>
                        <p>{data.author}</p>
                        <p>{data.price}</p>
                        <p>{data.quantity}</p>
                        <p>{data.status}</p>
                        <p>{data.name}</p>
                        <p>{data.phone}</p>
                        <hr/>
                    </div>

                ))
            }
        </div>
    )
}

export default AdminOrderPage
