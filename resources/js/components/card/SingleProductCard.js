import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import {useStateValue} from "../../helpers/StateProvider";
import '../../../sass/productDetail.scss';

const SingleProductCard = () => {

    let user = JSON.parse(window.localStorage.getItem('user'));
    const userID = user.user.id;
    const [{findBook}, dispatch] = useStateValue();
    const [data, setData] = useState([])
    const [quantity, setQuantity] = useState(1)
    const [status, setStatus] = useState(0)
    const api = process.env.MIX_API;
    const url = process.env.MIX_URL;
    const productID = window.location.href.split('/')[4]


    const getBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/` + productID)
                .then(async (res) => {
                    setData(res.data.showProduct);
                    console.log('singleData', res.data.showProduct);
                    console.log('bookId', findBook);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );

    useEffect(async () => {
        getBooks().then(r => r)
    }, [getBooks]);

    const depleteStock = useCallback(
        async () => {
            const Data = {userID, productID}
            let result = fetch(`${api}/cart/depleteStock`, {
                method: 'POST',
                body: JSON.stringify(Data),
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                }
            })
        },
        [quantity],
    );

    async function addToCart() {
        console.log(data);
        let coverType = data.category_cover_type_id;
        let bookType = data.category_book_type_id;
        let Data = {quantity, productID, userID, bookType, coverType}
        let result = fetch(`${api}/cart/store`, {
            method: 'POST',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        }).then(response => {
                setStatus(response.status)
                if (response.status !== 500) {
                    depleteStock().then(r => r)
                } else {
                    alert('You Already Added This to Your List')
                }
            }
        )
    }


    return (
        <div className='detail'>
            <div className='detailed'>
                <div className='detailed-left'>
                    <img src={`${url}/` + data.product_img}/>
                    <button className='stockButton'>Only {data.products_in_stock} Copies left</button>
                    {
                        (status !== 500) ?
                            <button onClick={() => addToCart()}>Add to Cart</button>
                            :
                            <button onClick={() =>window.location.replace('/cart') }>Go to Cart</button>
                    }

                </div>
                <div className='product-info'>
                    <p className='title-d'>{data.title}</p>
                    <p className='price-d'>${data.price}</p>
                    <p className='description-d'>{data.description}</p>
                </div>
            </div>


        </div>
    )
}
export default SingleProductCard
