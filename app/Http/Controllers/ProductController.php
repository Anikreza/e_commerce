<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Category[]|\Illuminate\Database\Eloquent\Collection|\Illuminate\Http\Response
     */
    public function index()
    {
        $catagory_type = Category::all();
        return $catagory_type;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Product[]|\Illuminate\Database\Eloquent\Collection|\Illuminate\Http\Response
     */
    public function get()
    {
    }

    public function list()
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
       $category = new Category();
       $category->bookType =  $request->bookType;
       $category->coverType =  $request->coverType;
       $category->save();

        $product = new Product();
              $image = $request->file;
              if($image){
                $image_ext = $image->getClientOriginalExtension();
                $image_full_name = time().'.'.$image_ext;
                $upload_path = 'assets/images/';
                $image_url = $upload_path.$image_full_name;

                $success = $image->move($upload_path,$image_full_name);
              }
              else{
                  $image_url = '';
              }

        $product->product_img = $image_url;
        $product->title =  $request->name;
        $product->products_in_stock =  $request->stock;
        $product->price =  $request->price;
        $product->description =  $request->description;
        $product->category_id =  $category->id;
        $product->save();

        $response = [
            'product' => $product
        ];

        return response($response, 201);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        //
    }
}
