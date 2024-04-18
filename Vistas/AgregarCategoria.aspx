<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarCategoria.aspx.cs" Inherits="Vistas.AgregarCategoria" %>

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
            width: 152px;
        }
        .auto-style6 {
            width: 197px;
        }
        .auto-style7 {
            width: 152px;
            height: 30px;
        }
        .auto-style8 {
            width: 197px;
            height: 30px;
        }
        .auto-style9 {
            height: 30px;
        }
        .auto-style10 {
            font-size: large;
        }
        .auto-style11 {
            width: 152px;
            font-size: large;
        }
        .auto-style12 {
            color: red;
            background-color: #FCE1B0;
            font-size: large;
        }
        .auto-style13 {
            width: 423px;
        }
        .auto-style14 {
            text-align: justify;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div class="auto-style1">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style13">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Imagenes/logoDePanNube.png" Height="180px" Width="180px"/>
                    </td>
                    <td class="auto-style14">
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style10"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
            <strong>AGREGAR CATEGORIA</strong></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11"><strong>Nombre Categoria:</strong></td>
                <td class="auto-style6">
                        <asp:TextBox ID="txtNombre" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                <td>
                        <asp:RequiredFieldValidator ID="rfvNombre" CssClass="auto-style12" runat="server" ControlToValidate="txtNombre" ValidationGroup="Group1">Ingrese un nombre</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <strong>
                    <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/ConfiguracionCategorias.aspx" CssClass="auto-style10">Volver</asp:HyperLink>
                        </strong>
                        </td>
                <td class="auto-style8">
                        <asp:Button ID="btnAgregarCat" class="btn neutro" runat="server" Text="Agregar" ValidationGroup="Group1" OnClick="btnAgregarCat_Click" />
                    </td>
                <td class="auto-style9">
                        </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                        <strong>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnConfirmar" class="boton confirmar" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" Visible="False" />
                </td>
                <td>
                    <asp:Button ID="btnCancelar" class="boton cancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" Visible="False" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style10">Home</asp:HyperLink>
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
