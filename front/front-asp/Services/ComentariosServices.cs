using front_asp.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace front_asp.Services
{
    public class ComentariosServices
    {
        string Baseurl = "http://localhost:8080/api/comentarios";


        public async Task<List<_Comentario>> Listar()
        {

            List<_Comentario> comentarios = new List<_Comentario>();

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(Baseurl);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                HttpResponseMessage Res = await client.GetAsync(Baseurl);
                if (Res.IsSuccessStatusCode)
                {
                    var Response = Res.Content.ReadAsStringAsync().Result;
                    comentarios = JsonConvert.DeserializeObject<List<_Comentario>>(Response);
                }
            }
            return comentarios;
        }

        public async Task<_Comentario> GetById(int id)
        {

            _Comentario commentario = new _Comentario();

            Console.WriteLine(Baseurl + "/" + id);

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(Baseurl+"/"+id);
                client.DefaultRequestHeaders.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                HttpResponseMessage Res = await client.GetAsync(Baseurl + "/" + id);
                if (Res.IsSuccessStatusCode)
                {
                    var Response = Res.Content.ReadAsStringAsync().Result;
                    commentario = JsonConvert.DeserializeObject<_Comentario>(Response);
                }
            }
            return commentario;
        }

        public async Task<Boolean> add(_Comentario comentario) {


            Console.WriteLine(comentario.ToString());

            using var client = new HttpClient();

            var res = await client.PostAsJsonAsync(Baseurl, comentario);

            if (res.IsSuccessStatusCode) {
                Console.WriteLine("agregado exitosamente");
                return true;
            }

            return false;
        }

        public async Task<Boolean> update(_Comentario comentario)
        {

            Console.WriteLine("entro al service");

            Console.WriteLine(comentario.ToString());

            using var client = new HttpClient();

            var res = await client.PutAsJsonAsync(Baseurl, comentario);

            if (res.IsSuccessStatusCode)
            {
                Console.WriteLine("actualizado exitosamente");
                return true;
            }

            return false;
        }

        public async Task<Boolean> Eliminar(int id)
        {

            using var client = new HttpClient();
            var res = await client.DeleteAsync(Baseurl+"?id="+id);

            if (res.IsSuccessStatusCode)
            {
                Console.WriteLine("eliminado exitosamente");
                return true;
            }

            return false;
        }
    }
}
