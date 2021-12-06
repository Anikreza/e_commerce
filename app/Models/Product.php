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
        'description',
        'status',
        'order_count'
    ];

//    public function categoryCoverType(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
//    {
//        return $this->belongsTo(CategoryCoverType::class, 'category_cover_type_id');
//    }
//    public function CategoryBookType(): \Illuminate\Database\Eloquent\Relations\BelongsToMany
//    {
//        return $this->belongsTo(CategoryCoverType::class, 'category_book_type_id');
//    }

    public function categoryBookType()
    {
        return $this->belongsTo('App\Models\CategoryBookType','category_book_type_id');
    }
    public function categoryCoverType()
    {
        return $this->belongsTo('App\Models\CategoryCoverType','category_cover_type_id');
    }
//    public function user()
//    {
//        return $this->belongsTo('App\Models\User','user_id');
//    }
    public function cart()
    {
        return $this->hasMany('App\Models\Cart');
    }
    public function review()
    {
        return $this->hasMany('App\Models\Review');
    }
}
