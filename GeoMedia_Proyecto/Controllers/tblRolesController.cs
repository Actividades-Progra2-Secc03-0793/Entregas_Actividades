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
    public class tblRolesController : Controller
    {
        private GeoMediaBDEntities db = new GeoMediaBDEntities();

        // GET: tblRoles
        public ActionResult Index()
        {
            return View(db.tblRoles.ToList());
        }

        // GET: tblRoles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRole tblRole = db.tblRoles.Find(id);
            if (tblRole == null)
            {
                return HttpNotFound();
            }
            return View(tblRole);
        }

        // GET: tblRoles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tblRoles/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idRol,nomRol")] tblRole tblRole)
        {
            if (ModelState.IsValid)
            {

                try
                {
                    db.tblRoles.Add(tblRole);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch (Exception)
                {

                    ViewBag.message = "Ya existe un Rol con ese ID. Por favor ingrece el Rol con otro ID";
                    return RedirectToAction("Create");
                }
            }

            return View(tblRole);
        }

        // GET: tblRoles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRole tblRole = db.tblRoles.Find(id);
            if (tblRole == null)
            {
                return HttpNotFound();
            }
            return View(tblRole);
        }

        // POST: tblRoles/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idRol,nomRol")] tblRole tblRole)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblRole).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblRole);
        }

        // GET: tblRoles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRole tblRole = db.tblRoles.Find(id);
            if (tblRole == null)
            {
                return HttpNotFound();
            }
            return View(tblRole);
        }

        // POST: tblRoles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblRole tblRole = db.tblRoles.Find(id);
            db.tblRoles.Remove(tblRole);
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
