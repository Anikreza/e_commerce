<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
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
<<<<<<< Updated upstream
<<<<<<< Updated upstream
Route::get('/products/byCategory',[ProductController::class, 'showProductsByCategory']);
Route::get('products/list',[ProductController::class, 'list']);
Route::get('/products/{id}',[ProductController::class, 'show']);

Route::post('/cart/store',[CartController::class, 'store']);
Route::get('/cart/show/{user_id}',[CartController::class, 'show']);
Route::post('/cart/update/{cart_id}',[CartController::class, 'update']);
=======
Route::get('/Products/byCategory',[ProductController::class, 'showProductsByCategory']);
Route::get('/Products/list',[ProductController::class, 'list']);
Route::get('/Products/show/{id}',[ProductController::class, 'show']);
>>>>>>> Stashed changes
=======
Route::get('/Products/byCategory',[ProductController::class, 'showProductsByCategory']);
Route::get('/Products/list',[ProductController::class, 'list']);
Route::get('/Products/show/{id}',[ProductController::class, 'show']);
>>>>>>> Stashed changes

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});
Route::group(['middleware' => ['auth:sanctum']], function () {
//    Route::get('/user', [UserController::class, 'index']);
    Route::post('/logout', [AuthController::class, 'logout']);


});
