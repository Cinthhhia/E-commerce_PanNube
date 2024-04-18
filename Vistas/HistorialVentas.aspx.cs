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
    public partial class HistorialVentas : System.Web.UI.Page
    {
        NegocioVentas neg = new NegocioVentas();
        Usuario usu = new Usuario();
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
            DataTable tablaProductos = neg.getTablaVentas();
            gvHistorialVentas.DataSource = tablaProductos;
            gvHistorialVentas.DataBind();
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
            GridView gvHistorialVentas = (GridView)FindControl("gvHistorialVentas");

            if (gvHistorialVentas != null)
            {
                gvHistorialVentas.PageIndex = 0;
                CargarTabla();
            }
        }

        protected void btnLimpiarFiltros_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();
            Session["TablaHistorialVentas"] = null;
            limpiarControles();
            CargarTabla();
        }

        public void limpiarControles()
        {
            txtCodVenta.Text = "";
            txtCodUsuario.Text = "";
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

            if(txtFechaDesde.Text == "" && txtFechaHasta.Text != "" || txtFechaDesde.Text != "" && txtFechaHasta.Text == "")
            {
                aux = false;
            }

            if (aux)
            {
                if (ddlFiltroPrecio.SelectedIndex == 0)
                {
                    cargarTablaFiltroPrecioIgual();
                    Session["TablaHistorialVentas"] = 0;
                }
                else if (ddlFiltroPrecio.SelectedIndex == 1)
                {
                    cargarTablaFiltroPrecioMayor();
                    Session["TablaHistorialVentas"] = 1;
                }
                else if (ddlFiltroPrecio.SelectedIndex == 2)
                {
                    cargarTablaFiltroPrecioMenor();
                    Session["TablaHistorialVentas"] = 2;
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
            gvHistorialVentas.DataSource = dt;
            gvHistorialVentas.DataBind();
        }
        public void cargarTablaFiltroPrecioMayor()
        {
            Venta ven = new Venta();
            ven = cargarDatosFiltrosObjVenta();
            var (fechaDesde, fechaHasta) = cargarDatosFiltrosFechas();
            SqlDataReader dr = neg.VentasPrecioMayor(ven, fechaDesde, fechaHasta);
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvHistorialVentas.DataSource = dt;
            gvHistorialVentas.DataBind();
        }
        public void cargarTablaFiltroPrecioMenor()
        {
            Venta ven = new Venta();
            ven = cargarDatosFiltrosObjVenta();
            var (fechaDesde, fechaHasta) = cargarDatosFiltrosFechas();
            SqlDataReader dr = neg.VentasPrecioMenor(ven, fechaDesde, fechaHasta);
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvHistorialVentas.DataSource = dt;
            gvHistorialVentas.DataBind();
        }
        public Venta cargarDatosFiltrosObjVenta()
        {
            Venta ven = new Venta();

            if (txtCodVenta.Text == "")
            {
                ven.cod_Venta = null;
            }
            else
            {
                ven.cod_Venta = Convert.ToInt32(txtCodVenta.Text);
            }
            if (txtCodUsuario.Text == "")
            {
                ven.cod_Usuario = null;
            }
            else
            {
                ven.cod_Usuario = Convert.ToInt32(txtCodUsuario.Text);
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
        protected void gvHistorialVentas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvHistorialVentas.PageIndex = e.NewPageIndex;

            if (Session["TablaHistorialVentas"] != null)
            {
                int aux = Convert.ToInt32(Session["TablaHistorialVentas"]);

                if(aux == 0)
                {
                    cargarTablaFiltroPrecioIgual();
                }
                else if(aux == 1)
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