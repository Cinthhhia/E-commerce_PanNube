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
    public class NegocioUsuario
    {
        DatosUsuarios dato = new DatosUsuarios();

        public DataTable getTablaUsuarios(String nombreAdmin)
        {
            return dato.getTablaUsuarios(nombreAdmin);
        }

        public bool existeNombreUsuario(Usuario usu)
        {
            if (dato.existeNombreUsuario(usu) == false)
            {
                return false;
            }
            else { return true; }
        }
        public bool existeMailUsuario(Usuario usu)
        {
            if (dato.existeMailUsuario(usu) == false)
            {
                return false;
            }
            else { return true; }
        }

        public bool agregarUsuario(Usuario usu)
        {
            int cantFilas = 0;

            if (dato.existeNombreUsuario(usu) == false && dato.existeMailUsuario(usu) == false)
            {
                cantFilas = dato.AgregarUsuario(usu);
            }
            else { return false; }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool actualizarUsuario(Usuario usu)
        {
            int aux = dato.ActualizarUsuario(usu);
            if (aux == 1)
                return true;
            else
                return false;
        }

        public bool eliminarUsuario(int cod)
        {
            Usuario usu = new Usuario();
            usu.cod_Usuario = cod;
            int aux = dato.EliminarUsuario(usu);
            if (aux == 1)
                return true;
            else
                return false;
        }

        public Usuario ObtenerUsuario(String nombre)
        {
            Usuario usu = new Usuario();
            usu = dato.ObtenerUsuario(nombre);
            return usu;
        }

        public bool usuarioLogeado(Usuario usu)
        {
            SqlDataReader dr = dato.UsuarioLogeado(usu);
            int count = 0;

            while (dr.Read())
            {
                count++;
            }

            if(count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool actualizarPerfil(Usuario usu)
        {
            int aux = dato.ActualizarPerfil(usu);
            if (aux == 1)
                return true;
            else
                return false;
        }

        public bool actualizarContra(Usuario usu)
        {
            int aux = dato.ActualizarContra(usu);
            if (aux == 1)
                return true;
            else
                return false;
        }
        public DataTable getTablaUsuariosFiltroBuscar(String nombre, String nombreAdmin)
        {
            return dato.getTablaFiltroNombreUsuario(nombre, nombreAdmin);
        }
    }
}
