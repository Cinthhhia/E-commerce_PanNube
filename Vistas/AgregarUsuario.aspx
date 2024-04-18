<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarUsuario.aspx.cs" Inherits="Vistas.AgregarUsuario" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style7 {
            width: 206px;
        }
        .auto-style2 {
            width: 165px;
        }
        .auto-style3 {
            width: 165px;
            height: 23px;
            font-size: large;
        }
        .auto-style8 {
            height: 23px;
            width: 206px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style10 {
            width: 165px;
            height: 26px;
            font-size: large;
        }
        .auto-style11 {
            width: 206px;
            height: 26px;
        }
        .auto-style12 {
            height: 26px;
        }
        .auto-style5 {
            width: 165px;
            height: 24px;
        }
        .auto-style9 {
            height: 24px;
            width: 206px;
        }
        .auto-style6 {
            height: 24px;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style13 {
            font-size: x-large;
        }
        .auto-style14 {
            width: 165px;
            height: 30px;
        }
        .auto-style15 {
            width: 206px;
            height: 30px;
        }
        .auto-style16 {
            height: 30px;
        }
        .auto-style17 {
            font-size: large;
        }
        .auto-style18 {
            width: 165px;
            height: 56px;
        }
        .auto-style19 {
            width: 206px;
            height: 56px;
        }
        .auto-style20 {
            height: 56px;
        }
        .auto-style21 {
            width: 165px;
            font-size: large;
        }
        .auto-style22 {
            color: red;
            background-color: #FCE1B0;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style13">AGREGAR USUARIO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></strong><br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style17"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">&nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Nombre: </strong> </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtNombre" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" CssClass="auto-style22" ControlToValidate="txtNombre" ValidationGroup="Group1">Ingrese un nombre</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Apellido:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtApellido" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvApellido" CssClass="auto-style22" runat="server" ControlToValidate="txtApellido" ValidationGroup="Group1">Ingrese un apellido</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>DNI:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtDni" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvDni" CssClass="auto-style22" runat="server" ControlToValidate="txtDni" ValidationGroup="Group1">Ingrese un DNI</asp:RequiredFieldValidator>
                        <br class="auto-style17" />
                        <asp:RegularExpressionValidator ID="reDni" CssClass="auto-style22" runat="server" ControlToValidate="txtDni" ValidationExpression="^\d+$" ValidationGroup="Group1">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Direccion:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtDireccion" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvDireccion" CssClass="auto-style22" runat="server" ControlToValidate="txtDireccion" ValidationGroup="Group1">Ingrese una direccion</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Codigo postal:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtCodigo" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvCodigo" CssClass="auto-style22" runat="server" ControlToValidate="txtCodigo" ValidationGroup="Group1">Ingrese un codigo postal</asp:RequiredFieldValidator>
                        <br class="auto-style17" />
                        <asp:RangeValidator ID="rvCodigo" CssClass="auto-style22" runat="server" ControlToValidate="txtCodigo" MaximumValue="9999" MinimumValue="1000" Type="Integer" ValidationGroup="Group1">Ingrese un codigo de 4 digitos</asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Numero de telefono:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtNumero" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvNumero" CssClass="auto-style22" runat="server" ControlToValidate="txtNumero" ValidationGroup="Group1">Ingrese un numero de telefono</asp:RequiredFieldValidator>
                        <br class="auto-style17" />
                        <asp:RegularExpressionValidator ID="reNumero" CssClass="auto-style22" runat="server" ControlToValidate="txtNumero" ValidationExpression="^\d+$" ValidationGroup="Group1">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Nombre de usuario:</strong></td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txtUsuario" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="rfvUsuario" CssClass="auto-style22" runat="server" ControlToValidate="txtUsuario" ValidationGroup="Group1">Ingrese un usuario</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Mail:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtMail" CssClass="txtBox" runat="server" Width="189px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvMail" CssClass="auto-style22" runat="server" ControlToValidate="txtMail" ValidationGroup="Group1">Ingrese un mail</asp:RequiredFieldValidator>
                        <br class="auto-style17" />
                        <asp:RegularExpressionValidator ID="reMail" CssClass="auto-style22" runat="server" ControlToValidate="txtMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Group1">Ingrese un correo validoIngrese un mail valido</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>Contraseña:</strong></td>
                    <td class="auto-style11">
                        <asp:TextBox ID="txtContrasena" CssClass="txtBox" runat="server" Width="189px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style12">
                        <asp:RequiredFieldValidator ID="rfvContarsena" CssClass="auto-style22" runat="server" ControlToValidate="txtContrasena" ValidationGroup="Group1">Ingrese una contraseña</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Repita la contraseña:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtRepetirContrasena" CssClass="txtBox" runat="server" Width="189px" TextMode="Password" OnTextChanged="txtRepetirContrasena_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="cvContrasena" runat="server" CssClass="auto-style22" ControlToCompare="txtContrasena" ControlToValidate="txtRepetirContrasena" ValidationGroup="Group1">Contraeña incorrecta</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21"><strong>Tipo de usuario:</strong></td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style17">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:RadioButtonList ID="rblTipoUsuario" runat="server" Width="207px" CssClass="neutro">
                            <asp:ListItem Value="1">Administrador</asp:ListItem>
                            <asp:ListItem Value="2" Selected="True">Cliente</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style19"></td>
                    <td class="auto-style20">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style14"></td>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <strong>
                    <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/ConfiguracionUsuarios.aspx" CssClass="auto-style17">Volver</asp:HyperLink>
                        </strong>
                        <br />
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnAgregarUsu" class="btn neutro" runat="server" Text="Agregar" ValidationGroup="Group1" OnClick="btnAgregarUsu_Click" />
                    </td>
                    <td class="auto-style6">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style9">
                        <strong>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="validacion"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style9">
                        <asp:Button ID="btnConfirmar" CssClass="boton confirmar" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" Visible="False" />
                    </td>
                    <td class="auto-style6">
                        <asp:Button ID="btnCancelar" CssClass="boton cancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <strong>
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style17">Home</asp:HyperLink>
                        </strong>
                    </td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        &nbsp;</td>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style6">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
