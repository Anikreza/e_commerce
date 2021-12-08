import React, {useState, useEffect, useCallback} from "react";
import '../../../sass/review.scss'
import TextareaAutosize from "react-textarea-autosize";
import {MdReviews} from 'react-icons/md';
import axios from "axios";
import ReviewData from "../../helpers/ReviewData";
import {useStateValue} from "../../states/StateProvider";

const Review = ({productID}) => {

    const [{likeState,DislikeState}, dispatch] = useStateValue();
    const [review, setReview] = useState('')
    const [data, setData] = useState([])
    const [title, setTitle] = useState('')
    const [emptyError, setEmptyError] = useState('')
    const [open, setOpen] = useState(false)
    const [error, setErrors] = useState('')
    const disabled = '';
    const api = process.env.MIX_API
    let User = JSON.parse(window.localStorage.getItem('user'));
    let userID = User?.user.id

    async function sendReview() {
        const reviewData = new FormData();
        reviewData.append('review', review);
        reviewData.append('userID', userID);
        reviewData.append('productID', productID);
        if (review) {
            await axios.post(`${api}/review/store`, reviewData
            ).then(response => {
                setReview('')
                setErrors('')
                setOpen(false)
            }).catch((e) => {
                setErrors(e.response.data.errors)
            })
        } else {
            setEmptyError('You Have Written Nothing')
        }

    }

    const gerReviews = useCallback(
        async () => {
            await axios.get(`${api}/review/` + productID)
                .then(async (res) => {
                    setData(res.data.reviews);
                    setTitle(res.data.reviews[0]);
                    console.log('reviews',res.data.reviews)
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [review],
    );

    useEffect(async () => {
        gerReviews().then(r => r)
    }, [gerReviews,likeState,DislikeState]);

    return (
        <div className='review'>
            <h4
                onClick={() => setOpen(true)}
                className={!open ? '' : 'hide'}
                style={{cursor: 'pointer'}}
            >
                <p style={{width: '250px'}}><MdReviews/><span style={{paddingLeft: '10px'}}>Write A Review</span></p>
            </h4>
            <div className={open ? '' : 'hide'}>
                <form onSubmit={(e) => e.preventDefault()}>
                    <TextareaAutosize
                        className='auto_height'
                        name='review'
                        onChange={(e) => setReview(e.target.value)}
                        placeholder="Write A Review"
                        minRows={3}
                        maxRows={20}
                        value={review}
                    />
                </form>
                <button
                    onClick={sendReview}
                    disabled={review ? disabled : !disabled}
                    className={review ? 'button-glow' : 'button-dim'}
                >POST
                </button>
                {
                    (error?.comment)?
                        <p style={{color:'darkred', fontSize:'20px'}}>{error?.comment}</p>
                        :
                        ''
                }
            </div>
            {
                (data.length > 0) ?
                    <div>
                        <h5>What Others Think Of <span>{title?.title}</span></h5>
                        <hr/>
                    </div>
                    :
                    ''
            }
            <div className='commentSection'>
                {
                    data?.map(review => (
                        <ReviewData
                            key={review.id}
                            name={review.name}
                            commentTime={review.commentTime}
                            comment={review.comment}
                            reviewID={review.id}
                            like={review.like}
                            dislike={review.dislike}
                        />
                    ))
                }
            </div>
        </div>
    )
}

export default Review
