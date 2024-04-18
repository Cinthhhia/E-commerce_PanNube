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
    public partial class ConfiguracionMetodoPago : System.Web.UI.Page
    {
        NegocioMetPago neg = new NegocioMetPago();
        Usuario usuLog = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTabla();

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
        public void CargarTabla()
        {
            DataTable tablaCategorias = neg.getTablaMetPago();
            gvAgregarMetPago.DataSource = tablaCategorias;
            gvAgregarMetPago.DataBind();
        }

        protected void gvAgregarMetPago_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAgregarMetPago.EditIndex = e.NewEditIndex;

            if (Session["TablaBuscarMetPago"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvAgregarMetPago_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAgregarMetPago.EditIndex = -1;

            if (Session["TablaBuscarMetPago"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvAgregarMetPago_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String cod = ((Label)gvAgregarMetPago.Rows[e.RowIndex].FindControl("lblIdPago")).Text;
            String nombre = ((TextBox)gvAgregarMetPago.Rows[e.RowIndex].FindControl("txtPago")).Text;
            Label mensaje = (Label)gvAgregarMetPago.Rows[e.RowIndex].FindControl("lblMensajeNombre");
            String estado = ((RadioButtonList)gvAgregarMetPago.Rows[e.RowIndex].FindControl("rblEstado")).Text;

            MetodoPago met = new MetodoPago();
            met.id_MetodoPago = Convert.ToInt32(cod);
            met.nombreMetodoPago = nombre;
            met.estado = Convert.ToBoolean(estado);

            bool existe = neg.existeNombreMetPago(met); 

            if (existe == true)
            {
                mensaje.Text = "Ese nombre ya existe";
            }
            else
            {
                NegocioMetPago negmet = new NegocioMetPago();
                negmet.actualizarMetPago(met);

                gvAgregarMetPago.EditIndex = -1;

                if (Session["TablaBuscarMetPago"] != null)
                {
                    cargarTablaFiltro();
                }
                else
                {
                    CargarTabla();
                }
            }
        }

        protected void gvAgregarMetPago_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bool estado = Convert.ToBoolean(((Label)gvAgregarMetPago.Rows[e.RowIndex].FindControl("lblEstado")).Text);

            if (estado == true)
            {
                lblMensaje.Text = "¿Está seguro/a de que desea eliminar este registro?";
                btnCancelar.Visible = true;
                btnConfirmar.Visible = true;
                int Cod = Convert.ToInt32(((Label)gvAgregarMetPago.Rows[e.RowIndex].FindControl("lblIdPago")).Text);
                Session["CodMetPago"] = Cod;
            }
            else
            {
                lblMensaje.Text = "Ese registro ya ha sido eliminado";
            }

        }

        protected void gvAgregarMetPago_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {

                    RadioButtonList rblEstado = (RadioButtonList)e.Row.FindControl("rblEstado");
                    String lblEstado = ((Label)e.Row.FindControl("lblEstado")).Text.Trim();

                    rblEstado.SelectedValue = lblEstado;

                }
            }
        }
        public void VolverPaginaUno()
        {
            GridView gvAgregarMetPago = (GridView)FindControl("gvAgregarMetPago");

            if (gvAgregarMetPago != null)
            {
                gvAgregarMetPago.PageIndex = 0;
                CargarTabla();
            }
        }
        protected void gvAgregarMetPago_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvAgregarMetPago.EditIndex == -1)
            {
                gvAgregarMetPago.PageIndex = e.NewPageIndex;

                if (Session["TablaBuscarMetPago"] != null)
                {
                    cargarTablaFiltro();
                }
                else
                {
                    CargarTabla();
                }
            }
            else
            {
                gvAgregarMetPago.PageIndex = gvAgregarMetPago.EditIndex;
            }
        }
        public void cargarTablaFiltro()
        {
            String nombre = txtFiltroBuscar.Text;

            DataTable dt = neg.getTablaMetPagoFiltroBuscar(nombre);

            gvAgregarMetPago.DataSource = dt;
            gvAgregarMetPago.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();

            cargarTablaFiltro();

            Session["TablaBuscarMetPago"] = true;
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();
            Session["TablaBuscarMetPago"] = null;
            txtFiltroBuscar.Text = "";
            CargarTabla();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            int CodMetPago = Convert.ToInt32(Session["CodMetPago"]);

            bool exito = neg.eliminarMetPago(CodMetPago);
            if (exito == true)
            {
                lblMensaje.Text = "Registro eliminado con exito";
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error a la hora de eliminar el registro";
            }

            if (Session["TablaBuscarMetPago"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }

            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
        }
    }
}