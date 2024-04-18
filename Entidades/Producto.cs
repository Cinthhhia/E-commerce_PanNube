using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Producto
    {
        private int cod_Producto;
        private String NombreProducto;
        private Categoria cod_categoria_prod = new Categoria();
        private bool sinTacc;
        private int stock;
        private decimal precioxUnidad;
        private bool estado;
        private String imagen;
      
        public Producto()
        {
        }

        public Producto(int cod_Producto, String NombreProducto, Categoria cod_categoria, bool sintacc, decimal precioxUnidad, bool estado, String imagen)
        {
            this.cod_Producto = cod_Producto;
            this.NombreProducto = NombreProducto;
            this.cod_categoria_prod = cod_categoria;
            this.sinTacc = sintacc;
            this.precioxUnidad = precioxUnidad;
            this.estado = estado;
            this.imagen = imagen;
        }

        public int Cod_Producto
        {
            get { return cod_Producto; }
            set { cod_Producto = value; }
        }

        public String nombreProducto
        {
            get { return NombreProducto; }
            set { NombreProducto = value; }
        }

        public int Cod_categoria_Prod
        {
            get { return cod_categoria_prod.Cod_Categoria; }
            set { cod_categoria_prod.Cod_Categoria= value; }
        }

        public bool SinTacc
        {
            get { return sinTacc; }
            set { sinTacc = value; }
        }

        public int Stock
        {
            get { return stock; }
            set { stock = value; }
        }

        public decimal PrecioxUnidad
        {
            get { return precioxUnidad; }
            set { precioxUnidad = value; }
        }

        public bool Estado
        {
            get { return estado; }
            set { estado = value; }
        }

        public String Imagen
        {
            get { return imagen; }
            set { imagen = value; }
        }
    }
}
