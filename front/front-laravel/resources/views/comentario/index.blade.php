@extends('layouts.app')

@section('template_title')
    Comentario
@endsection

@section('content')
    <div style="width: 60%" class="center" id="body-index">
        <div  class="center">

            <div class="card center">

                <button id="btncomments" class="button button-block button-pink margin-top ">
                    Nuevo
                    <i class="fa-solid fa-angle-down"></i>
                </button>

                <div id="formulario" class="container">
                    <h4><b>Agregar nuevo comentario</b></h4>
                    <form method="POST" action="{{ route('comentarios.store') }}" role="form"
                        enctype="multipart/form-data">
                        @csrf
                        @include('comentario.form')
                    </form>
                </div>
            </div>

            <table class="styled-table center margin-top" style="width: 100%">
                <thead class="thead">
                    <tr>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Asunto</th>
                        <th>Comentario</th>
                        <th>Fecha</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($comentarios as $comentario)
                        <tr>
                            <td>{{ $comentario->nombre }}</td>
                            <td>{{ $comentario->correo }}</td>
                            <td>{{ $comentario->asunto }}</td>
                            <td>{{ $comentario->comentario }}</td>
                            <td>{{ $comentario->fecha }}</td>

                            <td>
                                <button onclick="Editar({{ $comentario->id }})" class="link-button button button-pink"><i
                                        class="fa-solid fa-pen-to-square"></i>
                                </button>
                            </td>

                            <td>
                                <button onclick="Eliminar({{ $comentario->id }})" class="link-button button button-red"><i
                                        class="fa-solid fa-trash"></i>
                                </button>
                            </td>

                            {{-- <td>
                                <form action="{{ route('comentarios.destroy', $comentario->id) }}" method="POST">
                                    <a class="btn btn-sm btn-primary "
                                        href="{{ route('comentarios.show', $comentario->id) }}"><i
                                            class="fa fa-fw fa-eye"></i> Show</a>
                                    <a class="btn btn-sm btn-success"
                                        href="{{ route('comentarios.edit', $comentario->id) }}"><i
                                            class="fa fa-fw fa-edit"></i> Edit</a>
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-danger btn-sm"><i class="fa fa-fw fa-trash"></i>
                                        Delete</button>
                                </form>
                            </td> --}}
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>


    </div>

    <script>
        var open = false;

        $('#btncomments').click(function() {
            console.log('click');
            open = !open;

            if (open) {
                $("#formulario").css("display", "block");
                $(this).find($(".fa-solid")).removeClass('fa-angle-down').addClass('fa-angle-up');

            } else {
                $("#formulario").css("display", "none");
                $(this).find($(".fa-solid")).removeClass('fa-angle-up').addClass('fa-angle-down');
            }
        });
    </script>

    <script>

        </script>


    <script>
        let baseUrl = `http://127.0.0.1:8000/`;

        function Editar(id) {
            Swal.fire({
                title: 'Estas seguro deseas editar el comentario?',
                showCancelButton: true,
                confirmButtonText: 'Aceptar',
                confirmButtonColor: '753acb',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = `comentarios/${id}/edit`;
                } else if (result.isDenied) {
                    Swal.fire('Changes are not saved', '', 'info')
                }
            });
        }

        function Eliminar(id) {
            Swal.fire({
                title: 'Estas seguro deseas eliminar el comentario?',
                showCancelButton: true,
                confirmButtonText: 'Aceptar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = `comentarios/${id}/destroy`;
                } else if (result.isDenied) {
                    Swal.fire('Changes are not saved', '', 'info')
                }
            });
        }
    </script>


    <script>
        function alerta(id) {
            alert('id: ' + id);
        }
    </script>

    <style>
        @import url('http://fonts.cdnfonts.com/css/roboto');


        body {
            font-family: 'Roboto', sans-serif;
        }

        .body-index {
            position: relative;
            min-height: 100vh;
        }

        .button-orange {
            color: #fff;
            background-color: #e04e2f;
            border-color: #dc3545;
        }

        .button-pink {
            color: #fff;
            background-color: #753acb;
            border-color: #c21717;
        }



        #formularioEdit {
            transition: min-height .25s;
        }

        * {
            box-sizing: border-box;
        }

        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
            width: 100%
        }

        .styled-table thead tr {
            background-color: #444444;
            color: #ffffff;
            text-align: left;
        }

        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }

        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .center {
            margin-left: auto;
            margin-right: auto;
        }

        .margin-top-5 {
            margin-top: 5em;
        }

        .margin-top-3 {
            margin-top: 3em;
        }

        .margin-top-1 {
            margin-top: 1em;
        }

        .button {
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            margin-right: 0.5em;
        }

        .button-block {
            display: block;
            width: 100%;
            margin-bottom: 1em;
        }

        .button-blue {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;

        }

        .button-red {
            color: #fff;
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .margin-bottom-3 {
            margin-bottom: 3em;
        }

        .margin-top-5 {
            margin-top: 5em;
        }

        .margin-min {
            margin-top: 0.5em;
            margin-bottom: 0.5em;
        }

        input {
            width: 100%;
            padding: 5px 20px;
            margin: 8px 0;
            border: 0.5px solid rgb(154, 154, 154);
            outline: none;
        }

        button {
            border: transparent;
            cursor: pointer;
            padding: 0.375rem 0.75rem;
        }

        input:focus {
            border: 0.5px solid #007bff;
        }

        /* //////////////// CARD //////////// */

        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 100%;
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        .container {
            padding: 0px 16px;
        }

        #formulario {
            display: none;
        }

        .link-button {
            text-decoration: none
        }

        input[type=text],
        select,
        textarea {
            width: 100%;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 2px;
            resize: vertical;
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #cec9c9;
            color: #333333;
            text-align: center;
        }
    </style>
@endsection
