<aside id="sidebar" class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ route('admin.dashboard') }}" class="brand-link">
        <img src="{{ $setting->favicon_image_url }}" alt="{{ __('Logo') }}" class="elevation-3">
        <span class="brand-text font-weight-light">{{ env('APP_NAME') }}</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-nav-wrapper">
            <!-- Sidebar Menu -->
            <nav class="sidebar-main-nav mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <li class="nav-item">

                        <x-admin.sidebar-list :linkActive="Route::is('admin.sms.package.*') ? true : false" route="admin.sms.package.index" icon="fas fa-sms">
                            {{ __('Packages') }}</x-admin.sidebar-list>
                    </li>
                    <li class="nav-item">

                        <x-admin.sidebar-list :linkActive="Route::is('admin.sms.transaction.*') ? true : false" route="admin.sms.transaction.index"
                            icon="fas fa-money-check-alt">
                            {{ __('Transactions') }}</x-admin.sidebar-list>
                    </li>
                    <li class="nav-item">

                        <x-admin.sidebar-list :linkActive="Route::is('admin.sms.userPackage.*') ? true : false" route="admin.sms.userPackage.index"
                            icon="fas fa-money-check-alt">
                            {{ __('user_sms_package') }}</x-admin.sidebar-list>
                    </li>

                </ul>
            </nav>
        </div>
    </div>
</aside>
