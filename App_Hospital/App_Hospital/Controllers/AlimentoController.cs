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
    public class AlimentoController : Controller
    {
        private ModeloDB db = new ModeloDB();

        //
        // GET: /Default1/

        public ActionResult Index()
        {
            return View(db.Alimentoes.ToList());
        }

        //
        // GET: /Default1/Details/5

        public ActionResult Details(int id = 0)
        {
            Alimento alimento = db.Alimentoes.Find(id);
            if (alimento == null)
            {
                return HttpNotFound();
            }
            return View(alimento);
        }

        //
        // GET: /Default1/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Default1/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Alimento alimento)
        {
            if (ModelState.IsValid)
            {
                db.Alimentoes.Add(alimento);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(alimento);
        }

        //
        // GET: /Default1/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Alimento alimento = db.Alimentoes.Find(id);
            if (alimento == null)
            {
                return HttpNotFound();
            }
            return View(alimento);
        }

        //
        // POST: /Default1/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Alimento alimento)
        {
            if (ModelState.IsValid)
            {
                db.Entry(alimento).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(alimento);
        }

        //
        // GET: /Default1/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Alimento alimento = db.Alimentoes.Find(id);
            if (alimento == null)
            {
                return HttpNotFound();
            }
            return View(alimento);
        }

        //
        // POST: /Default1/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Alimento alimento = db.Alimentoes.Find(id);
            db.Alimentoes.Remove(alimento);
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