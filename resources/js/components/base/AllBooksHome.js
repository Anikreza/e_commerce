import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import {BounceLoader, BeatLoader, BarlLoader} from 'react-spinners'
import AllBooksHomeCard from "../card/AllBooksHomeCard";

const AllBooksHome = () => {

    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)

    const api = process.env.MIX_API;

    const getAllBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/list`)
                .then(async (response) => {
                    setData(response.data.allProductsWIthLike);
                    console.log(response.data.allProductsWIthLike)
                    setLoading(false)
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );

    useEffect(async () => {
        getAllBooks().then(r => r)
    }, [getAllBooks])

    return (
        <div className='all-books-home'>
            <h1>Grab Yours...</h1>
            <div className='books-home-bg'>
            </div>
            {
                (!loading) ?
                    < div className='main'>
                        <div className='row'>
                            {
                                data.map(data => (
                                    <AllBooksHomeCard
                                        key={data.id}
                                        id={data.id}
                                        image={data.product_img}
                                        title={data.title}
                                        author={data.author}
                                        stock={data.products_in_stock}
                                        productID={data.id}
                                        price={data.price}
                                    />
                                ))
                            }
                        </div>
                    </div>
                    :
                    <div className='loader-position-middle'>
                        <BeatLoader size={20} color={'rgb(71,94,66)'}/>
                    </div>
            }
        </div>
    )
}

export default AllBooksHome
