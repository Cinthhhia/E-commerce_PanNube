using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class AgregarCategoria : System.Web.UI.Page
    {
        Usuario usuLog = new Usuario();
        NegocioCategoria neg = new NegocioCategoria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LogoUsuario"] != null)
            {
                string rutaLogo = Session["LogoUsuario"].ToString();
                imgUsuario.ImageUrl = rutaLogo;
                imgUsuario.Visible = true;
            }
            if (Session["Usuario"] != null)
            {
                usuLog = (Usuario)Session["Usuario"];
                lblUsuarioLogeado.Text = usuLog.nombreUsuario;
            }
        }

        protected void btnAgregarCat_Click(object sender, EventArgs e)
        {
            Categoria cat = new Categoria();
            cat.NombreCategoria = txtNombre.Text;
            bool existeYaEsaCategoria = neg.existeNombreCategoria(cat);

            if (existeYaEsaCategoria == true)
            {
                lblMensaje.Text = "No se ha podido completar la operación porque ese nombre de categoria ya existe";
            }
            else
            {
                lblMensaje.Text = "¿Esta seguro de que desea agregar esta categoría?";
                btnConfirmar.Visible = true;
                btnCancelar.Visible = true;
                txtNombre.ReadOnly = true;
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            Categoria cat = new Categoria();
            cat.NombreCategoria = txtNombre.Text;
     
            bool exito = neg.agregarCategoria(cat);
            if (exito == true)
            {
                lblMensaje.Text = "Se ha podido agregar la categoría con éxito";
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error a la hora de agregar la categoría";
            }

            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            txtNombre.Text = "";
            txtNombre.ReadOnly = false;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "Se ha cancelado la operación";
            btnConfirmar.Visible = false;
            btnCancelar.Visible = false;
            txtNombre.ReadOnly = false;
        }
    }
}