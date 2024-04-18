using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private Nullable<int> Cod_Usuario;
        private String NombreUsuario;
        private String Contrasena;
        private String Nombre;
        private String Apellido;
        private String CodigoPostal;
        private String Direccion;
        private String Contacto;
        private String Dni;
        private TipoUsuario Id_TipoUsuario = new TipoUsuario();
        private String Mail;
        private bool estado;
       
        public Usuario()
        {
        }

        public Usuario(int Cod_Usuario, String NombreUsuario, String Contrasena, String Nombre, String Apellido, String CodigoPostal, String Direccion, String Contacto, String Dni, TipoUsuario Id_TipoUsuario, String Mail, bool estado)
        {
            this.Cod_Usuario = Cod_Usuario;
            this.NombreUsuario = NombreUsuario;
            this.Contrasena = Contrasena;
            this.Nombre = Nombre;
            this.Apellido = Apellido;
            this.CodigoPostal = CodigoPostal;
            this.Direccion = Direccion;
            this.Contacto = Contacto;
            this.Dni = Dni;
            this.Id_TipoUsuario = Id_TipoUsuario;
            this.Mail = Mail;
            this.estado = estado;
        }

        public Nullable<int> cod_Usuario
        {
            get { return Cod_Usuario; }
            set { Cod_Usuario = value; }
        }

        public String nombreUsuario
        {
            get { return NombreUsuario; }
            set { NombreUsuario = value; }
        }

        public String contrasena
        {
            get { return Contrasena; }
            set { Contrasena = value; }
        }

        public String nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }

        public String apellido
        {
            get { return Apellido; }
            set { Apellido = value; }
        }

        public String codigoPostal
        {
            get { return CodigoPostal; }
            set { CodigoPostal = value; }
        }
        public String direccion
        {
            get { return Direccion; }
            set { Direccion = value; }
        }

        public String contacto
        {
            get { return Contacto; }
            set { Contacto = value; }
        }

        public String dni
        {
            get { return Dni; }
            set { Dni = value; }
        }

        public int id_TipoUsuario
        {
            get { return Id_TipoUsuario.getId_TipoUsuario(); }
            set { Id_TipoUsuario.setId_TipoUsuario(value); }
        }

        public String mail
        {
            get { return Mail; }
            set { Mail = value; }
        }

        public bool Estado
        {
            get { return estado; }
            set { estado = value; }
        }
    }
}
