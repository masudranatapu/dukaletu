<div class="product_wrapper {{ $className }}">
        <div class="product_item">
            <div class="product_img">
                @if ($ad->thumbnail)
                <a href="{{ route('frontend.addetails', $ad->slug) }}">
                    <img src="{{ asset($ad->thumbnail) }}" alt="card-img" class="img-fluid" />
                     </a>
                @else
                <a href="{{ route('frontend.addetails', $ad->slug) }}">
                    <img src="{{ asset('backend/image/default-ad.png') }}" alt="card-img" class="img-fluid" />
                    </a>
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
                <h2><a href="{{ route('frontend.addetails', $ad->slug) }}">{{ \Illuminate\Support\Str::limit($ad->title, 25, $end = '...') }}</a></h2>
         
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
                <div class="mobile_device_content d-block d-sm-none">
                    <ul>
                        <li>
                            <a href="{{ route('frontend.message') }}" class="login_required">
                                <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 24 24" fill="none" stroke="#3db83a" stroke-width="1" stroke-linecap="round" stroke-linejoin="bevel"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
                                Chat
                            </a>
                        </li>
                        <li>
                            <a href="tel:01320325852">
                                <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" viewBox="0 0 24 24" fill="none" stroke="#3db83a" stroke-width="1" stroke-linecap="round" stroke-linejoin="bevel"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
                                Call
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</div>


