import React, {useState, useEffect,useCallback} from "react";
import axios from "axios";
import {AiFillLike} from 'react-icons/ai';
import {AiFillDislike} from 'react-icons/ai';
import {useStateValue} from "../states/StateProvider";

const ReviewData = ({name, commentTime, comment, productID,reviewID}) => {

    let User = JSON.parse(window.localStorage.getItem('user'));
    let userID = User?.user.id
    //const [likeState, setLikeState] = useState(0)
    const api = process.env.MIX_API
    const [{likeState,dislikeState}, dispatch] = useStateValue();
    const [liked, setLiked] = useState([])
    const [disliked, setDisLiked] = useState([])
    const [state, setState] = useState(false)


    const gerReviewLikes = useCallback(
        async () => {
            await axios.get(`${api}/review/likes/ ${+productID}/${+reviewID}`)
                .then(async (res) => {
                    setLiked(res?.data.likes)
                })
                .catch((error) => {
                    console.log(error);
                })

            await axios.get(`${api}/review/dislikes/ ${+productID}/${+reviewID}`)
                .then(async (res) => {
                    setDisLiked(res?.data.dislikes)
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [disliked],
    );

    useEffect(async () => {
        gerReviewLikes().then(r => r)
    }, [gerReviewLikes]);

    async function likesHandler() {
        let Data = {userID, productID,reviewID}
        await fetch(`${api}/products/like`, {
            method: 'POST',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
    }
    async function DislikesHandler() {
        let Data = {userID, productID,reviewID}
        await fetch(`${api}/products/dislike`, {
            method: 'POST',
            body: JSON.stringify(Data),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        })
    }
    return (
        <div>
            <p className='reviewer'>{name}
                <span>{commentTime}</span>
            </p>
            <p className='review'>{comment}</p>
            <p className='likes'>
                <AiFillLike
                    color={(liked?.length>0)?'darkgreen':'#703636'}
                    size='24px'
                    style={{position: 'relative', top: '2px', cursor: 'pointer', marginRight: '10px'}}
                    onClick={likesHandler}
                />
                {liked?.length} People Upvoated
                <span>
                    <AiFillDislike
                        color={(disliked?.length>0)?'darkred':'#5c935c'}
                        size='24px'
                        style={{
                            position: 'relative',
                            top: '5px',
                            cursor: 'pointer',
                            marginRight: '5px',
                            marginLeft: '10px'
                        }}
                       onClick={DislikesHandler}
                    />
                </span>
                {disliked?.length} people Devoted
            </p>
        </div>
    )
}
export default ReviewData
