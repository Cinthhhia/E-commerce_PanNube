USE [master]
GO

CREATE DATABASE [BDPanNube]
GO

USE [BDPanNube]
GO

------- CREACIÓN TABLAS ------------------------------------------------------------------------------------------------------------------

CREATE TABLE Categorias
(
CodCategoria_Ca int NOT NULL identity(1,1),
Nombre_Ca varchar(20) NOT NULL,
Estado_Ca bit not null Default(1)
CONSTRAINT PK_Categorias PRIMARY KEY (CodCategoria_Ca)
)
GO

CREATE TABLE Productos
(
CodProducto_Pro int NOT NULL identity(1,1),
Nombre_Pro varchar(100) NOT NULL,
CodCategoria_Pro int NOT NULL,
SinTacc_Pro bit not null Default(1),
Stock_Pro int default 0,
PrecioUnitario_Pro decimal(8,2) default 0,
Estado_Pro bit not null Default(1),
Imagen_Pro varchar(100) NOT NULL
CONSTRAINT PK_Productos PRIMARY KEY (CodProducto_Pro),
CONSTRAINT FK_Productos_Categorias FOREIGN KEY (CodCategoria_Pro)
REFERENCES Categorias(CodCategoria_Ca)
)
GO

CREATE TABLE TipoUsuario
(
Id_TipoUsuario int NOT NULL identity(1,1),
Nombre_TipoUsuario varchar(20) NOT NULL,
Estado_TipoUsuario bit not null Default(1)
CONSTRAINT PK_TipoUsuario PRIMARY KEY (Id_TipoUsuario)
)
GO

CREATE TABLE Usuarios
(
CodUsuario_Usu int NOT NULL identity(1,1),
NombreUsuario_Usu varchar(20) NOT NULL,
Contrasena_Usu varchar(20) NOT NULL,
Nombre_Usu varchar(20) not null,
Apellido_Usu varchar(20) not null,
CodigoPostal_Usu varchar(20) not null,
Direccion_Usu varchar(100) not null,
Contacto_Usu varchar(20) not null,
Dni_Usu varchar(20) not null,
TipoUsuario_Usu int NOT NULL,
Mail_Usu varchar(100) not null,
Estado_Usu bit not null Default(1)
CONSTRAINT PK_Usuarios PRIMARY KEY (CodUsuario_Usu),
CONSTRAINT FK_Usuarios_TipoUsuario FOREIGN KEY (TipoUsuario_Usu)
REFERENCES TipoUsuario(Id_TipoUsuario)
)
GO

CREATE TABLE TipoEntrega
(
Id_TipoEntrega int NOT NULL identity(1,1),
Nombre_TipoEntrega varchar(20) NOT NULL,
Estado_TipoEntrega bit not null Default(1)
CONSTRAINT PK_TipoEntrega PRIMARY KEY (Id_TipoEntrega)
)
GO

CREATE TABLE MetodoPago
(
Id_MetodoPago int NOT NULL identity(1,1),
Nombre_MetodoPago varchar(20) NOT NULL,
Estado_MetodoPago bit not null Default(1)
CONSTRAINT PK_MetodoPago PRIMARY KEY (Id_MetodoPago)
)
GO

CREATE TABLE Ventas
(
CodVentas_Ven int NOT NULL identity(1,1),
CodUsuario_Ven int NOT NULL,
Fechas_Ven datetime Default(GETDATE()),
Contacto_Ven varchar(20) not null,
TipoEntrega_Ven int NOT NULL,
Direccion_Ven varchar(100) not null,
MetodoPago_Ven int NOT NULL,
Total_Ven decimal(8,2) default 0,
CONSTRAINT PK_Ventas PRIMARY KEY (CodVentas_Ven),
CONSTRAINT FK_Ventas_Usuario FOREIGN KEY (CodUsuario_Ven)
REFERENCES Usuarios(CodUsuario_Usu),
CONSTRAINT FK_Ventas_TipoEntrega FOREIGN KEY (TipoEntrega_Ven)
REFERENCES TipoEntrega(Id_TipoEntrega),
CONSTRAINT FK_Ventas_MetodoPago FOREIGN KEY (MetodoPago_Ven)
REFERENCES MetodoPago(Id_MetodoPago)
)
GO

CREATE TABLE DetalleVenta
(
CodVenta_DV int NOT NULL,
CodProducto_DV int NOT NULL,
PrecioUnitario_DV decimal(8,2) default 0,
Cantidad_DV int NOT NULL,
CONSTRAINT PK_DetalleVenta PRIMARY KEY (CodVenta_DV, CodProducto_DV),
CONSTRAINT FK_DetalleVenta_Ventas FOREIGN KEY (CodVenta_DV)
REFERENCES Ventas(CodVentas_Ven),
CONSTRAINT FK_DetalleVenta_Productos FOREIGN KEY (CodProducto_DV)
REFERENCES Productos(CodProducto_Pro)
)
GO


--- PROCEDIMIENTOS ALMACENADOS ------------------------------------------------------------------------------------------------------------------

--CATEGORIAS

CREATE PROCEDURE [dbo].[spAgregarCategoria]
(
@NOMBREPCATEGORIA varchar(20)
)
AS
INSERT INTO Categorias(Nombre_Ca) VALUES (@NOMBREPCATEGORIA)
GO

CREATE PROCEDURE [dbo].[spActualizarCategoria]
(
@CODCATEGORIA int,
@NOMBREPCATEGORIA varchar(20),
@ESTADOCAT bit
)
AS
UPDATE Categorias SET Nombre_Ca = @NOMBREPCATEGORIA, Estado_Ca = @ESTADOCAT
WHERE CodCategoria_Ca = @CODCATEGORIA
GO

CREATE PROCEDURE [dbo].[spEliminarCategoria]
(
@CODCATEGORIA int
)
AS
UPDATE Categorias SET Estado_Ca = 0
WHERE CodCategoria_Ca = @CODCATEGORIA
RETURN
GO

