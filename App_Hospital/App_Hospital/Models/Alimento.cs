using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace App_Hospital.Models
{
    public class Alimento
    {
        public int ID { get;set; }
        [StringLength(50)]
        [Display(Name="Alimento")]
        [Required(ErrorMessage="Ingrese nombre del alimento.")]
        public string Nombre { get;set; }
        
        [Range(0,99999)]
        [Display(Name="Precio")]
        [Required(ErrorMessage="Ingrese precio.")]
        public string Precio { get; set; }
        
        [Range(0,99999)]
        [Display(Name="Precio Venta")]
        [Required(ErrorMessage="Ingrese precio de venta")]
        public string PrecioVenta { get; set; }
        
        [Range(0,1)]
        [Display(Name="Habilitado")]
        public bool Habilitado { get; set; }
    }
}