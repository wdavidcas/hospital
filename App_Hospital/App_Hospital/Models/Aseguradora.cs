using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace App_Hospital.Models
{
    public class Aseguradora
    {
        public int AseguradoraID { get; set; }

        [StringLength(50)]        
        [Display(Name="Aseguradora")]
        [Required(ErrorMessage="Ingrese nombre.")]        
        public string Nombre { get; set; }


        [Display(Name="Habilitado")]
        public bool Habilitado { get; set; }
    }
}