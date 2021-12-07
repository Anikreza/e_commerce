<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Product;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function get($productID)
    {
        $reviews = DB::table('reviews')
            ->select(
                DB::raw("DATE_FORMAT(reviews.created_at,'%Y-%m-%d %H:%i:00') as commentTime"),
                'reviews.comment', 'reviews.rating', 'reviews.user_id', 'reviews.product_id','reviews.like_count as like',
                'users.name as name', 'products.title')
            ->join('users', 'users.id', '=', 'reviews.user_id')
            ->join('products', 'products.id', '=', 'reviews.product_id')
//            ->where('reviews.product_id', $productID)
            ->orderBy('reviews.id', 'DESC')
            ->get();
        $response = [
            'reviews' => $reviews
        ];
        return response($response, 201);
    }
    public function likeHandler(Request $request, $likeState)
    {
        if($likeState == 0){
            $likeHandler = DB::table('reviews')
                ->where('reviews.id', $request->reviewID)
                ->where('reviews.user_id', $request->UserID)
                ->increment('reviews.like_count',1);
//            DB::table('reviews')
//            ->where('reviews.id', $request->reviewID)
//            ->where('reviews.user_id', $request->UserID)
//            ->increment('reviews.like_count',1);
        }
        elseif($likeState == 1){
        $likeHandler = DB::table('reviews')
            ->where('reviews.id', $request->reviewID)
            ->where('reviews.user_id', $request->UserID)
            ->decrement('reviews.like_count',1);
//            DB::table('reviews')
//            ->where('reviews.id', $request->reviewID)
//            ->where('reviews.user_id', $request->UserID)
//            ->decrement('reviews.like_count',1);
        }
        else{
//          $error_massage =  'Some Error Found';
        }
        $response = [
            'likeHandler' => $likeHandler,
//            'error_massage' => $error_massage
        ];
        return response($response, 201);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = $request->validate([
            'comment' => 'required|string|max:1000'
        ],
            [
                'comment.required' => ':attribute can not be more than 1000 words'
            ]);

        $review = new Review();
        $review->comment = $request->review;
        $review->rating = $request->rating;
        $review->like_count = 0;
        $review->user_id = $request->userID;
        $review->product_id = $request->productID;
        $review->save();

        $response = [
            'review' => $review
        ];
        return response($response, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Review $review
     * @return \Illuminate\Http\Response
     */
    public function show(Review $review)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Review $review
     * @return \Illuminate\Http\Response
     */
    public function edit(Review $review)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Review $review
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Review $review)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Review $review
     * @return \Illuminate\Http\Response
     */
    public function destroy(Review $review)
    {
        //
    }
}
