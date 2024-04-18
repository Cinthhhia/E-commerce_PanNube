<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarMetodoPago.aspx.cs" Inherits="Vistas.AgregarMetodoPago" %>

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
            width: 132px;
        }
        .auto-style6 {
            width: 197px;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style8 {
            width: 132px;
            font-size: large;
        }
        .auto-style9 {
            color: red;
            background-color: #FCE1B0;
            font-size: large;
        }
        .auto-style10 {
            width: 132px;
            height: 24px;
        }
        .auto-style11 {
            width: 197px;
            height: 24px;
        }
        .auto-style12 {
            height: 24px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div class="auto-style1">
            <strong>AGREGAR METODO DE PAGO</strong></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8"><strong>Tipo de pago:</strong></td>
                <td class="auto-style6">
                        <asp:TextBox ID="txtNombre" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                <td>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ValidationGroup="Group1" CssClass="auto-style9">Ingrese un nombre</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>
                    <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/ConfiguracionMetodoPago.aspx" CssClass="auto-style7">Volver</asp:HyperLink>
                        </strong>
                        </td>
                <td class="auto-style6">
                        <asp:Button ID="btnAgregarMetPago" runat="server" Text="Agregar" class="btn neutro" ValidationGroup="Group1" OnClick="btnAgregarMetPago_Click" />
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                        <strong>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btnConfirmar" runat="server" class="boton confirmar" OnClick="btnConfirmar_Click" Text="Confirmar" Visible="False" />
                </td>
                <td>
                    <asp:Button ID="btnCancelar" runat="server" class="boton cancelar" OnClick="btnCancelar_Click" Text="Cancelar" Visible="False" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style7">Home</asp:HyperLink>
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
