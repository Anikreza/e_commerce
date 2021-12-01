<?php

use App\Http\Controllers\BasketController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\ProductOrderController;
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
Route::get('/addCategoryType', [ProductController::class, 'index']);
Route::post('/store',[ProductController::class, 'store']);
Route::get('/products/byCategory',[ProductController::class, 'showProductsByCategory']);
Route::get('products/list',[ProductController::class, 'list']);
Route::get('products/search/{key}',[ProductController::class, 'search']);
Route::get('/products/{id}',[ProductController::class, 'show']);

Route::post('/cart/store',[CartController::class, 'store']);
Route::get('/cart/show/{user_id}',[CartController::class, 'show']);
Route::post('/cart/update/{cart_id}',[CartController::class, 'update']);
Route::post('/cart/updateStock',[CartController::class, 'updateStock']);
Route::post('/cart/depleteStock',[CartController::class, 'depleteStock']);
Route::delete('/cart/delete',[CartController::class, 'destroy']);

Route::get('/productOrder/add',[ProductOrderController::class, 'add']);
Route::post('/productOrder/store',[ProductOrderController::class, 'store']);
Route::get('/productOrder/orders/{user_id}',[ProductOrderController::class, 'orders']);
Route::delete('/productOrder/delete',[ProductOrderController::class, 'destroy']);



//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});
Route::group(['middleware' => ['auth:sanctum']], function () {
//    Route::get('/user', [UserController::class, 'index']);
    Route::post('/logout', [AuthController::class, 'logout']);


});
