import React, {useState, useEffect, useCallback} from "react";
import {useStateValue} from "../states/StateProvider";
import {useNavigate} from "react-router";

const comp = ({title, image, author, stock, productID, price}) => {

    const [quantity, setQuantity] = useState(1)
    let User = JSON.parse(window.localStorage.getItem('user'));
    let userID = User?.user.id
    const [{user, basket}, dispatch] = useStateValue();
    const navigate = useNavigate()
    const name = user.name
    const email = user.email

    async function addToBasket() {
        setQuantity(quantity + 1)
        if (quantity <= stock) {
            dispatch({
                type: "ADD_TO_BASKET",
                id: productID,
                item: {
                    product_id: productID,
                    title: title,
                    author: author,
                    quantity: quantity,
                    name: name,
                    email: email,
                    price: price,
                    user_id: userID,
                    image: image,
                    stock: stock,
                    status: 'PROCESSING',
                },
            });

            dispatch({
                type: "ADD_TO_CART",
                id: productID,
                item: {
                    product_id: productID,
                    quantity: quantity,
                    user_id: userID,
                    status: 'PROCESSING',
                    orderID: 111111,
                },
            });
        } else {
            alert('Out Of Stock')
        }

        window.localStorage.setItem('basket', basket);
    }

    return (
        <div>
            {
                (quantity > 1) ?
                    <button onClick={() => addToBasket()}>Add More +{quantity - 1}</button>
                    :
                    <button onClick={() => addToBasket()}>Add to Cart</button>
            }
        </div>
    )
}

export default comp
