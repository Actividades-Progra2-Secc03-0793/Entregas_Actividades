using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GeoMedia_Proyecto.Models.DataViewModels
{
    public class ViewUsuario
    {
        public int idUsuario { get; set; }
        public string  nomUsuario { get; set; }
        public string pass { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Correo { get; set; }
        public int? idRol { get; set; }
    }
}