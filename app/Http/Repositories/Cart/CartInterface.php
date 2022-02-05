<?php
namespace App\Repositories\Cart;
use Illuminate\Http\Request;
interface CartInterface
{
    public function save(Request $request);

    public function show(int $id);

    public function update(Request $request);

    public function delete(int $id);
}
