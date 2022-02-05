<?php
namespace App\Repositories\Review;
use Illuminate\Http\Request;
interface ReviewInterface
{
    public function get($productID);

    public function save(Request $request);
}
