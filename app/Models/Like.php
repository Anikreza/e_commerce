<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    public function user()
    {
        return $this->belongsTo('App\Models\User','like');
    }
    public function product()
    {
        return $this->belongsTo('App\Models\Product','like');
    }
}
