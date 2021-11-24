<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $fillable = [
        'quantity',
        'user_id',
        'product_id',
        'category_book_type_id',
        'category_cover_type_id'
    ];

//    public function user()
//    {
//        return $this->belongsTo('App\Models\User', 'user_id');
//    }
    /**
     * @var mixed
     */

    public function product()
    {
        return $this->belongsTo('App\Models\Product', 'product_id');
    }public function category_book_type()
    {
        return $this->belongsTo('App\Models\CategoryBookType', 'category_book_type_id');
    }
    public function category_cover_type()
    {
        return $this->belongsTo('App\Models\CategoryCoverType', 'category_cover_type_id');
    }
}
