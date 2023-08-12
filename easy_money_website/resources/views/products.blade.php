@extends('layouts/app')

@section('content')
    <main class="main" id="skip-target">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="white-block">
                        <!-- Card Title, Product Search bar, Filter Data button -->
                        <div class="container main-card-title">
                            <div class="main-nav-start">
                                <h2 class="main-title">Products</h2>
                            </div>
                            <div class="main-nav-end">
                                <!-- Product Search Bar -->
                                <div class="search-wrapper">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search" aria-hidden="true"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                    <input type="text" placeholder="Search for product ..." required="">
                                </div>
                                <!-- Product Filter button -->
                                <div class="filter-option">
                                    <p class="option-text">Sort by: &nbsp</p>
                                    <span class="p-relative">
                                        <button class="dropdown-btn transparent-btn" type="button" title="More info">
                                            <strong>Name</strong>
                                            <div class="sr-only">Sort Options</div>
                                            <i data-feather="chevron-down" aria-hidden="true"></i>
                                        </button>
                                        <ul class="users-item-dropdown dropdown">
                                            <li><a href="#">ID</a></li>
                                            <li><a href="#">Name</a></li>
                                            <li><a href="#">Category</a></li>
                                            <li><a href="#">Post Date</a></li>
                                            <li><a href="#">Seller</a></li>
                                        </ul>
                                        </span>
                                </div>
                            </div>
                        </div>
                        <!-- Product Table and Data -->
                        <div class="users-table table-wrapper">
                            <table class="posts-table">
                                <!-- Table Header -->
                                <thead>
                                    <tr class="users-table-info">
                                        <th>No</th>
                                        <th>Image</th>
                                        <th style="width: 180px">Product Name</th>
                                        <th>Category</th>
                                        <th>Seller</th>
                                        <th>Posted Date</th>
                                        <th>Status</th>
{{--                                        <th>Actions</th>--}}
                                    </tr>
                                </thead>
                                <!-- Table body -->
                                <tbody>
                                    <!-- Product Detail Row -->
                                @for($i = 0; $i < count($products); $i++)
                                    <tr>
                                        <td>{{ $i + 1 }}</td>
                                        <!-- Product Image -->
                                        <td>
                                            <div class="products-table-img">
                                                @if(count($products[$i]->productImages) == 0)
                                                    <img src="https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg" alt="products Image">
                                                @else
                                                    <img src="{{ $products[$i]->productImages[0]->path }}" alt="products Image">
                                                @endif
                                            </div>
                                        </td>
                                        <!-- Product Name -->
                                        <td>
                                            {{ $products[$i]->title }}
                                        </td>
                                        <!-- Product Category -->
                                        <td>
                                            {{ $products[$i]->category }}
                                        </td>
                                        <!-- Seller -->
                                        <td>{{ $products[$i]->user->first_name }} {{ $products[$i]->user->last_name }}</td>
                                        <!-- Posted Date -->
                                        <td>{!! date('Y F d', strtotime($products[$i]->created_at)) !!}</td>
                                        <!-- Product Status -->
                                        <td>
                                            @if($products[$i]->is_sold == 0)
                                                <span class="badge-pending">In Selling</span>
                                            @else
                                                <span class="badge-success">Sold</span>
                                            @endif
                                        </td>
                                        <!-- Actions -->
{{--                                        <td>--}}
{{--                                            <div class="actions-btn">--}}
{{--                                                <button class="action-btn transparent-btn" type="button" title="More info">--}}
{{--                                                    <div class="sr-only">Edit</div>--}}
{{--                                                    <i data-feather="edit" aria-hidden="true"></i>--}}
{{--                                                </button>--}}
{{--                                                <button class="action-btn transparent-btn" type="button" title="More info">--}}
{{--                                                    <div class="sr-only">Delet</div>--}}
{{--                                                    <i data-feather="trash-2" aria-hidden="true"></i>--}}
{{--                                                </button>--}}
{{--                                            </div>--}}
{{--                                        </td>--}}
                                    </tr>
                                @endfor
                                </tbody>
                            </table>
                        </div>
                        <!-- Data Landing Page Number and Pagination -->
                        <div class="container main-card-title">
                            <div class="main-nav-start">
                            </div>
                            <!-- Pagination -->
                            <div>
                                {{ $products->links('vendor.pagination.custom') }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection