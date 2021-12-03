import React, {useState, useEffect} from "react";
import {RiDeleteBin6Line} from "react-icons/ri";
import axios from 'axios';

const AllBooks = ({stock, title, author, status, price, image, productID, description}) => {

    const url = process.env.MIX_URL;
    const api = process.env.MIX_API;
    const [updatedStatus, setUpdatedStatus] = useState(status)
    const [modal, setModal] = useState(false)
    const [flag, setFlag] = useState(true)
    const [updatedStock, setUpdatedStock] = useState(stock)

    const updateInfo=async (e)=> {
        e.preventDefault()
        let Data = {updatedStatus,productID,updatedStock}
        await fetch(`${api}/products/updateProductInfo`, {
            method: 'POST',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(response => console.log(response))

        setFlag(true)
        setModal(false)
    }

    function setStuffs(){
        setModal(true)
        setFlag(false)
    }
   async function DeleteBook(){
       let answer = window.confirm("Delete Data Entry?");
       if(answer){
           await axios.delete(`${api}/products/delete/`+productID
           ).then(response=>{
               console.log(response)
           })
       }
   }

    return (
        <div className='column'>
            <RiDeleteBin6Line
                size='22px'
                className='delete'
                onClick={DeleteBook}
            />
            <div className='content'>
                <p> {title}</p>
                <img src={`${url}/` + image} alt=''/>
                <form onSubmit={updateInfo}>
                    <h1>Stocks Left: <span className={(stock>5)?'green':'red'}>{stock}</span>
                    {
                        (flag)?
                            <button onClick={setStuffs}>Update Inventory Stock</button>
                            :
                            ''
                    }
                    {
                        (modal)?
                            <input
                                type='number'
                                onChange={(e)=>setUpdatedStock(e.target.value)}
                                placeholder='Enter Updated Stock'
                            />
                            :
                            ''
                    }
                </h1>
                    <h1>Status: <span className={(status==='Published')?'green':'red'}>{status}</span>
                    <select onChange={(e) => setUpdatedStatus(e.target.value)}>
                        <option value={updatedStatus}>Change Status</option>
                        <option value='UnPublished'>UnPublished</option>
                        <option value='Published'>Published</option>
                    </select>
                </h1>
                    <button className='submitUpdate'> Update</button>
                </form>
            </div>
            <hr/>
        </div>
    )
}

export default AllBooks