CREATE PROCEDURE [dbo].[spExisteCategoria]
(
@NOMBRECATEGORIA varchar(20)
)
AS
SELECT Nombre_Ca
FROM Categorias
WHERE @NOMBRECATEGORIA =Nombre_Ca 
RETURN
GO

----------------------------------------------

--METODO DE PAGO

CREATE PROCEDURE [dbo].[spAgregarMetPago]
(
@NOMBRE varchar(20)
)
AS
INSERT INTO MetodoPago(Nombre_MetodoPago) VALUES (@NOMBRE)
GO

CREATE PROCEDURE [dbo].[spActualizarMetPago]
(
@COD int,
@NOMBRE varchar(20),
@ESTADOMET bit
)
AS
UPDATE MetodoPago SET Nombre_MetodoPago = @NOMBRE, 
	Estado_MetodoPago = @ESTADOMET
WHERE Id_MetodoPago = @COD
GO

CREATE PROCEDURE [dbo].[spEliminarMetPago]
(
@COD int
)
AS
UPDATE MetodoPago SET Estado_MetodoPago = 0
WHERE Id_MetodoPago = @COD
RETURN
GO

----------------------------------------------

--PRODUCTOS

CREATE PROCEDURE [dbo].[spAgregarProducto]
(
@NOMBREPRODUCTO varchar(100),
@CODCATEGORIA int,
@SINTACC bit,
@STOCK int,
@PRECIO decimal(8,2),
@ESTADO bit,
@IMAGEN varchar(100)
)
AS
BEGIN 
	IF EXISTS (SELECT 1 FROM Categorias WHERE CodCategoria_Ca = @CODCATEGORIA)
BEGIN
	INSERT INTO Productos(Nombre_Pro,CodCategoria_Pro,SinTacc_Pro,Stock_Pro,PrecioUnitario_Pro,Estado_Pro,Imagen_Pro) 
	VALUES(@NOMBREPRODUCTO,@CODCATEGORIA,@SINTACC,@STOCK,@PRECIO,@ESTADO,@IMAGEN);
END 
ELSE 
BEGIN 
	PRINT 'El codigo de categoria ' + @CODCATEGORIA + 'no existe';
END
END
GO

CREATE PROCEDURE [dbo].[spActualizarProducto]
(
@CODPRODUCTO int,
@NOMBREPRODUCTO varchar(100),
@CODCATEGORIA int,
@SINTACC bit,
@STOCK int,
@PRECIO decimal(8,2),
@IMAGEN varchar(100),
@ESTADOPROG bit
)
AS
UPDATE Productos SET Nombre_Pro = @NOMBREPRODUCTO, 
CodCategoria_Pro = @CODCATEGORIA, 
SinTacc_Pro = @SINTACC, 
Stock_Pro = @STOCK, 
PrecioUnitario_Pro = @PRECIO, 
Imagen_Pro = @IMAGEN,
Estado_Pro = @ESTADOPROG
WHERE CodProducto_Pro = @CODPRODUCTO
GO

CREATE PROCEDURE [dbo].[spEliminarProducto]
(
@CODPRODUCTO int
)
AS
UPDATE Productos SET Estado_Pro = 0 
WHERE CodProducto_Pro = @CODPRODUCTO
RETURN
GO

----------------------------------------------

--USUARIOS

CREATE PROCEDURE [dbo].[spAgregarUsuario]
(
@NOMBREUSUARIOUSU varchar(20),
@CONTRASENAUSU varchar(20),
@NOMBREUSU varchar(20),
@APELLIDOUSU varchar(20),
@CODIGOPOSTALUSU varchar(20),
@DIRECCIONUSU varchar(100),
@CONTACTOUSU varchar(20),
@DNIUSU varchar(20),
@TIPODEUSUARIO int,
@MAILUSU varchar(100)
)
AS
BEGIN 
	IF EXISTS (SELECT 1 FROM TipoUsuario WHERE Id_TipoUsuario = @TIPODEUSUARIO)
	BEGIN
		INSERT INTO Usuarios(NombreUsuario_Usu,Contrasena_Usu,Nombre_Usu,Apellido_Usu,CodigoPostal_Usu,Direccion_Usu,Contacto_Usu,Dni_Usu,TipoUsuario_Usu,Mail_Usu) 
		VALUES(@NOMBREUSUARIOUSU,@CONTRASENAUSU,@NOMBREUSU,@APELLIDOUSU,@CODIGOPOSTALUSU,@DIRECCIONUSU,@CONTACTOUSU,@DNIUSU,@TIPODEUSUARIO,@MAILUSU);
	END 
END
GO

CREATE PROCEDURE [dbo].[spActualizarUsuario]
(
@CODUSUARIO int,
@NOMBRE varchar(20),
@APELLIDO varchar(20),
@DNI varchar(20),
@DIRECCION varchar(100),
@CODIGOPOSTAL varchar(20),
@CONTACTO varchar(20),
@TIPOUSUARIO int,
@ESTADOUSU bit
)
AS
	UPDATE Usuarios SET Nombre_Usu = @NOMBRE, 
	Apellido_Usu = @APELLIDO, 
	Dni_Usu = @DNI, 
	Direccion_Usu = @DIRECCION, 
	CodigoPostal_Usu = @CODIGOPOSTAL, 
	Contacto_Usu = @CONTACTO,
	TipoUsuario_Usu = @TIPOUSUARIO,
	Estado_Usu = @ESTADOUSU
	WHERE CodUsuario_Usu = @CODUSUARIO
GO

CREATE PROCEDURE [dbo].[spEliminarUsuario]
(
@CODUSUARIO int
)
AS
UPDATE Usuarios SET Estado_Usu = 0
WHERE CodUsuario_Usu = @CODUSUARIO
RETURN
GO

