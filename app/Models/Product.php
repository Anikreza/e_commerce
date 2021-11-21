<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'title',
        'product_img',
        'price',
        'products_in_stock',
        'order_number',
        'description'
    ];

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'category_id');
    }
}
