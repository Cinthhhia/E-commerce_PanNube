using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data.SqlClient;

namespace Vistas
{
    public partial class ReportesCliente : System.Web.UI.Page
    {
        NegocioVentas neg = new NegocioVentas();
        Usuario usu = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDdl();

                if (Session["LogoUsuario"] != null)
                {
                    string rutaLogo = Session["LogoUsuario"].ToString();
                    imgUsuario.ImageUrl = rutaLogo;
                    imgUsuario.Visible = true;
                }
            }

            if (Session["Usuario"] != null)
            {
                usu = (Usuario)Session["Usuario"];
                lblUsuarioLogeado.Text = usu.nombreUsuario;
            }
        }

        public void cargarDdl()
        {
            SqlDataReader drCategoria = neg.cargarCategorias();

            ddlCategoria.DataSource = drCategoria;
            ddlCategoria.DataTextField = "Nombre_Ca";
            ddlCategoria.DataValueField = "CodCategoria_Ca";
            ddlCategoria.DataBind();

            ListItem i;
            i = new ListItem("--Seleccionar--");
            ddlCategoria.Items.Insert(0, i);
            ddlProducto.Items.Insert(0, i);
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            String cat = ddlCategoria.SelectedValue;
            SqlDataReader drProducto = neg.cargarProductos(cat);
            ddlProducto.DataSource = drProducto;
            ddlProducto.DataTextField = "Nombre_Pro";
            ddlProducto.DataValueField = "CodProducto_Pro";
            ddlProducto.DataBind();

            ListItem i;
            i = new ListItem("--Seleccionar--");
            ddlProducto.Items.Insert(0, i);
        }

        protected void btnLimparFiltros_Click(object sender, EventArgs e)
        {
            lblTotalProducto.Text = "0";
            lblTotalRangoFecha.Text = "0";
   
            txtFechaDesde.Text = "";
            txtFechaHasta.Text = "";

            ddlCategoria.SelectedIndex = 0;
            ddlProducto.SelectedIndex = 0;
        }

        protected void btnProducto_Click(object sender, EventArgs e)
        {
            String codPro = ddlProducto.SelectedValue;
            String codCliente = usu.cod_Usuario.ToString();

            decimal total = neg.obtenerProductosClientes(codPro, codCliente);

            lblTotalProducto.Text = Convert.ToString(total);
        }

        protected void btnFecha_Click(object sender, EventArgs e)
        {
            String fechaDesde = txtFechaDesde.Text;
            String fechaHasta = txtFechaHasta.Text;
            String codCliente = usu.cod_Usuario.ToString();

            decimal total = neg.ObtenerTotalFechasCliente(fechaDesde, fechaHasta, codCliente);

            lblTotalRangoFecha.Text = Convert.ToString(total);
        }
    }
}