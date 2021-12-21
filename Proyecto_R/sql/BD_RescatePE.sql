CREATE DATABASE BD_RESCATEPERRUNO

GO
CREATE TABLE [dbo].[Animal] (

Id INT IDENTITY(1,1),
IdUsuario int null,
IdCategoria int null,
Nombre nvarchar(50) null,
Edad nvarchar(50) null,
Raza nvarchar(50) null,
Color nvarchar(50) null,
Tamaño decimal(8,2) null,
Foto varchar(max) null,
Detalles nvarchar(50) null,
Fecha nvarchar(100) DEFAULT CURRENT_TIMESTAMP,

 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[MascotaExtraviada] (

Id INT IDENTITY(1,1),
Nombre nvarchar(50) null,
Apellido nvarchar(50) null,
Telefono nvarchar(50) null,
Dni nvarchar(50) null,
NombreMascota nvarchar(50) null,
DistritoMascota nvarchar(100) null,
Edad nvarchar(50) null,
Raza nvarchar(50) null,
Color nvarchar(50) null,
Tamaño decimal(8,2) null,
Foto varchar(max) null,
Detalles nvarchar(50) null,
Fecha nvarchar(100) DEFAULT CURRENT_TIMESTAMP,

 CONSTRAINT [MascotaExtraviada] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Usuario] (

Id INT IDENTITY(1,1) NOT NULL,
Nombre nvarchar(50) null,
Apellido nvarchar(50) null,
Telefono nvarchar(50) null,
Dni nvarchar(50) null,
Correo nvarchar(50) null,
Direccion nvarchar(50) null,
Detalles nvarchar(50) null,
NumeroContacto nvarchar(50) null,
Fecha DATETIME DEFAULT CURRENT_TIMESTAMP,


 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Usuario_Admin] (
  Id int IDENTITY(1,1) NOT NULL,
  Nombre nvarchar(50) null,
  Apellido nvarchar(50) null,
  Telefono nvarchar(50) null,
  Dni nvarchar(50) null,
  Usuario varchar(45) DEFAULT NULL,
  Contrasena varchar(45) DEFAULT NULL,
  Token varchar(45) DEFAULT NULL,
  Fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  Activo bit NULL,

 CONSTRAINT [PK_Usuario_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Categoria] (

Id INT IDENTITY(1,1) NOT NULL,
Estado nvarchar(50) null,
TipoCategoria nvarchar(50) null,

 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[Albergue] (
Id INT IDENTITY(1,1) NOT NULL,
Nombre nvarchar(50) null,
Direccion nvarchar(50) null,
Telefono nvarchar(50) null,
 CONSTRAINT [PK_Albergue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]




GO
ALTER TABLE [dbo].[Animal] ADD  CONSTRAINT [FK_Animal_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])

GO
ALTER TABLE [dbo].[Animal] ADD  CONSTRAINT [FK_Animal_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])





CREATE TRIGGER after_delete_animal_usuario
ON ANIMAL
AFTER DELETE 
AS
	DELETE USUARIO 
	FROM USUARIO
	JOIN deleted
	ON deleted.IdUsuario=Usuario.Id;



drop table [MascotaExtraviada]