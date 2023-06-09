<div class="col-xl-2 col-lg-2 col-sm-4 col-6">
    <h2 class="footer__title text--body-2-600">{{ __('popular_categories') }}</h2>

    <ul class="footer-menu">
        @foreach ($top_categories as $category)
            <li class="footer-menu__item">
                <a href="{{ route('frontend.adlist.search', ['category' => $category->slug]) }}"
                    class="footer-menu__link text--body-3">
                    {{ $category->name }} </a>
            </li>
        @endforeach
    </ul>
</div>
