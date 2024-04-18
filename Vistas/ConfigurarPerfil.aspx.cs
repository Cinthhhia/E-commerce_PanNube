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
    public partial class ConfigurarPerfil : System.Web.UI.Page
    {
        NegocioUsuario neg = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usu = new Usuario();
            if (!IsPostBack)
            {
                if (Session["LogoUsuario"] != null)
                {
                    string rutaLogo = Session["LogoUsuario"].ToString();
                    imgUsuario.ImageUrl = rutaLogo;
                    imgUsuario.Visible = true;
                }

                if (Session["Usuario"] != null)
                {
                    usu = (Usuario)(Session["Usuario"]);
                    lblUsuarioLogeado.Text = usu.nombreUsuario;
                }
                txtNombre.Text = usu.nombre;
                txtApellido.Text = usu.apellido;
                txtDni.Text = usu.dni;
                txtDireccion.Text = usu.direccion;
                txtCodigo.Text = usu.codigoPostal;
                txtNumero.Text = usu.contacto;
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            lblMensajeConfirmar.Text = "¿Esta seguro/a de que desea actualizar su cuenta?";
            txtLecturaTrue();
            btnConfirmarActualizacion.Visible = true;
            btnCancelarActualizacion.Visible = true;
        }

        public int ObtenerCodUsuario()
        {
            if(Session["Usuario"] != null)
            {
                var usuarioLogeado = (Usuario)Session["Usuario"];
                return Convert.ToInt32(usuarioLogeado.cod_Usuario);
            }
            else
            {
                return -1;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Usuario usua = new Usuario();
            usua = (Usuario)(Session["Usuario"]);
            if (usua.id_TipoUsuario == 1)
            {
                Response.Redirect("PerfilAdministrador.aspx");
            }
            else
            {
                Response.Redirect("PerfilUsuario.aspx");
            }  
        }

        protected void btnEliminarCuenta_Click(object sender, EventArgs e)
        {
            lblMensajeEliminar.Text = "¿Esta seguro/a de que desea eliminar su cuenta?";
            btnConfirmarEliminar.Visible = true;
            btnCancelarEliminar.Visible = true;
        }

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            Usuario usu = new Usuario();
            if (Session["Usuario"] != null)
            {
                usu = (Usuario)(Session["Usuario"]);
                neg.eliminarUsuario(Convert.ToInt32(usu.cod_Usuario));

                Session["Usuario"] = null;
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnCancelarEliminar_Click(object sender, EventArgs e)
        {
            lblMensajeEliminar.Text = "";
            btnConfirmarEliminar.Visible = false;
            btnCancelarEliminar.Visible = false;
        }

        protected void lkbtnVolver_Click(object sender, EventArgs e)
        {
            Usuario usu = new Usuario();
            usu = (Usuario)(Session["Usuario"]);
            if (usu.id_TipoUsuario == 1)
            {
                Response.Redirect("PerfilAdministrador.aspx");
            }
            else
            {
                Response.Redirect("PerfilUsuario.aspx");
            }
        }

        
        protected void btnCancelarActualizacion_Click(object sender, EventArgs e)
        {
            lblMensajeConfirmar.Text = "";
            txtLecturaFalse();
            btnConfirmarActualizacion.Visible = false;
            btnCancelarActualizacion.Visible = false;
        }

        protected void btnConfirmarActualizacion_Click(object sender, EventArgs e)
        {
            int codUsuario = ObtenerCodUsuario();

            Usuario usuLog = (Usuario)(Session["Usuario"]);
            Usuario usu = new Usuario();

            usu.cod_Usuario = codUsuario;
            usu.nombre = txtNombre.Text;
            usu.apellido = txtApellido.Text;
            usu.dni = txtDni.Text;
            usu.direccion = txtDireccion.Text;
            usu.codigoPostal = txtCodigo.Text;
            usu.contacto = txtNumero.Text;
            usu.mail = usuLog.mail;
            usu.id_TipoUsuario = usuLog.id_TipoUsuario;
            usu.nombreUsuario = usuLog.nombreUsuario;

            bool aux = neg.actualizarPerfil(usu);

            if (aux)
            {
                if (Session["Usuario"] != null)
                {
                    Session["Usuario"] = usu;
                    lblMensaje.Text = "Su perfil ha sido actualziado con exito";
                }
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error al intentar actualizar su perfil";
            }

            btnConfirmarActualizacion.Visible = false;
            btnCancelarActualizacion.Visible = false;
            lblMensajeConfirmar.Text = "";
        }

        public void txtLecturaTrue()
        {
            txtApellido.ReadOnly = true;
            txtCodigo.ReadOnly = true;
            txtDireccion.ReadOnly = true;
            txtDni.ReadOnly = true;
            txtNombre.ReadOnly = true;
            txtNumero.ReadOnly = true;
        }

        public void txtLecturaFalse()
        {
            txtApellido.ReadOnly = false;
            txtCodigo.ReadOnly = false;
            txtDireccion.ReadOnly = false;
            txtDni.ReadOnly = false;
            txtNombre.ReadOnly = false;
            txtNumero.ReadOnly = false;
        }
    }
}