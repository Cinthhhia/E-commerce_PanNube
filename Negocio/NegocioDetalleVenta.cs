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
    public class NegocioDetalleVenta
    {
        DatosDetalleVenta dato = new DatosDetalleVenta();
        public DataTable getTablaDetalleVenta(String codVenta)
        {
            return dato.getTablaDetalleVenta(codVenta);
        }

        public decimal ObtenerTotalCategoria(String cod)
        {
            decimal total = dato.obtenerTotalCategoria(cod);

            return total;
        }
        public decimal ObtenerTotalProducto(String cod)
        {
            decimal total = dato.obtenerTotalProducto(cod);

            return total;
        }

        public bool agregarDetalleDeVenta(DetalleVenta DV)
        {
            int cantFilas = 0;

            cantFilas = dato.AgregarDetalleVenta(DV);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

    }
}
