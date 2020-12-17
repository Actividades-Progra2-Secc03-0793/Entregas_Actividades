using GeoMedia_Proyecto.Models;
using GeoMedia_Proyecto.Models.DataViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GeoMedia_Proyecto.Controllers
{
    public class CarritoController : Controller
    {
        // GET: Carrito
        private GeoMediaBDEntities db = new GeoMediaBDEntities();
        public ActionResult MiCarrito()
        {
            return View();
        }

        public ActionResult MiHistorial (int? id)
        {
            List<ViewRegistro> list = null;
            using (GeoMediaBDEntities bd = new GeoMediaBDEntities())
            {
                list = (from data in bd.tblRegistroAlquilers
                       where data.idUsuario == id
                       select new ViewRegistro
                       {
                           codAlquiler = data.codAlquiler,
                           tblUsuario = data.tblUsuario.nomUsuario,
                           fec_alquiler = data.fecha_alquiler,
                           tblArchivo = data.tblArchivo.titulo,
                           subtotal = data.subTotal,
                           costoTotal = data.costoTotal
                       }
                       ).ToList();
            }
            return View(list);
        }

        public ActionResult AddCarrito(int? id)
        {
            if (Session["Carrito"] == null)
            {
                List<CarritoItem> compras = new List<CarritoItem>();
                compras.Add(new CarritoItem(db.tblArchivos.Find(id), 1)); 
                Session["carrito"] = compras;
                Session["totalcarrito"] = compras.Count;
            }
            else
            {
                List<CarritoItem> compras = (List<CarritoItem>)Session["carrito"];
                int indexExist = getIndex(id);
                if (indexExist == -1)
                {
                    compras.Add(new CarritoItem(db.tblArchivos.Find(id), 1));
                }
                else
                {
                    compras[indexExist].Cantidad++;
                }
                Session["carrito"] = compras;
            }
            return View();
        }
        public ActionResult DelCarrito(int id)
        {

            List<CarritoItem> compras = (List<CarritoItem>)Session["carrito"];
            try
            {

                compras.RemoveAt(id);
                Session["totalcarrito"] = compras.Count;
                return View();
            }
            catch (Exception e)
            {
                return Content(e.Message+""+id);

            }       


        }
        public ActionResult FinalizarCompra()
        {
            try
            {
                List<CarritoItem> compras = (List<CarritoItem>)Session["carrito"];
                if (compras != null && compras.Count > 0)
                {
                    for (int i = 0; i < compras.Count; i++)
                    {
                        var usuario = 0;
                        var lastRegister = 0;
                        try
                        {
                            lastRegister = db.tblRegistroAlquilers
                           .OrderByDescending(x => x.codAlquiler)
                           .First().codAlquiler;
                        }
                        catch (Exception)
                        {
                            lastRegister = 0;
                        }
                    


                        if (Session["idUsuario"] != null)
                        {
                            usuario = Convert.ToInt32(Session["idUsuario"]);
                        }

                        using (var data = new GeoMediaBDEntities())
                        {
                            tblRegistroAlquiler r = new tblRegistroAlquiler();
                            var precio = db.tblArchivos.Find(compras[i].TblArchivos.idArchivo);
                            r.codAlquiler = lastRegister + 1;
                            r.fecha_alquiler = DateTime.Now;
                            r.subTotal = Convert.ToDecimal(compras[i].TblArchivos.precio);
                            r.costoTotal = compras.Sum(x => x.TblArchivos.precio);
                            r.idArchivo = compras[i].TblArchivos.idArchivo;
                            r.idUsuario = usuario;
                            db.tblRegistroAlquilers.Add(r);
                            db.SaveChanges();
                        }
                        if (db.tblRegistroAlquilers.Count() > 0)
                            ViewBag.Mensaje = "Su compra fue finalizada correctamente";
                        else
                        {
                            ViewBag.Mensaje = "Ocurrio un problema al finalizar la compra";
                        }
                        Session["carrito"] = null;
                    }
                }
            }
            catch (Exception e)
            {

               ViewBag.Mensaje = "No se pudo finalizar su compra correctamente por "+e.Message;
            }
            
            return View();
        }

        private int getIndex(int? id)
        {
            List<CarritoItem> compras = new List<CarritoItem>();
            for (int i = 0; i < compras.Count; i++)
            {
                if (compras[i].TblArchivos.idArchivo == id)
                {
                    return -i;
                }
            }
            return -1;
        }
    }
}