CREATE PROCEDURE [dbo].[spActualizarPerfil]
(
@CODUSUARIO int,
@NOMBRE varchar(20),
@APELLIDO varchar(20),
@DNI varchar(20),
@DIRECCION varchar(100),
@CODIGOPOSTAL varchar(20),
@CONTACTO varchar(20)
)
AS
UPDATE Usuarios SET Nombre_Usu = @NOMBRE, 
Apellido_Usu = @APELLIDO, 
Dni_Usu = @DNI, 
Direccion_Usu = @DIRECCION, 
CodigoPostal_Usu = @CODIGOPOSTAL, 
Contacto_Usu = @CONTACTO
WHERE CodUsuario_Usu = @CODUSUARIO
GO

CREATE PROCEDURE [dbo].[spActualizarContra]
(
@CODUSUARIO int,
@CONTRASENA varchar(20)
)
AS
UPDATE Usuarios SET Contrasena_Usu = @CONTRASENA
WHERE CodUsuario_Usu = @CODUSUARIO
GO

/*
CREATE PROCEDURE [dbo].[spExisteNombreUsuario]
(
@NOMBREUSUARIO varchar(20)
)
AS
SELECT NombreUsuario_Usu
FROM Usuarios
WHERE @NOMBREUSUARIO = NombreUsuario_Usu 
RETURN
GO

CREATE PROCEDURE [dbo].[spExisteTipoUsuario]
(
@TIPOUSUARIO int
)
AS
SELECT Id_TipoUsuario
FROM TipoUsuario
WHERE @TIPOUSUARIO = Id_TipoUsuario
RETURN
GO*/

CREATE PROCEDURE [dbo].[spLoginUsuario]
(
@NOMBREUSUARIO varchar(20),
@CONTRASENA varchar(20)
)
AS
SELECT NombreUsuario_Usu, Contrasena_Usu
FROM Usuarios
WHERE @NOMBREUSUARIO COLLATE SQL_Latin1_General_CP1_CS_AS =NombreUsuario_Usu AND @CONTRASENA COLLATE SQL_Latin1_General_CP1_CS_AS =Contrasena_Usu AND Estado_Usu=1
RETURN
GO


USE [master]
GO
ALTER DATABASE [BDPanNube] SET  READ_WRITE 
GO

----------------------------------------------

--HISTORIAL DE VENTAS
USE BDPanNube
GO

CREATE PROCEDURE [dbo].[spFiltrarVentasPrecioIgual]
    @CODIGOVENTA INT = NULL,
    @CODIGOUSUARIO INT = NULL,
    @FECHA1 VARCHAR(20) = NULL,
    @FECHA2 VARCHAR(20) = NULL,
    @PRECIO DECIMAL(8, 2) = NULL,
    @ENTREGA INT = NULL,
    @PAGO INT = NULL
AS
BEGIN
    DECLARE @FECHADESDE DATETIME
    DECLARE @FECHAHASTA DATETIME
    SET @FECHADESDE= CONVERT(datetime, @FECHA1, 120)
    SET @FECHAHASTA= CONVERT(datetime, @FECHA2, 120)

    SELECT
        CodVentas_Ven,
        CodUsuario_Ven,
		NombreUsuario_Usu,
        Fechas_Ven,
        Contacto_Ven,
        Nombre_TipoEntrega,
        Direccion_Ven,
        Nombre_MetodoPago,
        Total_Ven
    FROM (dbo.Ventas inner join TipoEntrega on TipoEntrega_Ven = Id_TipoEntrega) inner join MetodoPago on MetodoPago_Ven = Id_MetodoPago inner join Usuarios on CodUsuario_Ven = CodUsuario_Usu

    WHERE
        (@CODIGOVENTA IS NULL OR CodVentas_Ven = @CODIGOVENTA)
        AND (@CODIGOUSUARIO IS NULL OR CodUsuario_Ven = @CODIGOUSUARIO)
        AND (@PRECIO IS NULL OR Total_Ven = @PRECIO)
        AND (@ENTREGA IS NULL OR TipoEntrega_Ven = @ENTREGA)
        AND (@PAGO IS NULL OR MetodoPago_Ven = @PAGO)
        AND ((@FECHADESDE IS NULL AND @FECHAHASTA IS NULL) OR (Fechas_Ven BETWEEN @FECHADESDE AND @FECHAHASTA));
END
GO

CREATE PROCEDURE [dbo].[spFiltrarVentasPrecioMayor]
    @CODIGOVENTA INT = NULL,
    @CODIGOUSUARIO INT = NULL,
    @FECHAH VARCHAR(20) = NULL,
    @FECHAD VARCHAR(20) = NULL,
    @PRECIO DECIMAL(8, 2) = NULL,
    @ENTREGA INT = NULL,
    @PAGO INT = NULL
AS
BEGIN
    DECLARE @FECHADES DATETIME
    DECLARE @FECHAHAS DATETIME
    SET @FECHADES= CONVERT(datetime, @FECHAH, 120)
    SET @FECHAHAS= CONVERT(datetime, @FECHAD, 120)

    SELECT 
        CodVentas_Ven,
        CodUsuario_Ven,
		NombreUsuario_Usu,
        Fechas_Ven,
        Contacto_Ven,
        Nombre_TipoEntrega,
        Direccion_Ven,
        Nombre_MetodoPago,
        Total_Ven
    FROM (Ventas inner join TipoEntrega on TipoEntrega_Ven = Id_TipoEntrega) inner join MetodoPago on MetodoPago_Ven = Id_MetodoPago inner join Usuarios on CodUsuario_Ven = CodUsuario_Usu
    WHERE
        (@CODIGOVENTA IS NULL OR CodVentas_Ven = @CODIGOVENTA)
        AND (@CODIGOUSUARIO IS NULL OR CodUsuario_Ven = @CODIGOUSUARIO)
        AND (@PRECIO IS NULL OR Total_Ven > @PRECIO)
        AND (@ENTREGA IS NULL OR TipoEntrega_Ven = @ENTREGA)
        AND (@PAGO IS NULL OR MetodoPago_Ven = @PAGO)
        AND (
            (@FECHADES IS NULL AND @FECHAHAS IS NULL)
            OR (Fechas_Ven BETWEEN @FECHADES AND @FECHAHAS)
        );
END
GO

