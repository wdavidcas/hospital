using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using App_Hospital.Models;

namespace App_Hospital.Controllers
{
    public class ContactoController : Controller
    {
        private ModeloDB db = new ModeloDB();

        //
        // GET: /Contacto/

        public ActionResult Index()
        {
            return View(db.Contactoes.ToList());
        }

        //
        // GET: /Contacto/Details/5

        public ActionResult Details(int id = 0)
        {
            Contacto contacto = db.Contactoes.Find(id);
            if (contacto == null)
            {
                return HttpNotFound();
            }
            return View(contacto);
        }

        //
        // GET: /Contacto/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Contacto/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Contacto contacto)
        {
            if (ModelState.IsValid)
            {
                db.Contactoes.Add(contacto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(contacto);
        }

        //
        // GET: /Contacto/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Contacto contacto = db.Contactoes.Find(id);
            if (contacto == null)
            {
                return HttpNotFound();
            }
            return View(contacto);
        }

        //
        // POST: /Contacto/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Contacto contacto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contacto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(contacto);
        }

        //
        // GET: /Contacto/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Contacto contacto = db.Contactoes.Find(id);
            if (contacto == null)
            {
                return HttpNotFound();
            }
            return View(contacto);
        }

        //
        // POST: /Contacto/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Contacto contacto = db.Contactoes.Find(id);
            db.Contactoes.Remove(contacto);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}