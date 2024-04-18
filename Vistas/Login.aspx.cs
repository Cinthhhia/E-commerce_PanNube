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
    public partial class Login1 : System.Web.UI.Page
    {
        NegocioUsuario neg = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            String usuario = txtUsuario.Text;
            String contrasena = txtContraseña.Text;

            Usuario usu = new Usuario();
            Usuario usulog;
            usu.nombreUsuario = usuario;
            usu.contrasena = contrasena;

            bool aux = neg.existeNombreUsuario(usu);
            bool estado = neg.usuarioLogeado(usu);

            if (!aux)
            {
                lblMensaje.Text = "Usuario ingresado no existe";
            }
            else if(estado)
            {
                usulog = neg.ObtenerUsuario(usuario);
                Session["Usuario"] = usulog;
                if (usulog.id_TipoUsuario == 1)
                {
                    string rutaLogo = "~/Imagenes/logoAdministrador.png";
                    Session["LogoUsuario"] = rutaLogo;
                }
                else
                {
                    string rutaLogo = "~/Imagenes/logoCliente.png";
                    Session["LogoUsuario"] = rutaLogo;
                }
                Response.Redirect("PaginaPrincipal.aspx");
            }
            else
            {
                lblMensaje.Text = "Contraseña Incorrecta";
            }
        }
    }
}