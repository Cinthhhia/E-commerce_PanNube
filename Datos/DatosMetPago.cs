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
    public class DatosMetPago
    {
        AccesoDatos ds = new AccesoDatos();

        public DataTable getTablaMetPago()
        {
            DataTable tabla = ds.ObtenerTabla("MetodoPago", "Select Id_MetodoPago, Nombre_MetodoPago, Estado_MetodoPago from MetodoPago");
            return tabla;
        }
        public DataTable getTablaFiltroNombreMetPago(String nombre)
        {
            DataTable tabla = ds.ObtenerTabla("MetodoPago", "select Id_MetodoPago, Nombre_MetodoPago, Estado_MetodoPago from MetodoPago where Nombre_MetodoPago like'" + nombre + "%'");
            return tabla;
        }
        public SqlDataReader obtenerMetPago()
        {
            String consulta = "Select Id_MetodoPago, Nombre_MetodoPago from MetodoPago where Estado_MetodoPago=1";
            SqlDataReader dr = ds.ObtenerDatos(consulta);
            return dr;
        }
        public Boolean existeMetPago(MetodoPago met)
        {
            String consulta = "Select * from MetodoPago where Nombre_MetodoPago='" + met.nombreMetodoPago + "'" + "and Id_MetodoPago !='" + met.id_MetodoPago + "'";
            return ds.existe(consulta);
        }
        public int AgregarMetPago(MetodoPago met)
        {
            met.id_MetodoPago = ds.ObtenerMaximo("SELECT COUNT(Id_MetodoPago) FROM MetodoPago") + 1;
            SqlCommand comando = new SqlCommand();
            ParametrosMetPagoAgregar(ref comando, met);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spAgregarMetPago");
        }
        public int EliminarMetPago(MetodoPago met)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosMetPagoEliminar(ref comando, met);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarMetPago");
        }
        public int ActualizarMetPago(MetodoPago met)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosMetPagoActualizar(ref comando, met);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spActualizarMetPago");
        }
        private void ParametrosMetPagoAgregar(ref SqlCommand Comando, MetodoPago met)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            SqlParametros.Value = met.nombreMetodoPago;
        }
        private void ParametrosMetPagoActualizar(ref SqlCommand Comando, MetodoPago met)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@COD", SqlDbType.Int);
            SqlParametros.Value = met.id_MetodoPago;
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            SqlParametros.Value = met.nombreMetodoPago;
            SqlParametros = Comando.Parameters.Add("@ESTADOMET", SqlDbType.Bit);
            SqlParametros.Value = met.estado;

        }
        private void ParametrosMetPagoEliminar(ref SqlCommand Comando, MetodoPago met)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@COD", SqlDbType.Int);
            SqlParametros.Value = met.id_MetodoPago;
        }
    }
}
