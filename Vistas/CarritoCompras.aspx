﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarritoCompras.aspx.cs" Inherits="Vistas.CarritoCompras" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 325px;
        }
        .auto-style4 {
            width: 325px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            width: 307px;
        }
        .auto-style7 {
            width: 307px;
            height: 23px;
        }
        .auto-style8 {
            width: 325px;
            font-size: x-large;
        }
        .auto-style9 {
            font-size: large;
        }
        .auto-style10 {
            color: red;
            background-color: #FCE1B0;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style8"><strong>CARRITO DE COMPRAS</strong></td>
                    <td class="auto-style6">
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <br />
                        <asp:GridView ID="gvCarrito" runat="server" AutoGenerateDeleteButton="True" OnRowDeleting="gvCarrito_RowDeleting" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                            <AlternatingRowStyle BackColor="White" />
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
                    </td>
                    <td class="auto-style6"><span class="auto-style9"><strong>Seleccione el metodo de pago:</strong></span><br />
                        <asp:RadioButtonList ID="rblMetPago" runat="server" CssClass="neutro">
                        </asp:RadioButtonList>
                        <br />
                        <span class="auto-style9"><strong>Seleccione lugar de entrega:</strong></span><br />
                        <asp:RadioButtonList ID="rblTipoEntrega" runat="server" RepeatDirection="Horizontal" CssClass="neutro">
                            <asp:ListItem Value="1">Local</asp:ListItem>
                            <asp:ListItem Value="2">Domicilio</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                        <asp:Button ID="btnComprar" class="btn neutro" runat="server" Text="Comprar" Width="90px" ValidationGroup="Grupo1" OnClick="btnComprar_Click" />
                    &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelar" class="btn neutro" runat="server" Text="Cancelar Compra" Width="132px" OnClick="btnCancelar_Click" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPago" runat="server" ControlToValidate="rblMetPago" CssClass="auto-style10" ValidationGroup="Grupo1">Seleccione un metodo de pago</asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="rfvEntrega" runat="server" ControlToValidate="rblTipoEntrega" CssClass="auto-style10" ValidationGroup="Grupo1">Seleccione un tipo de entrega</asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style6">
                        <strong>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"><span class="auto-style9"><strong>Total de compra:</strong></span> <strong>
                        <asp:Label ID="lblTotal" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnConfirmar" class="boton confirmar" runat="server" Text="Confirmar" Visible="False" OnClick="btnConfirmar_Click" />
                    &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelarConfirmacion" class="boton cancelar" runat="server" Text="Cancelar" Visible="False" OnClick="btnCancelarConfirmacion_Click" />
                    </td>
                    <td class="auto-style5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style7"></td>
                    <td class="auto-style5"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style9">Home</asp:HyperLink>
                        </strong>
                    </td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>