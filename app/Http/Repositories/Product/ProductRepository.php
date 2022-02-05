<?php

namespace App\Repositories\Product;

use App\Repositories\Product\ProductInterface;
use Illuminate\Support\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Str;

class ProductRepository implements ProductInterface
{

    public function save(Request $request)
    {
        // TODO: Implement save() method.
    }

    public function update(Request $request)
    {
        // TODO: Implement update() method.
    }

    public function delete(int $id)
    {
        // TODO: Implement delete() method.
    }
}
