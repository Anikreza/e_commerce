<?php

namespace App\Http\Controllers;

use App\Models\CategoryCoverType;
use App\Models\CategoryBookType;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Category[]|\Illuminate\Database\Eloquent\Collection|\Illuminate\Http\Response
     */
    public function index()
    {
        $category_book_type = CategoryBookType::all();
        $category_cover_type = CategoryCoverType::all();

        $response = [
            'book_type' => $category_book_type,
            'cover_type' => $category_cover_type
        ];

        return response($response, 201);
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
        $listProducts = Product::with(['categoryBookType','categoryCoverType'])->get();

        $response = [
            'allBooks' => $listProducts
        ];
        return response($response, 201);
    }

    public function showProductsByCategory()
    {
        $HardCover = Product::where('category_cover_type_id', 1)->get();
        $SoftCover = Product::where('category_cover_type_id', 2)->get();
        $AudioBook = Product::where('category_cover_type_id', 3)->get();

        $FantasyBooks = Product::where('category_book_type_id', 1)->get();
        $AdventureBooks = Product::where('category_book_type_id', 2)->get();
        $RomanceBooks = Product::where('category_book_type_id', 3)->get();

        $response = [
            'hardCover' => $HardCover,
            'softCover' => $SoftCover,
            'audioBook' => $AudioBook,

            'fantasyBooks' => $FantasyBooks,
            'adventureBooks' => $AdventureBooks,
            'romanceBooks' => $RomanceBooks,
        ];
        return response($response, 201);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

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
        $product->author =  $request->author;
        $product->products_in_stock =  $request->stock;
        $product->price =  $request->price;
        $product->description =  $request->description;
        $product->category_book_type_id =  $request->bookType;
        $product->category_cover_type_id =  $request->coverType;
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
    public function show($id)
    {
        $showProduct = Product::with('categoryBookType','categoryCoverType')->find($id);

        $response = [
            'showProduct' => $showProduct
        ];
        return response($response, 201);
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
