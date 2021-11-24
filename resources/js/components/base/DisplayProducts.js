import React, {useState, useEffect, useCallback} from "react";
import axios from "axios";
import SliderData from "../../helpers/sliderData";
import {actionTypes} from "../../helpers/reducer";

const DisplayProducts = () => {

    const [bookData, setBookData] = useState([]);
    const api = process.env.MIX_API;
    const url = process.env.MIX_URL;
    const ID=window.location.href.split('/')[4]


    const getBookData = useCallback(
        async () => {
            await axios.get(`${api}/products/byCategory`)
                .then(async (res) => {
                    console.log(res.data);
                    if(ID==='Fantasy'){
                        setBookData(res.data.fantasyBooks)
                    }
                    else if(ID==='Adventure'){
                        setBookData(res.data.adventureBooks)
                    }
                   else if(ID==='Romance'){
                        setBookData(res.data.romanceBooks)
                    }
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );
    useEffect(async () => {
        getBookData().then(r => r)
        console.log('ID:',ID)
    }, [getBookData]);
    return (
        <div style={{textAlign:'center'}}>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            {
                bookData.map((data)=>(
                    <div key={data.id}>
                        <p>{data.title}</p>
                        <p>{data.author}</p>
                        <img src={ `${url}/`+ data.product_img}/>
                        <p>{data.description}</p>
                        <p>Genre: {ID}</p>
                        {
                            (data.category_cover_type_id===1)?
                                (
                                <div>
                                  <p>Hard Cover</p>
                                </div>
                            ):
                                (data.category_cover_type_id===2)?(
                                <div>
                                    <p>Soft Cover</p>
                                </div>
                            ):
                                (
                                    <div>
                                        <p>Audio Book</p>
                                    </div>
                                )
                        }
                    </div>
                ))
            }
        </div>
    )
}

export default DisplayProducts
