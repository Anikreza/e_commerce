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
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $productOrder = new ProductOrder();
        $productOrder->name =  $request->name;
        $productOrder->phone =  $request->mobile;
        $productOrder->address =  $request->address;
        $productOrder->total =  $request->sum;
        $productOrder->user_id =  $request->userID;
        $productOrder->product_id =  $request->productId;
        $productOrder->cart_id =  $request->cartId;
        $productOrder->save();

        $response = [
            'productOrder' => $productOrder,
        ];
        return response($response, 201);
    }


    public function orders($user_id)
    {

        $orders=ProductOrder::where('user_id',$user_id)->first();

        $productOrder = DB::table('product_orders')
            ->join('users', 'users.id', '=', 'product_orders.user_id')
            ->join('carts', 'carts.user_id', '=', 'users.id')
            ->join('products', 'products.id', '=', 'carts.product_id')
            ->select('product_orders.*','carts.user_id','carts.quantity', 'products.title as title', 'products.price as price', 'products.author as author', 'products.product_img as product_img',
                'products.products_in_stock as products_in_stock', 'products.order_number as order_number',
                'products.description as description')
            ->where('carts.user_id', $user_id)
            ->get();

        $response = [
            'orders' => $productOrder,
            'customer'=>$orders
        ];
        return response($response, 201);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ProductOrder  $productOrder
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductOrder $productOrder)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ProductOrder  $productOrder
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductOrder $productOrder)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ProductOrder  $productOrder
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProductOrder $productOrder)
    {
        //
    }
}
