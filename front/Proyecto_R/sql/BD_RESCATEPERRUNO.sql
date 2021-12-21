CREATE DATABASE BD_RESCATEPERRUNO

GO
CREATE TABLE [dbo].[MascotaExtraviada] (

Id INT IDENTITY(1,1),
IdCategoria int DEFAULT 1,
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

 CONSTRAINT [PK_MascotaExtraviada] PRIMARY KEY CLUSTERED 
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
ALTER TABLE [dbo].[MascotaExtraviada] ADD  CONSTRAINT [FK_MascotaExtraviada_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])





--CREATE TRIGGER after_delete_animal_usuario
--ON ANIMAL
--AFTER DELETE 
--AS
--	DELETE USUARIO 
--	FROM USUARIO
--	JOIN deleted
--	ON deleted.IdUsuario=Usuario.Id;

--GO








-------------------------------------------------------------------------------------



--GO
--ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Categoria] FOREIGN KEY([IdCategoria])
--REFERENCES [dbo].[Categoria] ([Id])
--GO
--ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Categoria]

--GO
--ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Usuario] FOREIGN KEY([IdUsuario])
--REFERENCES [dbo].[Usuario] ([Id])
--GO
--ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Usuario]

-------------------------------------------------------------------------------------------------
--GO
--ALTER TABLE [dbo].[Albergue]  WITH CHECK ADD  CONSTRAINT [FK_Albergue_Animal] FOREIGN KEY([IdAnimales])
--REFERENCES [dbo].[Animales] ([Id])
--GO
--ALTER TABLE [dbo].[Albergue] CHECK CONSTRAINT [FK_Albergue_Animal]


-----INSERTANDO DATOS
INSERT INTO [Usuario_Admin](Nombre,Apellido,Telefono,Dni,Usuario,Contrasena,Activo)  VALUES 
('Gabriel','Rafael','951401980','48124551','admin1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1');

INSERT INTO [Categoria](Estado,TipoCategoria)  VALUES 
('Extraviado','Con Hogar'),
('Buscando Hogar','Sin Hogar');

--INSERT INTO [Animal](IdCategoria,Nombre,Edad,Raza,Color,Tamaño,Foto,Detalles)  VALUES 
--('1','Coki','2 años','Pekines','Marron','Pequeño','(https://i.ibb.co/9bYmYsv/pekines.jpg)','Se ofrece recompensa');

--INSERT INTO [Usuario](Nombre,Apellido)  VALUES 
--('Jesus','Rafael');



select * from [Usuario_Admin]
drop table Animal
SELECT * FROM Usuario
SELECT * FROM ANIMAL
DELETE FROM ANIMAL WHERE IDUSUARIO=1;

-- Volcado de datos para la tabla `usuarios`

--INSERT INTO usuarios  VALUES
--(1, 'usuario1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
--(2, 'usuario2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
--(3, 'usuario3@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
--(4, 'usuario4@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
--(5, 'usuario5@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
--(6, 'usuario6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Activo'),
--(7, 'usuario7@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo'),
--(8, 'usuario8@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo'),
--(9, 'usuario9@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_token`
--













select * from usuario_admin;

delete usuarios where UsuarioId=0;



select * from Albergue;
select * from Animales;
select * from Categoria;
select * from usuarios_token;

select * from Categoria;
INSERT INTO Categoria (Estado,TipoCategoria)
VALUES ('activo','adopcion');

SELECT *FROM Usuario;
INSERT INTO Usuario (Nombre,Apellido,Telefono,Dni,Correo,Direccion,Detalles,NumeroContacto,Contrasena,Activo,Rol)
VALUES ('carlos','manrique',98434321,'43242312','av.mariatgui 2312',43,'se registra','983242311',
'carlos31',1,'adoptar' );

	
SELECT *FROM Animales;
INSERT INTO Animales(IdCategoria,IdUsuario,Nombre,Edad,Raza,Color,Tamaño,Detalles)
VALUES (1,4,'toffe',2,'boxer','marron',30,'tenia una placa en el cuello' );



SELECT *FROM Albergue;
INSERT INTO Albergue (IdAnimales,Nombre,Direccion,Telefono)
VALUES (5,'la fontana','av.mariatgui 2312',3323341 );