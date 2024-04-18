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
    public partial class PerfilAdministrador : System.Web.UI.Page
    {
        NegocioUsuario neg = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogoUsuario"] != null)
            {
                string rutaLogo = Session["LogoUsuario"].ToString();
                imgUsuario.ImageUrl = rutaLogo;
                imgUsuario.Visible = true;
            }

            Usuario usu = new Usuario();
            usu = (Usuario)(Session["Usuario"]);

            lblUsuarioLogeado.Text = usu.nombreUsuario;
            lblNombre.Text = usu.nombre;
            lblApellido.Text = usu.apellido;
            lblDni.Text = usu.dni;
            lblDireccion.Text = usu.direccion;
            lblCodigo.Text = usu.codigoPostal;
            lblNumero.Text = usu.contacto;
            lblUsuario.Text = usu.nombreUsuario;
            lblMail.Text = usu.mail;
        }

        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Session["tabla"] = null;
            Session["Total"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}