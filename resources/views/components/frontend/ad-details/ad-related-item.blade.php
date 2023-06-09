@if($lists->count())
<section class="section related-post pt-0 mb-3 mt-5">
    <div class="container">
        <div class="related-post__header">
            <h2 class="text--heading-1">{{ __('related_ads') }}</h2>
            @if ($lists->count() > 4)
                <div class="slider-btn">
                    <button class="slider-btn--prev">
                        <x-svg.left-arrow-icon stroke="#3db83a" />
                    </button>
                    <button class="slider-btn--next">
                        <x-svg.right-arrow-icon stroke="#3db83a" />
                    </button>
                </div>
            @endif
        </div>
        <div class="related-post__slider" id="relatedPostSlider">
            @foreach ($lists as $ad)
                <x-frontend.single-ad :ad="$ad" :adfields="$ad->productCustomFields" className="related-post__slider-item" />
            @endforeach
        </div>
    </div>
</section>

@endif