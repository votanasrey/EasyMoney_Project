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
                                <h2 class="main-title">Loans</h2>
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
                                    <input type="text" placeholder="Search loan ..." required="">
                                </div>
                                <!-- Product Filter button -->
                                <div class="filter-option">
                                    <p class="option-text">Sort by: &nbsp</p>
                                    <span class="p-relative">
                                        <button class="dropdown-btn transparent-btn" type="button" title="More info">
                                            <strong>LID</strong>
                                            <div class="sr-only">Sort Options</div>
                                            <i data-feather="chevron-down" aria-hidden="true"></i>
                                        </button>
                                        <ul class="users-item-dropdown dropdown">
                                            <li><a href="#">No</a></li>
                                            <li><a href="#">Requester</a></li>
                                            <li><a href="#">Amount</a></li>
                                            <li><a href="#">Term</a></li>
                                            <li><a href="#">Request Date</a></li>
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
                                    <th>User</th>
                                    <th>predicted amount</th>
                                    <th>Pay back</th>
                                    <th>Term</th>
                                    <th>Request Date</th>
                                    <th>Status</th>
                                    <th>Document</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <!-- Table body -->
                                <tbody>
                                <!-- Loan Detail Row -->
                                @for($i = 0; $i < count($loanRequests); $i++)
                                    <tr>
                                        <!--  Loan ID -->
                                        <td>{{ $i+1 }}</td>
                                        <!-- Loan Requester -->
                                        <td>
                                            <div class="products-table-img">
                                                @if($loanRequests[$i]->user->user_profile != null)
                                                    <img src="{{ $loanRequests[$i]->user->user_profile }}"
                                                         alt="User Image">
                                                @else
                                                    <img src="assets/Images/Profiles/avatar-illustrated-{{ $loanRequests[$i]->user->gender == 'Male' ? '01': '04' }}.png"
                                                         alt="User Image">
                                                @endif
                                            </div>
                                        </td>
                                        <!-- User ID -->
                                        <td>{{ $loanRequests[$i]->user->first_name }} {{ $loanRequests[$i]->user->last_name }}</td>
                                        <!-- Loan Ammount -->

                                        <td>${{ number_format($loanRequests[$i]->loan_predict, 0) }}</td>
                                        <td>${{ number_format($loanRequests[$i]->pay_amount, 0) }}</td>
                                        <!-- Loan Term -->
                                        <td>{{ $loanRequests[$i]->term }} Months</td>
                                        <!-- Request Date -->
                                        <td>{!! date('Y F d', strtotime($loanRequests[$i]->created_at)) !!}</td>
                                        <!-- Loan Status -->
                                        <td>
                                            @if($loanRequests[$i]->status == 'pending')
                                                <span class="badge-pending">pending</span>
                                            @elseif($loanRequests[$i]->status == 'refused')
                                                <span class="badge-disabled">refused</span>
                                            @elseif($loanRequests[$i]->status == 'admin-approved')
                                                <span class="badge-pending">confirming</span>
                                            @elseif($loanRequests[$i]->status == 'approved')
                                                <span class="badge-success">approved</span>
                                            @endif
                                        </td>
                                        <td>
                                            <a href="{{ url($loanRequests[$i]->bank_statement) }}" target="_blank">
                                                <i data-feather="file-text" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                        <!-- Actions -->
                                        @if($loanRequests[$i]->status == 'pending')
                                            <td>
                                                <div class="actions-btn">
                                                    <form method="POST" action="loans/{{ $loanRequests[$i]->id }}">
                                                        @csrf
                                                        <input name="status" value="admin-approved" hidden>
                                                        <button class="action-btn transparent-btn" type="submit"
                                                                title="More info">
                                                            <div class="sr-only">Accept</div>
                                                            <i data-feather="check" aria-hidden="true"></i>
                                                        </button>
                                                    </form>
                                                    <form method="POST" action="loans/{{ $loanRequests[$i]->id }}">
                                                        @csrf
                                                        <input name="status" value="refused" hidden>
                                                        <button class="action-btn transparent-btn" type="submit"
                                                                title="More info">
                                                            <div class="sr-only">Accept</div>
                                                            <i data-feather="x" aria-hidden="true"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        @endif
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
                                {{ $loanRequests->links('vendor.pagination.custom') }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection