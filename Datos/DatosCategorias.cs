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
    public class DatosCategorias
    {
        AccesoDatos ds = new AccesoDatos();

        public DataTable getTablaCategorias()
        {
            DataTable tabla = ds.ObtenerTabla("Categorias", "Select CodCategoria_Ca, Nombre_Ca, Estado_Ca from Categorias");
            return tabla;
        }
        public DataTable getTablaFiltroNombreCategoria(String nombre)
        {
            DataTable tabla = ds.ObtenerTabla("Categorias", "select CodCategoria_Ca, Nombre_Ca, Estado_Ca from Categorias where Nombre_Ca like'" + nombre + "%'");
            return tabla;
        }

        public Boolean existeCategoria(Categoria cat)
        {
            String consulta = "Select * from Categorias where Nombre_Ca='" + cat.NombreCategoria + "'" + "and CodCategoria_Ca !='" + cat.Cod_Categoria + "'";
            return ds.existe(consulta);
        }

        public int AgregarCategoria(Categoria cat)
        {
            cat.Cod_Categoria = ds.ObtenerMaximo("SELECT COUNT(CodCategoria_Ca) FROM Categorias") + 1;
            SqlCommand comando = new SqlCommand();
            ParametrosCategoriaAgregar(ref comando, cat);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spAgregarCategoria");
        }
        public int EliminarCategoria(Categoria cat)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosCategoriaEliminar(ref comando, cat);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarCategoria");
        }
        public int ActualizarCategoria(Categoria cat)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosCategoriaActualizar(ref comando, cat);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spActualizarCategoria");
        }

        private void ParametrosCategoriaAgregar(ref SqlCommand Comando, Categoria cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@NOMBREPCATEGORIA", SqlDbType.VarChar);
            SqlParametros.Value = cat.NombreCategoria;
        }
        private void ParametrosCategoriaActualizar(ref SqlCommand Comando, Categoria cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODCATEGORIA", SqlDbType.Int);
            SqlParametros.Value = cat.Cod_Categoria;
            SqlParametros = Comando.Parameters.Add("@NOMBREPCATEGORIA", SqlDbType.VarChar);
            SqlParametros.Value = cat.NombreCategoria;
            SqlParametros = Comando.Parameters.Add("@ESTADOCAT", SqlDbType.Bit);
            SqlParametros.Value = cat.Estado;
        }

        private void ParametrosCategoriaEliminar(ref SqlCommand Comando, Categoria cat)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODCATEGORIA", SqlDbType.Int);
            SqlParametros.Value = cat.Cod_Categoria;
        }
    }
}
