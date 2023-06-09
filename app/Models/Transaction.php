<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Modules\Plan\Entities\Plan;

class Transaction extends Model
{
    use HasFactory;

    protected $guarded = [];

    /**
     * Transaction customer
     *
     * @return BelongsTo
     */
    public function customer(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     *  Customer scope
     * @return mixed
     */
    public function scopeCustomerData($query, $api = false)
    {
        if ($api) {
            return $query->where('user_id', auth('api')->id())->whereNotNull('plan_id');
        } else {
            return $query->where('user_id', auth('user')->id())->whereNotNull('plan_id');
        }
    }

    /**
     * Transaction plan
     *
     * @return BelongsTo
     */
    public function plan(): BelongsTo
    {
        return $this->belongsTo(Plan::class);
    }
    /**
     * Transaction plan
     *
     * @return BelongsTo
     */
    public function package(): BelongsTo
    {
        return $this->belongsTo(SmsPackage::class, 'sms_plan_id', 'id');
    }
}
