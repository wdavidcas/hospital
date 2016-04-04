using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace App_Hospital.Models
{
    public class Contacto
    {
        public int ID { get; set; }

        [StringLength(25)]
        [Display(Name="Nombre")]
        [Required(ErrorMessage="Ingrese nombre.")]
        public string Nombre { get; set; }

        [StringLength(50)]
        [Display(Name="Dirección")]
        [Required(ErrorMessage="Ingrese dirección.")]
        public string Direccion { get; set; }

        [StringLength(100)]
        [Display(Name="Observaciones")]
        public string Observaciones { get; set; }

        [Display(Name="Habilitado")]
        public bool Habilitado { get; set; }
    }
}