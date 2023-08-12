@extends('layouts.app')

@section('content')
    <!-- Mian body without sidebar and navbar-->
    <main class="main users chart-page" id="skip-target">
        <div class="container">
            <h2 class="main-title">Dashboard</h2>
            <!-- First Cards Row -->
            <div class="row stat-cards">
                @foreach($listCard as $card)
                    <div class="col-md-6 col-xl-3">
                        <article class="stat-cards-item">
                            <div class="stat-cards-icon {!! $card['color'] !!}">
                                <i data-feather="{!! $card['icon'] !!}" aria-hidden="true"></i>
                            </div>
                            <div class="stat-cards-info">
                                <p class="stat-cards-info__num">{{ number_format($card['data'], 0) }}</p>
                                <p class="stat-cards-info__title">{{ $card['title'] }}</p>
{{--                                <p class="stat-cards-info__progress">--}}
{{--                                    @if($card['percentage'] > 0)--}}
{{--                                        <span class="stat-cards-info__profit success">--}}
{{--                                            <i data-feather="trending-up" aria-hidden="true"></i>{{ number_format($card['percentage'], 2) }}%--}}
{{--                                        </span>--}}
{{--                                    @elseif($card['percentage'] < 0)--}}
{{--                                        <span class="stat-cards-info__profit danger">--}}
{{--                                            <i data-feather="trending-down" aria-hidden="true"></i>{{ number_format($card['percentage'], 2) }}%--}}
{{--                                        </span>--}}
{{--                                    @else--}}
{{--                                        <span class="stat-cards-info__profit warning">--}}
{{--                                            <i data-feather="minus" aria-hidden="true"></i>{{ number_format($card['percentage'], 2) }}%--}}
{{--                                        </span>--}}
{{--                                    @endif--}}
{{--                                    Last month--}}
{{--                                </p>--}}
                            </div>
                        </article>
                    </div>
                @endforeach
            </div>
            <!-- Second Cards Row -->
            <div class="row">
                <!-- Loan Revenue Card -->
                <div class="col-lg-12">
                    <div class="chart">
                        <canvas id="myChart" aria-label="Site statistics" role="img"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- ! Footer -->
    <footer class="footer">
        <div class="container footer--flex">
            <div class="footer-start">
                <p>2021 © EasyMoney Dashboard</p>
            </div>
        </div>
    </footer>
@endsection