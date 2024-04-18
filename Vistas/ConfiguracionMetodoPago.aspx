﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfiguracionMetodoPago.aspx.cs" Inherits="Vistas.ConfiguracionMetodoPago" %>

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
            width: 507px;
            height: 46px;
        }
        .auto-style4 {
            height: 46px;
        }
        .auto-style3 {
            width: 507px;
        }
        .auto-style5 {
            font-size: large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2"><strong>CONFIGURACION METODO DE PAGOS</strong></td>
                <td class="auto-style4">
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style5"></asp:Label>
                        </strong>
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <strong>
                    <asp:HyperLink ID="hlAgregarMetPago" runat="server" NavigateUrl="~/AgregarMetodoPago.aspx" CssClass="auto-style5">Agregar metodo de pago</asp:HyperLink>
                    </strong>
                </td>
                <td>
                    <strong>
        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style5">Home</asp:HyperLink>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"><strong><span class="auto-style5">Buscar por nombre:&nbsp;</span>&nbsp;&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtFiltroBuscar" class="txtBox" runat="server" Width="178px"></asp:TextBox>
                </td>
                <td><asp:Button ID="btnBuscar" class="btn neutro" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnBorrar" class="btn neutro" runat="server" OnClick="btnBorrar_Click" Text="Borrar Filtro" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblMensaje"  class="validacion" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="btnConfirmar" class="btn neutro" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancelar" class="btn neutro" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" Visible="False" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
            <asp:GridView ID="gvAgregarMetPago" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="gvAgregarMetPago_RowCancelingEdit" OnRowDeleting="gvAgregarMetPago_RowDeleting" OnRowEditing="gvAgregarMetPago_RowEditing" OnRowUpdating="gvAgregarMetPago_RowUpdating" OnRowDataBound="gvAgregarMetPago_RowDataBound" AllowPaging="True" OnPageIndexChanging="gvAgregarMetPago_PageIndexChanging" PageSize="3">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="id_MetodoPago">
                        <EditItemTemplate>
                            <asp:Label ID="lblIdPago" runat="server" Text='<%# Bind("Id_MetodoPago") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIdPago" runat="server" Text='<%# Bind("Id_MetodoPago") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TipoPago">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPago" runat="server" Text='<%# Bind("Nombre_MetodoPago") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtPago">Ingrese un nombre</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="lblMensajeNombre" runat="server"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTipoPago" runat="server" Text='<%# Bind("Nombre_MetodoPago") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:RadioButtonList ID="rblEstado" runat="server" Width="86px" SelectedValue='<%# Bind("Estado_MetodoPago") %>'>
                                <asp:ListItem Text="True" Value="True" />
                                <asp:ListItem Text="False" Value="False" />
                            </asp:RadioButtonList>
                            <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado_MetodoPago") %>' Visible="False"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado_MetodoPago") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        <br />
        <strong>
                    <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/PerfilAdministrador.aspx" CssClass="auto-style5">Volver</asp:HyperLink>
                </strong>
    </form>
</body>
</html>