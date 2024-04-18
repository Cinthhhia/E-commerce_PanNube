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
    public partial class ConfiguracionProductos : System.Web.UI.Page
    {
        NegocioProducto neg = new NegocioProducto();
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
            DataTable tablaProductos = neg.getTablaProductos();
            gvTablaProductos.DataSource = tablaProductos;
            gvTablaProductos.DataBind();
        }

        protected void gvTablaProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTablaProductos.EditIndex = e.NewEditIndex;

            if (Session["TablaBuscarProd"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvTablaProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTablaProductos.EditIndex = -1;

            if (Session["TablaBuscarProd"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvTablaProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String CodProducto = ((Label)gvTablaProductos.Rows[e.RowIndex].FindControl("lblCodProducto")).Text;
            String nombreProducto = ((TextBox)gvTablaProductos.Rows[e.RowIndex].FindControl("txtNombreProducto")).Text;
            String CodCategoria = ((DropDownList)gvTablaProductos.Rows[e.RowIndex].FindControl("ddlCategorias")).Text;
            String sinTacc = ((RadioButtonList)gvTablaProductos.Rows[e.RowIndex].FindControl("rblSinTacc")).Text;
            String stock = ((TextBox)gvTablaProductos.Rows[e.RowIndex].FindControl("txtStock")).Text;
            String precio = ((TextBox)gvTablaProductos.Rows[e.RowIndex].FindControl("txtPrecio")).Text;
            String imagen = ((TextBox)gvTablaProductos.Rows[e.RowIndex].FindControl("txtImagen")).Text;
            Label mensaje = (Label)gvTablaProductos.Rows[e.RowIndex].FindControl("lblMensajeNombre");
            String estado = ((RadioButtonList)gvTablaProductos.Rows[e.RowIndex].FindControl("rblEstado")).Text;

            Producto pro = new Producto();
            pro.Cod_Producto = Convert.ToInt32(CodProducto);
            pro.nombreProducto = nombreProducto;
            pro.Cod_categoria_Prod = Convert.ToInt32(CodCategoria);
            pro.SinTacc = Convert.ToBoolean(sinTacc);
            pro.Stock = Convert.ToInt32(stock);
            pro.PrecioxUnidad = Convert.ToDecimal(precio);
            pro.Imagen = imagen;
            pro.Estado = Convert.ToBoolean(estado);

            bool existeYaEseProducto = neg.existeNombreProducto(pro);

            if (existeYaEseProducto == true)
            {
                mensaje.Text = "Ese nombre de producto ya existe";
            }
            else
            {
                NegocioProducto prod = new NegocioProducto();
                prod.actualizarProducto(pro);

                gvTablaProductos.EditIndex = -1;

                if (Session["TablaBuscarProd"] != null)
                {
                    cargarTablaFiltro();
                }
                else
                {
                    CargarTabla();
                }
            }
        }

        protected void gvTablaProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bool estado = Convert.ToBoolean(((Label)gvTablaProductos.Rows[e.RowIndex].FindControl("lblEstadoP")).Text);

            if (estado == true)
            {
                lblMensaje.Text = "¿Está seguro/a de que desea eliminar este registro?";
                btnCancelar.Visible = true;
                btnConfirmar.Visible = true;
                int CodProducto = Convert.ToInt32(((Label)gvTablaProductos.Rows[e.RowIndex].FindControl("lblCodProducto")).Text);
                Session["CodProducto"] = CodProducto;
            }
            else
            {
                lblMensaje.Text = "Ese registro ya ha sido eliminado";
            }
        }

        protected void gvTablaProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddl = (DropDownList)e.Row.FindControl("ddlCategorias");
                    DataTable dt = neg.getTablaCategoria();

                    ddl.DataSource = dt;
                    ddl.DataTextField = "Nombre_Ca";
                    ddl.DataValueField = "CodCategoria_Ca";
                    ddl.DataBind();
                    
                    ListItem i;
                    i = new ListItem("--Seleccionar--");
                    ddl.Items.Insert(0, i);

                    RadioButtonList rdlSinTacc = (RadioButtonList)e.Row.FindControl("rblSinTacc"); 

                    String SinTacc = ((Label)e.Row.FindControl("lblSinTacc")).Text;

                    if (SinTacc.Trim() == "True")
                    {
                        rdlSinTacc.SelectedIndex = 0;
                    }
                    else
                    {
                        rdlSinTacc.SelectedIndex = 1;
                    }

                    RadioButtonList rblEstado = (RadioButtonList)e.Row.FindControl("rblEstado");
                    String lblEstado = ((Label)e.Row.FindControl("lblEstado")).Text.Trim();

                    rblEstado.SelectedValue = lblEstado;
                }
            }
        }
        public void VolverPaginaUno()
        {
            GridView gvTablaProductos = (GridView)FindControl("gvTablaProductos");

            if (gvTablaProductos != null)
            {
                gvTablaProductos.PageIndex = 0;
                CargarTabla();
            }
        }
        protected void gvTablaProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvTablaProductos.EditIndex == -1)
            {
                gvTablaProductos.PageIndex = e.NewPageIndex;

                if (Session["TablaBuscarProd"] != null)
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
                gvTablaProductos.PageIndex = gvTablaProductos.EditIndex;
            }
        }
        public void cargarTablaFiltro()
        {
            String nombre = txtFiltroBuscar.Text;

            DataTable dt = neg.getTablaProductosFiltroBuscarConfiguracionProducto(nombre);

            gvTablaProductos.DataSource = dt;
            gvTablaProductos.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();

            cargarTablaFiltro();

            Session["TablaBuscarProd"] = true;
        }
        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();
            Session["TablaBuscarProd"] = null;
            txtFiltroBuscar.Text = "";
            CargarTabla();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            int CodProducto = Convert.ToInt32(Session["CodProducto"]);

            bool exito = neg.eliminarProducto(CodProducto);
            if (exito == true)
            {
                lblMensaje.Text = "Registro eliminado con exito";
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error a la hora de eliminar el registro";
            }

            if (Session["TablaBuscarProd"] != null)
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