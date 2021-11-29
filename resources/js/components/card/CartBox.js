import React, {useEffect,useState, useCallback} from 'react'
import {Link, NavLink} from 'react-router-dom'
import { AiOutlineShoppingCart } from 'react-icons/ai';
import '../../../sass/cartPage.scss'
import {useStateValue} from "../../helpers/StateProvider";
const Cartbox = () => {

    const [data, setData] = useState([])
    const [{ user,basket }, dispatch] = useStateValue();

    useEffect(() => {
        const unique = [];
        basket.map(x => unique.filter(a => a.id === x.id).length > 0 ? null : unique.push(x));
        setData(unique)
    }, [basket]);

    return (

        <div className='cartbox'>
           <Link to='/cart'>
               <AiOutlineShoppingCart size='28px' color='black'/>
               <span> {data.length}</span>
           </Link>
        </div>
    )
}

export default Cartbox
