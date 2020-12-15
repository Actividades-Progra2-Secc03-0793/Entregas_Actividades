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
    public class tblUsuariosController : Controller
    {
        private GeoMediaBDEntities db = new GeoMediaBDEntities();

        // GET: tblUsuarios
        public ActionResult Index()
        {
            var tblUsuarios = db.tblUsuarios.Include(t => t.tblRole);
            return View(tblUsuarios.ToList());
        }

        // GET: tblUsuarios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUsuario tblUsuario = db.tblUsuarios.Find(id);
            if (tblUsuario == null)
            {
                return HttpNotFound();
            }
            return View(tblUsuario);
        }

        // GET: tblUsuarios/Create
        public ActionResult Create()
        {
            ViewBag.idRol = new SelectList(db.tblRoles, "idRol", "nomRol");
            return View();
        }

        // POST: tblUsuarios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idUsuario,nomUsuario,pass,idRol,Nombre,Apellido,Correo,Telefono")] tblUsuario tblUsuario)
        {
            if (ModelState.IsValid)
            {
                db.tblUsuarios.Add(tblUsuario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idRol = new SelectList(db.tblRoles, "idRol", "nomRol", tblUsuario.idRol);
            return View(tblUsuario);
        }

        // GET: tblUsuarios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUsuario tblUsuario = db.tblUsuarios.Find(id);
            if (tblUsuario == null)
            {
                return HttpNotFound();
            }
            ViewBag.idRol = new SelectList(db.tblRoles, "idRol", "nomRol", tblUsuario.idRol);
            return View(tblUsuario);
        }

        // POST: tblUsuarios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idUsuario,nomUsuario,pass,idRol,Nombre,Apellido,Correo,Telefono")] tblUsuario tblUsuario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblUsuario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idRol = new SelectList(db.tblRoles, "idRol", "nomRol", tblUsuario.idRol);
            return View(tblUsuario);
        }

        // GET: tblUsuarios/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUsuario tblUsuario = db.tblUsuarios.Find(id);
            if (tblUsuario == null)
            {
                return HttpNotFound();
            }
            return View(tblUsuario);
        }

        // POST: tblUsuarios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblUsuario tblUsuario = db.tblUsuarios.Find(id);
            db.tblUsuarios.Remove(tblUsuario);
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