CREATE PROCEDURE [dbo].[spFiltrarVentasPrecioMenor]
    @CODIGOVENTA INT = NULL,
    @CODIGOUSUARIO INT = NULL,
    @FECHAHA VARCHAR(20) = NULL,
    @FECHADE VARCHAR(20) = NULL,
    @PRECIO DECIMAL(8, 2) = NULL,
    @ENTREGA INT = NULL,
    @PAGO INT = NULL
AS
BEGIN
    DECLARE @FECHADESD DATETIME
    DECLARE @FECHAHAST DATETIME
    SET @FECHADESD= CONVERT(datetime, @FECHAHA, 120)
    SET @FECHAHAST= CONVERT(datetime, @FECHADE, 120)

    SELECT 
        CodVentas_Ven,
        CodUsuario_Ven,
		NombreUsuario_Usu,
        Fechas_Ven,
        Contacto_Ven,
        Nombre_TipoEntrega,
        Direccion_Ven,
        Nombre_MetodoPago,
        Total_Ven
   FROM (Ventas inner join TipoEntrega on TipoEntrega_Ven = Id_TipoEntrega) inner join MetodoPago on MetodoPago_Ven = Id_MetodoPago inner join Usuarios on CodUsuario_Ven = CodUsuario_Usu

    WHERE
        (@CODIGOVENTA IS NULL OR CodVentas_Ven = @CODIGOVENTA)
        AND (@CODIGOUSUARIO IS NULL OR CodUsuario_Ven = @CODIGOUSUARIO)
        AND (@PRECIO IS NULL OR Total_Ven < @PRECIO)
        AND (@ENTREGA IS NULL OR TipoEntrega_Ven = @ENTREGA)
        AND (@PAGO IS NULL OR MetodoPago_Ven = @PAGO)
        AND (
            (@FECHADESD IS NULL AND @FECHAHAST IS NULL)
            OR (Fechas_Ven BETWEEN @FECHADESD AND @FECHAHAST)
        );
END
GO

----------------------------------------------

--PAGINA PRINCIPAL

CREATE PROCEDURE [dbo].[spFiltrarProductoMenorMil]
    @CODCATEGORIA INT = 0,
	@SINTACC BIT = 0,
    @PRECIO DECIMAL(8, 2) = 0
AS
BEGIN
    SELECT
         CodProducto_Pro, Nombre_Pro, Nombre_Ca, SinTacc_Pro, Stock_Pro, PrecioUnitario_Pro, Estado_Pro, Imagen_Pro  
    FROM Productos inner join Categorias on CodCategoria_Pro = CodCategoria_Ca

    WHERE
        (@CODCATEGORIA = 0 OR CodCategoria_Pro = @CODCATEGORIA)
        AND (@SINTACC = 0 OR SinTacc_Pro = @SINTACC)
        AND (@PRECIO = 0 OR PrecioUnitario_Pro < @PRECIO);
END
GO

CREATE PROCEDURE [dbo].[spFiltrarProductoMayorMil]
    @CODCATEGORIA INT = 0,
	@SINTACC BIT = 0,
    @PRECIO DECIMAL(8, 2) = 0
AS
BEGIN
    SELECT
         CodProducto_Pro, Nombre_Pro, Nombre_Ca, SinTacc_Pro, Stock_Pro, PrecioUnitario_Pro, Estado_Pro, Imagen_Pro  
    FROM Productos inner join Categorias on CodCategoria_Pro = CodCategoria_Ca

    WHERE
        (@CODCATEGORIA = 0 OR CodCategoria_Pro = @CODCATEGORIA)
        AND (@SINTACC = 0 OR SinTacc_Pro = @SINTACC)
        AND (@PRECIO = 0 OR PrecioUnitario_Pro >= @PRECIO);
END
GO

----------------------------------------------

--CARRITO DE COMPRAS

CREATE PROCEDURE [dbo].[spAgregarVenta]
    @CODUSUARIO INT,
	@TIPOENTREGA INT,
    @METPAGO INT,
	@TOTAL DECIMAL (8,2)
AS
BEGIN
	DECLARE @CONTACTO VARCHAR (20)
	DECLARE @DIRECCION VARCHAR (100)
   IF EXISTS (SELECT 1 FROM Usuarios WHERE CodUsuario_Usu = @CODUSUARIO)
BEGIN
	IF (@TIPOENTREGA = 1)
	BEGIN
	SELECT @DIRECCION = Nombre_TipoEntrega FROM TipoEntrega WHERE Id_TipoEntrega = @TIPOENTREGA
	END
	ELSE 
	BEGIN
	SELECT @DIRECCION = Direccion_Usu FROM Usuarios WHERE CodUsuario_Usu = @CODUSUARIO
	END
	SELECT @CONTACTO = Contacto_Usu FROM Usuarios WHERE CodUsuario_Usu = @CODUSUARIO
	INSERT INTO Ventas(CodUsuario_Ven,Fechas_Ven,Contacto_Ven,TipoEntrega_Ven,Direccion_Ven,MetodoPago_Ven,Total_Ven) 
	VALUES(@CODUSUARIO,GETDATE(),@CONTACTO,@TIPOENTREGA,@DIRECCION,@METPAGO,@TOTAL);
END 
END
GO

CREATE PROCEDURE [dbo].[spAgregarDetalleDeVenta]
    @CODPROD INT,
    @PRECIOXUNIDAD DECIMAL (8,2),
    @CANTIDAD INT
AS
BEGIN
    INSERT INTO DetalleVenta(CodVenta_DV,CodProducto_DV,PrecioUnitario_DV,Cantidad_DV)
    SELECT (SELECT MAX(CodVentas_Ven) FROM Ventas), @CODPROD, @PRECIOXUNIDAD, @CANTIDAD
END
GO

CREATE TRIGGER TG_BajaStock
ON DetalleVenta
AFTER INSERT 
AS
BEGIN
SET NOCOUNT ON;
UPDATE Productos
SET Stock_Pro= Stock_Pro - (SELECT Cantidad_DV FROM INSERTED)
WHERE CodProducto_Pro = (SELECT CodProducto_DV FROM INSERTED)
END
GO


