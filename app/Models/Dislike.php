<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dislike extends Model
{


    protected $fillable = [
        'id',
        'user_id',
        'product_id',
        'review_id'
    ];
    public function user()
    {
        return $this->belongsTo('App\Models\User','dislike');
    }
    public function product()
    {
        return $this->belongsTo('App\Models\Product','dislike');
    }

}
