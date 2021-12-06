<?php

namespace App\Http\Controllers;

use App\Models\Cart;
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
        $listProducts = Product::latest()->get();
        $allProducts = Product::orderBy('updated_at', 'desc')->get();
        $response = [
            'allProducts'=>$allProducts,
            'allBooks' => $listProducts
        ];
        return response($response, 201);
    }

    /**
     * Display ALl Book By Category.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function showProductsByCategory()
    {
        $THRILLER = 1;
        $ADVENTURE = 2;
        $ROMANCE = 3;
        $KIDS = 4;

        $HARDCOVER = 1;
        $SOFTCOVER = 2;
        $AUDIOBOOK = 3;

        $HardCover = Product::where('category_cover_type_id', $HARDCOVER)->get();
        $SoftCover = Product::where('category_cover_type_id', $SOFTCOVER)->get();
        $AudioBook = Product::where('category_cover_type_id', $AUDIOBOOK)->get();

        $thrillerBooks = Product::where('category_book_type_id', $THRILLER)
            ->orderBy('products.created_at')
            ->get();
        $adventureBooks = Product::where('category_book_type_id', $ADVENTURE)
            ->orderBy('products.created_at')
            ->get();
        $romanceBooks = Product::where('category_book_type_id', $ROMANCE)
            ->orderBy('products.created_at')
            ->get();
        $kidsBooks = Product::where('category_book_type_id', $KIDS)
            ->orderBy('products.created_at')
            ->get();

       $BestSellers = Product::orderBy('sell_count', 'desc')->get();

        $response = [
            'HardCover' => $HardCover,
            'SoftCover' => $SoftCover,
            'AudioBook' => $AudioBook,

            'ThrillerBooks' => $thrillerBooks,
            'AdventureBooks' => $adventureBooks,
            'RomanceBooks' => $romanceBooks,
            'KidsBooks' => $kidsBooks,

            'BestSellers'=>$BestSellers
        ];
        return response($response, 201);
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
                'name' => 'required|string|max:50',
                'author' => 'required|string|max:40',
                'stock' => 'required|numeric',
                'price' => 'required|numeric|regex:/^\d*(\.\d{2})?$/',
                'description' => 'required|max:1200',
                'file' => 'image|mimes:jpeg,jpg,png|required|max:10000',
                'bookType' => 'required|string|max:50',
            ],
                [
                    'name.required' => ':attribute can not be blank',
                    'author.required' => ':attribute can not be blank Or Numeric',
                    'stock.required' => ':attribute can not be blank Or non integer',
                    'price.required' => ':attribute can not be blank and has to be a float of point 2 degree',
                    'file.required' => 'product must have a :attribute',
                    'bookType.required' => 'please select a :attribute',
                ]);

            $product = new Product();
            $image = $request->file;
            if ($image) {
                $image_ext = $image->getClientOriginalExtension();
                $image_full_name = time() . '.' . $image_ext;
                $upload_path = 'assets/images/';
                $image_url = $upload_path . $image_full_name;

                $success = $image->move($upload_path, $image_full_name);
            } else {
                $image_url = '';
            }

            $product->product_img = $image_url;
            $product->title = $request->name;
            $product->status = $request->status;
            $product->author = $request->author;
            $product->products_in_stock = $request->stock;
            $product->price = $request->price;
            $product->sell_count = 0;
            $product->description = $request->description;
        $product->category_cover_type_id = $request->coverType;
        $product->save();

        $response = [
            'product' => $product,
            'validator' => $validator
        ];
        return response($response, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $showProduct = Product::with('categoryBookType', 'categoryCoverType')->find($id);

        $response = [
            'showProduct' => $showProduct
        ];
        return response($response, 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
    }

    function search($key)
    {
        $Product = new Product;
        $Result = $Product::where('title', 'like', "%$key%")->get();
        $response = [
            'result' => $Result
        ];
        return response($response, 201);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
    }

    /**
     * List of Ordered Products for Admin Panel.
     *
     * @param \App\Models\Cart $cart
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response|\Illuminate\Support\Collection
     */


    /**
     * Update the Status of Ordered Product.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Product $product
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response|int
     */
    public function updateStatus(Request $request)
    {
        $updateUser = DB::table('carts')
            ->where('user_id', $request->userID)
            ->where('orderID', $request->orderID)
            ->update([
                'status' => $request->updatedStatus
            ]);
        $response = [
            'result' => $updateUser
        ];
        return response($response, 201);
    }

    public function updateProductInfo(Request $request)
    {
        $updateUser = DB::table('products')
            ->where('id', $request->productID)
            ->update([
                'status' => $request->updatedStatus,
                'products_in_stock' => $request->updatedStock
            ]);
        $response = [
            'result' => $updateUser
        ];
        return response($response, 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Product $product
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Cart::where('product_id', $id)->delete();
        Product::where('id', $id)->delete();
        $response = [
            'result' => 'deleted'
        ];
        return response($response, 201);
    }
}
