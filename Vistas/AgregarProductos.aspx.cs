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
    public partial class AgregarProductos : System.Web.UI.Page
    {
        NegocioProducto neg = new NegocioProducto();
        Usuario usuLog = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarCategorias();
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

        public void cargarCategorias()
        {
            DataTable dt = neg.getTablaCategoria();

            ddlCategorias.DataSource = dt;
            ddlCategorias.DataTextField = "Nombre_Ca";
            ddlCategorias.DataValueField = "CodCategoria_Ca";
            ddlCategorias.DataBind();

            ListItem i;
            i = new ListItem("--Seleccionar--");
            ddlCategorias.Items.Insert(0, i);
        }

        protected void btnAgregarProd_Click(object sender, EventArgs e)
        {
            Producto pro = new Producto();
            pro.nombreProducto = txtNombreProd.Text;
            bool existeYaEseProducto = neg.existeNombreProducto(pro);

            if (existeYaEseProducto == true)
            {
                lblMensaje.Text = "No se ha podido completar la operación porque ese nombre de producto ya existe";
            }
            else {
                lblMensaje.Text = "¿Esta seguro de que desea agregar este producto?";
                btnConfirmar.Visible = true;
                btnCancelar.Visible = true;
                txtLecturaTrue();
            }
          
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Producto pro = new Producto();
            pro.nombreProducto = txtNombreProd.Text;
            pro.Cod_categoria_Prod = Convert.ToInt32(ddlCategorias.SelectedValue);
            pro.SinTacc =Convert.ToBoolean(rblSinTacc.SelectedValue);
            pro.Stock = Convert.ToInt32(txtStock.Text);
            pro.PrecioxUnidad = Convert.ToDecimal(txtPxU.Text);
            pro.Estado = true;
            pro.Imagen = txtURLImagen.Text;

           bool exito= neg.agregarProducto(pro);
            if (exito == true)
            {
                lblMensaje.Text = "Se ha podido agregar el producto con éxito";
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error a la hora de agregar el producto";
            }
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            limpiarCampos();
            txtLecturaFalse();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Se ha cancelado la operación";
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            txtLecturaFalse();
        }

        public void limpiarCampos()
        {
            txtNombreProd.Text = "";
            ddlCategorias.SelectedIndex = 0;
            txtStock.Text = "";
            txtPxU.Text = "";
            txtURLImagen.Text = "";
        }

        public void txtLecturaTrue()
        {
            txtNombreProd.ReadOnly = true;
            txtPxU.ReadOnly = true;
            txtStock.ReadOnly = true;
            txtURLImagen.ReadOnly = true;
            rblSinTacc.Enabled = false;
            ddlCategorias.Enabled = false;
        }

        public void txtLecturaFalse()
        {
            txtNombreProd.ReadOnly = false;
            txtPxU.ReadOnly = false;
            txtStock.ReadOnly = false;
            txtURLImagen.ReadOnly = false;
            rblSinTacc.Enabled = true;
            ddlCategorias.Enabled = true;
        }

    }
}