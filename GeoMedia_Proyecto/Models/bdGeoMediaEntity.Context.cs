﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GeoMedia_Proyecto.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class GeoMediaBDEntities : DbContext
    {
        public GeoMediaBDEntities()
            : base("name=GeoMediaBDEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblArchivo> tblArchivos { get; set; }
        public virtual DbSet<tblCategoria> tblCategorias { get; set; }
        public virtual DbSet<tblRegistroAlquiler> tblRegistroAlquilers { get; set; }
        public virtual DbSet<tblRole> tblRoles { get; set; }
        public virtual DbSet<tblTiposFile> tblTiposFiles { get; set; }
        public virtual DbSet<tblUsuario> tblUsuarios { get; set; }
    }
}