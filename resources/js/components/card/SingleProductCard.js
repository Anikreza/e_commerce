import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import {useStateValue} from "../../helpers/StateProvider";
import '../../../sass/productDetail.scss';

const SingleProductCard = () => {

    let user=JSON.parse(window.localStorage.getItem('user'));
    const userID=user.user.id;
    const [{findBook}, dispatch] = useStateValue();
    const [data, setData] = useState([])
    const [quantity, setQuantity] = useState(0)
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

    async function addToCart() {
        console.log(data);
        let coverType=data.category_cover_type_id;
        let bookType=data.category_book_type_id;
        let Data={quantity,productID,userID,bookType,coverType}
        if(quantity>0){
            let result= fetch(`${api}/cart/store`,{
                method:'POST',
                body:JSON.stringify(Data),
                headers:{
                    'Content-Type':'application/json',
                    'Accept':'application/json'
                }
            })
        }
        else{
            alert('please add at least one book')
        }
    }
    async function depleteStock() {
        const Data = {productID}
        let result = fetch(`${api}/cart/depleteStock`, {
            method: 'POST',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
    }    async function updateStock() {
        const Data = {productID}
        let result = fetch(`${api}/cart/updateStock`, {
            method: 'POST',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
    }

    function Increase() {
        if (data.products_in_stock >= quantity) {
            setQuantity(quantity + 1)
        }
        else {
            alert('Out Of Stock!!!')
        }
        depleteStock().then(r=>r)
    }

    function Decrease() {
        if (data.products_in_stock > 0 && quantity >= 1) {
            setQuantity(quantity - 1)
        }
        updateStock().then(r=>r)
    }

    return (
        <div className='detail'>
            <div className='detailed'>
                <div className='detailed-left'>
                    <img src={`${url}/` + data.product_img}/>
                    <button className='stockButton'>Only {data.products_in_stock} Copies left</button>
                    <button className='quantityButton'>
                        <p1 onClick={Decrease}>-</p1>
                        <span> {quantity} </span>
                        <p2 onClick={Increase}>+</p2>
                    </button>
                    <button onClick={() => addToCart()}>Add to Cart</button>
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
