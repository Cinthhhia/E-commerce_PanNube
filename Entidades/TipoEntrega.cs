using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class TipoEntrega
    {
        private Nullable<int> Id_TipoEntrega;
        private String NombreTipoEntrega;
        private bool Estado;

        public TipoEntrega()
        {
        }

        public Nullable<int> id_TipoEntrega
        {
            get { return Id_TipoEntrega; }
            set { Id_TipoEntrega = value; }
        }

        public String nombreTipoEntrega
        {
            get { return NombreTipoEntrega; }
            set { NombreTipoEntrega = value; }
        }
        public bool estado
        {
            get { return Estado; }
            set { Estado = value; }
        }
    }
}
