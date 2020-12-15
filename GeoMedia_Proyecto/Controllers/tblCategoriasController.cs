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
    public class tblCategoriasController : Controller
    {
        private GeoMediaBDEntities db = new GeoMediaBDEntities();

        // GET: tblCategorias
        public ActionResult Index()
        {
            return View(db.tblCategorias.ToList());
        }

        // GET: tblCategorias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCategoria tblCategoria = db.tblCategorias.Find(id);
            if (tblCategoria == null)
            {
                return HttpNotFound();
            }
            return View(tblCategoria);
        }

        // GET: tblCategorias/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tblCategorias/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "codCategoria,categoria")] tblCategoria tblCategoria)
        {
            if (ModelState.IsValid)
            {
                db.tblCategorias.Add(tblCategoria);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblCategoria);
        }

        // GET: tblCategorias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCategoria tblCategoria = db.tblCategorias.Find(id);
            if (tblCategoria == null)
            {
                return HttpNotFound();
            }
            return View(tblCategoria);
        }

        // POST: tblCategorias/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "codCategoria,categoria")] tblCategoria tblCategoria)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblCategoria).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblCategoria);
        }

        // GET: tblCategorias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCategoria tblCategoria = db.tblCategorias.Find(id);
            if (tblCategoria == null)
            {
                return HttpNotFound();
            }
            return View(tblCategoria);
        }

        // POST: tblCategorias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblCategoria tblCategoria = db.tblCategorias.Find(id);
            db.tblCategorias.Remove(tblCategoria);
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
