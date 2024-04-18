<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="Vistas.Registrarse" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 162px;
        }
        .auto-style3 {
            width: 162px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 162px;
            height: 24px;
        }
        .auto-style6 {
            height: 24px;
        }
        .auto-style7 {
            width: 206px;
        }
        .auto-style8 {
            height: 23px;
            width: 206px;
        }
        .auto-style9 {
            height: 24px;
            width: 206px;
        }
        .auto-style10 {
            width: 162px;
            height: 26px;
        }
        .auto-style11 {
            width: 206px;
            height: 26px;
        }
        .auto-style12 {
            height: 26px;
        }
        .auto-style14 {
            text-align: center;
        }
        .auto-style15 {
            width: 162px;
            height: 30px;
        }
        .auto-style16 {
            width: 206px;
            height: 30px;
        }
        .auto-style17 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style14">
                <strong class="titulo-resgitrarse">
                REGISTRATE</strong><br />
            </div>
            <table class="tabla">
                <tr>
                    <td class="auto-style2"><strong></strong></td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Nombre: </strong> </td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtNombre" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvNombre" CssClass="validacion" runat="server" ControlToValidate="txtNombre" ValidationGroup="Group1" ForeColor="Red">Ingrese un nombre</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Apellido:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtApellido" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvApellido" CssClass="validacion" runat="server" ControlToValidate="txtApellido" ValidationGroup="Group1" ForeColor="Red">Ingrese un apellido</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>DNI:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtDni" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvDni" CssClass="validacion" runat="server" ControlToValidate="txtDni" ValidationGroup="Group1" ForeColor="Red">Ingrese un DNI</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="reDni" CssClass="validacion" runat="server" ControlToValidate="txtDni" ValidationExpression="^\d+$" ValidationGroup="Group1" ForeColor="Red">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Direccion:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtDireccion" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvDireccion" CssClass="validacion" runat="server" ControlToValidate="txtDireccion" ValidationGroup="Group1" ForeColor="Red">Ingrese una direccion</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Codigo postal:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtCodigo" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvCodigo" CssClass="validacion" runat="server" ControlToValidate="txtCodigo" ValidationGroup="Group1" ForeColor="Red">Ingrese un codigo postal</asp:RequiredFieldValidator>
                        <br />
                        <asp:RangeValidator ID="rvCodigo" CssClass="validacion" runat="server" ControlToValidate="txtCodigo" MaximumValue="9999" MinimumValue="1000" Type="Integer" ValidationGroup="Group1" ForeColor="Red">Ingrese un codigo de 4 digitos</asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Numero de telefono:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtNumero" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvNumero" CssClass="validacion" runat="server" ControlToValidate="txtNumero" ValidationGroup="Group1" ForeColor="Red">Ingrese un numero de telefono</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="reNumero" CssClass="validacion" runat="server" ControlToValidate="txtNumero" ValidationExpression="^\d+$" ValidationGroup="Group1" ForeColor="Red">Ingrese numeros</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><strong>Nombre de usuario:</strong></td>
                    <td class="auto-style8">
                        <asp:TextBox CssClass="txtBox" ID="txtUsuario" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="rfvUsuario" CssClass="validacion" runat="server" ControlToValidate="txtUsuario" ValidationGroup="Group1" ForeColor="Red">Ingrese un usuario</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Mail:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtMail" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvMail" CssClass="validacion" runat="server" ControlToValidate="txtMail" ValidationGroup="Group1" ForeColor="Red">Ingrese un mail</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="reMail" CssClass="validacion" runat="server" ControlToValidate="txtMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Group1" ForeColor="Red">Ingrese un mail valido</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Repetir mail:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtRepetirMail" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="cvMail" CssClass="validacion" runat="server" ControlToCompare="txtMail" ControlToValidate="txtRepetirMail" ValidationGroup="Group1" ForeColor="Red">Mail incorrecto</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>Contraseña:</strong></td>
                    <td class="auto-style11">
                        <asp:TextBox CssClass="txtBox" ID="txtContrasena" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                    </td>
                    <td class="auto-style12">
                        <asp:RequiredFieldValidator ID="rfvContarsena" CssClass="validacion" runat="server" ControlToValidate="txtContrasena" ValidationGroup="Group1" ForeColor="Red">Ingrese una contraseña</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2"><strong>Repita la contraseña:</strong></td>
                    <td class="auto-style7">
                        <asp:TextBox CssClass="txtBox" ID="txtRepetirContrasena" runat="server" Width="200px" TextMode="Password" OnTextChanged="txtRepetirContrasena_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="cvContrasena" CssClass="validacion" runat="server" ControlToCompare="txtContrasena" ControlToValidate="txtRepetirContrasena" ValidationGroup="Group1" ForeColor="Red">Contraeña incorrecta</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15"></td>
                    <td class="auto-style16"></td>
                    <td class="auto-style17"></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <strong>
                    <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/Login.aspx">Volver</asp:HyperLink>
                        </strong>
                    </td>
                    <td class="auto-style9">
                        <asp:Button ID="btnRegistrarse" class="boton ingresar" runat="server" Text="Registrarse" ValidationGroup="Group1" OnClick="btnRegistrarse_Click" />
                    </td>
                    <td class="auto-style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style8">
                        <asp:Label ID="lblMensaje" CssClass="validacion" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style8">
                        <asp:Button ID="btnConfirmar" class="boton confirmar" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" Visible="False" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnCancelar" class="boton cancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
