namespace front_asp.Models
{
    public class Comments
    {

        private String nombre;
        private String correo;
        private String asunto;
        private String comen;

        public Comments( string nombre, string correo, string asunto, string comen)
        {
      
            this.Nombre = nombre;
            this.Correo = correo;
            this.Asunto = asunto;
            this.Comen = comen;
         
        }

        public Comments() { }

        public string Nombre { get => nombre; set => nombre = value; }
        public string Correo { get => correo; set => correo = value; }
        public string Asunto { get => asunto; set => asunto = value; }
        public string Comen { get => comen; set => comen = value; }

        public override string ToString()
        {
            return $"{nameof(nombre)}: {nombre}, {nameof(correo)}: {correo} , {nameof(asunto)}: {asunto}, {nameof(comen)}: {comen}";
        }


    }
}
