namespace front_asp.Models
{
    public class _Comentario
    {

        private int id;
        private String nombre;
        private String correo;
        private String asunto;
        private String comen;
        private String fecha;

        public _Comentario(int id, string nombre, string correo, string asunto, string comen, string fecha)
        {
            this.id = id;
            this.nombre = nombre;
            this.correo = correo;
            this.asunto = asunto;
            this.comen = comen;
            this.fecha = fecha;
        }

        public _Comentario() { 
        }

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Correo { get => correo; set => correo = value; }
        public string Asunto { get => asunto; set => asunto = value; }
        public string Comentario { get => comen; set => comen = value; }
        public string Fecha { get => fecha; set => fecha = value; }


        public override string ToString()
        {
            return $"{nameof(nombre)}: {nombre}, {nameof(correo)}: {correo} , {nameof(asunto)}: {asunto}, {nameof(comen)}: {comen}";
        }
    }


}
