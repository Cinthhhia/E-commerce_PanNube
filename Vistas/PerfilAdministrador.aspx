<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfilAdministrador.aspx.cs" Inherits="Vistas.PerfilAdministrador" %>

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
        .auto-style3 {
            height: 23px;
        }
        .auto-style4 {
            width: 174px;
        }
        .auto-style5 {
            height: 23px;
            width: 174px;
        }
        .auto-style6 {
            font-size: x-large;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style8 {
            width: 174px;
            font-size: large;
        }
        .auto-style9 {
            height: 23px;
            width: 174px;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style6">Perfil Administrador</span></strong><br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8"><strong>Nombre: </strong> </td>
                    <td>
                        <strong>
                        <asp:Label ID="lblNombre" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"><strong>Apellido:</strong></td>
                    <td>
                        <strong>
                        <asp:Label ID="lblApellido" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9"><strong>DNI:</strong></td>
                    <td class="auto-style3">
                        <strong>
                        <asp:Label ID="lblDni" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"><strong>Direccion:</strong></td>
                    <td>
                        <strong>
                        <asp:Label ID="lblDireccion" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"><strong>Codigo postal:</strong></td>
                    <td>
                        <strong>
                        <asp:Label ID="lblCodigo" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9"><strong>Numero de telefono:</strong></td>
                    <td class="auto-style3">
                        <strong>
                        <asp:Label ID="lblNumero" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"><strong>Nombre de usuario:</strong></td>
                    <td>
                        <strong>
                        <asp:Label ID="lblUsuario" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8"><strong>Mail:</strong></td>
                    <td>
                        <strong>
                        <asp:Label ID="lblMail" runat="server" CssClass="auto-style7"></asp:Label>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <strong>
                        <asp:HyperLink ID="hlConfirmarPerfil" runat="server" NavigateUrl="~/ConfigurarPerfil.aspx" CssClass="auto-style7">Configurar Perfil</asp:HyperLink>
                        </strong>
                    </td>
                    <td>
                        <strong>
                        <asp:HyperLink ID="hlConfUsuarios" runat="server" NavigateUrl="~/ConfiguracionUsuarios.aspx" CssClass="auto-style7">Configurar Usuarios</asp:HyperLink>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <strong>
                        <asp:HyperLink ID="hlConfProd" runat="server" NavigateUrl="~/ConfiguracionProductos.aspx" CssClass="auto-style7">Configurar productos</asp:HyperLink>
                        </strong>
                    </td>
                    <td>
                        <strong>
                        <asp:HyperLink ID="hlConfMetPago" runat="server" NavigateUrl="~/ConfiguracionMetodoPago.aspx" CssClass="auto-style7">Configurar metodo de pago</asp:HyperLink>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <strong>
                        <asp:HyperLink ID="hlConfCateg" runat="server" NavigateUrl="~/ConfiguracionCategorias.aspx" CssClass="auto-style7">Configurar categoria</asp:HyperLink>
                        </strong>
                    </td>
                    <td>
                        <strong>
                        <asp:HyperLink ID="hlHistorialVentas" runat="server" NavigateUrl="~/HistorialVentas.aspx" CssClass="auto-style7">Historial de ventas</asp:HyperLink>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <strong>
                        <asp:HyperLink ID="hlReportes" runat="server" NavigateUrl="~/ReportesAdministrador.aspx" CssClass="auto-style7">Reportes</asp:HyperLink>
                        </strong>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <strong>
                        <asp:LinkButton ID="lbCerrarSesion" runat="server" OnClick="lbCerrarSesion_Click" CssClass="auto-style7">Cerrar sesion</asp:LinkButton>
                        </strong>
                    </td>
                    <td>
                        <strong>
                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style7">Home</asp:HyperLink>
                        </strong>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
