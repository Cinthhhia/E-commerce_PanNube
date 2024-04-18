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
    public class NegocioVentas
    {
        DatosVentas dato = new DatosVentas();
        public DataTable getTablaVentas()
        {
            return dato.getTablaVentas();
        }
        public DataTable getTablaCompras(int codCliente)
        {
            return dato.getTablaCompras(codCliente);
        }
        public SqlDataReader cargarEntregas()
        {
            SqlDataReader dr = dato.obtenerEntrega();

            return dr;
        }
        public SqlDataReader cargarPagos()
        {
            SqlDataReader dr = dato.obtenerPago();

            return dr;
        }

        public SqlDataReader cargarCategorias()
        {
            SqlDataReader dr = dato.obtenerCategorias();

            return dr;
        }
        public SqlDataReader cargarProductos(String cat)
        {
            int valor = Convert.ToInt32(cat);
            SqlDataReader dr = dato.obtenerProductos(valor);

            return dr;
        }

        public SqlDataReader VentasPrecioIgual(Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlDataReader dr = dato.FiltrarVentasPrecioIgual(ven, fechaDesde, fechaHasta);

            return dr;
        }

        public SqlDataReader VentasPrecioMayor(Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlDataReader dr = dato.FiltrarVentasPrecioMayor(ven,fechaDesde,fechaHasta);

            return dr;
        }

        public SqlDataReader VentasPrecioMenor(Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlDataReader dr = dato.FiltrarVentasPrecioMenor(ven, fechaDesde, fechaHasta);

            return dr;
        }

        public decimal ObtenerTotalUsuario(String cod)
        {
            decimal total = dato.obtenerTotalUsuario(cod);

            return total;
        }

        public decimal obtenerProductosClientes(String codPro, String codCliente)
        {
            decimal total = dato.obtenerTotalProductoCliente(codPro, codCliente);

            return total;
        }

        public decimal ObtenerTotalEntrega(String cod)
        {
            decimal total = dato.obtenerTotalEntrega(cod);

            return total;
        }
        public decimal ObtenerTotalMetPago(String cod)
        {
            decimal total = dato.obtenerTotalMetPago(cod);

            return total;
        }

        public decimal ObtenerTotalFechasAdministrador(String fechaDesde, String fechaHasta)
        {
            decimal total = dato.obtenerTotalFechaAdministrador(fechaDesde, fechaHasta);

            return total;
        }

        public decimal ObtenerTotalFechasCliente(String fechaDesde, String fechaHasta, String codCliente)
        {
            decimal total = dato.obtenerTotalFechaCliente(fechaDesde, fechaHasta, codCliente);

            return total;
        }

        public bool agregarVenta(Venta ven)
        {
            int cantFilas = 0;

            cantFilas = dato.AgregarVenta(ven);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
    }
}
