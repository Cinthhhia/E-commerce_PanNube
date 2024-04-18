using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

namespace Vistas
{
    public partial class DetalleCompra : System.Web.UI.Page
    {
        NegocioDetalleVenta neg = new NegocioDetalleVenta();
        Usuario usuLog = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            String codVenta = "";

            if (Session["CodVenta"] != null)
            {
                codVenta = Session["CodVenta"].ToString();
            }

            if (Session["Usuario"] != null)
            {
                usuLog = (Usuario)Session["Usuario"];
                lblUsuarioLogeado.Text = usuLog.nombreUsuario;
            }

            if (!IsPostBack)
            {
                CargarTabla(codVenta);
                if (Session["LogoUsuario"] != null)
                {
                    string rutaLogo = Session["LogoUsuario"].ToString();
                    imgUsuario.ImageUrl = rutaLogo;
                    imgUsuario.Visible = true;
                }
            }
        }
        public void CargarTabla(String codVenta)
        {
            DataTable tablaRecibo = neg.getTablaDetalleVenta(codVenta);
            gvRecibo.DataSource = tablaRecibo;
            gvRecibo.DataBind();
        }

        protected void lblVolver_Click(object sender, EventArgs e)
        {
            Usuario usu = new Usuario();
            usu = (Usuario)(Session["Usuario"]);
            if (usu.id_TipoUsuario == 1)
            {
                Response.Redirect("HistorialVentas.aspx");
            }
            else
            {
                Response.Redirect("HistorialCompras.aspx");
            }
        }
    }
}