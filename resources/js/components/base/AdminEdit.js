import React, {useState, useEffect, useCallback} from "react";
import '../../../sass/adminEdit.scss'
import axios from "axios";
import AllBooks from "../card/AllBooks";

const AdminEdit = () => {

    const [data, setData] = useState([])
    const api = process.env.MIX_API;

    const getAllBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/list`)
                .then(async (response) => {
                    setData(response.data.allBooks);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [data.products_in_stock],
    );

    useEffect(async () => {
        getAllBooks().then(r => r)
    }, [getAllBooks,data])

    return (
        <div className='editPage'>
            <h1>Admin DashBoard</h1>
            <hr/>
            <div className='main'>
                <div className='row'>
                    {
                        data.map(books => (
                            <AllBooks
                                key={books.id}
                                productID={books.id}
                                title={books.title}
                                author={books.author}
                                status={books.status}
                                image={books.product_img}
                                price={books.price}
                                description={books.description}
                                stock={books.products_in_stock}
                            />
                        ))
                    }
                </div>
            </div>

        </div>
    )
}

export default AdminEdit
