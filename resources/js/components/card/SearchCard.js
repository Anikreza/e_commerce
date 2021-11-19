import React, {useState, useEffect} from "react";
import { BsSearch } from 'react-icons/bs';

const comp = () => {
    return (
        <div>
            <form className='home-search'>
                <input type='search' placeholder='Search By Category...'/>
                <button><BsSearch size='22px'/></button>
            </form>
        </div>
    )
}

export default comp
