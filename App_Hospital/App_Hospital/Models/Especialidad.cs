using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace App_Hospital.Models
{
    public class Especialidad
    {
               
        public int EspecialidadID { get; set; }
        
        [Required(ErrorMessage="Ingrese nombre")]
        [StringLength(25)]
        [ValidarNombre(ErrorMessage="La especialidad existe")]        
        public string Nombre { get; set; }

        [StringLength(50)]
        [Display(Name="Descripción")]
        public string Descripcion { get; set; }

        [Display(Name="Habilitado")]
        public bool Habilitado { get; set; }        
    }

    [AttributeUsage(AttributeTargets.All)]
    public class ValidarNombre : ValidationAttribute 
    {
        ModeloDB modelo = new ModeloDB();
        
        public override bool IsValid(object value)
        {
            string nombre=Convert.ToString(value);
            var especialidad = from s in modelo.Especialidades
                               where s.Nombre.Equals(nombre)
                               select s;
            if (especialidad.Count() > 0)
                return false;
            else
                return true;            
        }

    }
}