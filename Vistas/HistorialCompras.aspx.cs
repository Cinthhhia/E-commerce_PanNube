using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;
using System.Data.SqlClient;

namespace Vistas
{
    public partial class HistorialCompras : System.Web.UI.Page
    {
        Usuario usu = new Usuario();
        NegocioVentas neg = new NegocioVentas();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTabla();
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
        public void CargarTabla()
        {
            usu = (Usuario)Session["Usuario"];
            int cod = Convert.ToInt32(usu.cod_Usuario);
            DataTable tablaProductos = neg.getTablaCompras(cod);
            gvHistorialCompras.DataSource = tablaProductos;
            gvHistorialCompras.DataBind();
        }
        public void cargarDdl()
        {
            SqlDataReader drEntrega = neg.cargarEntregas();
            SqlDataReader drPago = neg.cargarPagos();

            ddlTipoEntrega.DataSource = drEntrega;
            ddlTipoEntrega.DataTextField = "Nombre_TipoEntrega";
            ddlTipoEntrega.DataValueField = "Id_TipoEntrega";
            ddlTipoEntrega.DataBind();

            ddlMetPago.DataSource = drPago;
            ddlMetPago.DataTextField = "Nombre_MetodoPago";
            ddlMetPago.DataValueField = "Id_MetodoPago";
            ddlMetPago.DataBind();

            ListItem i;
            i = new ListItem("--Seleccionar--");
            ddlTipoEntrega.Items.Insert(0, i);
            ddlMetPago.Items.Insert(0, i);
        }
        public void VolverPaginaUno()
        {
            GridView gvHistorialCompras = (GridView)FindControl("gvHistorialCompras");

            if (gvHistorialCompras != null)
            {
                gvHistorialCompras.PageIndex = 0;
                CargarTabla();
            }
        }
        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();
            Session["TablaHistorialCompras"] = null;
            limpiarControles();
            CargarTabla();
        }
        public void limpiarControles()
        {
            txtCodCompra.Text = "";
            txtFechaDesde.Text = "";
            txtFechaHasta.Text = "";
            txtPrecio.Text = "";
            ddlTipoEntrega.SelectedIndex = 0;
            ddlMetPago.SelectedIndex = 0;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();

            bool aux = true;

            if (txtFechaDesde.Text == "" && txtFechaHasta.Text != "" || txtFechaDesde.Text != "" && txtFechaHasta.Text == "")
            {
                aux = false;
            }

            if (aux)
            {
                if (ddlFiltroPrecio.SelectedIndex == 0)
                {
                    cargarTablaFiltroPrecioIgual();
                    Session["TablaHistorialCompras"] = 0;
                }
                else if (ddlFiltroPrecio.SelectedIndex == 1)
                {
                    cargarTablaFiltroPrecioMayor();
                    Session["TablaHistorialCompras"] = 1;
                }
                else if (ddlFiltroPrecio.SelectedIndex == 2)
                {
                    cargarTablaFiltroPrecioMenor();
                    Session["TablaHistorialCompras"] = 2;
                }

                lblFechas.Text = "";
            }
            else
            {
                lblFechas.Text = "Complete los campos de fechas faltantes";
            }
        }
        public void cargarTablaFiltroPrecioIgual()
        {
            Venta ven = new Venta();
            ven = cargarDatosFiltrosObjVenta();
            var (fechaDesde, fechaHasta) = cargarDatosFiltrosFechas();
            SqlDataReader dr = neg.VentasPrecioIgual(ven, fechaDesde, fechaHasta);
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvHistorialCompras.DataSource = dt;
            gvHistorialCompras.DataBind();

        }
        public void cargarTablaFiltroPrecioMayor()
        {
            Venta ven = new Venta();
            ven = cargarDatosFiltrosObjVenta();
            var (fechaDesde, fechaHasta) = cargarDatosFiltrosFechas();
            SqlDataReader dr = neg.VentasPrecioMayor(ven, fechaDesde, fechaHasta);
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvHistorialCompras.DataSource = dt;
            gvHistorialCompras.DataBind();

        }

        public void cargarTablaFiltroPrecioMenor()
        {
            Venta ven = new Venta();
            ven = cargarDatosFiltrosObjVenta();
            var (fechaDesde, fechaHasta) = cargarDatosFiltrosFechas();
            SqlDataReader dr = neg.VentasPrecioMenor(ven, fechaDesde, fechaHasta);
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvHistorialCompras.DataSource = dt;
            gvHistorialCompras.DataBind();

        }
        public Venta cargarDatosFiltrosObjVenta()
        {
            Venta ven = new Venta();
            ven.cod_Usuario = usu.cod_Usuario;

            if (txtCodCompra.Text == "")
            {
                ven.cod_Venta = null;
            }
            else
            {
                ven.cod_Venta = Convert.ToInt32(txtCodCompra.Text);
            }
            if (txtPrecio.Text == "")
            {
                ven.total = null;
            }
            else
            {
                ven.total = Convert.ToDecimal(txtPrecio.Text);
            }
            if (ddlTipoEntrega.SelectedIndex == 0)
            {
                ven.id_TipoEntrega = null;
            }
            else
            {
                ven.id_TipoEntrega = Convert.ToInt32(ddlTipoEntrega.SelectedValue);
            }
            if (ddlMetPago.SelectedIndex == 0)
            {
                ven.id_MetodoPago = null;
            }
            else
            {
                ven.id_MetodoPago = Convert.ToInt32(ddlMetPago.SelectedValue);
            }

            return ven;
        }

        public (String, string) cargarDatosFiltrosFechas()
        {
            String fechaDesde, fechaHasta;
            if (txtFechaDesde.Text == "")
            {
                fechaDesde = null;
            }
            else
            {
                fechaDesde = txtFechaDesde.Text;
            }
            if (txtFechaHasta.Text == "")
            {
                fechaHasta = null;
            }
            else
            {
                fechaHasta = txtFechaHasta.Text;
            }

            return (fechaDesde, fechaHasta);
        }

        protected void lbRecibo_Click(object sender, EventArgs e)
        {
            LinkButton lbRecibo = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lbRecibo.NamingContainer;

            if (row != null)
            {
                Label lblCodProducto = (Label)row.FindControl("lblCodVentas");
                if (lblCodProducto != null)
                {
                    String CodVenta = lblCodProducto.Text;
                    Session["CodVenta"] = CodVenta;
                    Response.Redirect("DetalleCompra.aspx");
                }
            }
        }

        protected void gvHistorialCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvHistorialCompras.PageIndex = e.NewPageIndex;

            if (Session["TablaHistorialCompras"] != null)
            {
                int aux = Convert.ToInt32(Session["TablaHistorialCompras"]);

                if (aux == 0)
                {
                    cargarTablaFiltroPrecioIgual();
                }
                else if (aux == 1)
                {
                    cargarTablaFiltroPrecioMayor();
                }
                else if (aux == 2)
                {
                    cargarTablaFiltroPrecioMenor();
                }
            }
            else
            {
                CargarTabla();
            }
        }
    }
}