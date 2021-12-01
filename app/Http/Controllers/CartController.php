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
    public function index(Request $request )
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
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\JsonResponse|\Illuminate\Http\Response
     */
    public function store(Request $req)
    {
        $payload = json_decode($req->getContent(), true);
        $accepted = [];
        $bounced = [];

        foreach ($payload as $element) {

            if(DB::table('carts')
                ->where('user_id', $element["user_id"])
                ->where('product_id', $element["product_id"])
                ->doesntExist()){
                $arr = (array) $element;
                Cart::create($arr);

                array_push($accepted, $element["product_id"]);
            }else{
                array_push($bounced, $element["product_id"]);
            }
        }
        return response(["Accepted" => ["Product ID" => json_encode($accepted)], "Bounced" => ["Product ID" => json_encode($bounced)]] , 200);

    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Cart $cart
     * @return \Illuminate\Support\Collection
     */
    public function show($user_id)
    {
//        $listCarts = Cart::where('user_id','users.id')->latest()->get();
        $listCarts = DB::table('carts')
            ->join('products', 'products.id', '=', 'carts.product_id')
            ->select('carts.*', 'products.title as title', 'products.price as price', 'products.author as author', 'products.product_img as product_img',
                'products.products_in_stock as products_in_stock', 'products.order_number as order_number',
                'products.description as description',
            )
            ->where('carts.user_id', $user_id)
            ->get();

        return $listCarts;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Cart $cart
     * @return \Illuminate\Http\Response
     */
    public function edit(Cart $cart)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Cart $cart
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $userID)
    {
        $updateCart = DB::table('carts')
            ->where('carts.user_id', $userID)
            ->where('carts.product_id', $request->productID)
            ->update([
                'quantity' => $request->updatedQuantity,
            ]);
        $response = [
            'updateCart' => $updateCart,
        ];
        return response($response, 201);
    }
    public function updateStock(Request $request)
    {
        $Product = DB::table('products')
            ->join('carts', 'products.id', '=', 'carts.product_id')
            ->select('products.*', 'carts.user_id as user_id', 'carts.quantity as quantity')
            ->where('products.id', '=',$request->productID)
            ->where('carts.user_id', '=',$request->userID)
            ->increment('products_in_stock',1);
    }
    public function depleteStock(Request $request)
    {
        $Product = DB::table('products')
            ->join('carts', 'products.id', '=', 'carts.product_id')
            ->select('products.*', 'carts.user_id as user_id', 'carts.quantity as quantity')
            ->where('products.id', '=',$request->productID)
            ->where('carts.user_id', '=',$request->userID)
            ->decrement('products_in_stock',1);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Cart $cart
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $req)
    {
        $Product = DB::table('products')
            ->join('carts', 'products.id', '=', 'carts.product_id')
            ->select('products.*', 'carts.user_id as user_id', 'carts.quantity as quantity')
            ->where('products.id', '=',$req->productID)
            ->where('carts.user_id', '=',$req->userID)
            ->increment('products_in_stock',$req->updatedQuantity);

        $result= Cart::where([['product_id',$req->productID],['user_id',$req->userID]])->delete();

    }
}
