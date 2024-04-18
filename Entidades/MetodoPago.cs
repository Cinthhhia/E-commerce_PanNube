using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class MetodoPago
    {
        private Nullable<int> Id_MetodoPago;
        private String NombreMetodoPago;
        private bool Estado;

        public MetodoPago()
        {
        }
        public Nullable<int> id_MetodoPago
        {
            get { return Id_MetodoPago; }
            set { Id_MetodoPago = value; }
        }
        public String nombreMetodoPago
        {
            get { return NombreMetodoPago; }
            set { NombreMetodoPago = value; }
        }
        public bool estado
        {
            get { return Estado; }
            set { Estado = value; }
        }
    }
}
