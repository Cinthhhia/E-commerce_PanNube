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
    public class NegocioProducto
    {
        DatosProductos dato = new DatosProductos();
        public DataTable getTablaProductosPaginaPrincipal()
        {
            return dato.getTablaProductosPaginaPrincipal();
        }
        public DataTable getTablaProductos()
        {
            return dato.getTablaProductos();
        }

        public DataTable getTablaProductosFiltroBuscar(String nombre)
        {
            return dato.getTablaFiltroNombreProducto(nombre);
        }
        public DataTable getTablaProductosFiltroBuscarConfiguracionProducto(String nombre)
        {
            return dato.getTablaFiltroNombreProductoTrueYFalse(nombre);
        }

        public DataTable getTablaCategoria()
        {
            return dato.getTablaCategorias();
        }

        public bool eliminarProducto(int cod)
        {
            Producto pro = new Producto();
            pro.Cod_Producto = cod;
            int aux = dato.EliminarProducto(pro);
            if (aux == 1)
                return true;
            else
                return false;
        }

        public bool existeNombreProducto(Producto pro)
        {
            if (dato.existeProducto(pro) == false)
            {
                return false;
            }
            else { return true; }
        }

        public bool agregarProducto(Producto pro)
        {
            int cantFilas = 0;

            if (dato.existeProducto(pro) == false)
            {
                cantFilas = dato.AgregarProducto(pro);
            }
            else { return false; }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool actualizarProducto(Producto pro)
        {
            int aux = dato.ActualizarProducto(pro);
            if (aux == 1)
                return true;
            else
                return false;
        }


        public DataTable FiltrarProductoMenor(Producto pro, decimal precio)
        {
            DataTable dt = dato.FiltrarProductoMenorMil(pro, precio);

            return dt;
        }

        public DataTable FiltrarProductoMayor(Producto pro, decimal precio)
        {
            DataTable dt = dato.FiltrarProductoMayorMil(pro, precio);

            return dt;
        }
    }
}
