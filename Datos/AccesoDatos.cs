using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
    class AccesoDatos
    {
        String rutaPanNube = "Data Source=localhost\\SQLEXPRESS;Initial Catalog=BDPanNube;Integrated Security=True";

        public AccesoDatos()
        {
        }

        private SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(rutaPanNube);
            try
            {
                cn.Open();
                return cn;
            }
            catch
            {
                return null;
            }
        }


        private SqlDataAdapter ObtenerAdaptador(String consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(String NombreTabla, String Sql)
        {
            DataSet ds = new DataSet();
            SqlConnection Conexion = ObtenerConexion();
            SqlDataAdapter adp = ObtenerAdaptador(Sql, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }

        public SqlDataReader ObtenerDatos(string consulta)
        {
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }

        public SqlDataReader EjecutarConsultaYProcedimientoAlmacenado(SqlCommand comando, String NombreSP)
        {
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;    
            SqlDataReader dr = cmd.ExecuteReader();
            
            return dr;
        }

        public decimal EjecutarConsultarYObtenerDatos(string consulta)
        {
            decimal total = 0;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            object aux = cmd.ExecuteScalar();
            
            if (aux != DBNull.Value)
            {
                total = Convert.ToDecimal(aux);
            }

            return total;
        }

        public Boolean existe(String consulta)
        {
            Boolean estado = false;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            return estado;
        }

        public int ObtenerMaximo(String consulta)
        {
            int max = 0;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);

            using (cmd)
            {
                max = Convert.ToInt32(cmd.ExecuteScalar());
            }

            return max;
        }
    }
}
