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
    public class DatosDetalleVenta
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaDetalleVenta(String codVenta)
        {
            DataTable tabla = ds.ObtenerTabla("DetalleVenta", "select CodVenta_DV AS [Codigo], Nombre_Pro AS [Producto], PrecioUnitario_DV AS [Precio x Unidad], Cantidad_DV AS [Cantidad], (PrecioUnitario_DV * Cantidad_DV) AS [Subtotal] from DetalleVenta inner join Productos on CodProducto_DV = CodProducto_Pro where CodVenta_DV ='" + codVenta + "'");
            return tabla;
        }

        public decimal obtenerTotalCategoria(String cod)
        {
            String consulta = "select sum (PrecioUnitario_DV * Cantidad_DV) AS Total from DetalleVenta inner join Productos on DetalleVenta.CodProducto_DV = Productos.CodProducto_Pro inner join Categorias on Productos.CodCategoria_Pro = Categorias.CodCategoria_Ca where CodCategoria_Ca ='" + cod + "'";
            decimal total = ds.EjecutarConsultarYObtenerDatos(consulta);
            return total;
        }
        public decimal obtenerTotalProducto(String cod)
        {
            String consulta = "select sum (PrecioUnitario_DV * Cantidad_DV) AS Total from DetalleVenta where CodProducto_DV ='" + cod + "'";
            decimal total = ds.EjecutarConsultarYObtenerDatos(consulta);
            return total;
        }

        public int AgregarDetalleVenta(DetalleVenta DV)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosAgregarDetalleVenta(ref comando, DV);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spAgregarDetalleDeVenta");
        }
        private void ParametrosAgregarDetalleVenta(ref SqlCommand Comando, DetalleVenta DV)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODPROD", SqlDbType.Int);
            SqlParametros.Value = DV.cod_Producto;
            SqlParametros = Comando.Parameters.Add("@PRECIOXUNIDAD", SqlDbType.Decimal);
            SqlParametros.Value = DV.precioxUnidad;
            SqlParametros = Comando.Parameters.Add("@CANTIDAD", SqlDbType.Int);
            SqlParametros.Value = DV.cantidad;
        }

    }
}
