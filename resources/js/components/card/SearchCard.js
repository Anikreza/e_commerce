import React, {useState, useEffect} from "react";
import {BsSearch} from 'react-icons/bs';
import '../../../sass/Search.scss'
import axios from "axios";

const comp = () => {

    const [data, setData] = useState([]);
    const api = process.env.MIX_API;
    const url = process.env.MIX_URL;

    async function search(searchKey) {
        let key = '`'
        if (searchKey)
        {
            key = searchKey
        }
        else
        {
            key = '`'
        }
        if (key !== null && key.match(/^ *$/) === null)
        {
            await axios.get(`${api}/products/search/` + key)
                .then(async (res) => {
                    setData(res.data.result)
                })
                .catch((error) => {
                    alert(error)
                })
        }

    }

    return (
        <div className='home-search'>
            <form onSubmit={(e) => e.preventDefault()}>
                <input
                    type='text'
                    onChange={(e) => search(e.target.value)}
                    placeholder='Search By Title...'
                />
                <button><BsSearch size='22px'/></button>
            </form>
            <div>
                {
                    data.map((Data) => (
                        <div className={(Data?.length !== 0) ? 'resultTab' : 'hide'}>
                            <div
                                className='SearchShow'
                                onClick={() => window.location.replace(`/singleBook/${Data.id}`)}
                            >
                                <img src={`${url}/` + Data.product_img} alt=''/>
                                <div className='flexThis-column'>
                                    <h2>{Data.title}</h2>
                                    <h4>{Data.author}</h4>
                                </div>
                                <div className='rightSideInfo'>
                                    {
                                        Data.products_in_stock > 0 ?
                                            <h5> Product In Stock</h5>
                                            :
                                            <h6> Out Of Stock</h6>
                                    }
                                </div>
                                <h3> ${Data.price}</h3>
                            </div>
                            <hr/>
                        </div>
                    ))
                }
            </div>
        </div>
    )
}

export default comp
