using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;

namespace App_Hospital.Models
{
    public class EstadoCivil
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID;

        [Display(Name="Nombre")]
        [StringLength(25)]
        [Required(ErrorMessage="Ingrese nombre.")]
        public string Nombre;

        [Display(Name="Habilitado")]
        public bool Habilitado;
    }
}