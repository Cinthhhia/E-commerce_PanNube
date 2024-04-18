<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="Vistas.PerfilUsuario" %>

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
            font-size: x-large;
            width: 162px;
        }
        .auto-style4 {
            width: 168px;
        }
        .auto-style5 {
            width: 162px;
        }
        .auto-style6 {
            width: 162px;
            height: 23px;
            font-size: large;
        }
        .auto-style7 {
            width: 168px;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            font-size: large;
        }
        .auto-style10 {
            width: 162px;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2"><strong>Mi Perfil</strong></td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>Nombre: </strong> </td>
                    <td class="auto-style4">
                        <strong>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>Apellido:</strong></td>
                    <td class="auto-style4">
                        <strong>
                        <asp:Label ID="lblApellido" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>DNI:</strong></td>
                    <td class="auto-style4">
                        <strong>
                        <asp:Label ID="lblDni" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>Direccion:</strong></td>
                    <td class="auto-style4">
                        <strong>
                        <asp:Label ID="lblDireccion" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>Codigo postal:</strong></td>
                    <td class="auto-style4">
                        <strong>
                        <asp:Label ID="lblCodigo" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>Numero de telefono:</strong></td>
                    <td class="auto-style4">
                        <strong>
                        <asp:Label ID="lblNumero" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"><strong>Nombre de usuario:</strong></td>
                    <td class="auto-style4">
                        <strong>
                        <asp:Label ID="lblUsuario" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6"><strong>Mail:</strong></td>
                    <td class="auto-style7">
                        <strong>
                        <asp:Label ID="lblMail" runat="server" CssClass="auto-style9"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style8"></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <strong>
                        <asp:HyperLink ID="hlConfPerfil" runat="server" NavigateUrl="~/ConfigurarPerfil.aspx" CssClass="auto-style9">Configurar Perfil</asp:HyperLink>
                        </strong>
                    </td>
                    <td class="auto-style4">
                        <strong>
                        <asp:HyperLink ID="hlHistorialCompras" runat="server" NavigateUrl="~/HistorialCompras.aspx" CssClass="auto-style9">Historial de compras</asp:HyperLink>
                        </strong>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <strong>
                        <asp:HyperLink ID="hlReportes" runat="server" NavigateUrl="~/ReportesCliente.aspx" CssClass="auto-style9">Reportes</asp:HyperLink>
                        </strong>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <strong>
                        <asp:LinkButton ID="lbCerrraSesion" runat="server" OnClick="lbCerrraSesion_Click" CssClass="auto-style9">Cerrar Sesion</asp:LinkButton>
                        </strong>
                    </td>
                    <td class="auto-style4">
                        <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style9">Home</asp:HyperLink>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
