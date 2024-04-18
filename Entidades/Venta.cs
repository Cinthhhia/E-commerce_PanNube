using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Venta
    {
        private Nullable<int> Cod_Venta;
        private Usuario Cod_Usuario = new Usuario();
        private DateTime Fecha;
        private String Contacto;
        private TipoEntrega Id_TipoEntrega = new TipoEntrega();
        private String Direccion;
        private MetodoPago Id_MetodoPago = new MetodoPago();
        private Nullable<decimal> Total;
        private bool estado;

        public Venta()
        {
        }

        public Nullable<int> cod_Venta
        {
            get { return Cod_Venta; }
            set { Cod_Venta = value; }
        }
        public Nullable<int> cod_Usuario
        {
            get { return Cod_Usuario.cod_Usuario; }
            set { Cod_Usuario.cod_Usuario = value; }
        }
        public DateTime fecha
        {
            get { return Fecha; }
            set { Fecha = value; }
        }
        public String contacto
        {
            get { return Contacto; }
            set { Contacto = value; }
        }
        public Nullable<int> id_TipoEntrega
        {
            get { return Id_TipoEntrega.id_TipoEntrega; }
            set { Id_TipoEntrega.id_TipoEntrega = value; }
        }
        public String direccion
        {
            get { return Direccion; }
            set { Direccion = value; }
        }
        public Nullable<int> id_MetodoPago
        {
            get { return Id_MetodoPago.id_MetodoPago; }
            set { Id_MetodoPago.id_MetodoPago = value; }
        }
        public Nullable<decimal> total
        {
            get { return Total; }
            set { Total = value; }
        }
        public bool Estado
        {
            get { return estado; }
            set { estado = value; }
        }
    }
}
