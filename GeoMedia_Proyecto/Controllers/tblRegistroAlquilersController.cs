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
    public class tblRegistroAlquilersController : Controller
    {
        private GeoMediaBDEntities db = new GeoMediaBDEntities();

        // GET: tblRegistroAlquilers
        public ActionResult Index()
        {
            var tblRegistroAlquilers = db.tblRegistroAlquilers.Include(t => t.tblArchivo).Include(t => t.tblUsuario);
            return View(tblRegistroAlquilers.ToList());
        }

        // GET: tblRegistroAlquilers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRegistroAlquiler tblRegistroAlquiler = db.tblRegistroAlquilers.Find(id);
            if (tblRegistroAlquiler == null)
            {
                return HttpNotFound();
            }
            return View(tblRegistroAlquiler);
        }

        // GET: tblRegistroAlquilers/Create
        public ActionResult Create()
        {
            
            try
            {
                ViewBag.idArchivo = new SelectList(db.tblArchivos, "idArchivo", "titulo");
                ViewBag.idUsuario = new SelectList(db.tblUsuarios, "idUsuario", "nomUsuario");
                return View();
            }
            catch (Exception)
            {
                ViewBag.message = "Ya existe un Registro con ese ID. Por favor ingrece un Registro con otro ID";
                return RedirectToAction("Create");
            }
        }

        // POST: tblRegistroAlquilers/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "codAlquiler,fecha_alquiler,subTotal,costoTotal,idArchivo,idUsuario")] tblRegistroAlquiler tblRegistroAlquiler)
        {
            if (ModelState.IsValid)
            {
                db.tblRegistroAlquilers.Add(tblRegistroAlquiler);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idArchivo = new SelectList(db.tblArchivos, "idArchivo", "titulo", tblRegistroAlquiler.idArchivo);
            ViewBag.idUsuario = new SelectList(db.tblUsuarios, "idUsuario", "nomUsuario", tblRegistroAlquiler.idUsuario);
            return View(tblRegistroAlquiler);
        }

        // GET: tblRegistroAlquilers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRegistroAlquiler tblRegistroAlquiler = db.tblRegistroAlquilers.Find(id);
            if (tblRegistroAlquiler == null)
            {
                return HttpNotFound();
            }
            ViewBag.idArchivo = new SelectList(db.tblArchivos, "idArchivo", "titulo", tblRegistroAlquiler.idArchivo);
            ViewBag.idUsuario = new SelectList(db.tblUsuarios, "idUsuario", "nomUsuario", tblRegistroAlquiler.idUsuario);
            return View(tblRegistroAlquiler);
        }

        // POST: tblRegistroAlquilers/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "codAlquiler,fecha_alquiler,subTotal,costoTotal,idArchivo,idUsuario")] tblRegistroAlquiler tblRegistroAlquiler)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblRegistroAlquiler).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idArchivo = new SelectList(db.tblArchivos, "idArchivo", "titulo", tblRegistroAlquiler.idArchivo);
            ViewBag.idUsuario = new SelectList(db.tblUsuarios, "idUsuario", "nomUsuario", tblRegistroAlquiler.idUsuario);
            return View(tblRegistroAlquiler);
        }

        // GET: tblRegistroAlquilers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRegistroAlquiler tblRegistroAlquiler = db.tblRegistroAlquilers.Find(id);
            if (tblRegistroAlquiler == null)
            {
                return HttpNotFound();
            }
            return View(tblRegistroAlquiler);
        }

        // POST: tblRegistroAlquilers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblRegistroAlquiler tblRegistroAlquiler = db.tblRegistroAlquilers.Find(id);
            db.tblRegistroAlquilers.Remove(tblRegistroAlquiler);
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
