<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Modules\Review\Entities\Review;
use DB;

class SellerReview extends Component
{
    public $reviews, $user_id, $loadbutton = true, $total, $count = 5;
    public $loading = false;

    // Load More Data
    public function loadmore()
    {
        $this->loading = true;
        $this->count += 5;
    }

    public function render()
    {
        session(['seller_tab' => 'review_list']);

        // $this->reviews = Review::with('user:id,name,image')->whereUserId($this->user_id)
        //     ->whereStatus(1)
        //     ->latest()
        //     ->take($this->count)
        //     ->get();
            
        $this->reviews = DB::table('reviews')->where('seller_id', $this->user_id)->where('status', 1)->get();

        foreach($this->reviews as $review){
            $review->user = DB::table('users')->where('id', $review->user_id)->first();
        }

        $this->total = DB::table('reviews')->where('seller_id', $this->user_id)->where('status', 1)->count();
        $this->loading = false;

        return view('livewire.seller-review');
    }
}
