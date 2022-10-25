@if ($status == 'pending')
<div class="product-item__badge">
    <div class="badge badge--warning">
        <x-svg.pending-icon width="20" height="20" stroke="#ffbf00"/>
        <div class="badge badge--warning">
            {{ __('pending') }}
        </div>
    </div>
</div>
@endif
@if ($featured)
<div class="product-item__badge">
    <div class="badge badge--warning">
        <x-svg.check-icon width="16" height="16" stroke="#ffbf00" />
        <div class="badge badge--warning">
            {{ __('featured') }}
        </div>
    </div>
</div>
@endif
@if (hasMemberBadge($customerid))
<div class="product-item__badge">
    <div class="badge badge--danger">
        <span class="icon">
            <x-svg.membership-badge-icon />
        </span>
        {{ __('member') }}
    </div>
</div>
@endif
@if ($verifiedseller)
<div class="product-item__badge">
    <div class="badge badge--success">
        <span class="icon">
            <x-svg.verified-seller-badge-icon/>
        </span>
        {{ __('verified_seller') }}
    </div>
</div>
@endif