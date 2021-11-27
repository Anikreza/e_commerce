import React, {useState, useEffect,useCallback} from "react"
import axios from "axios"
import '../../../sass/orderPage.scss'
import CheckOut from "../card/CheckOut";
import Receipt from "../card/Receipt";

const ShowOrders = () => {

    let user = JSON.parse(window.localStorage.getItem('user'));
    const userID = user.user.id;
    const api = process.env.MIX_API;
    const [customer, setCustomer] = useState([])
    const [orders, setOrders] = useState([])
    const [sum, setSum] = useState([])

    const getOrders = useCallback(
        async () => {
            await axios.get(`${api}/productOrder/orders/`+userID)
                .then(async (res) => {
                    setCustomer(res.data.customer)
                    setOrders(res.data.orders)
                    console.log('orderResult:',res.data.orders);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [],
    );

    useEffect(async () => {
        getOrders().then(r => r)
    }, [getOrders]);

    useEffect(() => {
        const sum = customer.reduce((amount, books) => (books.total * orders.length) + amount, 0);
        setSum(sum)
    }, []);


    return (
        <div className='orderPage'>
            <div className='customerInfo'>
                <div className='receipt'>
                    <h2>Details About Your Order</h2>
                    <hr/>
                    <Receipt
                        name={customer.name}
                        phone={customer.phone}
                        address={customer.address}
                        total={customer.total}
                        data={orders}
                    />
                </div>
            </div>
            <div className='orderInfo'>
                <div className='main'>
                    <div className='row'>
                        {orders.map(data=>(
                            <CheckOut
                                title={data.title}
                                author={data.author}
                                quantity={data.quantity}
                                price={data.price}
                                image={data.product_img}
                            />
                        ))}

                    </div>
                </div>
            </div>

        </div>
    )
}

export default ShowOrders
