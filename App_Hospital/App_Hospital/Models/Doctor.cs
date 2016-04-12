using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace App_Hospital.Models
{
    public class Doctor
    {
        public int DoctorID { get; set; }

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
        [Display(Name="Notas")]
        public string Observaciones { get; set; }

        [StringLength(25)]
        [Display(Name="Usuario")]
        [Required(ErrorMessage="Ingrese usuario")]
        public string Usuario { get; set; }

        [Display(Name="Accionista?")]
        public bool Accionista { get; set; }
        
        [Display(Name="Profesión")]        
        public int EspecialidadID { get; set; }

        [Display(Name="Especialidad")]
        public virtual Especialidad Especialidad { get; set; }
    }
}