using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class AgregarUsuario : System.Web.UI.Page
    {
        NegocioUsuario neg = new NegocioUsuario();
        Usuario usuLog = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogoUsuario"] != null)
            {
                string rutaLogo = Session["LogoUsuario"].ToString();
                imgUsuario.ImageUrl = rutaLogo;
                imgUsuario.Visible = true;
            }
            if (Session["Usuario"] != null)
            {
                usuLog = (Usuario)Session["Usuario"];
                lblUsuarioLogeado.Text = usuLog.nombreUsuario;
            }

            txtLecturaFalse();
        }


        protected void btnAgregarUsu_Click(object sender, EventArgs e)
        {
            Usuario usu = new Usuario();
            usu.nombreUsuario = txtUsuario.Text;
            usu.mail = txtMail.Text;
            bool existeYaEseNombreUsuario = neg.existeNombreUsuario(usu);
            bool existeYaEseMailUsuario = neg.existeMailUsuario(usu);

            if (existeYaEseNombreUsuario == true)
            {
                lblMensaje.Text = "No se ha podido completar la operación porque ese nombre de usuario ya existe";
            }
            else if (existeYaEseMailUsuario == true)
            {
                lblMensaje.Text = "No se ha podido completar la operación porque el mail ingresado ya esta registrado";
            }
            else
            {
                lblMensaje.Text = "¿Esta seguro de que desea agregar este usuario?";
                btnConfirmar.Visible = true;
                btnCancelar.Visible = true;
                txtLecturaTrue();
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Usuario usu = new Usuario();
            usu.nombre = txtNombre.Text;
            usu.apellido = txtApellido.Text;
            usu.dni = txtDni.Text;
            usu.direccion = txtDireccion.Text;
            usu.codigoPostal = txtCodigo.Text;
            usu.contacto = txtNumero.Text;
            usu.nombreUsuario = txtUsuario.Text;
            usu.mail = txtMail.Text;

            usu.contrasena = Session["ContrasenaAgregarUsuario"].ToString();
            usu.id_TipoUsuario= Convert.ToInt32(rblTipoUsuario.SelectedValue);

            bool exito = neg.agregarUsuario(usu);
            if (exito == true)
            {
                lblMensaje.Text = "Se ha podido agregar el usuario con exito";
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error a la hora de agregar el usuario";
            }
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            limpiarCampos();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Se ha cancelado la operación";
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            txtLecturaFalse();
        }

        public void limpiarCampos()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDni.Text = "";
            txtDireccion.Text = "";
            txtCodigo.Text = "";
            txtNumero.Text = "";
            txtUsuario.Text = "";
            txtMail.Text = "";
            txtContrasena.Text = "";
            txtRepetirContrasena.Text = "";
        }

        protected void txtRepetirContrasena_TextChanged(object sender, EventArgs e)
        {
            string contrasena = txtRepetirContrasena.Text;
            Session["ContrasenaAgregarUsuario"] = contrasena;
        }

        public void txtLecturaTrue()
        {
            txtNombre.ReadOnly = true;
            txtApellido.ReadOnly = true;
            txtDni.ReadOnly = true;
            txtDireccion.ReadOnly = true;
            txtCodigo.ReadOnly = true;
            txtNumero.ReadOnly = true;
            txtUsuario.ReadOnly = true;
            txtMail.ReadOnly = true;
            txtContrasena.ReadOnly = true;
            txtRepetirContrasena.ReadOnly = true;
        }

        public void txtLecturaFalse()
        {
            txtNombre.ReadOnly = false;
            txtApellido.ReadOnly = false;
            txtDni.ReadOnly = false;
            txtDireccion.ReadOnly = false;
            txtCodigo.ReadOnly = false;
            txtNumero.ReadOnly = false;
            txtUsuario.ReadOnly = false;
            txtMail.ReadOnly = false;
            txtContrasena.ReadOnly = false;
            txtRepetirContrasena.ReadOnly = false;
        }
    }
}