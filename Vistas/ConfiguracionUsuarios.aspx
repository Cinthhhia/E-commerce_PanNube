﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfiguracionUsuarios.aspx.cs" Inherits="Vistas.ConfiguracionUsuarios" %>

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
            width: 435px;
        }
        .auto-style3 {
            width: 435px;
            font-size: x-large;
        }
        .auto-style4 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3"><strong>CONFIGURACION USUARIOS</strong></td>
                <td>
                        <strong>
                        <asp:Image ID="imgUsuario" runat="server" Height="45px" Width="45px" Visible="False" />
                        <asp:Label ID="lblUsuarioLogeado" runat="server" CssClass="auto-style4"></asp:Label>
                        </strong>
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <strong>
                    <asp:HyperLink ID="hlAgregarUsuario" runat="server" NavigateUrl="~/AgregarUsuario.aspx" CssClass="auto-style4">Agregar Usuario</asp:HyperLink>
                    </strong>
                </td>
                <td>
                    <strong>
            <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/PaginaPrincipal.aspx" CssClass="auto-style4">Home</asp:HyperLink>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <strong><span class="auto-style4">Buscar por nombre usuario:&nbsp;</span></strong>&nbsp;&nbsp;<asp:TextBox class="txtBox" ID="txtFiltroBuscar" runat="server" Width="170px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button class="btn neutro" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
&nbsp;&nbsp;&nbsp;
                    <asp:Button class="btn neutro" ID="btnBorrar" runat="server" OnClick="btnBorrar_Click" Text="Borrar Filtro" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblMensaje"  class="validacion" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnConfirmar" class="btn neutro" runat="server" OnClick="btnConfirmar_Click" Text="Confirmar" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancelar" class="btn neutro" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" Visible="False" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <div>
        <asp:GridView ID="gvConfUsuarios" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="5" OnRowCancelingEdit="gvConfUsuarios_RowCancelingEdit" OnRowDeleting="gvConfUsuarios_RowDeleting" OnRowEditing="gvConfUsuarios_RowEditing" OnRowUpdating="gvConfUsuarios_RowUpdating" OnPageIndexChanging="gvConfUsuarios_PageIndexChanging" OnRowDataBound="gvConfUsuarios_RowDataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <EditItemTemplate>
                        <asp:Label ID="lblIdUsuario" runat="server" Text='<%# Bind("CodUsuario_Usu") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblIdUsuario" runat="server" Text='<%# Bind("CodUsuario_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Usuario">
                    <EditItemTemplate>
                        <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("NombreUsuario_Usu") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("NombreUsuario_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombreUsuario" runat="server" Text='<%# Bind("Nombre_Usu") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombreUsuario">Ingrese un nombre</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombreUsuario" runat="server" Text='<%# Bind("Nombre_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtApellidoUsuario" runat="server" Text='<%# Bind("Apellido_Usu") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellidoUsuario">Ingrese un apellido</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblApellidoUsuario" runat="server" Text='<%# Bind("Apellido_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Codigo Postal">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCodigoPostal" runat="server" Text='<%# Bind("CodigoPostal_Usu") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigoPostal">Ingrese un codigo postal</asp:RequiredFieldValidator>
                        <br />
                        <asp:RangeValidator ID="rvCodigo" runat="server" ControlToValidate="txtCodigoPostal" MaximumValue="9999" MinimumValue="1000" Type="Integer">Ingrese un codigo de 4 digitos</asp:RangeValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCodigoPostal" runat="server" Text='<%# Bind("CodigoPostal_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Direccion">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDireccion" runat="server" Text='<%# Bind("Direccion_Usu") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion">Ingrese una direccion</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("Direccion_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contacto">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtContacto" runat="server" Text='<%# Bind("Contacto_Usu") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContacto" runat="server" ControlToValidate="txtContacto">Ingrese un contacto</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="reNumeroContatcto" runat="server" ControlToValidate="txtContacto" ValidationExpression="^\d+$">Ingrese numeros</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblContacto" runat="server" Text='<%# Bind("Contacto_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DNI">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDNI" runat="server" Text='<%# Bind("Dni_Usu") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="fvDni" runat="server" ControlToValidate="txtDNI">Ingrese un DNI</asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="reNumeroDni" runat="server" ControlToValidate="txtDNI" ValidationExpression="^\d+$">Ingrese numeros</asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblDNI" runat="server" Text='<%# Bind("Dni_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tipo Usuario">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rblTipoUsuario" runat="server">
                            <asp:ListItem Value="1">Administrador</asp:ListItem>
                            <asp:ListItem Value="2">Cliente</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:Label ID="lblTipoUsuario" runat="server" Text='<%# Bind("Nombre_TipoUsuario") %>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTipoUsuario" runat="server" Text='<%# Bind("Nombre_TipoUsuario") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mail">
                    <EditItemTemplate>
                        <asp:Label ID="lblMailU" runat="server" Text='<%# Bind("Mail_Usu") %>'></asp:Label>
                        <br />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblMail" runat="server" Text='<%# Bind("Mail_Usu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Estado">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="rblEstado" runat="server" SelectedValue='<%# Bind("Estado_Usu") %>' Width="86px">
                            <asp:ListItem Text="True" Value="True" />
                            <asp:ListItem Text="False" Value="False" />
                        </asp:RadioButtonList>
                        <asp:Label ID="lblEstado" runat="server" Text='<%# Bind("Estado_Usu") %>' Visible="False"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEstadoU" runat="server" Text='<%# Bind("Estado_Usu") %>'></asp:Label>
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
                    <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/PerfilAdministrador.aspx" CssClass="auto-style4">Volver</asp:HyperLink>
            </strong>
            <br />
        </div>
    </form>
</body>
</html>