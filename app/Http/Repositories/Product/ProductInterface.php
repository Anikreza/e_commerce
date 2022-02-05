<?php
namespace App\Repositories\Product;
use Illuminate\Http\Request;
interface ProductInterface
{
    public function save(Request $request);

    public function update(Request $request);

    public function delete(int $id);
}
