<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarContra.aspx.cs" Inherits="Vistas.CambiarContra" %>

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
            height: 23px;
        }
        .auto-style3 {
            font-size: x-large;
            width: 168px;
        }
        .auto-style6 {
            width: 329px;
        }
        .auto-style7 {
            height: 23px;
            width: 329px;
        }
        .auto-style8 {
            height: 23px;
            width: 168px;
        }
        .auto-style9 {
            width: 168px;
        }
        .auto-style10 {
            width: 329px;
            font-size: x-large;
        }
        .auto-style11 {
            width: 168px;
            height: 31px;
        }
        .auto-style12 {
            width: 329px;
            height: 31px;
        }
        .auto-style13 {
            height: 31px;
        }
        .auto-style14 {
            font-size: large;
        }
        .auto-style15 {
            width: 168px;
            font-size: large;
        }
        .auto-style16 {
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
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style10"><strong>CAMBIAR LA CONTRASEÑA</strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2">
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style14"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style15"><strong>Contraseña:</strong></td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtContrasena" CssClass="txtBox" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvContarsena" runat="server" CssClass="auto-style16" ControlToValidate="txtContrasena" ValidationGroup="Group1">Ingrese una contraseña</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15"><strong>Repita la contraseña:</strong></td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtRepetirContrasena" CssClass="txtBox" runat="server" Width="250px" TextMode="Password" OnTextChanged="txtRepetirContrasena_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="cvContrasena" runat="server" CssClass="auto-style16" ControlToCompare="txtContrasena" ControlToValidate="txtRepetirContrasena" ValidationGroup="Group1">Contraeña incorrecta</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8"></td>
                    <td class="auto-style7"></td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <strong>
                    <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/ConfigurarPerfil.aspx" CssClass="auto-style14">Volver</asp:HyperLink>
                        </strong>
                    </td>
                    <td class="auto-style6">
                        <asp:Button ID="btnConfirmar" CssClass="btn neutro" runat="server" Text="Confirmar" ValidationGroup="Group1" OnClick="btnConfirmar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelar" CssClass="btn neutro" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <strong>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">
                    </td>
                    <td class="auto-style12">
                        <strong>
                        <asp:Label ID="lblMensajeConfirmacion" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style13">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style6">
                        <asp:Button ID="btnAceptar" CssClass="boton confirmar" runat="server" OnClick="btnAceptar_Click" Text="Aceptar" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelarConfirmacion" CssClass="boton cancelar" runat="server" OnClick="btnCancelarConfirmacion_Click" Text="Cancelar" Visible="False" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
