<div class="box box-info padding-1">
    <div class="box-body">

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
            {{ Form::text('fecha', $comentario->fecha, ['class' => 'form-control' . ($errors->has('fecha') ? ' is-invalid' : ''), 'id' => 'fecha-id', 'placeholder' => 'Fecha']) }}
            {!! $errors->first('fecha', '<div class="invalid-feedback">:message</div>') !!}
        </div>

    </div>
    <div class="box-footer mt20">
        <button type="submit" class="button button-blue margin-min">Guardar <i
                class="fa-solid fa-floppy-disk"></i></button>
    </div>
</div>


<script>
    window.onload = function() {

        var currentdate = new Date();
        var datetime = currentdate.getFullYear() + "/" +
            (currentdate.getMonth() + 1) + "/" +
            currentdate.getDate() + "/ " +
            currentdate.getHours() + ":" +
            currentdate.getMinutes() + ":" +
            currentdate.getSeconds();



        elemento = document.getElementById("fecha-id");
        elemento.setAttribute('value', datetime);
    }
</script>
