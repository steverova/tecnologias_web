using front_asp.Models;
using front_asp.Services;
using Microsoft.AspNetCore.Mvc;

namespace front_asp.Controllers;

public class Index : Controller
{
    public ComentariosServices services;

    public async Task<IActionResult> IndiceAsync()
    {
        services = new ComentariosServices();
        var model = new CollectionModel();
        model.listaComentarios = new List<_Comentario>();
        model.listaComentarios = await services.Listar();
        return View(model);
    }

    [HttpPost]
    public async Task<RedirectToActionResult> addComment(_Comentario comentario)
    {
        services = new ComentariosServices();

        Console.WriteLine("entro");

        Console.WriteLine(comentario.ToString());

        var response = await services.add(comentario);

        if (response) return RedirectToAction("Indice");

        return RedirectToAction("Indice");
    }

    public async Task<RedirectToActionResult> deleteComment(int id)
    {
        Console.WriteLine("id para eliminar" + id);
        services = new ComentariosServices();

        var response = await services.Eliminar(id);

        if (response) return RedirectToAction("Indice");

        return RedirectToAction("Indice");
    }

    public async Task<IActionResult> Editar(int id)
    {
        services = new ComentariosServices();
        _Comentario c = new _Comentario();
        c = await services.GetById(id);
        Console.WriteLine(c.ToString());
        return View(c);
    }


    [HttpPost]
    public async Task<RedirectToActionResult> Editar(int id, String nombre, String correo, String asunto, String comen)
    {

        Console.WriteLine("comentario actualizado:" + comen);
        _Comentario c = new _Comentario(id, nombre, correo, asunto, comen, "");
        Console.WriteLine("obteniendo de form asp: " + c.ToString());
        services = new ComentariosServices();

        Console.WriteLine("entro a guardar");
        Console.WriteLine(c.ToString());

        var response = await services.update(c);

        if (response) return RedirectToAction("Indice");

        return RedirectToAction("Indice");
    }
}