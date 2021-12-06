import React, {useState, useEffect} from "react";
import {Link} from "react-router-dom";

const ImageGrid = ({bookData}) => {

    const url=process.env.MIX_URL
    return (
        <div className='home-image-grid'>

            {
                bookData.map(data=>(
                    <Link to={`/book/${data.id}/${data.title}`}>
                    <img src={`${url}/` + data.product_img} alt=''/>
                    </Link>
                ))
            }
        </div>
    )
}

export default ImageGrid