--- CARGA DE DATOS ---------------------------------------------------------------------------------------------------------------------
USE BDPanNube
GO



SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([CodCategoria_Ca], [Nombre_Ca], [Estado_Ca]) VALUES (1, N'Pan', 1)
INSERT [dbo].[Categorias] ([CodCategoria_Ca], [Nombre_Ca], [Estado_Ca]) VALUES (2, N'Torta', 1)
INSERT [dbo].[Categorias] ([CodCategoria_Ca], [Nombre_Ca], [Estado_Ca]) VALUES (3, N'Facturas', 1)
INSERT [dbo].[Categorias] ([CodCategoria_Ca], [Nombre_Ca], [Estado_Ca]) VALUES (4, N'Galletas', 1)
INSERT [dbo].[Categorias] ([CodCategoria_Ca], [Nombre_Ca], [Estado_Ca]) VALUES (5, N'Sandwiches de miga', 1)
INSERT [dbo].[Categorias] ([CodCategoria_Ca], [Nombre_Ca], [Estado_Ca]) VALUES (6, N'Budin', 1)
INSERT [dbo].[Categorias] ([CodCategoria_Ca], [Nombre_Ca], [Estado_Ca]) VALUES (7, N'Tarta', 1)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO



SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (1, N'Pan de salvado', 1, 0, 500, CAST(400.78 AS Decimal(8, 2)), 1, N'~/Imagenes/1.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (2, N'Pan de trigo', 1, 0, 750, CAST(120.00 AS Decimal(8, 2)), 1, N'~/Imagenes/2.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (3, N'Pan de campo', 1, 0, 400, CAST(480.50 AS Decimal(8, 2)), 1, N'~/Imagenes/3.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (4, N'Pan baguete', 1, 0, 550, CAST(450.00 AS Decimal(8, 2)), 1, N'~/Imagenes/4.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (5, N'Pan integral', 1, 0, 320, CAST(570.85 AS Decimal(8, 2)), 1, N'~/Imagenes/5.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (6, N'Pan de maiz', 1, 1, 800, CAST(249.99 AS Decimal(8, 2)), 1, N'~/Imagenes/6.jpg')

INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (7, N'Torta de ricota', 2, 0, 25, CAST(5000.00 AS Decimal(8, 2)), 1, N'~/Imagenes/7.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (8, N'Chocotorta', 2, 0, 34, CAST(6800.00 AS Decimal(8, 2)), 1, N'~/Imagenes/8.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (9, N'Cheesecake', 2, 1, 30, CAST(7000.00 AS Decimal(8, 2)), 1, N'~/Imagenes/9.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (10, N'Torta de Oreo', 2, 0, 26, CAST(8600.00 AS Decimal(8, 2)), 1, N'~/Imagenes/10.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (11, N'Selva negra', 2, 0, 15, CAST(7900.00 AS Decimal(8, 2)), 1, N'~/Imagenes/11.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (12, N'Torta de chocolate', 2, 0, 50, CAST(5800.00 AS Decimal(8, 2)), 1, N'~/Imagenes/12.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (13, N'Mil hojas', 2, 0, 40, CAST(4199.99 AS Decimal(8, 2)), 1, N'~/Imagenes/13.jpg')

INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (14, N'Medialuna', 3, 1, 800, CAST(223.32 AS Decimal(8, 2)), 1, N'~/Imagenes/14.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (15, N'Vigilantes', 3, 0, 600, CAST(390.00 AS Decimal(8, 2)), 1, N'~/Imagenes/15.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (16, N'Cañoncito', 3, 0, 460, CAST(380.85 AS Decimal(8, 2)), 1, N'~/Imagenes/16.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (17, N'Moñito', 3, 0, 680, CAST(430.00 AS Decimal(8, 2)), 1, N'~/Imagenes/17.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (18, N'Churro', 3, 0, 500, CAST(310.00 AS Decimal(8, 2)), 1, N'~/Imagenes/18.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (19, N'Tortita negra', 3, 0, 1000, CAST(199.99 AS Decimal(8, 2)), 1, N'~/Imagenes/19.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (20, N'Berlinesa', 3, 0, 750, CAST(120.00 AS Decimal(8, 2)), 1, N'~/Imagenes/20.jpg')

INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (21, N'Galletita de chocolate', 4, 0, 500, CAST(49.99 AS Decimal(8, 2)), 1, N'~/Imagenes/21.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (22, N'Galletita de avena', 4, 0, 560, CAST(80.00 AS Decimal(8, 2)), 1, N'~/Imagenes/22.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (23, N'Galletita de chips de chocolate', 4, 0, 670, CAST(119.69 AS Decimal(8, 2)), 1, N'~/Imagenes/23.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (24, N'Galletita de avena y coco', 4, 0, 580, CAST(90.00 AS Decimal(8, 2)), 1, N'~/Imagenes/24.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (25, N'Galletita marmolada', 4, 0, 600, CAST(80.00 AS Decimal(8, 2)), 1, N'~/Imagenes/25.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (26, N'Galletita pepa', 4, 0, 100, CAST(89.50 AS Decimal(8, 2)), 1, N'~/Imagenes/26.jpg')

INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (27, N'Sandwiches de jamon y queso', 5, 1, 200, CAST(249.99 AS Decimal(8, 2)), 1, N'~/Imagenes/27.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (28, N'Sandwiches de queso y tomate', 5, 0, 125, CAST(249.99 AS Decimal(8, 2)), 1, N'~/Imagenes/28.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (29, N'Sandwiches de queso y choclo', 5, 0, 220, CAST(210.00 AS Decimal(8, 2)), 1, N'~/Imagenes/29.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (30, N'Sandwiches de huevo y queso', 5, 0, 150, CAST(229.99 AS Decimal(8, 2)), 1, N'~/Imagenes/30.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (31, N'Sandwiches de aceituna y queso ', 5, 0, 300, CAST(249.99 AS Decimal(8, 2)), 1, N'~/Imagenes/31.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (32, N'Sandwiches de lechuga y tomate', 5, 0, 600, CAST(199.99 AS Decimal(8, 2)), 1, N'~/Imagenes/32.jpg')

INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (33, N'Budin de chocolate', 6, 0, 300, CAST(710.00 AS Decimal(8, 2)), 1, N'~/Imagenes/33.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (34, N'Budin de limón ', 6, 0, 280, CAST(780.00 AS Decimal(8, 2)), 1, N'~/Imagenes/34.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (35, N'Budin de pan', 6, 0, 340, CAST(889.99 AS Decimal(8, 2)), 1, N'~/Imagenes/35.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (36, N'Budin de banana', 6, 0, 800, CAST(1120.00 AS Decimal(8, 2)), 1, N'~/Imagenes/36.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (37, N'Budin de vainilla', 6, 0, 7800, CAST(1400.00 AS Decimal(8, 2)), 1, N'~/Imagenes/37.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (38, N'Budin de naranja', 6, 0, 100, CAST(3600.00 AS Decimal(8, 2)), 1, N'~/Imagenes/38.jpg')

INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (39, N'Pasta frola de membrillo', 7, 0, 460, CAST(2559.99 AS Decimal(8, 2)), 1, N'~/Imagenes/39.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (40, N'Pasta frola de batata', 7, 0, 400, CAST(2500.00 AS Decimal(8, 2)), 1, N'~/Imagenes/40.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (41, N'Pasta frola de batata y membrillo', 7, 0, 260, CAST(2500.00 AS Decimal(8, 2)), 1, N'~/Imagenes/41.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (42, N'Pasta frola de dulce de leche', 7, 0, 270, CAST(2750.00 AS Decimal(8, 2)), 1, N'~/Imagenes/42.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (43, N'Tarta de dulce de leche con chocolate', 7, 0, 300, CAST(3499.99 AS Decimal(8, 2)), 1, N'~/Imagenes/43.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (44, N'Tarta de manzana', 7, 0, 250, CAST(3400.00 AS Decimal(8, 2)), 1, N'~/Imagenes/44.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (45, N'Tarta de frutillas', 7, 0, 245, CAST(4199.99 AS Decimal(8, 2)), 1, N'~/Imagenes/45.jpg')
INSERT [dbo].[Productos] ([CodProducto_Pro], [Nombre_Pro], [CodCategoria_Pro], [SinTacc_Pro], [Stock_Pro], [PrecioUnitario_Pro], [Estado_Pro], [Imagen_Pro]) VALUES (46, N'Lemon pie', 7, 0, 330, CAST(4500.00 AS Decimal(8, 2)), 1, N'~/Imagenes/46.jpg')

SET IDENTITY_INSERT [dbo].[Productos] OFF
GO




SET IDENTITY_INSERT [dbo].[MetodoPago] ON 

INSERT [dbo].[MetodoPago] ([Id_MetodoPago], [Nombre_MetodoPago], [Estado_MetodoPago]) VALUES (1, N'Efectivo', 1)
INSERT [dbo].[MetodoPago] ([Id_MetodoPago], [Nombre_MetodoPago], [Estado_MetodoPago]) VALUES (2, N'Visa Debito', 1)
INSERT [dbo].[MetodoPago] ([Id_MetodoPago], [Nombre_MetodoPago], [Estado_MetodoPago]) VALUES (3, N'Visa Credito', 1)
INSERT [dbo].[MetodoPago] ([Id_MetodoPago], [Nombre_MetodoPago], [Estado_MetodoPago]) VALUES (4, N'Mastercard Debito', 1)
INSERT [dbo].[MetodoPago] ([Id_MetodoPago], [Nombre_MetodoPago], [Estado_MetodoPago]) VALUES (5, N'Mastercard Credito', 1)

SET IDENTITY_INSERT [dbo].[MetodoPago] OFF
GO




SET IDENTITY_INSERT [dbo].[TipoEntrega] ON 

INSERT [dbo].[TipoEntrega] ([Id_TipoEntrega], [Nombre_TipoEntrega], [Estado_TipoEntrega]) VALUES (1, N'Local', 1)
INSERT [dbo].[TipoEntrega] ([Id_TipoEntrega], [Nombre_TipoEntrega], [Estado_TipoEntrega]) VALUES (2, N'Domicilio', 1)

SET IDENTITY_INSERT [dbo].[TipoEntrega] OFF
GO




SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 

INSERT [dbo].[TipoUsuario] ([Id_TipoUsuario], [Nombre_TipoUsuario], [Estado_TipoUsuario]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[TipoUsuario] ([Id_TipoUsuario], [Nombre_TipoUsuario], [Estado_TipoUsuario]) VALUES (2, N'Cliente', 1)

SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
GO




SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (1, N'GracielaR', N'graciela2023', N'Graciela', N'Rodriguez', N'1416', N'San Martín 151', N'67973668', N'11111111', 2, N'Graciela_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (2, N'RaulR', N'raul2023', N'Raul', N'Gonzalez', N'1834', N'Av Meeks 155', N'33231098', N'11111112', 2, N'Raul_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (3, N'PatricioA', N'patricio2023', N'Patricio', N'Alvarez', N'1636', N'M Pelliza 4550', N'61789452', N'11111113', 2, N'Patricio_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (4, N'PatriciaR', N'patricia2023', N'Patricia', N'Ruiz', N'1408', N'Calle 2 792', N'2939736', N'11111114', 2, N'Patricia_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (5, N'HectorD', N'hector2023', N'Hector', N'Diaz', N'1036', N'Calle 33 691', N'93047470', N'11111115', 2, N'Hector_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (6, N'MonicaS', N'monica2023', N'Monica', N'Sosa', N'1012', N'Calle 4 520', N'79446615', N'11111116', 2, N'Monica_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (7, N'ValeriaR', N'valeria2023', N'Valeria', N'Ruiz', N'1092', N'Av Belgrano 1099', N'60771074', N'11111117', 2, N'Valeria_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (8, N'MiguelR', N'miguel2023', N'Miguel', N'Romero', N'3492', N'Hipólito Irigoyen 1940', N'58777171', N'11111118', 2, N'Miguel_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (9, N'LuciaB', N'lucia2023', N'Lucia', N'Benitez', N'1036', N'Calle 40 347', N'18976811', N'11111119', 2, N'Lucia_2023@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (10, N'NelidaR', N'nelida2023', N'Nelida', N'Ramirez', N'1231', N'Calle 3 1141', N'73030117', N'11111110', 2, N'Nelida_2023@gmail.com', 1)

INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (11, N'CinthiaAdmin', N'cinthia2023', N'Cinthia', N'Ecthepare', N'7414', N'Laprida 342', N'15720507', N'22222222', 1, N'Cinthia2023_admin@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (12, N'AlejandroAdmin', N'alejandro2023', N'Alejandro', N'Ecthepare', N'2169', N'Av. Rivadavia 21096', N'15507494', N'22222223', 1, N'Alejandro2023_admin@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (13, N'SantiagoAdmin', N'santiago2023', N'Santiago', N'Monzalvo', N'1832', N'Manuel Castro 161', N'76224537', N'22222224', 1, N'Santiago2023_admin@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (14, N'MatiasAdmin', N'matias2023', N'Matias', N'Simonetti', N'1092', N'Av 32 587', N'48360843', N'22222225', 1, N'Matias2023_admin@gmail.com', 1)
INSERT [dbo].[Usuarios] ([CodUsuario_Usu], [NombreUsuario_Usu], [Contrasena_Usu], [Nombre_Usu], [Apellido_Usu], [CodigoPostal_Usu], [Direccion_Usu], [Contacto_Usu], [Dni_Usu], [TipoUsuario_Usu], [Mail_Usu], [Estado_Usu]) 
VALUES (15, N'IaraAdmin', N'iara2023', N'Iara', N'Viera', N'1206', N'Av Don Bosco 2100', N'93635185', N'22222226', 1, N'Iara2023_admin@gmail.com', 1)

SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO

SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (1, 7, CAST(N'2023-10-10T00:00:00.000' AS DateTime), N'60771074', 2, N'Av Belgrano 1099', 1, CAST(7480.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (2, 10, CAST(N'2023-08-01T00:00:00.000' AS DateTime), N'73030117', 1, N'Local', 2, CAST(6249.75 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (3, 2, CAST(N'2023-05-26T00:00:00.000' AS DateTime), N'33231098', 2, N'Av Meeks 155', 1, CAST(17749.45 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (4, 6, CAST(N'2023-01-18T00:00:00.000' AS DateTime), N'79446615', 2, N'Calle 4 520', 1, CAST(9100.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (5, 3, CAST(N'2023-04-06T00:00:00.000' AS DateTime), N'61789452', 1, N'Local', 2, CAST(4199.99 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (6, 1, CAST(N'2023-11-11T00:00:00.000' AS DateTime), N'67973668', 1, N'Local', 5, CAST(7579.76 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (7, 4, CAST(N'2023-09-03T00:00:00.000' AS DateTime), N'2939736', 2, N'Calle 2 792', 2, CAST(3600.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (8, 5, CAST(N'2022-06-01T00:00:00.000' AS DateTime), N'93047470', 2, N'Calle 33 691', 2, CAST(4199.99 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (9, 8, CAST(N'2021-02-28T00:00:00.000' AS DateTime), N'58777171', 2, N'Hipólito Irigoyen 1940', 4, CAST(21099.50 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (10, 9, CAST(N'2023-02-14T00:00:00.000' AS DateTime), N'18976811', 2, N'Calle 40 347', 3, CAST(4294.68 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (11, 8, CAST(N'2023-12-12T00:00:00.000' AS DateTime), N'58777171', 1, N'Local', 4, CAST(7000.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (12, 7, CAST(N'2022-09-08T00:00:00.000' AS DateTime), N'60771074', 1, N'Local', 2, CAST(4740.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (13, 3, CAST(N'2021-12-20T00:00:00.000' AS DateTime), N'61789452', 2, N'M Pelliza 4550', 1, CAST(4199.99 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (14, 4, CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'2939736', 2, N'Calle 2 792', 1, CAST(2500.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (15, 1, CAST(N'2023-11-02T00:00:00.000' AS DateTime), N'67973668', 2, N'San Martín 151', 5, CAST(10964.40 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (16, 2, CAST(N'2022-03-09T00:00:00.000' AS DateTime), N'33231098', 2, N'Av Meeks 155', 3, CAST(11909.80 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (17, 3, CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'61789452', 1, N'Local', 4, CAST(3639.99 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (18, 9, CAST(N'2023-10-08T00:00:00.000' AS DateTime), N'18976811', 2, N'Calle 40 347', 2, CAST(5000.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (19, 7, CAST(N'2021-11-09T00:00:00.000' AS DateTime), N'60771074', 1, N'Local', 1, CAST(6370.70 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (20, 10, CAST(N'2022-03-06T00:00:00.000' AS DateTime), N'73030117', 1, N'Local', 1, CAST(16869.75 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (21, 6, CAST(N'2023-01-29T00:00:00.000' AS DateTime), N'79446615', 2, N'Calle 4 520', 5, CAST(3400.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (22, 9, CAST(N'2022-09-19T00:00:00.000' AS DateTime), N'18976811', 2, N'Calle 40 347', 1, CAST(2380.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (23, 4, CAST(N'2023-07-04T00:00:00.000' AS DateTime), N'2939736', 1, N'Local', 3, CAST(4899.99 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (24, 10, CAST(N'2023-01-06T00:00:00.000' AS DateTime), N'73030117', 2, N'Calle 3 1141', 4, CAST(9884.88 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (25, 9, CAST(N'2023-02-09T00:00:00.000' AS DateTime), N'18976811', 2, N'Calle 40 347', 1, CAST(5800.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (26, 2, CAST(N'2022-02-17T00:00:00.000' AS DateTime), N'33231098', 2, N'Av Meeks 155', 2, CAST(5000.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (27, 10, CAST(N'2023-01-08T00:00:00.000' AS DateTime), N'73030117', 2, N'Calle 3 1141', 2, CAST(7900.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (28, 3, CAST(N'2021-01-08T00:00:00.000' AS DateTime), N'61789452', 1, N'Local', 4, CAST(5150.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (29, 7, CAST(N'2022-06-19T00:00:00.000' AS DateTime), N'60771074', 1, N'Local', 5, CAST(710.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (30, 10, CAST(N'2023-01-30T00:00:00.000' AS DateTime), N'73030117', 2, N'Calle 3 1141', 1, CAST(8030.47 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (31, 4, CAST(N'2021-12-05T00:00:00.000' AS DateTime), N'2939736', 1, N'Local', 5, CAST(2499.50 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (32, 8, CAST(N'2022-09-26T00:00:00.000' AS DateTime), N'58777171', 1, N'Local', 1, CAST(8760.00 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (33, 6, CAST(N'2023-07-06T00:00:00.000' AS DateTime), N'79446615', 1, N'Local', 4, CAST(18809.34 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (34, 1, CAST(N'2023-04-04T00:00:00.000' AS DateTime), N'67973668', 2, N'San Martín 151', 3, CAST(4199.90 AS Decimal(8, 2)))
INSERT [dbo].[Ventas] ([CodVentas_Ven], [CodUsuario_Ven], [Fechas_Ven], [Contacto_Ven], [TipoEntrega_Ven], [Direccion_Ven], [MetodoPago_Ven], [Total_Ven]) 
VALUES (35, 2, CAST(N'2022-11-10T00:00:00.000' AS DateTime), N'33231098', 2, N'Av Meeks 155', 2, CAST(9289.99 AS Decimal(8, 2)))

SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (1, 7, CAST(5000.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (1, 18, CAST(310.00 AS Decimal(8, 2)), 8)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (2, 27, CAST(249.99 AS Decimal(8, 2)), 25)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (3, 46, CAST(4500.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (3, 30, CAST(229.99 AS Decimal(8, 2)), 25)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (3, 28, CAST(249.99 AS Decimal(8, 2)), 30)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (4, 25, CAST(80.00 AS Decimal(8, 2)), 26)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (4, 15, CAST(390.00 AS Decimal(8, 2)), 18)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (5, 13, CAST(4199.90 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (6, 14, CAST(223.32 AS Decimal(8, 2)), 12)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (6, 18, CAST(310.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (6, 19, CAST(199.99 AS Decimal(8, 2)), 8)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (6, 20, CAST(120.00 AS Decimal(8, 2)), 12)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (7, 38, CAST(3600.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (8, 45, CAST(4199.99 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (9, 10, CAST(8600.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (9, 27, CAST(249.99 AS Decimal(8, 2)), 50)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (10, 1, CAST(400.78 AS Decimal(8, 2)), 6)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (10, 2, CAST(120.00 AS Decimal(8, 2)), 12)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (10, 4, CAST(450.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (11, 9, CAST(7000.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (12, 36, CAST(1120.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (12, 40, CAST(2500.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (13, 45, CAST(4199.99 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (14, 41, CAST(2500.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (15, 34, CAST(780.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (15, 23, CAST(119.69 AS Decimal(8, 2)), 50)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (15, 13, CAST(4199.90 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (16, 29, CAST(210.00 AS Decimal(8, 2)), 15)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (16, 32, CAST(199.99 AS Decimal(8, 2)), 20)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (16, 33, CAST(710.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (16, 24, CAST(90.00 AS Decimal(8, 2)), 45)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (17, 42, CAST(2750.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (17, 35, CAST(889.99 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (18, 7, CAST(5000.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (19, 23, CAST(119.69 AS Decimal(8, 2)), 30)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (19, 34, CAST(780.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (19, 25, CAST(80.00 AS Decimal(8, 2)), 25)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (20, 5, CAST(570.95 AS Decimal(8, 2)), 5)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (20, 2, CAST(120.00 AS Decimal(8, 2)), 12)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (20, 46, CAST(4500.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (20, 38, CAST(3600.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (20, 26, CAST(89.50 AS Decimal(8, 2)), 50)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (21, 44, CAST(3400.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (22, 36, CAST(1120.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (22, 29, CAST(210.00 AS Decimal(8, 2)), 6)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (23, 37, CAST(1400.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (23, 43, CAST(3499.99 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (24, 16, CAST(380.85 AS Decimal(8, 2)), 6)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (24, 18, CAST(310.00 AS Decimal(8, 2)), 12)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (24, 19, CAST(199.99 AS Decimal(8, 2)), 6)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (24, 14, CAST(223.32 AS Decimal(8, 2)), 12)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (25, 12, CAST(5800.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (26, 7, CAST(5000.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (27, 11, CAST(7900.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (28, 42, CAST(2750.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (28, 25, CAST(80.00 AS Decimal(8, 2)), 30)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (29, 33, CAST(710.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (30, 3, CAST(480.50 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (30, 6, CAST(249.99 AS Decimal(8, 2)), 3)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (30, 8, CAST(6800.00 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (31, 21, CAST(49.99 AS Decimal(8, 2)), 50)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (32, 17, CAST(430.00 AS Decimal(8, 2)), 12)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (32, 22, CAST(80.00 AS Decimal(8, 2)), 45)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (33, 39, CAST(2559.99 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (33, 31, CAST(249.99 AS Decimal(8, 2)), 25)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (33, 27, CAST(249.99 AS Decimal(8, 2)), 40)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (34, 13, CAST(4199.99 AS Decimal(8, 2)), 1)

INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (35, 35, CAST(889.99 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (35, 37, CAST(1400.00 AS Decimal(8, 2)), 1)
INSERT [dbo].[DetalleVenta] ([CodVenta_DV], [CodProducto_DV], [PrecioUnitario_DV], [Cantidad_DV]) VALUES (35, 9, CAST(7000.00 AS Decimal(8, 2)), 1)

GO