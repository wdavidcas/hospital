using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace App_Hospital.Models
{
    public class Doctor
    {

        public int ID { get; set; }

        [StringLength(50)]
        [Display(Name="Nombre")]
        [Required(ErrorMessage="Ingrese nombre")]
        public string Nombre { get; set; }

        [StringLength(100)]
        [Display(Name="Dirección")]
        [Required(ErrorMessage="Ingrese dirección")]
        public string Direccion { get; set; }

        [StringLength(15)]
        [Display(Name="NIT")]
        public string Nit { get; set; }

        [StringLength(150)]
        [Display(Name="Observaciones")]
        public string Observaciones { get; set; }

        [StringLength(25)]
        [Display(Name="Usuario")]
        [Required(ErrorMessage="Ingrese usuario")]
        public string Usuario { get; set; }

        [Display(Name="Es accionista?")]
        public string Accionista { get; set; }

        
        public string EspecialidadID { get; set; }

        public virtual Especialidad Especialidad { get; set; }

    }
}