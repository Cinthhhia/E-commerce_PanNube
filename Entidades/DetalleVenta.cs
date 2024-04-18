using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleVenta
    {
        private Venta Cod_Venta = new Venta();
        private Producto Cod_Producto = new Producto();
        private decimal PrecioxUnidad;
        private int Cantidad;
        private bool estado;

        public DetalleVenta()
        {
        }
        public Nullable<int> cod_Venta
        {
            get { return Cod_Venta.cod_Venta; }
            set { Cod_Venta.cod_Venta = value; }
        }
        public int cod_Producto
        {
            get { return Cod_Producto.Cod_Producto; }
            set { Cod_Producto.Cod_Producto = value; }
        }
        public decimal precioxUnidad
        {
            get { return PrecioxUnidad; }
            set { PrecioxUnidad = value; }
        }
        public int cantidad
        {
            get { return Cantidad; }
            set { Cantidad = value; }
        }
        public bool Estado
        {
            get { return estado; }
            set { estado = value; }
        }
    }
}
