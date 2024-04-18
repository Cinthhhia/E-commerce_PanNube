using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DatosVentas
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaVentas()
        {
            DataTable tabla = ds.ObtenerTabla("Ventas", "select CodVentas_Ven, CodUsuario_Ven, NombreUsuario_Usu, Fechas_Ven, Contacto_Ven, Nombre_TipoEntrega, Direccion_Ven, Nombre_MetodoPago, Total_Ven from Ventas inner join TipoEntrega on TipoEntrega_Ven = Id_TipoEntrega inner join MetodoPago on MetodoPago_Ven = Id_MetodoPago inner join Usuarios on CodUsuario_Ven = CodUsuario_Usu");
            return tabla;
        }

        public DataTable getTablaCompras(int codCliente)
        {
            DataTable tabla = ds.ObtenerTabla("Ventas", "select CodVentas_Ven, Fechas_Ven, Contacto_Ven, Nombre_TipoEntrega, Direccion_Ven, Nombre_MetodoPago, Total_Ven from (Ventas inner join TipoEntrega on TipoEntrega_Ven = Id_TipoEntrega) inner join MetodoPago on MetodoPago_Ven = Id_MetodoPago where CodUsuario_Ven='" + codCliente + "'");
            return tabla;
        }
        public SqlDataReader obtenerEntrega()
        {
            String consulta = "Select Id_TipoEntrega,Nombre_TipoEntrega from TipoEntrega";
            SqlDataReader dr = ds.ObtenerDatos(consulta);
            return dr;
        }
        public SqlDataReader obtenerPago()
        {
            String consulta = "Select Id_MetodoPago,Nombre_MetodoPago from MetodoPago";
            SqlDataReader dr = ds.ObtenerDatos(consulta);
            return dr;
        }

        public SqlDataReader obtenerCategorias()
        {
            String consulta = "Select CodCategoria_Ca,Nombre_Ca from Categorias";
            SqlDataReader dr = ds.ObtenerDatos(consulta);
            return dr;
        }

        public SqlDataReader obtenerProductos(int cat)
        {
            String consulta = "select CodProducto_Pro, Nombre_Pro from Productos inner join Categorias on CodCategoria_Pro=CodCategoria_Ca where CodCategoria_Pro ='" + cat + "'";
            SqlDataReader dr = ds.ObtenerDatos(consulta);
            return dr;
        }

        public decimal obtenerTotalProductoCliente(String codPro, String codCliente)
        {
            String consulta = "select sum(PrecioUnitario_DV* Cantidad_DV) AS Total from Ventas inner join DetalleVenta on CodVentas_Ven = CodVenta_DV where CodProducto_DV = '" + codPro + "' AND CodUsuario_Ven = '" + codCliente + "'";
            decimal total = ds.EjecutarConsultarYObtenerDatos(consulta);
            return total;
        }

        public decimal obtenerTotalUsuario(String cod)
        {
            String consulta = "select SUM(Total_Ven) as total from Ventas where CodUsuario_Ven ='" + cod + "'";
            decimal total = ds.EjecutarConsultarYObtenerDatos(consulta);
            return total;
        }

        public decimal obtenerTotalEntrega(String cod)
        {
            String consulta = "select SUM(Total_Ven) as total from Ventas where TipoEntrega_Ven ='" + cod + "'";
            decimal total = ds.EjecutarConsultarYObtenerDatos(consulta);
            return total;
        }
        public decimal obtenerTotalMetPago(String cod)
        {
            String consulta = "select SUM(Total_Ven) as total from Ventas where MetodoPago_Ven ='" + cod + "'";
            decimal total = ds.EjecutarConsultarYObtenerDatos(consulta);
            return total;
        }

        public decimal obtenerTotalFechaAdministrador(String fechaDesde, String fechaHasta)
        {
            String consulta = "SELECT SUM (Total_Ven) AS Total FROM Ventas WHERE Fechas_Ven BETWEEN CONVERT(datetime,'" + fechaDesde + "'" + ", 120) AND CONVERT(datetime," + "'" + fechaHasta + "'" + ", 120)";
            decimal total = ds.EjecutarConsultarYObtenerDatos(consulta);
            return total;
        }

        public decimal obtenerTotalFechaCliente(String fechaDesde, String fechaHasta, String codCliente)
        {
            String consulta = "SELECT SUM(Total_Ven) AS Total FROM Ventas WHERE Fechas_Ven BETWEEN CONVERT(datetime,'" + fechaDesde + "'" + ", 120) AND CONVERT(datetime," + "'" + fechaHasta + "'" + ", 120) AND CodUsuario_Ven = '" + codCliente + "'";
            decimal total = ds.EjecutarConsultarYObtenerDatos(consulta);
            return total;
        }

        public SqlDataReader FiltrarVentasPrecioIgual(Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosVentasIgual(ref comando, ven, fechaDesde, fechaHasta);
            return ds.EjecutarConsultaYProcedimientoAlmacenado(comando, "spFiltrarVentasPrecioIgual");
        }

        public SqlDataReader FiltrarVentasPrecioMayor(Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosVentasMayor(ref comando, ven, fechaDesde, fechaHasta);
            return ds.EjecutarConsultaYProcedimientoAlmacenado(comando, "spFiltrarVentasPrecioMayor");
        }
        public SqlDataReader FiltrarVentasPrecioMenor(Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosVentasMenor(ref comando, ven, fechaDesde, fechaHasta);
            return ds.EjecutarConsultaYProcedimientoAlmacenado(comando, "spFiltrarVentasPrecioMenor");
        }
        public int AgregarVenta(Venta ven)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosVentaAgregar(ref comando, ven);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spAgregarVenta");
        }
        private void ParametrosVentaAgregar(ref SqlCommand Comando, Venta ven)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODUSUARIO", SqlDbType.Int);
            SqlParametros.Value = ven.cod_Usuario;
            SqlParametros = Comando.Parameters.Add("@TIPOENTREGA", SqlDbType.Int);
            SqlParametros.Value = ven.id_TipoEntrega;
            SqlParametros = Comando.Parameters.Add("@METPAGO", SqlDbType.Int);
            SqlParametros.Value = ven.id_MetodoPago;
            SqlParametros = Comando.Parameters.Add("@TOTAL", SqlDbType.Decimal);
            SqlParametros.Value = ven.total;
        }
        private void ParametrosVentasIgual(ref SqlCommand Comando, Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODIGOVENTA", SqlDbType.Int);
            SqlParametros.Value = ven.cod_Venta;
            SqlParametros = Comando.Parameters.Add("@CODIGOUSUARIO", SqlDbType.Int);
            SqlParametros.Value = ven.cod_Usuario;
            SqlParametros = Comando.Parameters.Add("@FECHA1", SqlDbType.VarChar);
            SqlParametros.Value = fechaDesde;
            SqlParametros = Comando.Parameters.Add("@FECHA2", SqlDbType.VarChar);
            SqlParametros.Value = fechaHasta;
            SqlParametros = Comando.Parameters.Add("@PRECIO", SqlDbType.Decimal);
            SqlParametros.Value = ven.total;
            SqlParametros = Comando.Parameters.Add("@ENTREGA", SqlDbType.Int);
            SqlParametros.Value = ven.id_TipoEntrega;
            SqlParametros = Comando.Parameters.Add("@PAGO", SqlDbType.Int);
            SqlParametros.Value = ven.id_MetodoPago;
        }

        private void ParametrosVentasMayor(ref SqlCommand Comando, Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODIGOVENTA", SqlDbType.Int);
            SqlParametros.Value = ven.cod_Venta;
            SqlParametros = Comando.Parameters.Add("@CODIGOUSUARIO", SqlDbType.Int);
            SqlParametros.Value = ven.cod_Usuario;
            SqlParametros = Comando.Parameters.Add("@FECHAH", SqlDbType.VarChar);
            SqlParametros.Value = fechaDesde;
            SqlParametros = Comando.Parameters.Add("@FECHAD", SqlDbType.VarChar);
            SqlParametros.Value = fechaHasta;
            SqlParametros = Comando.Parameters.Add("@PRECIO", SqlDbType.Decimal);
            SqlParametros.Value = ven.total;
            SqlParametros = Comando.Parameters.Add("@ENTREGA", SqlDbType.Int);
            SqlParametros.Value = ven.id_TipoEntrega;
            SqlParametros = Comando.Parameters.Add("@PAGO", SqlDbType.Int);
            SqlParametros.Value = ven.id_MetodoPago;
        }

        private void ParametrosVentasMenor(ref SqlCommand Comando, Venta ven, String fechaDesde, String fechaHasta)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODIGOVENTA", SqlDbType.Int);
            SqlParametros.Value = ven.cod_Venta;
            SqlParametros = Comando.Parameters.Add("@CODIGOUSUARIO", SqlDbType.Int);
            SqlParametros.Value = ven.cod_Usuario;
            SqlParametros = Comando.Parameters.Add("@FECHAHA", SqlDbType.VarChar);
            SqlParametros.Value = fechaDesde;
            SqlParametros = Comando.Parameters.Add("@FECHADE", SqlDbType.VarChar);
            SqlParametros.Value = fechaHasta;
            SqlParametros = Comando.Parameters.Add("@PRECIO", SqlDbType.Decimal);
            SqlParametros.Value = ven.total;
            SqlParametros = Comando.Parameters.Add("@ENTREGA", SqlDbType.Int);
            SqlParametros.Value = ven.id_TipoEntrega;
            SqlParametros = Comando.Parameters.Add("@PAGO", SqlDbType.Int);
            SqlParametros.Value = ven.id_MetodoPago;
        }
    }
}
