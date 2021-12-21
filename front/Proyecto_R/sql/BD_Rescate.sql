GO
CREATE DATABASE BD_RESCATEPERRUNO;

CREATE TABLE [dbo].[Animales] (

Id INT IDENTITY(1,1) NOT NULL,
IdCategoria int null,
IdUsuario int null,
Nombre nvarchar(50) null,
Edad nvarchar(50) null,
Raza nvarchar(50) null,
Color nvarchar(50) null,
Tamaño decimal(8,2) null,
Detalles nvarchar(50) null,

 CONSTRAINT [PK_Animales] PRIMARY KEY CLUSTERED 
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
Direccion decimal(8,2) null,
Detalles nvarchar(50) null,
NumeroContacto nvarchar(50) null,
Contrasena nvarchar(100) NULL,
Activo bit NULL,
Rol nvarchar(50) null,

 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Categoria] (

Id INT IDENTITY(1,1) NOT NULL,
Estado nvarchar(50) null,

 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Albergue] (

Id INT IDENTITY(1,1) NOT NULL,
IdAnimales int null,
Nombre nvarchar(50) null,
Direccion nvarchar(50) null,
Telefono nvarchar(50) null,
 CONSTRAINT [PK_PedidoDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



GO
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_Categoria]

GO
ALTER TABLE [dbo].[Animales]  WITH CHECK ADD  CONSTRAINT [FK_Animales_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Animales] CHECK CONSTRAINT [FK_Animales_Usuario]


GO
ALTER TABLE [dbo].[Albergue]  WITH CHECK ADD  CONSTRAINT [FK_Albergue_Animales] FOREIGN KEY([IdAnimales])
REFERENCES [dbo].[Animales] ([Id])
GO
ALTER TABLE [dbo].[Albergue] CHECK CONSTRAINT [FK_Albergue_Animales]