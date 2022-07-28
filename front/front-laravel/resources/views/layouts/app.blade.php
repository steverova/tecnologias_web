<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>
        @if (trim($__env->yieldContent('template_title')))
            @yield('template_title') |
        @endif {{ config('app.name', 'Laravel') }}
    </title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">

    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/0f02ee1723.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<style>
    body {
        font-family: 'Roboto', sans-serif;
    }

    body {

        margin: 0 auto;
    }

    a {
        color: aliceblue;
        text-decoration: none;
        font-weight: bold;
    }


    .menu {
        padding: 0;
        margin: 0;
        width: 100%;
        border-bottom: 0;
    }

    li:hover {
        box-shadow: 0 10px 16px 0 rgba(0, 0, 0, 0.2);
        transform: scale(1.1);
    }

    .contenedor{
        margin-bottom: 1em;
    }

    .menu li {
        display: table-cell;
        width: 1%;
        float: none;
        margin: 2px;
        padding: 20px;
        text-align: center;
    }
</style>

<body>
    <div id="app">
        <div class="contenedor">
            <div>
                <ul class="menu">
                    <li style="background-color:#8338e6;"><a href="https://localhost:7068/Index">ASP + SPRINGBOOT</a></li>
                    <li style="background-color: #ef6157;"><a href="http://localhost:8000/comentarios">LARAVEL</a></li>
                    <li style="background-color: #50d1e8;"><a href="http://localhost:3001/">REACT + NODE</a></li>
                    <li style="background-color: #e64064;"><a href="http://127.0.0.1:4200/listar">ANGULAR + NODE</a></li>
                </ul>
            </div>
        </div>
        <main class="py-4">
            @yield('content')
        </main>
    </div>
</body>

</html>
