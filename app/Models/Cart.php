<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    protected $fillable = [
        'product_id',
        'category_id'
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_id');
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'category_id');
    }
}
