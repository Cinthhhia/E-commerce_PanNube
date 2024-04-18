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
    public partial class ConfiguracionCategorias : System.Web.UI.Page
    {
        NegocioCategoria neg = new NegocioCategoria();
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
            DataTable tablaCategorias = neg.getTablaCategoria();
            gvConfCat.DataSource = tablaCategorias;
            gvConfCat.DataBind();
        }

        protected void gvConfCat_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvConfCat.EditIndex = e.NewEditIndex;

            if (Session["TablaBuscarCat"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvConfCat_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvConfCat.EditIndex = -1;

            if (Session["TablaBuscarCat"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvConfCat_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String CodCategoria = ((Label)gvConfCat.Rows[e.RowIndex].FindControl("lblCodCategoria")).Text;
            String nombreCategoria = ((TextBox)gvConfCat.Rows[e.RowIndex].FindControl("txtNombreCategoria")).Text;
            Label mensaje = (Label)gvConfCat.Rows[e.RowIndex].FindControl("lblMensajeNombre");
            String estado = ((RadioButtonList)gvConfCat.Rows[e.RowIndex].FindControl("rblEstado")).Text;

            Categoria cat = new Categoria();
            cat.Cod_Categoria = Convert.ToInt32(CodCategoria);
            cat.NombreCategoria = nombreCategoria;
            cat.Estado = Convert.ToBoolean(estado);

            bool existeYaEsaCategoria = neg.existeNombreCategoria(cat);

            if (existeYaEsaCategoria == true)
            {
                mensaje.Text = "Ese nombre de producto ya existe";
            }
            else
            {
                NegocioCategoria categ = new NegocioCategoria();
                categ.actualizarCategoria(cat);

                gvConfCat.EditIndex = -1;

                if (Session["TablaBuscarCat"] != null)
                {
                    cargarTablaFiltro();
                }
                else
                {
                    CargarTabla();
                }
            }
        }

        protected void gvConfCat_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bool estado = Convert.ToBoolean(((Label)gvConfCat.Rows[e.RowIndex].FindControl("lblEstado")).Text);

            if (estado==true)
            {
                lblMensaje.Text = "¿Está seguro/a de que desea eliminar este registro?";
                btnCancelar.Visible = true;
                btnConfirmar.Visible = true;
                int CodCategoria = Convert.ToInt32(((Label)gvConfCat.Rows[e.RowIndex].FindControl("lblCodCategoria")).Text);
                Session["CodCategoria"] = CodCategoria;
            }
            else
            {
                lblMensaje.Text = "Ese registro ya ha sido eliminado";
            }

        }

        protected void gvConfCat_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    RadioButtonList rblEstado = (RadioButtonList)e.Row.FindControl("rblEstado");

                    String lblEstado = ((Label)e.Row.FindControl("lblEstado")).Text;

                    if (lblEstado.Trim() == "True")
                    {
                        rblEstado.SelectedIndex = 0;
                    }
                    else
                    {
                        rblEstado.SelectedIndex = 1;
                    }
                }
            }
        }
        public void VolverPaginaUno()
        {
            GridView gvConfCat = (GridView)FindControl("gvConfCat");

            if (gvConfCat != null)
            {
                gvConfCat.PageIndex = 0;
                CargarTabla();
            }
        }

        protected void gvConfCat_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if(gvConfCat.EditIndex == -1)
            {
                gvConfCat.PageIndex = e.NewPageIndex;

                if (Session["TablaBuscarCat"] != null)
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
                gvConfCat.PageIndex = gvConfCat.EditIndex;
            }  
        }
        public void cargarTablaFiltro()
        {
            String nombre = txtFiltroBuscar.Text;

            DataTable dt = neg.getTablaCategoriaFiltroBuscar(nombre);

            gvConfCat.DataSource = dt;
            gvConfCat.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();

            cargarTablaFiltro();

            Session["TablaBuscarCat"] = true;
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();
            Session["TablaBuscarCat"] = null;
            txtFiltroBuscar.Text = "";
            CargarTabla();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            int CodCategoria =Convert.ToInt32(Session["CodCategoria"]);

            bool exito = neg.eliminarCategoria(CodCategoria);
            if (exito == true)
            {
                lblMensaje.Text = "Registro eliminado con exito";
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error a la hora de eliminar el registro";
            }
            
            if (Session["TablaBuscarCat"] != null)
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