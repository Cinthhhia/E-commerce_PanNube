<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Login1" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style11 {
            width: 237px;
        }
        .auto-style12 {
            height: 23px;
            width: 237px;
        }
        .auto-style13 {
            height: 21px;
            width: 237px;
        }
        .auto-style17 {
            height: 23px;
            width: 237px;
            font-size: x-large;
        }
        .auto-style18 {
            width: 237px;
            font-size: x-large;
        }
        .auto-style19 {
            font-size: large;
        }
        .auto-style20 {
            width: 237px;
            height: 12px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="titulo-login" style="justify-content: center; align-items: center;">Pan Nube</div>
        <table class="tabla">
            <tr>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style17"><strong>Nombre de Usuario</strong></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:TextBox CssClass="txtBox" ID="txtUsuario" runat="server" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <strong>
                    <asp:RequiredFieldValidator ID="rfvUsuario" CssClass="validacion" runat="server" ControlToValidate="txtUsuario" ValidationGroup="Grupo1" >Ingrese un usuario</asp:RequiredFieldValidator>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18"><strong>Contraseña</strong></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:TextBox CssClass="txtBox" ID="txtContraseña" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <strong>
                    <asp:RequiredFieldValidator ID="rfvContra" CssClass="validacion"  runat="server" ControlToValidate="txtContraseña" ValidationGroup="Grupo1" >Ingrese una contraseña</asp:RequiredFieldValidator>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Button ID="btnIngresar" class="boton ingresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" ValidationGroup="Grupo1" Width="268px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <strong>
                    <asp:HyperLink ID="hlRegistrar" runat="server" NavigateUrl="~/Registrarse.aspx" CssClass="auto-style19">Registrarse</asp:HyperLink>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="lblMensaje" CssClass="validacion" runat="server"></asp:Label>
                </td>
            </tr>
            </table>
        </div>
    </form>
</body>
</html>
