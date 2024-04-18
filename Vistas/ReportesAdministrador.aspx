<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportesAdministrador.aspx.cs" Inherits="Vistas.ReportesAdministrador" %>

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
        .auto-style14 {
            width: 243px;
            text-align: left;
            height: 26px;
            font-size: large;
        }
        .auto-style21 {
            width: 218px;
        }
        .auto-style22 {
            width: 218px;
            height: 23px;
        }
        .auto-style18 {
            width: 243px;
            height: 8px;
            font-size: large;
        }
        .auto-style23 {
            width: 218px;
            height: 8px;
        }
        .auto-style15 {
            width: 243px;
            height: 26px;
            font-size: large;
        }
        .auto-style24 {
            width: 218px;
            height: 26px;
        }
        .auto-style25 {
            height: 26px;
        }
        .auto-style26 {
            height: 26px;
            width: 81px;
        }
        .auto-style27 {
            width: 81px;
        }
        .auto-style28 {
            width: 81px;
            height: 8px;
        }
        .auto-style29 {
            height: 8px;
        }
        .auto-style30 {
            width: 81px;
            height: 23px;
        }
        .auto-style31 {
            height: 23px;
        }
        .auto-style32 {
            width: 147px;
            height: 26px;
        }
        .auto-style33 {
            width: 147px;
        }
        .auto-style34 {
            width: 147px;
            height: 23px;
        }
        .auto-style35 {
            width: 147px;
            height: 8px;
        }
        .auto-style36 {
            font-size: large;
        }
        .auto-style37 {
            width: 243px;
            font-size: large;
        }
        .auto-style38 {
            width: 243px;
            height: 23px;
            font-size: large;
        }
        .auto-style39 {
            width: 243px;
            height: 23px;
        }
        .auto-style40 {
            width: 243px;
        }
        .auto-style41 {
            width: 243px;
            height: 37px;
        }
        .auto-style42 {
            width: 218px;
            height: 37px;
        }
        .auto-style43 {
            width: 81px;
            height: 37px;
        }
        .auto-style44 {
            width: 147px;
            height: 37px;
        }
        .auto-style45 {
            height: 37px;
        }
        .auto-style46 {
            color: red;
            background-color: #FCE1B0;
            font-size: large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>REPORTES</strong></div>
        <p>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style36"></asp:Label>
                        </strong>
                    </p>
        <table class="auto-style2">
            <tr>
                <td class="auto-style14">
                    <strong>Reporte por codigo de usuario</strong></td>
                <td class="auto-style24">
                    &nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style25">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    Ingrese el codigo:</td>
                <td class="auto-style24">
                    <asp:TextBox ID="txtCodUsuario" CssClass="txtBox" runat="server" Width="204px"></asp:TextBox>
                </td>
                <td class="auto-style26">
                    <asp:Label ID="lblCodigo" runat="server">0</asp:Label>
                    $</td>
                <td class="auto-style32">
                    <asp:Button ID="btnAceptarCodigo" CssClass="btn neutro" runat="server" Text="Aceptar" OnClick="btnAceptarCodigo_Click" ValidationGroup="Grupo1" />
                </td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvCodigo" CssClass="auto-style46" runat="server" ControlToValidate="txtCodUsuario" ValidationGroup="Grupo1">Ingrese un codigo</asp:RequiredFieldValidator>
                    <br />
                        <asp:RegularExpressionValidator ID="reNumero" CssClass="auto-style46" runat="server" ControlToValidate="txtCodUsuario" ValidationExpression="^\d+$" ValidationGroup="Grupo1">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <strong>Reporte por categoria</strong></td>
                <td class="auto-style24">
                    &nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style32">&nbsp;</td>
                <td class="auto-style25">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style38">Elija la categoria:</td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlCategoria" CssClass="neutro" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style27">
                    <asp:Label ID="lblCategoria" runat="server">0</asp:Label>
                    $</td>
                <td class="auto-style33">
                    <asp:Button ID="btnAceptarCatgoria" CssClass="btn neutro" runat="server" Text="Aceptar" OnClick="btnAceptarCatgoria_Click" ValidationGroup="Grupo2" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvCategoria" CssClass="auto-style46" runat="server" ControlToValidate="ddlCategoria" InitialValue="--Seleccionar--" ValidationGroup="Grupo2">Seleccione una categoria</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style39"></td>
                <td class="auto-style22">
                </td>
                <td class="auto-style30"></td>
                <td class="auto-style34"></td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style38"><strong>Reporte por producto</strong></td>
                <td class="auto-style22">
                </td>
                <td class="auto-style30"></td>
                <td class="auto-style34"></td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style38">Elija primero la categoria:</td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlCategoriaPro" CssClass="neutro" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCategoriaPro_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style38">Elija el producto:</td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlProducto" CssClass="neutro" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style27">
                    <asp:Label ID="lblProducto" runat="server">0</asp:Label>
                    $</td>
                <td class="auto-style33">
                    <asp:Button ID="btnAceptarProducto" CssClass="btn neutro" runat="server" Text="Aceptar" OnClick="btnAceptarProducto_Click" ValidationGroup="Grupo3" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvProducto" CssClass="auto-style46" runat="server" ControlToValidate="ddlProducto" InitialValue="--Seleccionar--" ValidationGroup="Grupo3">Seleccione un producto</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style38">&nbsp;</td>
                <td class="auto-style22">
                    &nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style38"><strong>Reporte por fecha</strong></td>
                <td class="auto-style22">
                </td>
                <td class="auto-style30"></td>
                <td class="auto-style34"></td>
                <td class="auto-style31"></td>
            </tr>
            <tr>
                <td class="auto-style15">Filtar por fecha desde:</td>
                <td class="auto-style24">
                    <asp:TextBox ID="txtFechaDesde" CssClass="txtBox" runat="server" TextMode="Date" Width="206px"></asp:TextBox>
                </td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style32"></td>
                <td class="auto-style25">
                    <asp:RequiredFieldValidator ID="rfvFechaDesde" class="validacion" runat="server" ControlToValidate="txtFechaDesde" ValidationGroup="Grupo4">Seleccione una fecha desde</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style38">Filtar por fecha hasta:</td>
                <td class="auto-style22">
                    <asp:TextBox ID="txtFechaEntrega" CssClass="txtBox" runat="server" TextMode="Date" Width="206px"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    <asp:Label ID="lblFecha" runat="server">0</asp:Label>
                    $</td>
                <td class="auto-style33">
                    <asp:Button ID="btnAceptarFecha" CssClass="btn neutro" runat="server" Text="Aceptar" OnClick="btnAceptarFecha_Click" ValidationGroup="Grupo4" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvFechaHasta" class="validacion" runat="server" ControlToValidate="txtFechaEntrega" ValidationGroup="Grupo4">Seleccione una fecha hasta</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style38">&nbsp;</td>
                <td class="auto-style22">
                    &nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style38"><strong>Reporte por tipo de entrega</strong></td>
                <td class="auto-style22">
                    &nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style38">Filtrar por tipo de entrega:</td>
                <td class="auto-style22">
                    <asp:DropDownList ID="ddlTipoEntrega" CssClass="neutro" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style27">
                    <asp:Label ID="lblEntrega" runat="server">0</asp:Label>
                    $</td>
                <td class="auto-style33">
                    <asp:Button ID="btnAceptarEntrega" CssClass="btn neutro" runat="server" Text="Aceptar" OnClick="btnAceptarEntrega_Click" ValidationGroup="Grupo5" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvEntrega" class="validacion" runat="server" ControlToValidate="ddlTipoEntrega" InitialValue="--Seleccionar--" ValidationGroup="Grupo5">Seleccione un tipo de entrega</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style38">&nbsp;</td>
                <td class="auto-style22">
                    &nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18"><strong>Reporte por metodo de pago</strong></td>
                <td class="auto-style23">
                    &nbsp;</td>
                <td class="auto-style28"></td>
                <td class="auto-style35"></td>
                <td class="auto-style29">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">Filtrar por metodo de pago:</td>
                <td class="auto-style23">
                    <asp:DropDownList ID="ddlMetPago" CssClass="neutro" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style27">
                    <asp:Label ID="lblPago" runat="server">0</asp:Label>
                    $</td>
                <td class="auto-style33">
                    <asp:Button ID="btnAceptarPago" CssClass="btn neutro" runat="server" Text="Aceptar" OnClick="btnAceptarPago_Click" ValidationGroup="Grupo6" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPago" class="validacion" runat="server" ControlToValidate="ddlMetPago" InitialValue="--Seleccionar--" ValidationGroup="Grupo6">Seleccione un metodo de pago</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style38">&nbsp;</td>
                <td class="auto-style22">
                    &nbsp;</td>
                <td class="auto-style30"></td>
                <td class="auto-style34"></td>
                <td class="auto-style31">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style24">
                    &nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style41">
                    <asp:Button ID="btnLimpiarFiltros" CssClass="btn neutro" runat="server" Text="Limpiar filtros" OnClick="btnLimpiarFiltros_Click" />
                </td>
                <td class="auto-style42"></td>
                <td class="auto-style43"></td>
                <td class="auto-style44"></td>
                <td class="auto-style45"></td>
            </tr>
            <tr>
                <td class="auto-style37">
                    &nbsp;</td>
                <td class="auto-style21">
                    &nbsp;</td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style40">
                    <strong>
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/PerfilAdministrador.aspx" CssClass="auto-style36">Volver</asp:HyperLink>
                    </strong>
                </td>
                <td class="auto-style21">
                    <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style36">Home</asp:HyperLink>
                    </strong>
                </td>
                <td class="auto-style27">&nbsp;</td>
                <td class="auto-style33">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
    </form>
</body>
</html>
