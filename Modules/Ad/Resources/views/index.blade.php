@extends('admin.layouts.app')

@section('title')
    {{ __('ad_list') }}
@endsection

@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3 class="card-title">
                            {{ __('ad_list') }}
                        </h3>
                        @if (userCan('ad.create'))
                            <a href="{{ route('module.ad.create') }}"
                                class="btn bg-primary d-inline-flex align-items-center justify-content-center">
                                <i class="fas fa-plus mr-2"></i>
                                <span>{{ __('add_ad') }}</span>
                            </a>
                        @endif
                    </div>
                    <div class="card-body table-responsive">
                        <div class="row">
                            <div class="col-md-10">
                                <form class="row mt-2" id="formSubmit" action="{{ route('module.ad.index') }}" method="GET">
                                    <div class="col-sm-12 col-md-3">
                                        <select name="category" class="form-control">
                                            <option value="" {{ !request('category') ? 'selected' : '' }}>
                                                {{ __('all_category') }}
                                            </option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->slug }}"
                                                    {{ request('category') == $category->slug ? 'selected' : '' }}>
                                                    {{ $category->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <select name="brand" class="form-control">
                                            <option value="" {{ !request('brand') ? 'selected' : '' }}>
                                                {{ __('all_brand') }}
                                            </option>
                                            @foreach ($brands as $brand)
                                                <option value="{{ $brand->slug }}"
                                                    {{ request('brand') == $brand->slug ? 'selected' : '' }}>
                                                    {{ $brand->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-12 col-md-3">
                                        <select name="filter_by" class="form-control w-100-p">
                                            <option value="" class="d-none">{{ __('filter_by') }}</option>
                                            <option {{ request('filter_by') == 'active' ? 'selected' : '' }} value="active">
                                                {{ __('active') }}</option>
                                            <option {{ request('filter_by') == 'inactive' ? 'selected' : '' }} value="inactive">
                                                {{ __('Inactive') }}</option>
                                            @if ($settings->ads_admin_approval)
                                                <option {{ request('filter_by') == 'pending' ? 'selected' : '' }}
                                                    value="pending">
                                                    {{ __('pending') }}</option>
                                            @endif
                                            <option {{ request('filter_by') == 'sold' ? 'selected' : '' }} value="sold">
                                                {{ __('sold') }}</option>
                                            @if ($settings->ads_admin_approval)
                                                <option {{ request('filter_by') == 'declined' ? 'selected' : '' }}
                                                    value="sold">
                                                    {{ __('declined') }}</option>
                                            @endif
                                            <option {{ request('filter_by') == 'featured' ? 'selected' : '' }} value="featured">
                                                {{ __('featured') }}</option>
                                            <option {{ request('filter_by') == 'most_viewed' ? 'selected' : '' }}
                                                value="most_viewed">{{ __('most_viewed') }}</option>
                                            <option {{ request('filter_by') == 'all' ? 'selected' : '' }} value="all">
                                                {{ __('all') }}</option>
                                        </select>
                                    </div>
                                    <div
                                        class="col-sm-12 col-md-{{ request('keyword') || request('filter_by') || request('category') || request('brand') ? '2' : '3' }}">
                                        <div class="input-group mb-3">
                                            <input name="keyword" id="title" value="{{ request('keyword') }}" type="text"
                                                placeholder="{{ __('search') }}..." class="form-control font-size-13">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="fas fa-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    @if (request('keyword') || request('filter_by') || request('category') || request('brand'))
                                        <div class="col-sm-6 col-md-1">
                                            <div class="input-group mb-3">
                                                <a href="{{ route('module.ad.index') }}" class="btn btn-danger">
                                                    {{ __('clear') }}
                                                </a>
                                            </div>
                                        </div>
                                    @endif
                                </form>
                            </div>
                            <div class="col-md-2">
                                <form class="mt-2" action="{{ route('module.ad.index') }}" method="GET">
                                    <input class="form-control" name="adsid" id="showAdsId" type="hidden"/>
                                    <select name="ad_status" class="form-control" onchange="this.form.submit()">
                                        <option disabled selected>Ads Status</option>
                                        <option value="active">Active</option>
                                        <option value="inactive">Inactive</option>
                                        <option value="sold">Sold</option>
                                    </select>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <x-backend.ad-manage :ads="$ads" />
                            </div>
                        </div>
                    </div>
                    @if ($ads->total() > $ads->count())
                        <div class="card-footer ">
                            <div class="d-flex justify-content-center">
                                {{ $ads->links() }}
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@section('style')
    <style>
        .page-link.page-navigation__link.active {
            background-color: #007bff;
            border-color: #007bff;
            color: #fff;
        }
    </style>
@endsection
@section('script')
    <script>
        $('#formSubmit').on('change', function() {
            $(this).submit();
        });
    </script>
    <script>
        function addValue(input){
            //select all checkboxes with name userid that are checked
            var checkboxes = document.querySelectorAll("input[name='ads_id[]']:checked")
            
            var values = "";
            
            //append values of each checkbox into a variable (seperated by commas)
            for(var i=0; i<checkboxes.length; i++){
                values += checkboxes[i]
            .value + ","  }

            //remove last comma
            values = values.slice(0,values.length-1)
            
            //set the value of input box
            document.getElementById("showAdsId").value = values;
            
        }
    </script>
    <script>
        $('.selectall').click(function() {
            if ($(this).is(':checked')) {
                $('input:checkbox').prop('checked', true);
                
                var checkboxes = document.querySelectorAll("input[name='ads_id[]']:checked")
                
                var values = "";
                
                //append values of each checkbox into a variable (seperated by commas)
                for(var i=0; i<checkboxes.length; i++){
                    values += checkboxes[i]
                .value + ","  }

                //remove last comma
                values = values.slice(0,values.length-1)
                
                //set the value of input box
                document.getElementById("showAdsId").value = values;

            } else {
                $('input:checkbox').prop('checked', false);
                document.getElementById("showAdsId").value = '';
            }
        });
    </script>
@endsection
