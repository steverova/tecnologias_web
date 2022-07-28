{{-- @extends('layouts.app')

@section('template_title')
    Update Comentario
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="">
            <div class="col-md-12">

                @includeif('partials.errors')

                <div class="card card-default">
                    <div class="card-header">
                        <span class="card-title">Update Comentario</span>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('comentarios.update', $comentario->id) }}"  role="form" enctype="multipart/form-data">
                            {{ method_field('PATCH') }}
                            @csrf

                            @include('comentario.form')

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection --}}

@extends('layouts.app')

@section('template_title')
    Update Comentario
@endsection



<link rel="stylesheet" href="{{ url('../resources/css/app.css') }}">

@section('content')
    <div id="body-index">
        <div style="width: 50%" class="center">
            <div class="card center">
                <div class="button button-block button-pink margin-top margin-top-3 center">
                    Actualizar Comentario

                </div>
                <div id="" class="container">
                    <form method="POST" action="{{ route('comentarios.update', $comentario->id) }}" role="form"
                        enctype="multipart/form-data">
                        {{ method_field('PATCH') }}
                        @csrf
                        {{-- @include('comentario.form') --}}

                        <div class="group">
                            {{ Form::label('nombre') }}
                            {{ Form::text('nombre', $comentario->nombre, ['class' => 'form-control' . ($errors->has('nombre') ? ' is-invalid' : ''), 'placeholder' => 'Nombre']) }}
                            {!! $errors->first('nombre', '<div class="invalid-feedback">:message</div>') !!}
                        </div>
                        <div class="form-group">
                            {{ Form::label('correo') }}
                            {{ Form::text('correo', $comentario->correo, ['class' => 'form-control' . ($errors->has('correo') ? ' is-invalid' : ''), 'placeholder' => 'Correo']) }}
                            {!! $errors->first('correo', '<div class="invalid-feedback">:message</div>') !!}
                        </div>
                        <div class="form-group">
                            {{ Form::label('asunto') }}
                            {{ Form::text('asunto', $comentario->asunto, ['class' => 'form-control' . ($errors->has('asunto') ? ' is-invalid' : ''), 'placeholder' => 'Asunto']) }}
                            {!! $errors->first('asunto', '<div class="invalid-feedback">:message</div>') !!}
                        </div>
                        <div class="form-group">
                            {{ Form::label('comentario') }}
                            {{ Form::text('comentario', $comentario->comentario, ['class' => 'form-control' . ($errors->has('comentario') ? ' is-invalid' : ''), 'placeholder' => 'Comentario']) }}
                            {!! $errors->first('comentario', '<div class="invalid-feedback">:message</div>') !!}
                        </div>
                        <div hidden class="form-group">
                            {{ Form::label('fecha') }}
                            {{ Form::text('fecha', $comentario->fecha, ['class' => 'form-control' . ($errors->has('fecha') ? ' is-invalid' : ''), 'placeholder' => 'Fecha']) }}
                            {!! $errors->first('fecha', '<div class="invalid-feedback">:message</div>') !!}
                        </div>


                        <div class="box-footer mt20">
                            <button onclick="location.href='/'" class="button button-orange margin-min"> <i
                                    class="fa-solid fa-angle-left"></i> Volver</button>
                            <button type="submit" class="button button-blue margin-min">Guardar <i
                                    class="fa-solid fa-floppy-disk"></i></button>

                        </div>

                </div>

                </form>
            </div>
        </div>
    </div>
    @endsection

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
