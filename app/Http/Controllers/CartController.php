<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Product;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $cart = New Cart;
        $cart->quantity = $request->quantity;
        $cart->product_id = $request->productID;
        $cart->category_book_type_id = $request->bookType;
        $cart->category_cover_type_id = $request->coverType;
        $cart->user_id = $request->userID;
        $cart->save();

        $response = [
            'cart' => $cart
        ];
        return response($response, 201);
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function show($user_id)
    {
//        $listCarts = Cart::where('user_id','users.id')->latest()->get();
        $listCarts = DB::table('carts')
            ->join('products', 'products.id', '=', 'carts.product_id')
            ->join('category_book_types', 'category_book_types.id', '=', 'carts.category_book_type_id')
            ->join('category_cover_types', 'category_cover_types.id', '=', 'carts.category_cover_type_id')
//            ->join('users', 'users.id', '=', 'carts.user_id')
            ->select('carts.*', 'products.title as title','products.product_img as product_img',
                'products.products_in_stock as products_in_stock','products.order_number as order_number',
                'products.description as description','category_cover_types.category_cover_types as category_cover_types',
                'category_cover_types.category_cover_types as category_cover_types')
            ->where('carts.user_id', $user_id)
            ->latest()
            ->get();

        $response = [
            'listCarts' => $listCarts
        ];
        return response($response, 201);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function edit(Cart $cart)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cart $cart)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cart $cart)
    {
        //
    }
}
