using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data;
using System.Data.SqlClient;

namespace Negocio
{
   public class NegocioCategoria
    {
        DatosCategorias dato = new DatosCategorias();
        public DataTable getTablaCategoria()
        {
            return dato.getTablaCategorias();
        }
        public DataTable getTablaCategoriaFiltroBuscar(String nombre)
        {
            return dato.getTablaFiltroNombreCategoria(nombre);
        }

        public bool existeNombreCategoria(Categoria cat)
        {
            if (dato.existeCategoria(cat) == false)
            {
                return false;
            }
            else { return true; }
        }

        public bool eliminarCategoria(int cod)
        {
            Categoria cat = new Categoria();
            cat.Cod_Categoria = cod;
            int aux = dato.EliminarCategoria(cat);
            if (aux == 1)
                return true;
            else
                return false;
        }

        public bool agregarCategoria(Categoria cat)
        {
            int cantFilas = 0;

            if (dato.existeCategoria(cat) == false)
            {
                cantFilas = dato.AgregarCategoria(cat);
            }
            else { return false; }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool actualizarCategoria(Categoria cat)
        {            
            int aux = dato.ActualizarCategoria(cat);
            if (aux == 1)
                return true;
            else
                return false;
        }
    }
}
