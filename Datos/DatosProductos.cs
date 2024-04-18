using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{ 
    public class DatosProductos
    {
        AccesoDatos ds = new AccesoDatos();
        public DataTable getTablaProductos()
        {
            DataTable tabla = ds.ObtenerTabla("Productos", "select CodProducto_Pro, Nombre_Pro, CodCategoria_Pro, Nombre_Ca, SinTacc_Pro, Stock_Pro, PrecioUnitario_Pro, Imagen_Pro, Estado_Pro from Productos inner join Categorias on CodCategoria_Pro = CodCategoria_Ca");
            return tabla;
        }
        public DataTable getTablaProductosPaginaPrincipal()
        {
            DataTable tabla = ds.ObtenerTabla("Productos", "select CodProducto_Pro, Nombre_Pro, Nombre_Ca, SinTacc_Pro, Stock_Pro, PrecioUnitario_Pro, Estado_Pro, Imagen_Pro from Productos inner join Categorias on CodCategoria_Pro = CodCategoria_Ca where Estado_Pro=1");
            return tabla;
        }

        public DataTable getTablaFiltroNombreProducto(String nombre)
        {
            DataTable tabla = ds.ObtenerTabla("Productos", "select CodProducto_Pro, Nombre_Pro,CodCategoria_Pro, Nombre_Ca, SinTacc_Pro, Stock_Pro, PrecioUnitario_Pro, Estado_Pro, Imagen_Pro from Productos inner join Categorias on CodCategoria_Pro = CodCategoria_Ca where Estado_Pro = 1 AND Nombre_Pro like '" + nombre + "%'");
            return tabla;
        }
        public DataTable getTablaFiltroNombreProductoTrueYFalse(String nombre)
        {
            DataTable tabla = ds.ObtenerTabla("Productos", "select CodProducto_Pro, Nombre_Pro,CodCategoria_Pro, Nombre_Ca, SinTacc_Pro, Stock_Pro, PrecioUnitario_Pro, Estado_Pro, Imagen_Pro from Productos inner join Categorias on CodCategoria_Pro = CodCategoria_Ca where Nombre_Pro like '" + nombre + "%'");
            return tabla;
        }

        public DataTable getTablaCategorias()
        {
            DataTable tabla = ds.ObtenerTabla("Categorias", "Select CodCategoria_Ca, Nombre_Ca from Categorias where Estado_Ca=1");
            return tabla;
        }

        public Boolean existeProducto(Producto pro)
        {
            String consulta = "Select * from Productos where Nombre_Pro='" + pro.nombreProducto + "'" + "and CodProducto_Pro !='" + pro.Cod_Producto + "'";
            return ds.existe(consulta);
        }

        public int AgregarProducto(Producto pro)
        {
            pro.Cod_Producto = ds.ObtenerMaximo("SELECT COUNT(CodProducto_Pro) FROM Productos") + 1;
            SqlCommand comando = new SqlCommand();
            ParametrosProductoAgregar(ref comando, pro);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spAgregarProducto");
        }
        public int EliminarProducto(Producto pro)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosProuctoEliminar(ref comando, pro);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spEliminarProducto");
        }
        public int ActualizarProducto(Producto pro)
        {
            SqlCommand comando = new SqlCommand();
            ParametrosProductoActualizar(ref comando, pro);
            return ds.EjecutarProcedimientoAlmacenado(comando, "spActualizarProducto");
        }

        public DataTable FiltrarProductoMenorMil(Producto pro, decimal precio)
        {
            SqlCommand comando = new SqlCommand();
            
            ParametrosProductoFiltrar(ref comando, pro, precio);

            DataTable dt = new DataTable();
            dt.Load(ds.EjecutarConsultaYProcedimientoAlmacenado(comando, "spFiltrarProductoMenorMil"));
            return dt;
        }

        public DataTable FiltrarProductoMayorMil(Producto pro, decimal precio)
        {
            SqlCommand comando = new SqlCommand();

            ParametrosProductoFiltrar(ref comando, pro, precio);

            DataTable dt = new DataTable();
            dt.Load(ds.EjecutarConsultaYProcedimientoAlmacenado(comando, "spFiltrarProductoMayorMil"));
            return dt;
        }

        private void ParametrosProductoFiltrar(ref SqlCommand Comando, Producto pro, decimal precio)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODCATEGORIA", SqlDbType.Int);
            SqlParametros.Value = pro.Cod_categoria_Prod;
            SqlParametros = Comando.Parameters.Add("@SINTACC", SqlDbType.Bit);
            SqlParametros.Value = pro.SinTacc;
            SqlParametros = Comando.Parameters.Add("@PRECIO", SqlDbType.Decimal);
            SqlParametros.Value = precio;
        }

        private void ParametrosProductoAgregar(ref SqlCommand Comando, Producto pro)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@NOMBREPRODUCTO", SqlDbType.VarChar);
            SqlParametros.Value = pro.nombreProducto;
            SqlParametros = Comando.Parameters.Add("@CODCATEGORIA", SqlDbType.Int);
            SqlParametros.Value = pro.Cod_categoria_Prod;
            SqlParametros = Comando.Parameters.Add("@SINTACC", SqlDbType.Bit);
            SqlParametros.Value = pro.SinTacc;
            SqlParametros = Comando.Parameters.Add("@STOCK", SqlDbType.Int);
            SqlParametros.Value = pro.Stock;
            SqlParametros = Comando.Parameters.Add("@PRECIO", SqlDbType.Decimal);
            SqlParametros.Value = pro.PrecioxUnidad;
            SqlParametros = Comando.Parameters.Add("@ESTADO", SqlDbType.Bit);
            SqlParametros.Value = pro.Estado;
            SqlParametros = Comando.Parameters.Add("@IMAGEN", SqlDbType.VarChar);
            SqlParametros.Value = pro.Imagen;
        }

        private void ParametrosProductoActualizar(ref SqlCommand Comando, Producto pro)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODPRODUCTO", SqlDbType.Int);
            SqlParametros.Value = pro.Cod_Producto;
            SqlParametros = Comando.Parameters.Add("@NOMBREPRODUCTO", SqlDbType.VarChar);
            SqlParametros.Value = pro.nombreProducto;
            SqlParametros = Comando.Parameters.Add("@CODCATEGORIA", SqlDbType.Int);
            SqlParametros.Value = pro.Cod_categoria_Prod;
            SqlParametros = Comando.Parameters.Add("@SINTACC", SqlDbType.Bit);
            SqlParametros.Value = pro.SinTacc;
            SqlParametros = Comando.Parameters.Add("@STOCK", SqlDbType.Int);
            SqlParametros.Value = pro.Stock;
            SqlParametros = Comando.Parameters.Add("@PRECIO", SqlDbType.Decimal);
            SqlParametros.Value = pro.PrecioxUnidad;
            SqlParametros = Comando.Parameters.Add("@IMAGEN", SqlDbType.VarChar);
            SqlParametros.Value = pro.Imagen;
            SqlParametros = Comando.Parameters.Add("@ESTADOPROG", SqlDbType.Bit);
            SqlParametros.Value = pro.Estado;
        }

        private void ParametrosProuctoEliminar(ref SqlCommand Comando, Producto pro)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = Comando.Parameters.Add("@CODPRODUCTO", SqlDbType.Int);
            SqlParametros.Value = pro.Cod_Producto;
        }
    }
}
