using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class TipoUsuario
    {
        private int id_TipoUsuario;
        private String NombreTipoUsuario;
        private bool Estado;

        public TipoUsuario()
        {
        }
        public int getId_TipoUsuario()
        {
            return id_TipoUsuario;
        }
        public void setId_TipoUsuario(int Id_TipoUsuario)
        {
            id_TipoUsuario = Id_TipoUsuario;
        }
        public String getNombreTipoUsuario()
        {
            return NombreTipoUsuario;
        }
        public void setNombreTipoUsuario(String nombreTipoUsuario)
        {
            NombreTipoUsuario = nombreTipoUsuario;
        }
        public bool getEstado()
        {
            return Estado;
        }
        public void setEstado(bool estado)
        {
            Estado = estado;
        }
    }
}
