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
    public partial class CarritoCompras : System.Web.UI.Page
    {
        Usuario usu = new Usuario();
        NegocioMetPago neg = new NegocioMetPago();
        NegocioVentas negV = new NegocioVentas();
        NegocioDetalleVenta negDV = new NegocioDetalleVenta();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarPagos();
                CargarTabla();

                if (Session["LogoUsuario"] != null)
                {
                    string rutaLogo = Session["LogoUsuario"].ToString();
                    imgUsuario.ImageUrl = rutaLogo;
                    imgUsuario.Visible = true;
                }

                if (Session["Total"] != null)
                {
                    lblTotal.Text = Session["Total"].ToString();
                }

                if (Session["Usuario"] != null)
                {
                    usu = (Usuario)Session["Usuario"];
                    lblUsuarioLogeado.Text = usu.nombreUsuario;
                }
            }
        }

        public void cargarPagos()
        {
            SqlDataReader drPago = neg.cargarMetPago();

            rblMetPago.DataSource = drPago;
            rblMetPago.DataTextField = "Nombre_MetodoPago";
            rblMetPago.DataValueField = "Id_MetodoPago";
            rblMetPago.DataBind();
        }

        public void CargarTabla()
        {
            if (Session["tabla"] != null)
            {
                gvCarrito.DataSource = (DataTable)Session["tabla"];
                gvCarrito.DataBind();
            }
        }

        protected void gvCarrito_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["tabla"] != null)
            {
                DataTable tabla = (DataTable)Session["tabla"];

                if (e.RowIndex >= 0 && e.RowIndex < tabla.Rows.Count)
                {
                    DataRow row = tabla.Rows[e.RowIndex];
                    decimal precio = Convert.ToDecimal(row[4]);
                    decimal precioTotal = Convert.ToDecimal(Session["Total"]);

                    precioTotal -= precio;
                    Session["Total"] = precioTotal;
                    lblTotal.Text = precioTotal.ToString();
                    tabla.Rows.RemoveAt(e.RowIndex);

                    Session["tabla"] = tabla;

                    CargarTabla();
                }
            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            if(gvCarrito.Rows.Count > 0)
            {
                lblMensaje.Text = "¿Esta seguro de que desea realizar la compra?";
                btnConfirmar.Visible = true;
                btnCancelarConfirmacion.Visible = true;
                rblMetPago.Enabled = false;
                rblTipoEntrega.Enabled = false;
            }
            else
            {
                lblMensaje.Text = "No se puede realizar la compra porque no se han seleccionado productos";
            }
        }

        protected void btnCancelarConfirmacion_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Se ha cancelado la operación";
            btnConfirmar.Visible = false;
            btnCancelarConfirmacion.Visible = false;
            rblMetPago.Enabled = true;
            rblTipoEntrega.Enabled = true;
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (gvCarrito.Rows.Count > 0)
            {
                Venta ven = new Venta();
                Usuario usuVen = new Usuario();
                usuVen = (Usuario)Session["Usuario"];
                ven.cod_Usuario = usuVen.cod_Usuario;
                ven.id_TipoEntrega = Convert.ToInt32(rblTipoEntrega.SelectedValue);
                ven.id_MetodoPago = Convert.ToInt32(rblMetPago.SelectedValue);
                ven.total = Convert.ToDecimal(lblTotal.Text);

                bool exito = negV.agregarVenta(ven);

                if (Session["Compra"] == null)
                {
                    Session["Compra"] = exito;
                }

                 foreach (GridViewRow row in gvCarrito.Rows)
                 {
                     string codigoProducto = row.Cells[1].Text;
                     string precioUnidad = row.Cells[3].Text;
                     string cantidad = row.Cells[4].Text;

                     Producto pro = new Producto();
                     pro.Cod_Producto = Convert.ToInt32(codigoProducto);

                     DetalleVenta DV = new DetalleVenta();
                     DV.cod_Producto = pro.Cod_Producto;
                     DV.precioxUnidad = Convert.ToDecimal(precioUnidad);
                     DV.cantidad = Convert.ToInt32(cantidad);
                     negDV.agregarDetalleDeVenta(DV);

                 }

                btnConfirmar.Visible = false;
                btnCancelarConfirmacion.Visible = false;

                Session["Total"] = null;
                Session["tabla"] = null;

                Response.Redirect("ConfirmacionCompra.aspx");
            }
            else
            {
                lblMensaje.Text = "No se ha podido realizar la compra porque se han eliminado los productos";
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session["Total"] = null;
            Session["tabla"] = null;

            Response.Redirect("PaginaPrincipal.aspx");
        }
    }
}