import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import {useStateValue} from "../../helpers/StateProvider";
import '../../../sass/productDetail.scss';

const ProductCard = () => {

    const [{user,findBook}, dispatch] = useStateValue();
    const [data, setData]=useState([])
    const api = process.env.MIX_API;
    const url = process.env.MIX_URL;
    const ID=window.location.href.split('/')[4]
    const getBooks = useCallback(
        async () => {
            await axios.get(`${api}/products/`+ID)
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

    function addToCart(id){

        let User={id};
        let result= fetch(`${api}/add_to_cart`,{
            method:'POST',
            body:JSON.stringify(User),
            headers:{
                'Content-Type':'application/json',
                'Accept':'application/json'
            }
        })

        console.log('result:',result)

    }

    return (
        <div className='detail'>

            <div className='detailed'>
                <div className='detailed-left'>
                    <img src={`${url}/`+data.product_img}/>
                    <button className='stockButton'>Only {data.products_in_stock} Copes left </button>
                    <button onClick={()=>addToCart(data.id)}>Add to Cart</button>
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
export default ProductCard
