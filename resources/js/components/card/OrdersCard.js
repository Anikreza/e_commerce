import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";

const comp = ({name, mobile, email, userID, title, quantity, stock, status, price}) => {

    const api = process.env.MIX_API;
    const [updatedStatus, setUpdatedStatus] = useState(status)


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
            <div className={(updatedStatus !== 'Delivered') ? 'infoSide' : 'infoSide-Done'}>
                <p>Product Name: {title}</p>
                <p>Quantity Ordered: {quantity}</p>
                <p>Order Total: {price * quantity}</p>
                <p>Items Left In Stock: {stock}</p>
                <p>Status: {status}</p>
                <hr/>
            </div>
            <div style={{display: 'flex', flexDirection: 'column', maxWidth: '180px', marginLeft: '40%'}}>
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
