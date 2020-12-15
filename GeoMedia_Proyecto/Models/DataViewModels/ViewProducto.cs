using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace GeoMedia_Proyecto.Models.DataViewModels
{
    public class ViewProducto
    {
        public int idArchivo { get; set; }
        public string titulo { get; set; }
        public string formato { get; set; }
        public string ruta { get; set; }
        public string detalles { get; set; }
        public string sinopsis { get; set; }
        public decimal? precio { get; set; }
        public int? categoria { get; set; }
    }

   
}