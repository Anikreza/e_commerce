import React, {useState, useEffect,useCallback} from "react";
import axios from "axios";
import {AiFillLike} from 'react-icons/ai';
import {AiFillDislike} from 'react-icons/ai';
import {useStateValue} from "../states/StateProvider";

const ReviewData = ({name, commentTime, comment, productID,reviewID, like,dislike}) => {

    let User = JSON.parse(window.localStorage.getItem('user'));
    let userID = User?.user.id
    //const [likeState, setLikeState] = useState(0)
    const api = process.env.MIX_API
    const [{likeState,dislikeState}, dispatch] = useStateValue();
    const [liked, setLiked] = useState([])
    const [disLiked, setDisLiked] = useState(false)


    const gerReviewLikes = useCallback(
        async () => {
            await axios.get(`${api}/review/likes/ ${+ productID}/${+reviewID}/${+userID}`)
                .then(async (res) => {
                    setLiked(res.data.likes)
                    console.log('ThisLike:',res.data.likes)
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [liked],
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


    return (
        <div>
            <p className='reviewer'>{name}
                <span>{commentTime}</span>
            </p>
            <p className='review'>{comment}</p>
            <p className='likes'>
                <AiFillLike
                    color='darkgreen'
                    size='24px'
                    style={{position: 'relative', top: '2px', cursor: 'pointer', marginRight: '10px'}}
                    onClick={likesHandler}
                />
                {liked.length} People Upvoated
                <span>
                    <AiFillDislike
                        color=' #50271e'
                        size='24px'
                        style={{
                            position: 'relative',
                            top: '5px',
                            cursor: 'pointer',
                            marginRight: '5px',
                            marginLeft: '10px'
                        }}
                       // onClick={SetDIsLikeState}
                    />
                </span>
                {dislike} people Devoted
            </p>
        </div>
    )
}
export default ReviewData
