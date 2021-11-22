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

    public function categoryBookType(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(CategoryBookType::class, 'category_book_type_id');

    }

    public function categoryCoverType(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
    {
        return $this->belongsToMany(CategoryCoverType::class, 'category_cover_type_id');
    }
}
