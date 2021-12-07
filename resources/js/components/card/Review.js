import React, {useState, useEffect,useCallback} from "react";
import '../../../sass/review.scss'
import TextareaAutosize from "react-textarea-autosize";
import { MdReviews } from 'react-icons/md';
import axios from "axios";

const Review = ({productID}) => {

    const [review, setReview]=useState('')
    const [data, setData]=useState('')
    const [loading, setLoading]=useState(true)
    const [open, setOpen]=useState(false)
    const api=process.env.MIX_API
    let User = JSON.parse(window.localStorage.getItem('user'));
    let userID=User?.user.id

    const getReviews = useCallback(
        async () => {
            const reviewData = new FormData();
            reviewData.append('review', review);
            reviewData.append('userID', userID);
            reviewData.append('productID', productID);
            await axios.post(`${api}/products`,reviewData)
        },
        [],
    );

    useEffect(async () => {
        getReviews().then(r => r)
    }, [getReviews]);

    return (
        <div className='review'>
            <h4
                onClick={()=>setOpen(true)}
                className={!open?'':'hide'}
                style={{cursor:'pointer'}}
            >
                <p style={{width:'250px'}}><MdReviews/><span style={{paddingLeft:'10px'}}>Write A Review</span></p>
            </h4>
            <div className={open?'':'hide'}>
                <form>
                    <TextareaAutosize
                        className='auto_height'
                        name='review'
                        onChange={(e) => setReview(e.target.value)}
                        placeholder="Write A Review"
                        minRows={3}
                        maxRows={20}
                    />
                </form>
                <button>POST</button>
            </div>
            <div className='commentSection'>
                {
<h2>hru</h2>
                }
            </div>
        </div>
    )
}

export default Review
