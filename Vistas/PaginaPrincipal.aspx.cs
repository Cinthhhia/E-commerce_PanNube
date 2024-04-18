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
    public partial class PaginaPrincipal : System.Web.UI.Page
    {
        NegocioProducto neg = new NegocioProducto();
        NegocioVentas negV = new NegocioVentas();
        NegocioUsuario negUsu = new NegocioUsuario();
        Usuario usu = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["LogoUsuario"] != null)
                {
                    string rutaLogo = Session["LogoUsuario"].ToString();
                    imgUsuario.ImageUrl = rutaLogo;
                    imgUsuario.Visible = true;
                }
                Session.Remove("TablaFiltro");
                Session.Remove("FiltroBuscar");
                CargarTabla();
                cargarDdl();
            }

            if (Session["Usuario"] != null)
            {
                usu = (Usuario)Session["Usuario"];
                lblUsuarioLogeado.Text = usu.nombreUsuario;
            }
        }

        public void CargarTabla()
        {
            DataTable tablaProductos = neg.getTablaProductosPaginaPrincipal();
            lvProductos.DataSource = tablaProductos;
            lvProductos.DataBind();
            foreach (ListViewItem item in lvProductos.Items)
            {
                Label lblCantidad = (Label)item.FindControl("lblStock");
                Label lblMensaje = (Label)item.FindControl("lblMensajeStock");

                int valor = Convert.ToInt32(lblCantidad.Text);

                if (valor == 0)
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No hay mas stock";
                }
            }
        }
        public void cargarDdl()
        {
            SqlDataReader drCategorias = negV.cargarCategorias();

            ddlCategorias.DataSource = drCategorias;
            ddlCategorias.DataTextField = "Nombre_Ca";
            ddlCategorias.DataValueField = "CodCategoria_Ca";
            ddlCategorias.DataBind();

            ListItem i;
            i = new ListItem("--Categorias--");
            ddlCategorias.Items.Insert(0, i);
        }

        protected void btnMenos_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoMenos")
            {
                int cantidad = 0;
                ListViewItem selectedItem = (ListViewItem)((Button)sender).NamingContainer;
                Label lblCantidad = (Label)selectedItem.FindControl("lblCantidad");
                Label lblMensaje = (Label)selectedItem.FindControl("lblMensajeStock");
                Label lblStock = (Label)selectedItem.FindControl("lblStock");
                lblMensaje.Text = "";

                cantidad = Convert.ToInt32(lblCantidad.Text);
                int stock = Convert.ToInt32(lblStock.Text);

                if (cantidad != 0)
                {
                    cantidad--;
                }
                else if (stock == 0)
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No hay mas stock";
                }

                lblCantidad.Text = cantidad.ToString();
                
               
                Session["cantidadProducto"] = cantidad.ToString();
                
            }
        }

        protected void btnMas_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoMas")
            {
                int cantidad = 0;
                ListViewItem selectedItem = (ListViewItem)((Button)sender).NamingContainer;
                Label lblCantidad = (Label)selectedItem.FindControl("lblCantidad");
                Label lblStock = (Label)selectedItem.FindControl("lblStock");
                Label lblMensaje = (Label)selectedItem.FindControl("lblMensajeStock");
                cantidad = Convert.ToInt32(lblCantidad.Text);
                int stock = Convert.ToInt32(lblStock.Text);

                if(cantidad < stock)
                {
                    cantidad++;
                    lblMensaje.Text = "";
                    lblMensaje.Visible = false;
                }
                else
                {
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "No hay mas stock"; 
                }

                lblCantidad.Text = cantidad.ToString();

                Session["cantidadProducto"] = cantidad.ToString();
            }
        }

        protected void btnSeleccionar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoSeleccionar")
            {
                String[] datos = e.CommandArgument.ToString().Split('-');

                String codProducto = datos[0];
                String nombreProducto = datos[1];
                String PrecioProducto = datos[2];
                String CantidadProducto;

                if (Session["cantidadProducto"] == null)
                {
                    CantidadProducto = "0";
                }
                else
                {
                    CantidadProducto = Session["cantidadProducto"].ToString();
                }
                if (CantidadProducto != "0")
                {
                    decimal subTotal = Convert.ToDecimal(PrecioProducto) * Convert.ToInt32(CantidadProducto);

                    

                    if (Session["tabla"] == null)
                    {
                        Session["tabla"] = crearTabla();
                    }

                    bool aux = false;
                    DataTable tabla = (DataTable)Session["tabla"];

                    if (tabla != null)
                    {
                        foreach (DataRow row in tabla.Rows)
                        {
                            string valorColumna1 = row["CODIGO"].ToString();
                            if (valorColumna1 == codProducto)
                            {
                                aux = true;
                            }
                        }
                    }

                    if (!aux)
                    {
                        agregarFila((DataTable)Session["tabla"], codProducto, nombreProducto, PrecioProducto, CantidadProducto, subTotal);
                        
                        if (Session["Total"] == null)
                        {
                            Session["Total"] = subTotal;
                        }
                        else
                        {
                            decimal exTotal = (decimal)Session["Total"];
                            Session["Total"] = exTotal + subTotal;
                        }
                    }
                }

                Session["cantidadProducto"] = null;
            }
        }

        public DataTable crearTabla()
        {
            DataTable dt = new DataTable();

            DataColumn columna = new DataColumn("CODIGO", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("NOMBRE", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("PRECIO", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("CANTIDAD", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("SUBTOTAL", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            return dt;
        }

        public void agregarFila(DataTable tabla, String codProducto, String nombreProducto, String PrecioProducto, String CantidadProducto, decimal subTotal)
        {
                DataRow[] vectorTabla = tabla.Select($"CODIGO = '{codProducto}'");

                if (vectorTabla.Length == 0)
                {
                    DataRow dr = tabla.NewRow();

                    dr["CODIGO"] = codProducto;
                    dr["NOMBRE"] = nombreProducto;
                    dr["PRECIO"] = PrecioProducto;
                    dr["CANTIDAD"] = CantidadProducto;
                    dr["SUBTOTAL"] = subTotal.ToString();

                    tabla.Rows.Add(dr);
                }
            
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Session.Remove("TablaFiltro");

            String nombre = txtFiltroBuscar.Text;

            VolverPaginaUno();

            lvProductos.DataSource = neg.getTablaProductosFiltroBuscar(nombre);
            Session["FiltroBuscar"] = neg.getTablaProductosFiltroBuscar(nombre);
            lvProductos.DataBind();
        }

        protected void lvProductos_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager dpControl = (DataPager)lvProductos.FindControl("lvProductosPager");

            dpControl.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

            if (Session["FiltroBuscar"] != null)
            {
                DataTable tablaBuscar = (DataTable)Session["FiltroBuscar"];

                lvProductos.DataSource = tablaBuscar;
                lvProductos.DataBind();
            }
            else if(Session["TablaFiltro"] != null)
            {
                DataTable tablaFiltros = (DataTable)Session["TablaFiltro"];

                lvProductos.DataSource = tablaFiltros;
                lvProductos.DataBind();
            }
            else
            {
                CargarTabla();
            }
        }

        public void VolverPaginaUno()
        {
            DataPager dpControl = (DataPager)lvProductos.FindControl("lvProductosPager");

            if (dpControl != null)
            {
                dpControl.SetPageProperties(0, dpControl.MaximumRows, false);
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            Session.Remove("FiltroBuscar");

            VolverPaginaUno();

            txtFiltroBuscar.Text = "";

            if (ddlRangoPrecios.SelectedIndex == 0)
            {
                cargarTablaFiltroProductoMenor(0);
            }
            else if (ddlRangoPrecios.SelectedIndex == 1)
            {
                cargarTablaFiltroProductoMenor(1000);
            }
            else if (ddlRangoPrecios.SelectedIndex == 2)
            {
                cargarTablaFiltroProductoMayor(1000);
            }
        }
        public void cargarTablaFiltroProductoMenor(decimal precio)
        {
            Producto pro = new Producto();
            pro = cargarDatosFiltros();
            DataTable dt = neg.FiltrarProductoMenor(pro, precio);
            Session["TablaFiltro"] = neg.FiltrarProductoMenor(pro, precio);
            lvProductos.DataSource = dt;
            lvProductos.DataBind();
        }

        public void cargarTablaFiltroProductoMayor(decimal precio)
        {
            Producto pro = new Producto();
            pro = cargarDatosFiltros();
            DataTable dt = neg.FiltrarProductoMayor(pro, precio);
            Session["TablaFiltro"] = neg.FiltrarProductoMayor(pro, precio);
            lvProductos.DataSource = dt;
            lvProductos.DataBind();
        }

        public Producto cargarDatosFiltros()
        {
            Producto pro = new Producto();

            if (ddlCategorias.SelectedIndex == 0)
            {
                pro.Cod_categoria_Prod = 0;
            }
            else
            {
                pro.Cod_categoria_Prod = Convert.ToInt32(ddlCategorias.SelectedValue);
            }
            if (!cbSinTacc.Checked)
            {
                pro.SinTacc = false;
            }
            else
            {
                pro.SinTacc = true;
            }

            return pro;
        }

        protected void lbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Session["tabla"] = null;
            Session["Total"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void lbPerfil_Click(object sender, EventArgs e)
        {
            usu = negUsu.ObtenerUsuario(usu.nombreUsuario);

            if (usu.id_TipoUsuario == 1)
            {
                Response.Redirect("PerfilAdministrador.aspx");
            }
            else
            {
                Response.Redirect("PerfilUsuario.aspx");
            }
        }

        protected void btnBorrarFiltros_Click(object sender, EventArgs e)
        {
            Session.Remove("TablaFiltro");
            Session.Remove("FiltroBuscar");
            VolverPaginaUno();
            CargarTabla();
            ddlCategorias.SelectedIndex = 0;
            ddlRangoPrecios.SelectedIndex = 0;
            cbSinTacc.Checked = false;
            txtFiltroBuscar.Text = "";
        }
    }
}