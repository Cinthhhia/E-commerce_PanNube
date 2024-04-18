<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistorialVentas.aspx.cs" Inherits="Vistas.HistorialVentas" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            text-align: left;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            width: 223px;
            height: 23px;
            font-size: large;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style14 {
            width: 223px;
            text-align: left;
            font-size: large;
        }
        .auto-style15 {
            width: 223px;
            height: 26px;
            font-size: large;
        }
        .auto-style17 {
            height: 26px;
        }
        .auto-style18 {
            width: 223px;
            height: 8px;
            font-size: large;
        }
        .auto-style20 {
            height: 8px;
        }
        .auto-style22 {
            width: 228px;
            height: 23px;
        }
        .auto-style23 {
            width: 228px;
            height: 8px;
        }
        .auto-style24 {
            width: 228px;
            height: 26px;
        }
        .auto-style25 {
            font-size: large;
        }
        .auto-style26 {
            width: 223px;
        }
        .auto-style27 {
            width: 228px;
        }
        .auto-style28 {
            height: 26px;
            font-size: small;
        }
        .auto-style12 {
            color: red;
            background-color: #FCE1B0;
            font-size: large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>HISTORIAL DE VENTAS</strong></div>
        <p>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style25"></asp:Label>
                        </strong>
                    </p>
        <table class="auto-style2">
            <tr>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <strong>Filtrar por codigo de venta :</strong></td>
                <td class="auto-style27">
                    <asp:TextBox ID="txtCodVenta" CssClass="txtBox" runat="server" Width="204px"></asp:TextBox>
                </td>
                <td>
                        <asp:RegularExpressionValidator ID="reNumeroStock" runat="server" ControlToValidate="txtCodVenta" ValidationExpression="^\d+$" ValidationGroup="Group1" CssClass="auto-style12">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Filtrar por codigo de usuario:</strong></td>
                <td class="auto-style22">
                    <asp:TextBox ID="txtCodUsuario" CssClass="txtBox" runat="server" Width="204px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                        <asp:RegularExpressionValidator ID="reNumeroStock0" runat="server" ControlToValidate="txtCodUsuario" ValidationExpression="^\d+$" ValidationGroup="Group1" CssClass="auto-style12">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style18"><strong>Filtar por fecha desde:</strong></td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtFechaDesde" CssClass="txtBox" runat="server" TextMode="Date" Width="206px"></asp:TextBox>
                </td>
                <td class="auto-style20">
                    </td>
            </tr>
            <tr>
                <td class="auto-style18"><strong>Filtar por fecha hasta:</strong></td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtFechaHasta" CssClass="txtBox" runat="server" TextMode="Date" Width="206px"></asp:TextBox>
                </td>
                <td class="auto-style20">
                </td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Filtrar por precio:<br />
                    </strong>
                    <asp:Label ID="lblMensajePrecio" runat="server" CssClass="auto-style28" Text="Los decimales deben de ser ingresados con coma (,)"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlFiltroPrecio" CssClass="neutro" runat="server">
                        <asp:ListItem Value="=">Igual a</asp:ListItem>
                        <asp:ListItem Value="&gt;">Mayor a</asp:ListItem>
                        <asp:ListItem Value="&lt;">Menor a</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtPrecio" CssClass="txtBox" runat="server" Width="133px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                        <asp:RegularExpressionValidator ID="reNumeroPrecio" runat="server" ControlToValidate="txtPrecio" ValidationExpression="^\d+([.,]\d{1,2})?$" ValidationGroup="Group1" CssClass="auto-style12">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Filtrar por tipo de entrega:</strong></td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlTipoEntrega" CssClass="neutro" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>Filtrar por metodo de pago:</strong></td>
                <td class="auto-style24">
                    <asp:DropDownList ID="ddlMetPago" CssClass="neutro" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style17">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style26">
                    <asp:Button ID="btnAceptar" CssClass="btn neutro" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" ValidationGroup="Group1" />
                </td>
                <td class="auto-style27">
                    <asp:Button ID="btnLimpiarFiltros" CssClass="btn neutro" runat="server" Text="Limpiar filtros" OnClick="btnLimpiarFiltros_Click" />
                </td>
                <td>
                    <strong>
                    <asp:Label ID="lblFechas" runat="server" CssClass="validacion"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
        <asp:GridView ID="gvHistorialVentas" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="gvHistorialVentas_PageIndexChanging" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Cod_Venta">
                    <ItemTemplate>
                        <asp:Label ID="lblCodVentas" runat="server" Text='<%# Bind("CodVentas_Ven") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cod_Usuario">
                    <ItemTemplate>
                        <asp:Label ID="lblCodUsuario" runat="server" Text='<%# Bind("CodUsuario_Ven") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario">
                    <ItemTemplate>
                        <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("NombreUsuario_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha">
                    <ItemTemplate>
                        <asp:Label ID="lblFecha" runat="server" Text='<%# Bind("Fechas_Ven") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contacto">
                    <ItemTemplate>
                        <asp:Label ID="lblContacto" runat="server" Text='<%# Bind("Contacto_Ven") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Entrega">
                    <ItemTemplate>
                        <asp:Label ID="lblEntrega" runat="server" Text='<%# Bind("Nombre_TipoEntrega") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Direccion">
                    <ItemTemplate>
                        <asp:Label ID="lblDireecion" runat="server" Text='<%# Bind("Direccion_Ven") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Metodo de pago">
                    <ItemTemplate>
                        <asp:Label ID="lblPago" runat="server" Text='<%# Bind("Nombre_MetodoPago") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("Total_Ven") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ver detalle">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbRecibo" runat="server" OnClick="lbRecibo_Click">Ver Recibo</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
                <p>
                    <strong>
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/PerfilAdministrador.aspx" CssClass="auto-style25">Volver</asp:HyperLink>
                    </strong>&nbsp;&nbsp;
                    <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style25">Home</asp:HyperLink>
                    </strong>
                    </p>
    </form>
</body>
</html>
