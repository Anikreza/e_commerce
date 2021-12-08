import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import {useStateValue} from "../../states/StateProvider";
import '../../../sass/productDetail.scss';
import {useNavigate} from "react-router";
import AddToList from "../../helpers/addToList";
import {BounceLoader, BeatLoader, BarlLoader} from 'react-spinners'
import Review from "../card/Review";

const SingleProductCard = () => {

    const [data, setData] = useState([])
    const [likes, setLikes] = useState()
    const api = process.env.MIX_API;
    const url = process.env.MIX_URL;
    const [loading, setLoading] = useState(true)
    const productID = window.location.href.split('/')[4]
    const [{likeState,dislikeState}, dispatch] = useStateValue();


    const getBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/` + productID)
                .then(async (res) => {
                    setData(res.data.showProduct);
                    setLikes(res.data.showProduct.likes)
                    setLoading(false)
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [data.products_in_stock,likes],
    );

    useEffect(async () => {
        getBooks().then(r => r)
    }, [getBooks, data.products_in_stock]);

    if (!loading) {
        return (
            <div>
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
                    <Review
                        productID={productID}
                        likes={likes.length}
                    />
                </div>
            </div>
        )
    } else {
        return (
            <div className='loader-position-middle'>
                <BeatLoader  size={40} color={'rgb(150,73,73)'}/>
            </div>
        )
    }

}
export default SingleProductCard
