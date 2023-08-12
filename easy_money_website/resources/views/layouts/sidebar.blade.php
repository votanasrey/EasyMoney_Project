<!-- ! Sidebar -->
<aside class="sidebar">
    <div class="sidebar-start">
        <div class="sidebar-head">
            <a href="#" class="logo-wrapper" title="Home">
                <span class="sr-only">Home</span>
                <!-- <span class="icon logo" aria-hidden="true"></span> -->
                <div class="logo-text">
                    <span class="logo-title">EasyMoney</span>
                    <span class="logo-subtitle">Admin Dashboard</span>
                </div>
            </a>
            <button class="sidebar-toggle transparent-btn" title="Menu" type="button">
                <span class="sr-only">Toggle menu</span>
                <span class="icon menu-toggle" aria-hidden="true"></span>
            </button>
        </div>
        <div class="sidebar-body">
            <ul class="sidebar-body-menu">
                <li>
                    <a class="{{ 'dashboard' == request()->path() ? 'active' : '' }}" href="{{ route('dashboard') }}"><span class="icon home" aria-hidden="true"></span>Dashboard</a>
                </li>
                <li>
                    <a class="" href="#"><span class="icon document" aria-hidden="true"></span>General Book</a>
                </li>
                <li>
                    <a class="{{ 'products' == request()->path() ? 'active' : '' }}" href="{{ route('products') }}"><span class="icon buy" aria-hidden="true"></span>Products</span></a>
                </li>
                <li>
                    <a class="{{ 'loans' == request()->path() ? 'active' : '' }}" href="{{ route('loans') }}"><span class="icon wallet" aria-hidden="true"></span>Loans</a>
                </li>
            </ul>
            <ul class="sidebar-body-menu">
                <li>
                    <a class="show-cat-btn" href="#">
                    <span class="icon user-3" aria-hidden="true"></span>Users
                    <span class="category__btn transparent-btn" title="Open list">
                        <span class="sr-only">Open list</span>
                        <span class="icon arrow-down" aria-hidden="true"></span>
                    </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="{{ route('users') }}">Users</a>
                        </li>
{{--                        @if(\Illuminate\Support\Facades\Auth::user()->hasRole('SuperAdmin'))--}}
{{--                            <li>--}}
{{--                                <a href="{{ route('admins') }}">Admins</a>--}}
{{--                            </li>--}}
{{--                        @endif--}}
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="sidebar-footer">
        <a href="##" class="sidebar-user">
            <span class="sidebar-user-img">
                <img src="assets/Images/Profiles/avatar-illustrated-02.png" alt="User name">
            </span>
            <div class="sidebar-user-info">
                <span class="sidebar-user__title">{!! \Illuminate\Support\Facades\Auth::user()->first_name !!} {!! \Illuminate\Support\Facades\Auth::user()->last_name !!}</span>
                <span class="sidebar-user__subtitle"><?php
                    $roles = \Illuminate\Support\Facades\Auth::user()->getRoleNames();
                    echo $roles->first();
                    ?></span>
            </div>
        </a>
    </div>
</aside>