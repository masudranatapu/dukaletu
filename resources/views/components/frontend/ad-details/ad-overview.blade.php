<div>
    @if($ad->brand)
    <h2 class="text--body-1">{{ __('overview') }}</h2>
    <ul class="overview-details">
        
        <li class="overview-details__item">
            <span class="text--body-3 title">{{ __('Brand Name') }}:</span>
            <span class="text--body-3 info">{{ $ad->brand->name ?? '' }}</span>
        </li>
        
    </ul>
    @endif
</div>