import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import {useStateValue} from "../../helpers/StateProvider";
import '../../../sass/productDetail.scss';

const SingleProductCard = () => {

    const [{user, basket}, dispatch] = useStateValue();

    const userID = user?.id
    const name = user.name
    const email = user.email

    const [data, setData] = useState([])
    const [quantity, setQuantity] = useState(1)
    const [updatedQuantity, setUpdatedQuantity] = useState(quantity)
    const [status, setStatus] = useState(false)
    const api = process.env.MIX_API;
    const url = process.env.MIX_URL;
    const productID = window.location.href.split('/')[4]

    useEffect(() => {

    }, [basket]);


    const getBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/` + productID)
                .then(async (res) => {
                    setData(res.data.showProduct);
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
                }
            )
        },
        [quantity],
    );

    async function addToCart() {
        let coverType = data.category_cover_type_id;
        let bookType = data.category_book_type_id;
        let Data = {quantity, productID, userID, bookType, coverType}
        if (userID) {
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
        } else {
            alert('Please Log In First')
            window.location.replace('/login')
        }

    }

    async function addToBasket() {
        setQuantity(quantity + 1)
        dispatch({
            type: "ADD_TO_BASKET",
            id: productID,
            item: {
                title: data.title,
                author: data.author,
                quantity: quantity,
                name: name,
                email: email,
                price: data.price,
                userID: userID,
                image: data.product_img,
                status: 'Added To Cart',
            },
        });        dispatch({
            type: "ADD_TO_CART",
            id: productID,
            item: {
                quantity: quantity,
                userID: userID,
                status: 'Added To Cart',
            },
        });
        window.localStorage.setItem('basket', basket);
    }

    return (
        <div className='detail'>
            <div className='detailed'>
                <div className='detailed-left'>
                    <img src={`${url}/` + data.product_img}/>
                    <button className='stockButton'>Only {data.products_in_stock} Copies left</button>
                    <button onClick={() => addToBasket()}>Add to Cart</button>
                </div>
                <div className='product-info'>
                    <p className='title-d'>{data.title}</p>
                    <p className='price-d'>${data.price}</p>
                    <hr/>
                    <p className='description-d'>{data.description}</p>
                </div>
            </div>
        </div>
    )
}
export default SingleProductCard
