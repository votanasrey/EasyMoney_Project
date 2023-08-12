<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- favicons -->
    <link rel="shortcut icon" href="/assets/images/EasyMoney-logo.png" type="image/x-icon">
    <title>Login • EasyMoney</title>
    <!-- scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <!-- feather icons -->
    <script src="https://unpkg.com/feather-icons"></script>
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
    <!-- styles -->
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-md-6 d-none d-md-block image-container">
                <div class="banner">
                    <img class="banner-logo" src="https://firebasestorage.googleapis.com/v0/b/easy-money-76612.appspot.com/o/EasyMoney-logo.png?alt=media&token=99769e3d-eadf-4b97-b39c-d36e940d5177" alt="easy money logo">
                    <h1 class="big-title">EasyMoney</h1>
                    <h1 class="big-title">Admin Portal</h1>
                    <br>
                    <p>Accept, Reject Loan Request instantly.</p>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 form-container">
                <div class="col-lg-8 col-md-12 col-sm-9 col-xs-12 form-box">
                    <div class="heading-title md-3">
                        <h1 class="big-title">Login</h1>
                        <br>
                        <p>to access EasyMoney Admin Portal.</p>
                    </div>
                    <form action="{{route('auth')}}" method="POST">
                        @csrf
                        <div class="form-input">
                            <span><i data-feather="user"></i></span>
                            <input type="text" name="phone_number" value="{{old('phone_number')}}" id="phone_number" placeholder="Phone Number">
                        </div>
                        <div class="form-input">
                            <span><i data-feather="lock"></i></span>
                            <input type="password" name="password" id="pwd" placeholder="Password">
                            <span><i id="toggler" data-feather="eye"></i></span>
                        </div>
                        <div class="text-left mb-3">
                            <button type="submit" class="btn">Login</button>
                        </div>
                        @if($errors->any())
                            @foreach($errors->all() as $error)
                                <span class="text-danger">{{$error}}</span>
                            @endforeach
                        @endif
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- show feather icons -->
    <script>
        feather.replace()
    </script>

    <script type="text/javascript">
        // show or hide password 
        var password = document.getElementById('pwd');
        var toggler = document.getElementById('toggler');


        showHidePassword = () => {
            if (password.type == 'password') {
                password.setAttribute('type', 'text');
            } else {
                password.setAttribute('type', 'password');
            }
        };

        toggler.addEventListener('click', showHidePassword);
    </script>
</body>
</html>