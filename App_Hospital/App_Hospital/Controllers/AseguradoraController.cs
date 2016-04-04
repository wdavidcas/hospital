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
    public class AseguradoraController : Controller
    {
        private ModeloDB db = new ModeloDB();

        //
        // GET: /Aseguradora/

        public ActionResult Index()
        {
            return View(db.Aseguradoras.ToList());
        }

        //
        // GET: /Aseguradora/Details/5

        public ActionResult Details(int id = 0)
        {
            Aseguradora aseguradora = db.Aseguradoras.Find(id);
            if (aseguradora == null)
            {
                return HttpNotFound();
            }
            return View(aseguradora);
        }

        //
        // GET: /Aseguradora/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Aseguradora/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Aseguradora aseguradora)
        {
            if (ModelState.IsValid)
            {
                db.Aseguradoras.Add(aseguradora);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(aseguradora);
        }

        //
        // GET: /Aseguradora/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Aseguradora aseguradora = db.Aseguradoras.Find(id);
            if (aseguradora == null)
            {
                return HttpNotFound();
            }
            return View(aseguradora);
        }

        //
        // POST: /Aseguradora/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Aseguradora aseguradora)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aseguradora).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(aseguradora);
        }

        //
        // GET: /Aseguradora/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Aseguradora aseguradora = db.Aseguradoras.Find(id);
            if (aseguradora == null)
            {
                return HttpNotFound();
            }
            return View(aseguradora);
        }

        //
        // POST: /Aseguradora/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Aseguradora aseguradora = db.Aseguradoras.Find(id);
            db.Aseguradoras.Remove(aseguradora);
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