<div class="product_wrapper {{ $className }}">
     <a href="{{ route('frontend.addetails', $ad->slug) }}">
        <div class="product_item">
            <div class="product_img">
                @if ($ad->thumbnail)
                    <img src="{{ asset($ad->thumbnail) }}" alt="card-img" class="img-fluid" />
                @else
                    <img src="{{ asset('backend/image/default-ad.png') }}" alt="card-img" class="img-fluid" />
                @endif
                @if($ad->featured)
                    <div class="freatured_tag">
                         <button type="button" data-bs-toggle="tooltip" data-bs-placement="top" title="Featured">
                         <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
                        </button>
                    </div>
                @endif
            </div>
            <div class="product_content">
                <h5>
                    <span class="icon">
                        <i class="{{ $ad->category->icon }}" style="font-size: 15px"></i>
                    </span>
                    {{ $ad->category->name }}
                </h5>
                <h2>{{ \Illuminate\Support\Str::limit($ad->title, 25, $end = '...') }}</h2>
         
                <div class="cards__info-bottom pt-2">
                    <h6 class="cards__location text--body-4">
                        <span class="icon">
                            <x-svg.location-icon width="20" height="20" stroke="#27C200" />
                        </span>
                        {{ Str::limit($ad->region, 10, '...') }} {{ $ad->region ? ', ' : '' }} {{ $ad->country }}
                    </h6>
                    <span class="cards__price-title text--body-3-600">
                        {{ changeCurrency($ad->price) }}
                    </span>
                </div>
            </div>
        </div>
    </a>
</div>


