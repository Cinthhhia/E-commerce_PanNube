<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaPrincipal.aspx.cs" Inherits="Vistas.PaginaPrincipal" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 193px;
        }
        .auto-style5 {
            width: 193px;
            height: 34px;
        }
        .auto-style6 {
            width: 316px;
            height: 34px;
        }
        .auto-style7 {
            height: 34px;
            text-align: left;
        }
        .auto-style15 {
            width: 316px;
        }
        .auto-style19 {
            text-align: center;
        }
        .auto-style20 {
            font-size: large;
        }
        </style>
</head>
<body>
    <form id="form1" class="pagina-principal" runat="server">
        <div class="centrado">
            <table>
                <tr>
                    <td class="auto-style5">
                        <asp:ImageButton ID="imgbtnLogo" runat="server" ImageUrl="~/Imagenes/logoDePanNube.png" Height="180px" Width="180px"/>
                    </td>
                    <td class="auto-style6">
                        <br />
                        <br />
                        <asp:TextBox ID="txtFiltroBuscar" CssClass="txtBox" runat="server" Width="178px"></asp:TextBox>
&nbsp;<asp:Button ID="btnBuscar" CssClass="btn buscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td class="auto-style7">
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <strong>
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style20"></asp:Label>
                        </strong>
                        <br />
                        <strong>
                        <asp:LinkButton ID="lbPerfil" runat="server" OnClick="lbPerfil_Click" CssClass="auto-style20">Mi Perfil</asp:LinkButton>
                        </strong>&nbsp;&nbsp;&nbsp;
                        <strong>
                        <asp:LinkButton ID="lbCerrarSesion" runat="server" OnClick="lbCerrarSesion_Click" CssClass="auto-style20">Cerrar sesion</asp:LinkButton>
                        </strong>
                        <br />
                        <strong>
                        <asp:HyperLink ID="hlCarritoCompras" runat="server" NavigateUrl="~/CarritoCompras.aspx" CssClass="auto-style20">Carrito de Compras</asp:HyperLink>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlCategorias" class= "neutro" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">
                        <asp:DropDownList ID="ddlRangoPrecios" class= "neutro" runat="server">
                            <asp:ListItem Value="0">--Rango de precios--</asp:ListItem>
                            <asp:ListItem Value="1">0 &lt; 1000</asp:ListItem>
                            <asp:ListItem Value="2">&gt;= 1000</asp:ListItem>
                        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    <td>
                        <asp:CheckBox ID="cbSinTacc" class= "neutro" runat="server" Text="Sin Tacc" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnFiltrar" class="btn neutro" runat="server" OnClick="btnFiltrar_Click" Text="Filtrar" />
                    &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnBorrarFiltros" class="btn neutro" runat="server" OnClick="btnBorrarFiltros_Click" Text="Borrar Filtros" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style15">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        
        <asp:ListView ID="lvProductos" runat="server" GroupItemCount="4" OnPagePropertiesChanging="lvProductos_PagePropertiesChanging"> 
      
            
      
            <EditItemTemplate>
                <td runat="server" style="">Cod_Producto:
                    <asp:TextBox ID="Cod_ProductoTextBox" runat="server" Text='<%# Bind("Cod_Producto") %>' />
                    <br />
                    NombreProducto:
                    <asp:TextBox ID="NombreProductoTextBox" runat="server" Text='<%# Bind("NombreProducto") %>' />
                    <br />
                    CodCategoria_Prod:
                    <asp:TextBox ID="CodCategoria_ProdTextBox" runat="server" Text='<%# Bind("CodCategoria_Prod") %>' />
                    <br />
                    <asp:CheckBox ID="SinTaccCheckBox" runat="server" Checked='<%# Bind("SinTacc") %>' Text="SinTacc" />
                    <br />
                    Stock:
                    <asp:TextBox ID="StockTextBox" runat="server" Text='<%# Bind("Stock") %>' />
                    <br />
                    PrecioxUnidad:
                    <asp:TextBox ID="PrecioxUnidadTextBox" runat="server" Text='<%# Bind("PrecioxUnidad") %>' />
                    <br />
                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("Estado") %>' Text="Estado" />
                    <br />
                    Imagen:
                    <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("Imagen") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No se han devuelto datos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Cod_Producto:
                    <asp:TextBox ID="Cod_ProductoTextBox" runat="server" Text='<%# Bind("CodProducto_Pro") %>' />
                    <br />
                    NombreProducto:
                    <asp:TextBox ID="NombreProductoTextBox" runat="server" Text='<%# Bind("Nombre_Pro") %>' />
                    <br />
                    CodCategoria_Prod:
                    <asp:TextBox ID="CodCategoria_ProdTextBox" runat="server" Text='<%# Bind("CodCategoria_Pro") %>' />
                    <br />
                    <asp:CheckBox ID="SinTaccCheckBox" runat="server" Checked='<%# Bind("SinTacc_Pro") %>' Text="SinTacc" />
                    <br />
                    Stock:
                    <asp:TextBox ID="StockTextBox" runat="server" Text='<%# Bind("Stock_Pro") %>' />
                    <br />
                    PrecioxUnidad:
                    <asp:TextBox ID="PrecioxUnidadTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pro") %>' />
                    <br />
                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("Estado_Pro") %>' Text="Estado" />
                    <br />
                    Imagen:
                    <asp:TextBox ID="ImagenTextBox" runat="server" Text='<%# Bind("Imagen_Pro") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="" class="auto-style19">
                    <asp:ImageButton ID="ibImagen" runat="server" Height="200px" ImageUrl='<%# Eval("Imagen_Pro") %>' Width="200px" />
                    &nbsp;<br />
                    <strong>
                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre_Pro") %>'></asp:Label>
                    <br />
                    </strong><em>Stock:<strong> </strong></em><em>
                    <asp:Label ID="lblStock" runat="server" Text='<%# Bind("Stock_Pro") %>'></asp:Label>
                    </em>
                    <br />
                    Precio por unidad:<br />
                    <asp:Label ID="lblPrecio" runat="server" Text='<%# Bind("PrecioUnitario_Pro") %>'></asp:Label>
                    <br />
                    Cantidad:<br />
                    <asp:Button ID="btnMenos" class="btn neutro" runat="server" CommandName="eventoMenos" OnCommand="btnMenos_Command" Text="-" />
                    <asp:Label ID="lblCantidad" runat="server" Text='0'></asp:Label>
                    <asp:Button ID="btnMas" class="btn neutro" runat="server"  CommandName="eventoMas" OnCommand="btnMas_Command" Text="+"/>
                    <br />
                    <asp:Label ID="lblMensajeStock" runat="server" Visible="False"></asp:Label>
                    <br />
                    <asp:Button ID="btnSeleccionar" CssClass="btn seleccion" runat="server" Text="Seleccionar" CommandArgument='<%# Eval("CodProducto_Pro")+"-"+Eval("Nombre_Pro")+"-"+Eval("PrecioUnitario_Pro") %>' CommandName="eventoSeleccionar" OnCommand="btnSeleccionar_Command"/>
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="lvProductosPager" runat="server" PageSize="8">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="">Cod_Producto:
                    <asp:Label ID="Cod_ProductoLabel" runat="server" Text='<%# Bind("CodProducto_Pro") %>' />
                    <br />
                    NombreProducto:
                    <asp:Label ID="NombreProductoLabel" runat="server" Text='<%# Bind("Nombre_Pro") %>' />
                    <br />
                    CodCategoria_Prod:
                    <asp:Label ID="CodCategoria_ProdLabel" runat="server" Text='<%# Bind("CodCategoria_Pro") %>' />
                    <br />
                    <asp:CheckBox ID="SinTaccCheckBox" runat="server" Checked='<%# Bind("SinTacc_Pro") %>' Enabled="false" Text="SinTacc" />
                    <br />
                    Stock:
                    <asp:Label ID="StockLabel" runat="server" Text='<%# Bind("Stock_Pro") %>' />
                    <br />
                    PrecioxUnidad:
                    <asp:Label ID="PrecioxUnidadLabel" runat="server" Text='<%# Bind("PrecioUnitario_Pro") %>' />
                    <br />
                    <asp:CheckBox ID="EstadoCheckBox" runat="server" Checked='<%# Bind("Estado_Pro") %>' Enabled="false" Text="Estado" />
                    <br />
                    Imagen:
                    <asp:Label ID="ImagenLabel" runat="server" Text='<%# Bind("Imagen_Pro") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
            </div>
    </form>
</body>
</html>
