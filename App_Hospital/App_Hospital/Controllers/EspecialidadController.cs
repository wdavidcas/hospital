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
    public class EspecialidadController : Controller
    {
        private ModeloDB db = new ModeloDB();

        //
        // GET: /Especialidad/

        public ActionResult Index()
        {
            return View(db.Especialidades.ToList());
        }

        //
        // GET: /Especialidad/Details/5

        public ActionResult Details(int id = 0)
        {
            Especialidad especialidad = db.Especialidades.Find(id);
            if (especialidad == null)
            {
                return HttpNotFound();
            }
            return View(especialidad);
        }

        //
        // GET: /Especialidad/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Especialidad/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Especialidad especialidad)
        {
            if (ModelState.IsValid)
            {                
                db.Especialidades.Add(especialidad);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(especialidad);
        }

        //
        // GET: /Especialidad/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Especialidad especialidad = db.Especialidades.Find(id);
            if (especialidad == null)
            {
                return HttpNotFound();
            }
            return View(especialidad);
        }

        //
        // POST: /Especialidad/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Especialidad especialidad)
        {
            if (ModelState.IsValid)
            {
                db.Entry(especialidad).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(especialidad);
        }

        //
        // GET: /Especialidad/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Especialidad especialidad = db.Especialidades.Find(id);
            if (especialidad == null)
            {
                return HttpNotFound();
            }
            return View(especialidad);
        }

        //
        // POST: /Especialidad/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Especialidad especialidad = db.Especialidades.Find(id);
            db.Especialidades.Remove(especialidad);
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