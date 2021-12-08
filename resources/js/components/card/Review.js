import React, {useState, useEffect, useCallback} from "react"
import '../../../sass/review.scss'
import TextareaAutosize from "react-textarea-autosize"
import {MdReviews} from 'react-icons/md'
import axios from "axios"
import ReviewData from "../../helpers/ReviewData"
import {useStateValue} from "../../states/StateProvider"
import { Rating } from 'react-simple-star-rating'

const Review = ({productID}) => {

    const [{likeState}, dispatch] = useStateValue();
    const [review, setReview] = useState('')
    const [data, setData] = useState([])
    const [title, setTitle] = useState('')
    const [rating, setRating] = useState(0)
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
        reviewData.append('rating', rating);
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
                    console.log('res.data.reviews',res.data.reviews);
                    setTitle(res.data.reviews[0]);
                })
                .catch((error) => {
                    console.log(error);
                })
        },
        [review],
    );

    useEffect(async () => {
        gerReviews().then(r => r)
        console.log('rating',rating)
    }, [gerReviews,rating]);

    const handleRating = (rate) => {
        setRating(rate)
        console.log('rating',rating)
        // other logic
    }
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
                    <Rating
                        ratingValue={rating} /* Available Props */
                        onClick={handleRating}
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
                            productID={productID}
                            reviewID={review.id}
                        />
                    ))
                }
            </div>
        </div>
    )
}

export default Review
