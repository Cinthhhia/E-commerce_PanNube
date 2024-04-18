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
    public partial class ConfiguracionUsuarios : System.Web.UI.Page
    {
        NegocioUsuario neg = new NegocioUsuario();
        Usuario usuLog = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                usuLog = (Usuario)Session["Usuario"];
                lblUsuarioLogeado.Text = usuLog.nombreUsuario;
            }

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
        }

        public void CargarTabla()
        {
            DataTable tablaCategorias = neg.getTablaUsuarios(usuLog.nombreUsuario);
            gvConfUsuarios.DataSource = tablaCategorias;
            gvConfUsuarios.DataBind();
        }

        protected void gvConfUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvConfUsuarios.EditIndex = e.NewEditIndex;

            if (Session["TablaBuscarUsu"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvConfUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvConfUsuarios.EditIndex = -1;

            if (Session["TablaBuscarUsu"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvConfUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bool estado = Convert.ToBoolean(((Label)gvConfUsuarios.Rows[e.RowIndex].FindControl("lblEstadoU")).Text);

            if (estado == true)
            {
                lblMensaje.Text = "¿Está seguro/a de que desea eliminar este registro?";
                btnCancelar.Visible = true;
                btnConfirmar.Visible = true;
                int CodUsuario = Convert.ToInt32(((Label)gvConfUsuarios.Rows[e.RowIndex].FindControl("lblIdUsuario")).Text);
                Session["CodUsuario"] = CodUsuario;
            }
            else
            {
                lblMensaje.Text = "Ese registro ya ha sido eliminado";
            }
        }

        protected void gvConfUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String Codusuario = ((Label)gvConfUsuarios.Rows[e.RowIndex].FindControl("lblIdUsuario")).Text;
            String Nombre = ((TextBox)gvConfUsuarios.Rows[e.RowIndex].FindControl("txtNombreUsuario")).Text;
            String Apellido = ((TextBox)gvConfUsuarios.Rows[e.RowIndex].FindControl("txtApellidoUsuario")).Text;
            String CodigoPostal = ((TextBox)gvConfUsuarios.Rows[e.RowIndex].FindControl("txtCodigoPostal")).Text;
            String Direccion = ((TextBox)gvConfUsuarios.Rows[e.RowIndex].FindControl("txtDireccion")).Text;
            String Contacto = ((TextBox)gvConfUsuarios.Rows[e.RowIndex].FindControl("txtContacto")).Text;
            String DNI = ((TextBox)gvConfUsuarios.Rows[e.RowIndex].FindControl("txtDNI")).Text;
            String TipoUsuario = ((RadioButtonList)gvConfUsuarios.Rows[e.RowIndex].FindControl("rblTipoUsuario")).Text;
            String estado = ((RadioButtonList)gvConfUsuarios.Rows[e.RowIndex].FindControl("rblEstado")).Text;

            Usuario usu = new Usuario();
            usu.cod_Usuario = Convert.ToInt32(Codusuario);
            usu.nombre = Nombre;
            usu.apellido = Apellido;
            usu.codigoPostal = CodigoPostal;
            usu.direccion = Direccion;
            usu.contacto = Contacto;
            usu.dni = DNI;
            usu.id_TipoUsuario = Convert.ToInt32(TipoUsuario);
            usu.Estado = Convert.ToBoolean(estado);

            NegocioUsuario usuario = new NegocioUsuario();
            usuario.actualizarUsuario(usu);

            gvConfUsuarios.EditIndex = -1;

            if (Session["TablaBuscarUsu"] != null)
            {
                cargarTablaFiltro();
            }
            else
            {
                CargarTabla();
            }
        }

        protected void gvConfUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvConfUsuarios.EditIndex == -1)
            {
                gvConfUsuarios.PageIndex = e.NewPageIndex;

                if (Session["TablaBuscarUsu"] != null)
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
                gvConfUsuarios.PageIndex = gvConfUsuarios.EditIndex;
            }
        }

        protected void gvConfUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    RadioButtonList rblTipoUsuario = (RadioButtonList)e.Row.FindControl("rblTipoUsuario");

                    String lblTipoUsuario = ((Label)e.Row.FindControl("lblTipoUsuario")).Text;

                    if (lblTipoUsuario.Trim() == "Cliente")
                    {
                        rblTipoUsuario.SelectedIndex = 1;
                    }
                    else
                    {
                        rblTipoUsuario.SelectedIndex = 0;
                    }

                    RadioButtonList rblEstado = (RadioButtonList)e.Row.FindControl("rblEstado");
                    String lblEstado = ((Label)e.Row.FindControl("lblEstado")).Text.Trim();

                    rblEstado.SelectedValue = lblEstado;

                }
            }
        }
        public void VolverPaginaUno()
        {
            GridView gvTablaProductos = (GridView)FindControl("gvConfUsuarios");

            if (gvTablaProductos != null)
            {
                gvTablaProductos.PageIndex = 0;
                CargarTabla();
            }
        }
        public void cargarTablaFiltro()
        {
            String nombre = txtFiltroBuscar.Text;

            DataTable dt = neg.getTablaUsuariosFiltroBuscar(nombre, usuLog.nombreUsuario);

            gvConfUsuarios.DataSource = dt;
            gvConfUsuarios.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();

            cargarTablaFiltro();

            Session["TablaBuscarUsu"] = true;
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            VolverPaginaUno();
            Session["TablaBuscarUsu"] = null;
            txtFiltroBuscar.Text = "";
            CargarTabla();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            int CodUsuario = Convert.ToInt32(Session["CodUsuario"]);

            bool exito = neg.eliminarUsuario(CodUsuario);    
            if (exito == true)
            {
                lblMensaje.Text = "Registro eliminado con exito";
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error a la hora de eliminar el registro";
            }

            if (Session["TablaBuscarUsu"] != null)
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