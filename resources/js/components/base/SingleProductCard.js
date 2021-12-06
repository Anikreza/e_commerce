import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import {useStateValue} from "../../states/StateProvider";
import '../../../sass/productDetail.scss';
import {useNavigate} from "react-router";
import AddToList from "../../helpers/addToList";

const SingleProductCard = () => {

    const [data, setData] = useState([])
    const api = process.env.MIX_API;
    const url = process.env.MIX_URL;
    const productID = window.location.href.split('/')[4]

    const getBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/` + productID)
                .then(async (res) => {
                    setData(res.data.showProduct);
                    console.log('this',res.data)
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [data.products_in_stock],
    );

    useEffect(async () => {
        getBooks().then(r => r)
    }, [getBooks, data.products_in_stock]);


    return (
        <div className='detail'>
            <div className='detailed'>
                <div className='detailed-left'>
                    <img src={`${url}/` + data.product_img}/>
                    <button className='stockButton'>Only {data.products_in_stock} Copies left</button>
                    <AddToList
                        title={data.title}
                        image={data.product_img}
                        author={data.author}
                        stock={data.products_in_stock}
                        productID={productID}
                        price={data.price}
                    />
                </div>
                <div className='product-info'>
                    <p className='title-d'>{data.title}</p>
                    <p className='author-d'>{data.author}</p>
                    <p className='price-d'>${data.price}</p>
                    <p className='description-d'>{data.description}</p>
                </div>
            </div>


        </div>
    )
}
export default SingleProductCard
