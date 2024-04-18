using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data;
using System.Data.SqlClient;

namespace Negocio
{
    public class NegocioMetPago
    {
        DatosMetPago dato = new DatosMetPago();
        public DataTable getTablaMetPago()
        {
            return dato.getTablaMetPago();
        }
        public DataTable getTablaMetPagoFiltroBuscar(String nombre)
        {
            return dato.getTablaFiltroNombreMetPago(nombre);
        }

        public SqlDataReader cargarMetPago()
        {
            SqlDataReader dr = dato.obtenerMetPago();

            return dr;
        }
        public bool existeNombreMetPago(MetodoPago met)
        {
            if (dato.existeMetPago(met) == false)
            {
                return false;
            }
            else { return true; }
        }
        public bool eliminarMetPago(int cod)
        {
            MetodoPago met = new MetodoPago();
            met.id_MetodoPago = cod;
            int aux = dato.EliminarMetPago(met);
            if (aux == 1)
                return true;
            else
                return false;
        }

        public bool agregarMetPago(MetodoPago met)
        {
            int cantFilas = 0;

            if (dato.existeMetPago(met) == false)
            {
                cantFilas = dato.AgregarMetPago(met);
            }
            else { return false; }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool actualizarMetPago(MetodoPago met)
        {
            int aux = dato.ActualizarMetPago(met);
            if (aux == 1)
                return true;
            else
                return false;
        }
    }
}
