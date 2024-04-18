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
    public class DatosUsuarios
    {
        AccesoDatos ds = new AccesoDatos();

        public DataTable getTablaUsuarios(String nombreAdmin)
        {
            DataTable tabla = ds.ObtenerTabla("Usuarios", "select CodUsuario_Usu, NombreUsuario_Usu,Contrasena_Usu,Nombre_Usu,Apellido_Usu,CodigoPostal_Usu,Direccion_Usu,Contacto_Usu,Dni_Usu,Nombre_TipoUsuario,Mail_Usu,Estado_Usu from Usuarios inner join TipoUsuario on Id_TipoUsuario=TipoUsuario_Usu where NombreUsuario_Usu !='" + nombreAdmin + "'");
            return tabla;
        }

        public DataTable getTablaFiltroNombreUsuario(String nombre, String nombreAdmin)
        {
            DataTable tabla = ds.ObtenerTabla("Usuarios", "select CodUsuario_Usu, NombreUsuario_Usu,Contrasena_Usu,Nombre_Usu,Apellido_Usu,CodigoPostal_Usu,Direccion_Usu,Contacto_Usu,Dni_Usu,Nombre_TipoUsuario,Mail_Usu,Estado_Usu from Usuarios inner join TipoUsuario on Id_TipoUsuario=TipoUsuario_Usu where NombreUsuario_Usu like '" + nombre + "%' AND NombreUsuario_Usu !='" + nombreAdmin + "'");
            return tabla;
        }

        public Boolean existeNombreUsuario(Usuario usu)
        {
            String consulta = "Select * from Usuarios where NombreUsuario_Usu COLLATE SQL_Latin1_General_CP1_CS_AS ='" + usu.nombreUsuario + "'";
            return ds.existe(consulta);
        }
        public Boolean existeMailUsuario(Usuario usu)
        {
            String consulta = "Select * from Usuarios where Mail_Usu COLLATE SQL_Latin1_General_CP1_CS_AS ='" + usu.mail + "'";
            return ds.existe(consulta);
        }

        public int AgregarUsuario(Usuario usu)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosUsuarioAgregar(ref comando, usu);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spAgregarUsuario");
        }

        private void ParametrosUsuarioAgregar(ref SqlCommand Comando, Usuario usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@NOMBREUSUARIOUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.nombreUsuario;
            SqlParametros = Comando.Parameters.Add("@CONTRASENAUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.contrasena;
            SqlParametros = Comando.Parameters.Add("@NOMBREUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.nombre;
            SqlParametros = Comando.Parameters.Add("@APELLIDOUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.apellido;
            SqlParametros = Comando.Parameters.Add("@CODIGOPOSTALUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.codigoPostal;
            SqlParametros = Comando.Parameters.Add("@DIRECCIONUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.direccion;
            SqlParametros = Comando.Parameters.Add("@CONTACTOUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.contacto;
            SqlParametros = Comando.Parameters.Add("@DNIUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.dni;
            SqlParametros = Comando.Parameters.Add("@TIPODEUSUARIO", SqlDbType.Int);
            SqlParametros.Value = usu.id_TipoUsuario;
            SqlParametros = Comando.Parameters.Add("@MAILUSU", SqlDbType.VarChar);
            SqlParametros.Value = usu.mail;
        }
        public int ActualizarUsuario(Usuario usu)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosUsuarioActualizar(ref comando, usu);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spActualizarUsuario");
        }

        private void ParametrosUsuarioActualizar(ref SqlCommand Comando, Usuario usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODUSUARIO", SqlDbType.Int);
            SqlParametros.Value = usu.cod_Usuario;
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            SqlParametros.Value = usu.nombre;
            SqlParametros = Comando.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            SqlParametros.Value = usu.apellido;
            SqlParametros = Comando.Parameters.Add("@DNI", SqlDbType.VarChar);
            SqlParametros.Value = usu.dni;
            SqlParametros = Comando.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            SqlParametros.Value = usu.direccion;
            SqlParametros = Comando.Parameters.Add("@CODIGOPOSTAL", SqlDbType.VarChar);
            SqlParametros.Value = usu.codigoPostal;
            SqlParametros = Comando.Parameters.Add("@CONTACTO", SqlDbType.VarChar);
            SqlParametros.Value = usu.contacto;
            SqlParametros = Comando.Parameters.Add("@TIPOUSUARIO", SqlDbType.Int);
            SqlParametros.Value = usu.id_TipoUsuario;
            SqlParametros = Comando.Parameters.Add("@ESTADOUSU", SqlDbType.Bit);
            SqlParametros.Value = usu.Estado;
        }

        public int EliminarUsuario(Usuario usu)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosUsuarioEliminar(ref comando, usu);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarUsuario");
        }

        private void ParametrosUsuarioEliminar(ref SqlCommand Comando, Usuario usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODUSUARIO", SqlDbType.Int);
            SqlParametros.Value = usu.cod_Usuario;

        }

        public Usuario ObtenerUsuario(String usu)
        {
            String consulta = "Select * from Usuarios where NombreUsuario_Usu='" + usu + "'";
            return ObtenerUsuarioDatos(consulta);
        }
        public Usuario ObtenerUsuarioDatos(String consulta)
        {
            Usuario usu = new Usuario();
            SqlDataReader datos = ds.ObtenerDatos(consulta);
            if (datos.Read())
            {
                usu.cod_Usuario = (int)(datos["CodUsuario_Usu"]);
                usu.nombre = datos["Nombre_Usu"].ToString();
                usu.apellido = datos["Apellido_Usu"].ToString();
                usu.dni = datos["Dni_Usu"].ToString();
                usu.id_TipoUsuario = (int)(datos["TipoUsuario_Usu"]);
                usu.codigoPostal = datos["CodigoPostal_Usu"].ToString();
                usu.direccion = datos["Direccion_Usu"].ToString();
                usu.contacto = datos["Contacto_Usu"].ToString();
                usu.nombreUsuario = datos["NombreUsuario_Usu"].ToString();
                usu.contrasena = datos["Contrasena_Usu"].ToString();
                usu.mail = datos["Mail_Usu"].ToString();
                usu.Estado = (bool)datos["Estado_Usu"];
            }
            return usu;
        }

        public SqlDataReader UsuarioLogeado(Usuario usu)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosUsuarioLogeado(ref comando, usu);
            return ds.EjecutarConsultaYProcedimientoAlmacenado(comando, "spLoginUsuario");
        }
        public int ActualizarPerfil(Usuario usu)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosPerfilActualizar(ref comando, usu);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spActualizarPerfil");
        }
        public int ActualizarContra(Usuario usu)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosActualizarContra(ref comando, usu);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spActualizarContra");
        }
        private void ParametrosActualizarContra(ref SqlCommand Comando, Usuario usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODUSUARIO", SqlDbType.Int);
            SqlParametros.Value = usu.cod_Usuario;
            SqlParametros = Comando.Parameters.Add("@CONTRASENA", SqlDbType.VarChar);
            SqlParametros.Value = usu.contrasena;
        }

        private void ParametrosUsuarioLogeado(ref SqlCommand Comando, Usuario usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@NOMBREUSUARIO", SqlDbType.VarChar);
            SqlParametros.Value = usu.nombreUsuario;
            SqlParametros = Comando.Parameters.Add("@CONTRASENA", SqlDbType.VarChar);
            SqlParametros.Value = usu.contrasena;
        }

        private void ParametrosPerfilActualizar(ref SqlCommand Comando, Usuario usu)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODUSUARIO", SqlDbType.Int);
            SqlParametros.Value = usu.cod_Usuario;
            SqlParametros = Comando.Parameters.Add("@NOMBRE", SqlDbType.VarChar);
            SqlParametros.Value = usu.nombre;
            SqlParametros = Comando.Parameters.Add("@APELLIDO", SqlDbType.VarChar);
            SqlParametros.Value = usu.apellido;
            SqlParametros = Comando.Parameters.Add("@DNI", SqlDbType.VarChar);
            SqlParametros.Value = usu.dni;
            SqlParametros = Comando.Parameters.Add("@DIRECCION", SqlDbType.VarChar);
            SqlParametros.Value = usu.direccion;
            SqlParametros = Comando.Parameters.Add("@CODIGOPOSTAL", SqlDbType.VarChar);
            SqlParametros.Value = usu.codigoPostal;
            SqlParametros = Comando.Parameters.Add("@CONTACTO", SqlDbType.VarChar);
            SqlParametros.Value = usu.contacto;
        }
    }
}
