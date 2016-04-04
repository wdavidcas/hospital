using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace App_Hospital.Models
{
    public class Categoria
    {
        public int ID { get; set; }

        [StringLength(50)]
        [Display(Name="Categoría")]
        [Required(ErrorMessage="Ingrese categoría.")]
        public string Nombre { get; set; }

        [Display(Name="Habilitado")]
        public bool Habilitado { get; set; }

        [Display(Name = "Es medicamento")]
        public bool EsMedicamento { get;set; }
    }
}