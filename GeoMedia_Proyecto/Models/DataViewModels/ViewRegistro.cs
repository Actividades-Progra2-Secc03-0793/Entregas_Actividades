using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GeoMedia_Proyecto.Models.DataViewModels
{
    public class ViewRegistro
    {
        public int codAlquiler { get; set; }
        public DateTime? fec_alquiler { get; set; }
        public decimal? subtotal { get; set; }
        public decimal? costoTotal { get; set; }
        public int? idArchivo { get; set; }
        public int? idUsuario { get; set; }
        public string tblArchivo { get; set; }
        public string tblUsuario { get; set; }

    }
}