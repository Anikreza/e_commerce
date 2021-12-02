<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Product;
use App\Models\Cart;
use Illuminate\Support\Facades\DB;
use App\Models\ProductOrder;
use Illuminate\Http\Request;

class ProductOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $payload = json_decode($request->getContent(), true);
        $accepted = [];
        $bounced = [];

        foreach ($payload as $element) {

            if(DB::table('carts')->where('user_id', $element["user_id"])->where('product_id', $element["product_id"])->doesntExist()){
                $arr = (array) $element;
                productOrder::create($arr);

                array_push($accepted, $element["product_id"]);
            }else{
                array_push($bounced, $element["product_id"]);
            }
        }
        return response(["Accepted" => ["Product ID" => json_encode($accepted)], "Bounced" => ["Product ID" => json_encode($bounced)]] , 200);
    }


    public function orders($user_id)
    {

        $orders = ProductOrder::where('user_id', $user_id)->first();

        $productOrder = DB::table('product_orders')
            ->join('users', 'users.id', '=', 'product_orders.user_id')
            ->join('carts', 'carts.user_id', '=', 'users.id')
            ->join('products', 'products.id', '=', 'carts.product_id')
            ->select('product_orders.*', 'carts.user_id', 'carts.quantity', 'products.title as title', 'products.price as price', 'products.author as author', 'products.product_img as product_img',
                'products.products_in_stock as products_in_stock', 'products.order_number as order_number',
                'products.description as description')
            ->where('carts.user_id', $user_id)
            ->get();

        $response = [
            'orders' => $productOrder,
            'customer' => $orders
        ];
        return response($response, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\ProductOrder $productOrder
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductOrder $productOrder)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\ProductOrder $productOrder
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductOrder $productOrder)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\ProductOrder $productOrder
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $req)
    {
        $productOrderDelete= ProductOrder::where('user_id',$req->userID)->delete();
        $cartDelete= Cart::where('user_id',$req->userID)->delete();
        return response( ['message' => 'Order Placed'], 201);
    }
}
