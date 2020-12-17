using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GeoMedia_Proyecto.Models;

namespace GeoMedia_Proyecto.Controllers
{
    public class tblArchivoesController : Controller
    {
        private GeoMediaBDEntities db = new GeoMediaBDEntities();

        // GET: tblArchivoes
        public ActionResult Index()
        {
            var tblArchivos = db.tblArchivos.Include(t => t.tblCategoria).Include(t => t.tblTiposFile);
            return View(tblArchivos.ToList());
        }

        // GET: tblArchivoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblArchivo tblArchivo = db.tblArchivos.Find(id);
            if (tblArchivo == null)
            {
                return HttpNotFound();
            }
            return View(tblArchivo);
        }

        // GET: tblArchivoes/Create
        public ActionResult Create()
        {
            ViewBag.codCategoria = new SelectList(db.tblCategorias, "codCategoria", "categoria");
            ViewBag.idTipoFile = new SelectList(db.tblTiposFiles, "idTipoFile", "nomTipoFile");
            return View();
        }

        // POST: tblArchivoes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idArchivo,titulo,idTipoFile,formato,precio,ruta,detalles,sinopsis,codCategoria")] tblArchivo tblArchivo)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    db.tblArchivos.Add(tblArchivo);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch (Exception)
                {
                    ViewBag.message = "Ya existe un Producto con ese ID. Por favor ingrece el Producto con otro ID";
                    return RedirectToAction("Create");
                }
                
            }

            ViewBag.codCategoria = new SelectList(db.tblCategorias, "codCategoria", "categoria", tblArchivo.codCategoria);
            ViewBag.idTipoFile = new SelectList(db.tblTiposFiles, "idTipoFile", "nomTipoFile", tblArchivo.idTipoFile);
            return View(tblArchivo);
        }

        // GET: tblArchivoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblArchivo tblArchivo = db.tblArchivos.Find(id);
            if (tblArchivo == null)
            {
                return HttpNotFound();
            }
            ViewBag.codCategoria = new SelectList(db.tblCategorias, "codCategoria", "categoria", tblArchivo.codCategoria);
            ViewBag.idTipoFile = new SelectList(db.tblTiposFiles, "idTipoFile", "nomTipoFile", tblArchivo.idTipoFile);
            return View(tblArchivo);
        }

        // POST: tblArchivoes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idArchivo,titulo,idTipoFile,formato,precio,ruta,detalles,sinopsis,codCategoria")] tblArchivo tblArchivo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblArchivo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.codCategoria = new SelectList(db.tblCategorias, "codCategoria", "categoria", tblArchivo.codCategoria);
            ViewBag.idTipoFile = new SelectList(db.tblTiposFiles, "idTipoFile", "nomTipoFile", tblArchivo.idTipoFile);
            return View(tblArchivo);
        }

        // GET: tblArchivoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblArchivo tblArchivo = db.tblArchivos.Find(id);
            if (tblArchivo == null)
            {
                return HttpNotFound();
            }
            return View(tblArchivo);
        }

        // POST: tblArchivoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblArchivo tblArchivo = db.tblArchivos.Find(id);
            db.tblArchivos.Remove(tblArchivo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
