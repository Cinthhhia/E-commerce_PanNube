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
    public partial class CambiarContra : System.Web.UI.Page
    {
        NegocioUsuario neg = new NegocioUsuario();
        Usuario usu = new Usuario();
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
                usu = (Usuario)Session["Usuario"];
                lblUsuarioLogeado.Text = usu.nombreUsuario;
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            lblMensajeConfirmacion.Text = "¿Esta seguro/a de que desea actualizar su contraseña?";      
            btnAceptar.Visible = true;
            btnCancelarConfirmacion.Visible = true;
            btnConfirmar.Enabled = false;
            btnCancelar.Enabled = false;
        }
        public int ObtenerCodUsuario()
        {
            if (Session["Usuario"] != null)
            {
                Usuario usuarioLogeado = (Usuario)Session["Usuario"];
                return Convert.ToInt32(usuarioLogeado.cod_Usuario);
            }
            else
            {
                return -1;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConfigurarPerfil.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int codUsuario = ObtenerCodUsuario();

            Usuario usu = new Usuario();
            usu = (Usuario)(Session["Usuario"]);
            usu.cod_Usuario = codUsuario;
            usu.contrasena = Session["ContrasenaAgregarUsuario"].ToString();

            bool aux = neg.actualizarContra(usu);

            if (aux)
            {
                if (Session["Usuario"] != null)
                {
                    Session["Usuario"] = usu;
                    lblMensaje.Text = "Contraseña actualizada con exito";
                }
            }
            else
            {
                lblMensaje.Text = "Error";
            }
            btnConfirmar.Enabled = true;
            btnCancelar.Enabled = true;
            btnAceptar.Visible = false;
            btnCancelarConfirmacion.Visible = false;
            lblMensajeConfirmacion.Text = "";
        }

        protected void btnCancelarConfirmacion_Click(object sender, EventArgs e)
        {
            btnConfirmar.Enabled = true;
            btnCancelar.Enabled = true;
            lblMensajeConfirmacion.Text = "";
            btnAceptar.Visible = false;
            btnCancelarConfirmacion.Visible = false;
        }

        protected void txtRepetirContrasena_TextChanged(object sender, EventArgs e)
        {
            string contrasena = txtRepetirContrasena.Text;
            Session["ContrasenaAgregarUsuario"] = contrasena;
        }
    }
}