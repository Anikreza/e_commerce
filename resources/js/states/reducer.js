export const initialState = {
    basket: [],
    cart:[],
    user: {},
    userDetail: {},
    likeState:0,
    dislikeState:0,
};

// Selector
export const getBasketTotal = (basket) =>
    basket?.reduce((amount, item) => item.price + amount, 0);

const reducer = (state, action) => {
    console.log(action);
    switch (action.type) {
        case "ADD_TO_BASKET":
            return {
                ...state,
                basket: [action.item,...state.basket],
            };
            case "ADD_TO_CART":
            return {
                ...state,
                cart: [action.item,...state.cart],
            };

        case "INCREMENT_QUANTITY":
            return {
                ...state,
                basket: state.basket.map(item=>item.product_id===action.id? {...item,quantity:action.value}:item),
                cart: state.cart.map(item=>item.product_id===action.id? {...item,quantity:action.value}:item)
            };

        case 'EMPTY_BASKET':
            return {
                ...state,
                basket: []
            }


        case "REMOVE_FROM_BASKET":
            let newBasket= state.basket.filter(
                (basketItem) => basketItem.product_id !== action.id
            );
            return {
                ...state,

                basket: newBasket
            }
        case "SET_USER":
            return {
                ...state,
                user: action.item
            }
            case "SET_USER_DETAIL":
            return {
                ...state,
                userDetail: action.item
            }
        case "SET_LIKE":
            return {
                ...state,
                likeState: action.item
            }
        default:
            return state;
    }
};

export default reducer;
