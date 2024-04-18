<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistorialCompras.aspx.cs" Inherits="Vistas.HistorialCompras" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
            font-size: x-large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style5 {
            font-size: large;
        }
        .auto-style6 {
            width: 230px;
            font-size: large;
        }
        .auto-style7 {
            width: 230px;
        }
        .auto-style17 {
            font-size: small;
        }
        .auto-style18 {
            width: 238px;
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
            <strong>HISTORIAL DE COMPRAS</strong></div>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style5"></asp:Label>
                    </strong>
                    <br />
        <br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style6"><strong>Filtrar por codigo de compra:</strong></td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtCodCompra" class="txtBox" runat="server" Width="204px"></asp:TextBox>
                </td>
                <td>
                        <asp:RegularExpressionValidator ID="reNumeroStock" runat="server" ControlToValidate="txtCodCompra" ValidationExpression="^\d+$" ValidationGroup="Group1" CssClass="auto-style12">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style6"><strong>Filtar por fecha desde:</strong></td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtFechaDesde" class="txtBox" runat="server" TextMode="Date" Width="206px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"><strong>Filtar por fecha hasta:</strong></td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtFechaHasta" class="txtBox" runat="server" TextMode="Date" Width="206px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"><strong>Filtrar por precio:<br />
                    </strong>
                    <asp:Label ID="lblMensajePrecio" runat="server" CssClass="auto-style17" Text="Los decimales deben de ser ingresados con coma (,)"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlFiltroPrecio" class="neutro" runat="server">
                        <asp:ListItem>Igual a</asp:ListItem>
                        <asp:ListItem>Mayor a</asp:ListItem>
                        <asp:ListItem>Menor a</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtPrecio" class="txtBox" runat="server" Width="133px" ValidationGroup="Group1"></asp:TextBox>
                </td>
                <td>
                        <asp:RegularExpressionValidator ID="reNumeroPrecio" runat="server" ControlToValidate="txtPrecio" ValidationExpression="^\d+([.,]\d{1,2})?$" ValidationGroup="Group1" CssClass="auto-style12">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style6"><strong>Filtrar por tipo de entrega:</strong></td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlTipoEntrega" class="neutro" runat="server">
                        <asp:ListItem>--Tipo de entrega--</asp:ListItem>
                        <asp:ListItem>Domicilio</asp:ListItem>
                        <asp:ListItem>Local</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"><strong>Filtrar por metodo de pago:</strong></td>
                <td class="auto-style18">
                    <asp:DropDownList ID="ddlMetPago" class="neutro" runat="server">
                        <asp:ListItem>--Metodo de pago--</asp:ListItem>
                        <asp:ListItem>Efectivo</asp:ListItem>
                        <asp:ListItem>Tarjeta de credito</asp:ListItem>
                        <asp:ListItem>Tarjeta de debito</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Button ID="btnAceptar" class="btn neutro" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" ValidationGroup="Group1" />
                </td>
                <td class="auto-style18">
                    <asp:Button ID="btnLimpiarFiltros" class="btn neutro" runat="server" Text="Limpiar filtros" OnClick="btnLimpiarFiltros_Click" />
                </td>
                <td>
                    <strong>
                    <asp:Label ID="lblFechas" runat="server" CssClass="auto-style5"></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
                    <br />
        <asp:GridView ID="gvHistorialCompras" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="gvHistorialCompras_PageIndexChanging" PageSize="5" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Cod_Compra">
                    <ItemTemplate>
                        <asp:Label ID="lblCodVentas" runat="server" Text='<%# Bind("CodVentas_Ven") %>'></asp:Label>
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
        <br />
        <strong>
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/PerfilUsuario.aspx" CssClass="auto-style5">Volver</asp:HyperLink>
        </strong>&nbsp;&nbsp;&nbsp;
        <strong>
        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style5">Home</asp:HyperLink>
                    </strong>
                    </form>
</body>
</html>
