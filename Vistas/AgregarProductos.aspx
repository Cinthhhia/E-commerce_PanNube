<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarProductos.aspx.cs" Inherits="Vistas.AgregarProductos" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 146px;
        }
        .auto-style4 {
            width: 146px;
            height: 23px;
            font-size: large;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            width: 209px;
        }
        .auto-style7 {
            height: 23px;
            width: 209px;
        }
        .auto-style8 {
            width: 294px;
        }
        .auto-style9 {
            height: 23px;
            width: 294px;
        }
        .auto-style10 {
            font-size: large;
        }
        .auto-style11 {
            width: 146px;
            font-size: large;
        }
        .auto-style12 {
            color: red;
            background-color: #FCE1B0;
            font-size: large;
        }
        .auto-style13 {
            width: 146px;
            height: 30px;
        }
        .auto-style14 {
            width: 209px;
            height: 30px;
        }
        .auto-style15 {
            width: 294px;
            height: 30px;
        }
        .auto-style16 {
            height: 30px;
        }
        .auto-style17 {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>AGREGAR PRODUCTOS</strong></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style10"></asp:Label>
                        </strong>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"><strong></strong></td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Nombre Producto:</strong></td>
                <td class="auto-style6">
                        <asp:TextBox ID="txtNombreProd" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombreProd" ValidationGroup="Group1" CssClass="auto-style12">Ingrese un nombre</asp:RequiredFieldValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Categoria Producto:</strong></td>
                <td class="auto-style7">
                        <asp:DropDownList ID="ddlCategorias" class= "neutro" runat="server">
                        </asp:DropDownList>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="rfvCategoria" runat="server" ControlToValidate="ddlCategorias" InitialValue="--Seleccionar--" ValidationGroup="Group1" CssClass="auto-style12">Seleccione una categoria</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                        </td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Sin Tacc:</strong></td>
                <td class="auto-style6">
                        <asp:RadioButtonList ID="rblSinTacc" CssClass="neutro" runat="server" Width="86px">
                            <asp:ListItem Value="true">Si</asp:ListItem>
                            <asp:ListItem Value="false" Selected="True">No</asp:ListItem>
                        </asp:RadioButtonList>
                </td>
                <td class="auto-style8">
                        &nbsp;</td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Stock</strong></td>
                <td class="auto-style6">
                        <asp:TextBox ID="txtStock" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock" ValidationGroup="Group1" CssClass="auto-style12">Ingrese un stock</asp:RequiredFieldValidator>
                    <br />
                        <asp:RegularExpressionValidator ID="reNumeroStock" runat="server" ControlToValidate="txtStock" ValidationExpression="^\d+$" ValidationGroup="Group1" CssClass="auto-style12">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Precio x Unidad:<br />
                    </strong>
                    <asp:Label ID="lblMensajePrecio" runat="server" CssClass="auto-style17" Text="Los decimales deben de ser ingresados con coma (,)"></asp:Label>
                </td>
                <td class="auto-style6">
                        <asp:TextBox ID="txtPxU" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPxU" ValidationGroup="Group1" CssClass="auto-style12">Ingrese un Precio</asp:RequiredFieldValidator>
                    <br />
                        <asp:RegularExpressionValidator ID="reNumeroPrecio" runat="server" ControlToValidate="txtPxU" ValidationExpression="^\d+([.,]\d{1,2})?$" ValidationGroup="Group1" CssClass="auto-style12">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style6">
                        &nbsp;</td>
                <td class="auto-style8">
                        &nbsp;</td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Imagen (URL):</strong></td>
                <td class="auto-style6">
                        <asp:TextBox ID="txtURLImagen" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvURLImagen" runat="server" ControlToValidate="txtURLImagen" ValidationGroup="Group1" CssClass="auto-style12">Ingrese un URL</asp:RequiredFieldValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>
                    <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/ConfiguracionProductos.aspx" CssClass="auto-style10">Volver</asp:HyperLink>
                        </strong>
                        </td>
                <td class="auto-style6">
                        <asp:Button ID="btnAgregarProd" runat="server" CssClass="btn neutro" Text="Agregar" OnClick="btnAgregarProd_Click" ValidationGroup="Group1" />
                    </td>
                <td class="auto-style8">
                        &nbsp;</td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                        <strong>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    </td>
                <td class="auto-style14">
                    <asp:Button ID="btnConfirmar" class="boton confirmar" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" Visible="False" />
                </td>
                <td class="auto-style15">
                    <asp:Button ID="btnCancelar" class="boton cancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" Visible="False" />
                </td>
                <td class="auto-style16"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style10">Home</asp:HyperLink>
                    </strong>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
