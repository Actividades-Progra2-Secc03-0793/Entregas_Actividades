using GeoMedia_Proyecto.Models;
using GeoMedia_Proyecto.Models.DataViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace GeoMedia_Proyecto.Controllers
{
    public class GeoHomeController : Controller
    {
        private GeoMediaBDEntities db = new GeoMediaBDEntities();
        // GET: GeoHome
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        //Cerrar sesion:
        public ActionResult Logout()
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
        public ActionResult Recuperar()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Recuperar(int texto)
        {

            if (texto != 0)
            {
                var user = db.tblUsuarios.FirstOrDefault(e => e.idUsuario == texto);

                if (user != null)
                {
                    var selectPass = from p in db.tblUsuarios
                                    where p.idUsuario == texto
                                    select p.pass;
                    var selectUser = from u in db.tblUsuarios
                                     where u.idUsuario == texto
                                     select u.nomUsuario;
                    string pass;
                    string usuario;
                    try
                    {
                        usuario = selectUser.First();
                        pass = selectPass.First();
                    }
                    catch (Exception)
                    {
                        usuario = null;
                        pass = null;
                    }
                    if (pass != null && usuario != null)
                    {
                        ViewBag.pass = "Su usuario es: " + usuario + " y sucontraseña es: " + pass;
                    }
                    else
                    {
                        ViewBag.pass = "Su contraseña no pudo ser recuperada. Intente nuevamente";
                    }

                    return View();
                }
                else
                {
                    ViewBag.pass = "Su contraseña no pudo se recuperada. Ingrece un ID valido";
                    return View();
                }
            }
            else
            {
                ViewBag.pass = "LLene el campo correspondiente";
                return View();
            }
            
        }
        [HttpPost]
        public ActionResult Login(string txtUsuarios, string txtPass)
        {

            //Validar que los input no vengan vacios
            if (!string.IsNullOrEmpty(txtUsuarios) && !string.IsNullOrEmpty(txtPass))
            {
                var user = db.tblUsuarios.FirstOrDefault(e => e.nomUsuario == txtUsuarios && e.pass == txtPass);
                //Si el usuario y la contraseña son correctos:
                if (user != null)
                {
                    var selectRol = from r in db.tblUsuarios
                                     where r.nomUsuario == txtUsuarios
                                     select r.idRol; 

                    var model = db.tblUsuarios.FirstOrDefault(x => x.nomUsuario == txtUsuarios);
                    

                    int? rol, idUsuario;
                    string nomUsuario, nombre, apellido, correo, pass;
                    try
                    {
                        rol = selectRol.First();
                        idUsuario = model.idUsuario;
                        nomUsuario = model.nomUsuario;
                        nombre = model.Nombre;
                        apellido = model.Apellido;
                        correo = model.Correo;
                        pass = model.pass;

                    }
                    catch (Exception e)
                    {
                        rol = null;
                        idUsuario = null;
                        nomUsuario = null;
                        nombre = null;
                        apellido = null;
                        correo = null;
                        pass = null;
                    }

                    //Para validar que tiene que haber una sesion activa para poder acceder a una pagina:
                    FormsAuthentication.SetAuthCookie(user.Correo, true);

                    //Creacion de variables de session para validar el rol de ususario
                    Session["idrol"] = rol;
                    Session["idUsuario"] = idUsuario;
                    Session["nomUsuario"] = nomUsuario;
                    Session["nombre"] = nombre;
                    Session["apellido"] = apellido;
                    Session["correo"] = correo;
                    Session["pass"] = pass;
                    Session["sesion"] = "true";

                    return RedirectToAction("Index");
                }

                //Si los datos son incorrectos:
                else
                {
                    ViewBag.message = "Usuario o Contraseña incorrecto.";
                    return View();
                }

            }
            else
            {

                ViewBag.message = "Llene todos los campos para poder iniciar sesión.";
                return View();
            }

        }
        public ActionResult Registro()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Registro([Bind(Include = "nomUsuario,pass,Nombre,Apellido,Correo,Telefono")] tblUsuario tblUsuario)
        {
            var LastRegister = db.tblUsuarios
            .OrderByDescending(x => x.idUsuario)
            .First().idUsuario;

            tblUsuario.idUsuario = LastRegister + 1;
            tblUsuario.idRol = 2;

            if (ModelState.IsValid)
            {
                db.tblUsuarios.Add(tblUsuario);
                db.SaveChanges();


                return RedirectToAction("Login");
            }


            return View();
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Help()
        {
            return View();
        }
    }
}