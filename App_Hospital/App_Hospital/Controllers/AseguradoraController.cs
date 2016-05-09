using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Entity;
using System.Web;
using System.Web.Mvc;
using PagedList;
using App_Hospital.Models;

namespace App_Hospital.Controllers
{
    public class AseguradoraController : Controller
    {
        private ModeloDB bd = new ModeloDB();
        // GET: /Aseguradora/

        public ActionResult Index()
        {                            
            return View(bd.Aseguradoras.ToList());
        }

    }
}
