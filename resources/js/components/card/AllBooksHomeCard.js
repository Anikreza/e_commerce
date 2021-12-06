import React, {useState, useEffect} from "react";
import {Link} from "react-router-dom";
import AddToList from "../../helpers/addToList";
import '../../../sass/AllBooksHome.scss'

const AllBooksHomeCard = ({title, image, author, stock, productID, price}) => {
    return (
        <div className='column'>
            <div className='content' style={{cursor: 'pointer'}}>
                {/*<ReactTooltip />*/}
                {/*<p data-tip="hello world">Tooltip</p>*/}
                <Link to={`/book/${productID}/${title}`}>
                    <div className='slider-image'>
                        <img src={image}/>
                    </div>
                    <div className='slider-header'>
                        <h2>{title}</h2>
                    </div>
                    <div >
                        <p> {author}...</p>
                    </div>
                    <div >
                        <h4> ${price}...</h4>
                    </div>
                </Link>
                <AddToList
                    title={title}
                    image={image}
                    author={author}
                    stock={stock}
                    productID={productID}
                    price={price}
                />
                <br/>
            </div>
        </div>
    )
}

export default AllBooksHomeCard
