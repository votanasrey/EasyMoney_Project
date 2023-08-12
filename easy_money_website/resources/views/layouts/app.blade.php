<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EasyMoney | Dashboard</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="/assets/images/EasyMoney-logo.png" type="image/x-icon">
    <!-- Custom styles -->
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>

<body>
    <div class="layer"></div>
    <!-- ! Body -->
    <a class="skip-link sr-only" href="#skip-target">Skip to content</a>
    <div class="page-flex">
        <!-- ! Sidebar -->
        @include('layouts/sidebar')

        <!-- Main body part -->
        <div class="main-wrapper">
            <!-- Body part -->
            @include('layouts.navbar')

            <!-- Body part -->
            @yield('content')
        </div>

    </div>
    <!-- Chart library -->
    <script src="{{ asset('js/chart.min.js') }}" defer></script>
    <!-- Icons library -->
    <script src="{{ asset('js/feather.min.js') }}"></script>
    <!-- Custom scripts -->
    <script src="{{ asset('js/script.js') }}"></script>
</body>

</html>