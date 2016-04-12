using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace App_Hospital.Models
{
    public class ModeloDB:DbContext
    {
        public ModeloDB() : base("bdhospital") { 
        
        }

        public DbSet<Especialidad> Especialidades { get; set; }
        public DbSet<Alimento> Alimentoes { get; set; }
        public DbSet<Aseguradora> Aseguradoras { get; set; }
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Contacto> Contactoes { get; set; }
        public DbSet<Doctor> Doctors { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        
    }
}