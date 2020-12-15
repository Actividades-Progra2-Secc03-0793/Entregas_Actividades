using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GeoMedia_Proyecto.Models;
using GeoMedia_Proyecto.Models.DataViewModels;
using System.Data.Entity;
using System.Net;

namespace GeoMedia_Proyecto.Controllers
{
    public class CatalogoController : Controller
    {
        // GET: Catalogo
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Peliculas()
        {
            return View(ListaCatalogo(1));
        }
        public ActionResult Series()
        {
            return View(ListaCatalogo(2));
        }
        public ActionResult Videos()
        {
            return View(ListaCatalogo(3));
        }
        public ActionResult Musica()
        {
            return View(ListaCatalogo(4));
        }
        public ActionResult Detalle(int? id)
        {
            try
            {
                GeoMediaBDEntities db = new GeoMediaBDEntities();
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                tblArchivo model = db.tblArchivos.Find(id);
                if (model == null)
                {
                    return HttpNotFound();
                }
                return View(model);
            }
            catch (Exception ex)
            {

                return Content("Error por " + id + " describe los siguiente: " + ex.Message);
            }
            
        }

        // Metodo que mostrara la lista de catalogo segun el tipo de catalogo del producto
        public List<ViewProducto> ListaCatalogo (int idCatalogo)
        {
            List<ViewProducto> lst = null;
            using (GeoMediaBDEntities bd = new GeoMediaBDEntities())
            {
                lst = (from data in bd.tblArchivos
                       where data.codCategoria == idCatalogo
                       orderby data.titulo
                       select new ViewProducto
                       {
                           idArchivo = data.idArchivo,
                           titulo = data.titulo,
                           formato = data.formato,
                           precio = data.precio,
                           detalles = data.detalles,
                           sinopsis = data.sinopsis,
                           ruta = data.ruta,
                           categoria = data.codCategoria
                       }
                    ).ToList();
            }
            return lst;
        }
    }
}