﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfiguracionCategorias.aspx.cs" Inherits="Vistas.ConfiguracionCategorias" %>

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
            width: 420px;
            height: 45px;
        }
        .auto-style4 {
            height: 45px;
        }
        .auto-style3 {
            width: 420px;
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
                <td class="auto-style2"><strong>CONFIGURACION CATEGORIAS</strong></td>
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
                    <asp:HyperLink ID="hlAgregarCategoria" runat="server" NavigateUrl="~/AgregarCategoria.aspx" CssClass="auto-style5">Agregar categoria</asp:HyperLink>
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
                <td class="auto-style3"><strong><span class="auto-style5">Buscar por nombre:</span>&nbsp;&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtFiltroBuscar" class="txtBox" runat="server" Width="178px"></asp:TextBox>
                    &nbsp;</td>
                <td><asp:Button ID="btnBuscar" class="btn neutro" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
&nbsp;&nbsp;
                    <asp:Button ID="btnBorrar" class="btn neutro" runat="server" OnClick="btnBorrar_Click" Text="Borrar Filtro" />
                </td>
            </tr>
            <tr>
                <td>
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
            <asp:GridView ID="gvConfCat" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="gvConfCat_RowCancelingEdit" OnRowDeleting="gvConfCat_RowDeleting" OnRowEditing="gvConfCat_RowEditing" OnRowUpdating="gvConfCat_RowUpdating" OnRowDataBound="gvConfCat_RowDataBound" AllowPaging="True" OnPageIndexChanging="gvConfCat_PageIndexChanging" PageSize="4">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Codigo">
                        <EditItemTemplate>
                            <asp:Label ID="lblCodCategoria" runat="server" Text='<%# Bind("CodCategoria_Ca") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCodCategoria" runat="server" Text='<%# Bind("CodCategoria_Ca") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNombreCategoria" runat="server" Text='<%# Bind("Nombre_Ca") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombreCategoria">Ingrese un nombre</asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="lblMensajeNombre" runat="server"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNombreCategoria" runat="server" Text='<%# Bind("Nombre_Ca") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:RadioButtonList ID="rblEstado" runat="server" Width="86px">
                                <asp:ListItem Value="true">True</asp:ListItem>
                                <asp:ListItem Value="false">False</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado_Ca") %>' Visible="False"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado_Ca") %>'></asp:Label>
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
        <br />
    </form>
</body>
</html>