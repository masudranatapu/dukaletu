<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserSmsPlan extends Model
{
    use HasFactory;


    public function plan(): BelongsTo
    {
        return $this->belongsTo(SmsPackage::class, 'sms_plan_id', 'id');
    }
}
