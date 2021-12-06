import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import AllBooksHomeCard from "../card/AllBooksHomeCard";

const AllBooksHome = () => {

    const [data, setData] = useState([])
    const api = process.env.MIX_API;

    const getAllBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/list`)
                .then(async (response) => {
                    setData(response.data.allBooks);
                    console.log(response.data.allBooks)
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
            <div className='main'>
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
        </div>
    )
}

export default AllBooksHome
