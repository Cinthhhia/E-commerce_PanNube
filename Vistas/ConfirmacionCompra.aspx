<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmacionCompra.aspx.cs" Inherits="Vistas.ConfirmacionCompra" %>

<!DOCTYPE html>
<link href="Css/EstiloPaginas.css" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style2"></asp:Label>
                        </strong>
                    <br />
            <br />
            <br />
                        <strong>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="neutro"></asp:Label>
                        </strong>
            <br />
            <br />
            <br />
            <br />
            <br />
                        <strong>
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style2">Home</asp:HyperLink>
                        </strong>
                </div>
    </form>
</body>
</html>
