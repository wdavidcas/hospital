using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using App_Hospital.Models;

namespace App_Hospital.Controllers
{
    public class DoctorController : Controller
    {
        private ModeloDB db = new ModeloDB();

        //
        // GET: /Doctor/

        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            //EspecialidadesDropDrownList();

            ViewBag.CurrentSort = sortOrder;
            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.NitSortParm=sortOrder=="Nit" ? "nit_desc":"Nit";
            
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            var doctores = from s in db.Doctors
                           select s;

            /*if (especialidad == null || especialidad <= 0)
            {
                doctores.Where(s=>s.EspecialidadID.Equals(especialidad));
            }*/
            
            

            if (!String.IsNullOrEmpty(searchString))
            {
                doctores = doctores.Where(s => s.Nombre.Contains(searchString)
                    || s.Nit.Contains(searchString)
                    );
            }

            switch (sortOrder)
            {
                case "name_desc":
                    doctores = doctores.OrderByDescending(s => s.Nombre);
                    break;
                case "nit_desc":
                    doctores = doctores.OrderByDescending(s => s.Nit);
                    break;
                default:
                    doctores = doctores.OrderBy(s => s.DoctorID);
                    break;
            }

            int pageSize = 10;
            int pageNumber = (page ?? 1);

            return View(doctores.ToPagedList(pageNumber, pageSize));
        }

        //
        // GET: /Doctor/Details/5

        public ActionResult Details(int id = 0)
        {
            Doctor doctor = db.Doctors.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            EspecialidadesDropDrownList(doctor.EspecialidadID);
            return View(doctor);
        }

        //
        // GET: /Doctor/Create

        public ActionResult Create()
        {
            EspecialidadesDropDrownList();
            return View();
        }

        /// <summary>
        /// Metodo que crea la lista de especialidades
        /// </summary>
        /// <param name="EspecialidadId"></param>
        private void EspecialidadesDropDrownList(int? EspecialidadId = 0)
        {            
            List<SelectListItem> Especialidades = new
            List<SelectListItem>();
            Especialidades.Add(new
            SelectListItem() { Value = "0", Text = "::Seleccione especialidad::", Selected = false });

            foreach (var especialidad in db.Especialidades)
            {
                Especialidades.Add(new SelectListItem()
                {
                    Value = especialidad.EspecialidadID.ToString(),
                    Text = especialidad.Nombre.ToString(),
                    Selected = EspecialidadId == especialidad.EspecialidadID ? true : false
                });
                ViewData["EspecialidadID"] = Especialidades;
            }
            
        }
        //
        // POST: /Doctor/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Doctor doctor)
        {            
            if (ModelState.IsValid)
            {
                db.Doctors.Add(doctor);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(doctor);
        }

        //
        // GET: /Doctor/Edit/5

        public ActionResult Edit(int id = 0)
        {
            
            Doctor doctor = db.Doctors.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            EspecialidadesDropDrownList(doctor.EspecialidadID);
            return View(doctor);
        }

        //
        // POST: /Doctor/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Doctor doctor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(doctor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(doctor);
        }

        //
        // GET: /Doctor/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Doctor doctor = db.Doctors.Find(id);
            if (doctor == null)
            {
                return HttpNotFound();
            }
            return View(doctor);
        }

        //
        // POST: /Doctor/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Doctor doctor = db.Doctors.Find(id);
            db.Doctors.Remove(doctor);
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