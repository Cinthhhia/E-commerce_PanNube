<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigurarPerfil.aspx.cs" Inherits="Vistas.ConfigurarPerfil" %>

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
            width: 178px;
        }
        .auto-style4 {
            width: 319px;
        }
        .auto-style5 {
            width: 178px;
            height: 34px;
        }
        .auto-style6 {
            width: 319px;
            height: 34px;
        }
        .auto-style7 {
            height: 34px;
        }
        .auto-style8 {
            width: 302px;
        }
        .auto-style9 {
            height: 34px;
            width: 302px;
        }
        .auto-style11 {
            width: 178px;
            height: 6px;
        }
        .auto-style12 {
            width: 319px;
            height: 6px;
        }
        .auto-style13 {
            height: 6px;
            width: 302px;
        }
        .auto-style14 {
            height: 6px;
        }
        .auto-style15 {
            width: 178px;
            font-size: large;
        }
        .auto-style16 {
            width: 178px;
            font-size: large;
            height: 42px;
        }
        .auto-style17 {
            width: 319px;
            height: 42px;
        }
        .auto-style18 {
            width: 302px;
            height: 42px;
        }
        .auto-style19 {
            height: 42px;
        }
        .auto-style20 {
            font-size: large;
        }
        .auto-style21 {
            width: 178px;
            height: 24px;
        }
        .auto-style22 {
            width: 319px;
            height: 24px;
        }
        .auto-style23 {
            width: 302px;
            height: 24px;
        }
        .auto-style24 {
            height: 24px;
        }
        .auto-style25 {
            width: 302px;
            font-size: large;
        }
        .auto-style26 {
            color: red;
            background-color: #FCE1B0;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>CONFIGURARACION DEL PERFIL</strong></div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style20"></asp:Label>
                        </strong>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style25">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>Nombre: </strong> </td>
                <td class="auto-style4">
                        <asp:TextBox ID="txtNombre" class="txtBox" runat="server" Width="250px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvNombre" CssClass="auto-style26" runat="server" ControlToValidate="txtNombre" ValidationGroup="Group1">Ingrese un nombre</asp:RequiredFieldValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>Apellido:</strong></td>
                <td class="auto-style4">
                        <asp:TextBox ID="txtApellido" class="txtBox" runat="server" Width="250px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvApellido" CssClass="auto-style26" runat="server" ControlToValidate="txtApellido" ValidationGroup="Group1">Ingrese un apellido</asp:RequiredFieldValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>DNI:</strong></td>
                <td class="auto-style4">
                        <asp:TextBox ID="txtDni" class="txtBox" runat="server" Width="250px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvDni" CssClass="auto-style26" runat="server" ControlToValidate="txtDni" ValidationGroup="Group1">Ingrese un DNI</asp:RequiredFieldValidator>
                        <br class="auto-style20" />
                        <asp:RegularExpressionValidator ID="reDni" CssClass="auto-style26" runat="server" ControlToValidate="txtDni" ValidationExpression="^\d+$" ValidationGroup="Group1">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>Direccion:</strong></td>
                <td class="auto-style4">
                        <asp:TextBox ID="txtDireccion" class="txtBox" runat="server" Width="250px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvDireccion" CssClass="auto-style26" runat="server" ControlToValidate="txtDireccion" ValidationGroup="Group1">Ingrese una direccion</asp:RequiredFieldValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>Codigo postal:</strong></td>
                <td class="auto-style4">
                        <asp:TextBox ID="txtCodigo" class="txtBox" runat="server" Width="250px"></asp:TextBox>
                    </td>
                <td class="auto-style8">
                        <asp:RequiredFieldValidator ID="rfvCodigo" CssClass="auto-style26" runat="server" ControlToValidate="txtCodigo" ValidationGroup="Group1">Ingrese un codigo postal</asp:RequiredFieldValidator>
                        <br class="auto-style20" />
                        <asp:RangeValidator ID="rvCodigo" CssClass="auto-style26" runat="server" ControlToValidate="txtCodigo" MaximumValue="9999" MinimumValue="1000" Type="Integer" ValidationGroup="Group1">Ingrese un codigo de 4 digitos</asp:RangeValidator>
                    </td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16"><strong>Numero de telefono:</strong></td>
                <td class="auto-style17">
                        <asp:TextBox ID="txtNumero" class="txtBox" runat="server" Width="250px"></asp:TextBox>
                    </td>
                <td class="auto-style18">
                        <asp:RequiredFieldValidator ID="rfvNumero" CssClass="auto-style26" runat="server" ControlToValidate="txtNumero" ValidationGroup="Group1">Ingrese un numero de telefono</asp:RequiredFieldValidator>
                        <br class="auto-style20" />
                        <asp:RegularExpressionValidator ID="reNumero" CssClass="auto-style26" runat="server" ControlToValidate="txtNumero" ValidationExpression="^\d+$" ValidationGroup="Group1">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
                <td class="auto-style19">
                        </td>
            </tr>
            <tr>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style4">
                        &nbsp;</td>
                <td class="auto-style25">
                        &nbsp;</td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>
                    <asp:HyperLink ID="hlContrasena" runat="server" NavigateUrl="~/CambiarContra.aspx" CssClass="auto-style20">Cambiar la contraseña</asp:HyperLink>
                    </strong>
                </td>
                <td class="auto-style4">
                        &nbsp;</td>
                <td class="auto-style8">
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6"></td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <strong>
                    <asp:LinkButton ID="lkbtnVolver" runat="server" OnClick="lkbtnVolver_Click" CssClass="auto-style20">Volver</asp:LinkButton>
                    </strong>
                    </td>
                <td class="auto-style12">
                        <asp:Button ID="btnConfirmar" CssClass="btn neutro" runat="server" Text="Aceptar" ValidationGroup="Group1" OnClick="btnConfirmar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancelar" CssClass="btn neutro" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"/>
                        &nbsp;&nbsp;</td>
                <td class="auto-style13">
                        <strong>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
                <td class="auto-style14">
                        </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    <strong>
                    <asp:Label ID="lblMensajeConfirmar" runat="server" CssClass="validacion"></asp:Label>
                    </strong>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="btnConfirmarActualizacion" CssClass="boton confirmar" runat="server" OnClick="btnConfirmarActualizacion_Click" Text="Confirmar" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancelarActualizacion" CssClass="boton cancelar" runat="server" OnClick="btnCancelarActualizacion_Click" Text="Cancelar" Visible="False" />
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>
                        <asp:Button ID="btnEliminarCuenta" CssClass="btn neutro" runat="server" Text="Eliminar cuenta" OnClick="btnEliminarCuenta_Click" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    </td>
                <td class="auto-style22"></td>
                <td class="auto-style23"></td>
                <td class="auto-style24">
                        <strong>
                        <asp:Label ID="lblMensajeEliminar" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>
                        <asp:Button ID="btnConfirmarEliminar" CssClass="boton confirmar" runat="server" Text="Confirmar" OnClick="btnConfirmarEliminar_Click" Visible="False"/>
                    &nbsp;
                        <asp:Button ID="btnCancelarEliminar" CssClass="boton cancelar" runat="server" Text="Cancelar" OnClick="btnCancelarEliminar_Click" Visible="False" />
                    </td>
            </tr>
        </table>
    </form>
</body>
</html>
