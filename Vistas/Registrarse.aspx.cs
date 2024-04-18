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
    public partial class Registrarse : System.Web.UI.Page
    {
        NegocioUsuario neg = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Usuario usu = new Usuario();
            usu.nombreUsuario = txtUsuario.Text;
            usu.mail = txtRepetirMail.Text;
            bool existeYaEseNombreUsuario = neg.existeNombreUsuario(usu);
            bool existeYaEseMailUsuario = neg.existeMailUsuario(usu);

            if (existeYaEseNombreUsuario == true)
            {
                lblMensaje.Text = "No se ha podido completar la operación porque ese nombre de usuario ya existe";
            }
            else if(existeYaEseMailUsuario == true)
            {
                lblMensaje.Text = "No se ha podido completar la operación porque el mail ingresado ya esta registrado";
            }
            else
            {
                lblMensaje.Text = "¿Está seguro/a de que desea crear una cuenta?";
                txtLecturaTrue();
                btnConfirmar.Visible = true;
                btnCancelar.Visible = true;
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
            usu.mail = txtRepetirMail.Text;
            usu.contrasena = Session["ContrasenaRegistrarUsuario"].ToString();
            usu.id_TipoUsuario = 2;

            bool exito = neg.agregarUsuario(usu);
            if (exito == true)
            {
                lblMensaje.Text = "Se ha podido crear la cuenta con éxito.\n Vuelva al Login y podrá ingresar a PanNube con su nueva cuenta";
            }
            else
            {
                lblMensaje.Text = "Lo sentimos, ha ocurrido un error a la hora de crear la cuenta";
            }
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            limpiarCampos();
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
            txtRepetirMail.Text = "";
            txtContrasena.Text = "";
            txtRepetirContrasena.Text = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Se ha cancelado la operación";
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            txtLecturaFalse();
        }

        protected void txtRepetirContrasena_TextChanged(object sender, EventArgs e)
        {
            string contrasena = txtRepetirContrasena.Text;
            Session["ContrasenaRegistrarUsuario"] = contrasena;
        }

        public void txtLecturaTrue()
        {
            txtApellido.ReadOnly = true;
            txtCodigo.ReadOnly = true;
            txtContrasena.ReadOnly = true;
            txtDireccion.ReadOnly = true;
            txtDni.ReadOnly = true;
            txtMail.ReadOnly = true;
            txtNombre.ReadOnly = true;
            txtNumero.ReadOnly = true;
            txtRepetirContrasena.ReadOnly = true;
            txtRepetirMail.ReadOnly = true;
            txtUsuario.ReadOnly = true;
        }

        public void txtLecturaFalse()
        {
            txtApellido.ReadOnly = false;
            txtCodigo.ReadOnly = false;
            txtContrasena.ReadOnly = false;
            txtDireccion.ReadOnly = false;
            txtDni.ReadOnly = false;
            txtMail.ReadOnly = false;
            txtNombre.ReadOnly = false;
            txtNumero.ReadOnly = false;
            txtRepetirContrasena.ReadOnly = false;
            txtRepetirMail.ReadOnly = false;
            txtUsuario.ReadOnly = false;
        }
    }
}