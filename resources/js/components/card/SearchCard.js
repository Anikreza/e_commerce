import React, {useState, useEffect, useRef} from "react";
import {BsSearch} from 'react-icons/bs';
import '../../../sass/Search.scss'
import axios from "axios";
import {Link, NavLink} from 'react-router-dom'
import {useNavigate} from "react-router";

const comp = () => {

    const resultTabRef = useRef();
    const [data, setData] = useState([]);
    const [open, setOpen] = useState(false);
    const api = process.env.MIX_API;
    const url = process.env.MIX_URL;
    const navigate = useNavigate()

    async function search(searchKey) {
        let key = '`'
        if (searchKey) {
            key = searchKey
        } else {
            key = '`'
        }
        if (key !== null && key.match(/^ *$/) === null) {
            await axios.get(`${api}/products/search/` + key)
                .then(async (res) => {
                    setData(res.data.result)
                    setOpen(true)
                })
                .catch((error) => {
                    alert(error)
                })
        }

    }

    useEffect(() => {
        document.addEventListener('mousedown', (e) => {
            if (!resultTabRef.current.contains(e.target)) {
                setOpen(false)
            }
        })
    }, []);

    function setLink(title, id) {
        navigate(`/book/${id}/${title}`)
        setOpen(false)
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
            <div ref={resultTabRef}>
                {
                    data.map((Data) => (
                        <div
                            key={Data.id}
                            className={(Data?.length !== 0 && open) ? 'resultTab' : 'hide'}
                            onClick={() => setLink(Data.title, Data.id)}
                        >
                            <div className='SearchShow'>
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
