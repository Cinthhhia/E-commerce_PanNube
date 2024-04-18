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
    public partial class ReportesAdministrador : System.Web.UI.Page
    {
        NegocioVentas neg = new NegocioVentas();
        NegocioDetalleVenta negDV = new NegocioDetalleVenta();
        Usuario usuLog = new Usuario();
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
                usuLog = (Usuario)Session["Usuario"];
                lblUsuarioLogeado.Text = usuLog.nombreUsuario;
            }
        }

        public void cargarDdl()
        {
            SqlDataReader drEntrega = neg.cargarEntregas();
            SqlDataReader drPago = neg.cargarPagos();
            SqlDataReader drCategoriaPro = neg.cargarCategorias();
            SqlDataReader drCategoria = neg.cargarCategorias();

            ddlTipoEntrega.DataSource = drEntrega;
            ddlTipoEntrega.DataTextField = "Nombre_TipoEntrega";
            ddlTipoEntrega.DataValueField = "Id_TipoEntrega";
            ddlTipoEntrega.DataBind();

            ddlMetPago.DataSource = drPago;
            ddlMetPago.DataTextField = "Nombre_MetodoPago";
            ddlMetPago.DataValueField = "Id_MetodoPago";
            ddlMetPago.DataBind();

            ddlCategoriaPro.DataSource = drCategoriaPro;
            ddlCategoriaPro.DataTextField = "Nombre_Ca";
            ddlCategoriaPro.DataValueField = "CodCategoria_Ca";
            ddlCategoriaPro.DataBind();

            ddlCategoria.DataSource = drCategoria;
            ddlCategoria.DataTextField = "Nombre_Ca";
            ddlCategoria.DataValueField = "CodCategoria_Ca";
            ddlCategoria.DataBind();

            ListItem i;
            i = new ListItem("--Seleccionar--");
            ddlTipoEntrega.Items.Insert(0, i);
            ddlMetPago.Items.Insert(0, i);
            ddlCategoriaPro.Items.Insert(0, i);
            ddlProducto.Items.Insert(0, i);
            ddlCategoria.Items.Insert(0, i);
        }
        

        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            lblCodigo.Text = "0";
            lblCategoria.Text = "0";
            lblProducto.Text = "0";
            lblFecha.Text = "0";
            lblEntrega.Text = "0";
            lblPago.Text = "0";

            txtCodUsuario.Text = "";
            txtFechaDesde.Text = "";
            txtFechaEntrega.Text = "";

            ddlCategoria.SelectedIndex = 0;
            ddlCategoriaPro.SelectedIndex = 0;
            ddlProducto.SelectedIndex = 0;
            ddlTipoEntrega.SelectedIndex = 0;
            ddlMetPago.SelectedIndex = 0;
        }

        protected void ddlCategoriaPro_SelectedIndexChanged(object sender, EventArgs e)
        {
            String cat = ddlCategoriaPro.SelectedValue;
            SqlDataReader drProducto = neg.cargarProductos(cat);
            ddlProducto.DataSource = drProducto;
            ddlProducto.DataTextField = "Nombre_Pro";
            ddlProducto.DataValueField = "CodProducto_Pro";
            ddlProducto.DataBind();

            ListItem i;
            i = new ListItem("--Seleccionar--");
            ddlProducto.Items.Insert(0, i);
        }

        protected void btnAceptarCodigo_Click(object sender, EventArgs e)
        {
            String cod = txtCodUsuario.Text;

            decimal total = neg.ObtenerTotalUsuario(cod);

            lblCodigo.Text = Convert.ToString(total);
        }

        protected void btnAceptarCatgoria_Click(object sender, EventArgs e)
        {
            String cod = ddlCategoria.SelectedValue;

            decimal total = negDV.ObtenerTotalCategoria(cod);

            lblCategoria.Text = Convert.ToString(total);
        }

        protected void btnAceptarProducto_Click(object sender, EventArgs e)
        {
            String cod = ddlProducto.SelectedValue;

            decimal total = negDV.ObtenerTotalProducto(cod);

            lblProducto.Text = Convert.ToString(total);
        }

        protected void btnAceptarFecha_Click(object sender, EventArgs e)
        {
            String fechaDesde = txtFechaDesde.Text;
            String fechaHasta = txtFechaEntrega.Text;

            decimal total = neg.ObtenerTotalFechasAdministrador(fechaDesde,fechaHasta);

            lblFecha.Text = Convert.ToString(total);
        }

        protected void btnAceptarEntrega_Click(object sender, EventArgs e)
        {
            String cod = ddlTipoEntrega.SelectedValue;

            decimal total = neg.ObtenerTotalEntrega(cod);

            lblEntrega.Text = Convert.ToString(total);
        }

        protected void btnAceptarPago_Click(object sender, EventArgs e)
        {
            String cod = ddlMetPago.SelectedValue;

            decimal total = neg.ObtenerTotalMetPago(cod);

            lblPago.Text = Convert.ToString(total);
        }
    }
}
