using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        private int cod_Categoria;
        private String nombreCategoria;
        private bool estado;

        public Categoria()
        { 
        }

        public Categoria(int cod_Categoria, String nombreCategoria, bool estado)
        {
            this.cod_Categoria = cod_Categoria;
            this.nombreCategoria = nombreCategoria;
            this.estado = estado;
        }

        public int Cod_Categoria
        {
            get { return cod_Categoria; }
            set { cod_Categoria = value; }
        }

        public string NombreCategoria
        {
            get { return nombreCategoria; }
            set { nombreCategoria = value; }
        }

        public bool Estado
        {
            get { return estado; }
            set { estado = value; }
        }

    }
}
