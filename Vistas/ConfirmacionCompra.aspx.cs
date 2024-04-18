using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vistas
{
    public partial class ConfirmacionCompra : System.Web.UI.Page
    {
        Usuario usu = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    usu = (Usuario)Session["Usuario"];
                    lblUsuarioLogeado.Text = usu.nombreUsuario;
                }

                if(Session["Compra"] != null)
                {
                    bool valor = Convert.ToBoolean(Session["Compra"]);

                    if (valor)
                    {
                        lblMensaje.Text = "¡¡¡COMPRA REALIZADA CON ÉXITO!!!";
                    }
                    else
                    {
                        lblMensaje.Text = "HUBO UN ERROR AL REALIZAR LA COMPRA";
                    }
                }
            }
        }
    }
}