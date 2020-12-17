using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GeoMedia_Proyecto.Models.DataViewModels
{
    public class CarritoItem
    {
        private tblArchivo _tblArchivos;
        private int _cantidad;

        public int Cantidad
        {
            get
            {
                return _cantidad;
            }
            set
            {
                _cantidad = value;
            }
        }

        public tblArchivo TblArchivos
        {
            get
            {
                return _tblArchivos;
            }
            set
            {
                _tblArchivos = value;
            }
        }

        public CarritoItem() { }
        public CarritoItem (tblArchivo tblArchivos, int cantidad)
        {
            this._tblArchivos = tblArchivos;
            this._cantidad = cantidad;
        }
    }

}