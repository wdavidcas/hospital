using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace App_Hospital.Models
{
    public class Especialidad
    {
        public int ID { get; set; }
        [Required(ErrorMessage="Ingrese nombre.")]
        [StringLength(25)]
        public string Nombre { get; set; }
        [StringLength(50)]
        public string Descripcion { get; set; }
    }
}