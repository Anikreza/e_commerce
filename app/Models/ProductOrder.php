<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductOrder extends Model
{
    protected $fillable = [
        'name',
        'phone',
        'address',
        'total',
        'user_id',
        'product_id',
        'cart_id',
    ];

    public function user()
    {
        return $this->belongsTo('App\Models\Product', 'user_id');
    }
    public function product()
    {
        return $this->belongsTo('App\Models\Product', 'product_id');
    }
    public function cart()
    {
        return $this->belongsTo('App\Models\Cart', 'cart_id');
    }

}
