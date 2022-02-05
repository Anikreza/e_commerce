<?php

namespace App\Repositories\Review;

use App\Repositories\Review\ReviewInterface;
use Illuminate\Support\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Str;

class ReviewRepository implements ReviewInterface
{

    public function get($productID)
    {
        // TODO: Implement save() method.
    }
    public function save(Request $request)
    {
        // TODO: Implement save() method.
    }
}
