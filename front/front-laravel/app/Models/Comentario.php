<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Comentario
 *
 * @property $id
 * @property $nombre
 * @property $correo
 * @property $asunto
 * @property $comentario
 * @property $fecha
 * @property $created_at
 * @property $updated_at
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Comentario extends Model
{
    
    static $rules = [
		'nombre' => 'required',
		'correo' => 'required',
		'asunto' => 'required',
		'comentario' => 'required',
		'fecha' => 'required',
    ];

    protected $perPage = 20;

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['nombre','correo','asunto','comentario','fecha'];



}
