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
//        $listCarts = Cart::where('user_id','users.id')->latest()->get();
        $listCarts = DB::table('carts')
            ->join('products', 'products.id', '=', 'carts.product_id')
            ->join('users', 'users.id', '=', 'carts.user_id')
            ->select('carts.*', 'users.id as id')
            ->whereRaw('carts.user_id = users.id')
            ->latest()
            ->get();

        $response = [
            'listCarts' => $listCarts
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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request,$product_id)
    {
        $check = DB::table('carts')
            ->join('products', 'products.id', '=', 'carts.product_id')
            ->join('users', 'users.id', '=', 'carts.user_id')
            ->select('carts.*', 'users.id as id')
            ->where('product_id',$product_id)
            ->whereRaw('carts.user_id = users.id')
            ->find($product_id);
        if($check)
        {
            DB::table('carts')
            ->join('products', 'products.id', '=', 'carts.product_id')
            ->join('users', 'users.id', '=', 'carts.user_id')
            ->select('carts.*', 'users.id as id')
            ->where('product_id',$product_id)
            ->whereRaw('carts.user_id = users.id')
            ->increment('quantity');
        }
        else
        {
            $cart = New Cart;
            $cart->quantity = 1;
            $cart->product_id = $request->product_id;
            $cart->user_id = $request->user_id;

            $cart->save();
        }

        $response = [
            'check' => $check,
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
