import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";

const comp = ({status, name, mobile, email, userID}) => {

    const api = process.env.MIX_API;
    const [updatedStatus, setUpdatedStatus] = useState(status)
    const [data, setData] = useState([])

    const getOrderDetail = useCallback(
        async () => {
            await axios.get(`${api}/admin/orderInfo`)
                .then(async (res) => {
                    setData(res.data)
                    console.log('damned result', res.data);
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

    async function updateStatus() {
        let Data = {updatedStatus, userID}
        await fetch(`${api}/products/updateStatus`, {
            method: 'POST',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(response => console.log(response))
        window.location.reload()
    }

    return (
        <div>
            <div className='userSide'>
                <p>{name}</p>
                <p>{mobile}</p>
                <p>{email}</p>
            </div>
            <div className={(updatedStatus!=='Delivered')?'infoSide':'infoSide-Done'}>
                {
                    data.map(Data => (
                        <div >
                            <p>Product Name: {Data.title}</p>
                            <p>Quantity Ordered: {Data.quantity}</p>
                            <p>Order Total: {Data.price * Data.quantity}</p>
                            <p>Items Left In Stock: {Data.products_in_stock}</p>
                            <p>Status: {Data.status}</p>
                            <hr/>
                        </div>
                    ))
                }
            </div>
            <div style={{display:'flex',flexDirection:'column',maxWidth:'180px',marginLeft:'40%'}}>
                <select onChange={(e) => setUpdatedStatus(e.target.value)}>
                    <option value={updatedStatus}> Change Status</option>
                    <option value='Sent'> Sent</option>
                    <option value='Delivered'> Delivered</option>
                </select>
                <button onClick={updateStatus}> Update</button>
            </div>
        </div>
    )
}

export default comp
