<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportesCliente.aspx.cs" Inherits="Vistas.ReportesCliente" %>

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
        .auto-style21 {
            width: 218px;
        }
        .auto-style4 {
            width: 195px;
            height: 23px;
            font-size: large;
        }
        .auto-style22 {
            width: 218px;
            height: 23px;
        }
        .auto-style18 {
            width: 195px;
            height: 8px;
            font-size: large;
        }
        .auto-style23 {
            width: 218px;
            height: 8px;
        }
        .auto-style3 {
            width: 195px;
        }
        .auto-style25 {
            width: 195px;
            height: 30px;
        }
        .auto-style26 {
            width: 218px;
            height: 30px;
        }
        .auto-style27 {
            height: 30px;
        }
        .auto-style28 {
            height: 23px;
        }
        .auto-style29 {
            width: 78px;
        }
        .auto-style30 {
            width: 78px;
            height: 23px;
        }
        .auto-style31 {
            width: 78px;
            height: 30px;
        }
        .auto-style32 {
            width: 89px;
        }
        .auto-style33 {
            width: 89px;
            height: 23px;
        }
        .auto-style34 {
            width: 89px;
            height: 30px;
        }
        .auto-style35 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div class="auto-style1">
            <strong>REPORTES</strong></div>
            <p>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style35"></asp:Label>
                        </strong>
                    </p>
            <table class="auto-style2">
                <tr>
                <td class="auto-style4"><strong>Filtrar por categoria:</strong></td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlCategoria" CssClass="neutro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style32">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                <td class="auto-style4"><strong>Filtrar por producto:</strong></td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlProducto" CssClass="neutro" runat="server">
                    </asp:DropDownList>
                </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblTotalProducto" runat="server">0</asp:Label>
                        $</td>
                    <td class="auto-style33">
                        <asp:Button ID="btnProducto" CssClass="btn neutro" runat="server" OnClick="btnProducto_Click" Text="Aceptar" ValidationGroup="Grupo1" />
                    </td>
                    <td class="auto-style28">
                    <asp:RequiredFieldValidator ID="rfvProducto" CssClass="validacion" runat="server" ControlToValidate="ddlProducto" InitialValue="--Seleccionar--" ValidationGroup="Grupo1">Seleccione un producto</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td class="auto-style18"><strong></strong></td>
                <td class="auto-style23">
                    &nbsp;</td>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style32">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                <td class="auto-style18"><strong>Filtar por fecha desde:</strong></td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtFechaDesde" CssClass="txtBox" runat="server" TextMode="Date" Width="206px"></asp:TextBox>
                </td>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style32">&nbsp;</td>
                    <td>
                    <asp:RequiredFieldValidator ID="rfvFechaDesde" CssClass="validacion" runat="server" ControlToValidate="txtFechaDesde" ValidationGroup="Grupo2">Seleccione una fecha desde</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td class="auto-style18"><strong>Filtar por fecha hasta:</strong></td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtFechaHasta" CssClass="txtBox" runat="server" TextMode="Date" Width="206px"></asp:TextBox>
                </td>
                    <td class="auto-style29">
                        <asp:Label ID="lblTotalRangoFecha" runat="server">0</asp:Label>
                        $</td>
                    <td class="auto-style32">
                        <asp:Button ID="btnFecha" CssClass="btn neutro" runat="server" OnClick="btnFecha_Click" Text="Aceptar" ValidationGroup="Grupo2" />
                    </td>
                    <td>
                    <asp:RequiredFieldValidator ID="rfvFechaHasta" CssClass="validacion" runat="server" ControlToValidate="txtFechaHasta" ValidationGroup="Grupo2">Seleccione una fecha hasta</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style21">&nbsp;</td>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style32">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                <td class="auto-style25">
                    <asp:Button ID="btnLimparFiltros" CssClass="btn neutro" runat="server" Text="Limpiar filtros" OnClick="btnLimparFiltros_Click" />
                </td>
                <td class="auto-style26">
                    &nbsp;</td>
                    <td class="auto-style31"></td>
                    <td class="auto-style34">&nbsp;</td>
                    <td class="auto-style27">&nbsp;</td>
                </tr>
                <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style21">&nbsp;</td>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style32">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style32">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <strong>
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/PerfilUsuario.aspx" CssClass="auto-style35">Volver</asp:HyperLink>
                        </strong>
                    </td>
                    <td>
                        <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style35">Home</asp:HyperLink>
                        </strong>
                    </td>
                    <td class="auto-style29">&nbsp;</td>
                    <td class="auto-style32">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
