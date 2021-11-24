export const initialState = {
    user:null,
    findBook:'',
};

export const actionTypes = {
    SET_USER : "SET_USER",
    SET_BOOK_ID : "SET_BOOK_ID",
};

const reducer = (state, action) => {
    switch(action.type){
        case actionTypes.SET_USER:
            return {
                ...state,
                user: action.user,
            };
        case actionTypes.SET_BOOK_ID:
            return {
                ...state,
                findBook: action.findBook,
            };

        default:
            return state;
    }
};

export default reducer;
