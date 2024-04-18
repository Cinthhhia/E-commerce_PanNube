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
    public partial class AgregarMetodoPago : System.Web.UI.Page
    {
        NegocioMetPago neg = new NegocioMetPago();
        Usuario usuLog = new Usuario();
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

        protected void btnAgregarMetPago_Click(object sender, EventArgs e)
        {
            MetodoPago met = new MetodoPago();
            met.nombreMetodoPago = txtNombre.Text;
            bool existe = neg.existeNombreMetPago(met);

            if (existe == true)
            {
                lblMensaje.Text = "No se ha podido completar la operación porque ese nombre ya existe";
            }
            else
            {
                lblMensaje.Text = "¿Esta seguro de que desea agregar este método de pago?";
                btnConfirmar.Visible = true;
                btnCancelar.Visible = true;
                txtNombre.ReadOnly = true;
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            MetodoPago met = new MetodoPago();
            met.nombreMetodoPago = txtNombre.Text;

            bool exito = neg.agregarMetPago(met);
            if (exito == true)
            {
                lblMensaje.Text = "Se ha podido agregar el método de pago con exito";
            }
            else
            {
                lblMensaje.Text = "Ha ocurrido un error a la hora de agregar el método de pago";
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