<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ComentarioController;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('comentarios/{id}/destroy', 'App\Http\Controllers\ComentarioController@destroy');
Route::get('comentarios/{id}/edit', 'App\Http\Controllers\ComentarioController@edit');

Auth::routes();
Route::resource('/comentarios',ComentarioController::class);
