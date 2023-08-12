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
                                <h2 class="main-title">Admins</h2>
                            </div>
                            <div class="main-nav-end">
                                <!-- Product Search Bar -->
                                <div class="search-wrapper">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-search" aria-hidden="true">
                                        <circle cx="11" cy="11" r="8"></circle>
                                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                    </svg>
                                    <input type="text" placeholder="Search user ..." required="">
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
                                            <li><a href="#">Name (ASC)</a></li>
                                            <li><a href="#">Name (ASC)</a></li>
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
                                    <th>Profile</th>
                                    <th style="width: 180px;">Name</th>
                                    <th>Gender</th>
                                    <th>Date of Birth</th>
                                    <th style="width: 220px;">Address</th>
                                    <th>Phone Number</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <!-- Table body -->
                                <tbody>
                                @for($i = 0; $i < count($users); $i++)
                                    <tr>
                                        <!--  User ID -->
                                        <td>{!! $i+1 !!}</td>
                                        <!-- Product Image -->
                                        <td>
                                            <div class="products-table-img">
                                                @if($users[$i]->user_profile != null)
                                                    <img src="{{ $users[$i]->user_profile }}" alt="User Image">
                                                @else
                                                    <img src="assets/Images/Profiles/avatar-illustrated-{{ $users[$i]->gender == 'Male' ? '01': '04' }}.png" alt="User Image">
                                                @endif
                                            </div>
                                        </td>
                                        <!-- User Fullname -->
                                        <td>{!! $users[$i]->first_name !!}  {!! $users[$i]->last_name !!}</td>
                                        <!-- Gender -->
                                        <td>{!! $users[$i]->gender !!}</td>
                                        <!-- Date of Birth -->
                                        <td>{!! date('Y F d', strtotime($users[$i]->date_of_birth)) !!}</td>
                                        <!-- Address -->
                                        <td>{!! $users[$i]->address !!}</td>
                                        <!-- Phone Number -->
                                        <td>{!! $users[$i]->phone_number !!}</td>
                                        <!-- Actions -->
                                        <td>
                                            <div class="actions-btn">
                                                <button class="action-btn transparent-btn" type="button" title="More info">
                                                    <div class="sr-only">Edit</div>
                                                    <i data-feather="edit" aria-hidden="true"></i>
                                                </button>
                                                <button class="action-btn transparent-btn" type="button" title="More info">
                                                    <div class="sr-only">Delet</div>
                                                    <i data-feather="trash-2" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </td>
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
                                {{ $users->links('vendor.pagination.custom') }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection