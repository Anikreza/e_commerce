<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\ReviewController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::post('/updateUser/{user_id}', [UserController::class, 'update']);

Route::get('/addCategoryType', [ProductController::class, 'index']);
Route::post('/store',[ProductController::class, 'store']);
Route::get('/products/byCategory',[ProductController::class, 'showProductsByCategory']);
Route::get('/products/list',[ProductController::class, 'list']);
Route::get('/products/search/{key}',[ProductController::class, 'search']);
Route::get('/products/{id}',[ProductController::class, 'show']);
Route::post('/products/updateStatus',[ProductController::class, 'updateStatus']);
Route::post('/products/updateProductInfo',[ProductController::class, 'updateProductInfo']);
Route::post('/newType/add/{type}',[ProductController::class, 'addNewType']);
Route::delete('/products/delete/{id}',[ProductController::class, 'destroy']);
Route::post('/products/like',[ProductController::class, 'saveLike']);
Route::post('/products/dislike',[ProductController::class, 'saveDislike']);


Route::post('/cart/store/{order}',[CartController::class, 'store']);
Route::get('/cart/show/{user_id}',[CartController::class, 'show']);
Route::post('/cart/update/{cart_id}',[CartController::class, 'update']);
Route::delete('/cart/delete',[CartController::class, 'destroy']);
Route::get('/admin/orderInfo',[CartController::class, 'orderInfoForAdmin']);
Route::get('/cart/showStatus/{user_id}',[CartController::class, 'showStatus']);

Route::get('/review/{productID}', [ReviewController::class, 'get']);
Route::get('/review/likes/{pid}/{rid}', [ReviewController::class, 'getLikes']);
Route::get('/review/dislikes/{pid}/{rid}', [ReviewController::class, 'getDislikes']);
Route::post('/review/store',[ReviewController::class, 'store']);



//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});
Route::group(['middleware' => ['auth:sanctum']], function () {
//    Route::get('/user', [UserController::class, 'index']);
    Route::post('/logout', [AuthController::class, 'logout']);
});
