USE [master]
GO
/****** Object:  Database [Preguntados]    Script Date: 17/8/2023 09:08:20 ******/
CREATE DATABASE [Preguntados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Preguntados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Preguntados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Preguntados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Preguntados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Preguntados] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Preguntados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Preguntados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Preguntados] SET ARITHABORT OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Preguntados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Preguntados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Preguntados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Preguntados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Preguntados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Preguntados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Preguntados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Preguntados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Preguntados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Preguntados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Preguntados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Preguntados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Preguntados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Preguntados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Preguntados] SET RECOVERY FULL 
GO
ALTER DATABASE [Preguntados] SET  MULTI_USER 
GO
ALTER DATABASE [Preguntados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Preguntados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Preguntados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Preguntados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Preguntados] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Preguntados', N'ON'
GO
ALTER DATABASE [Preguntados] SET QUERY_STORE = OFF
GO
USE [Preguntados]
GO
/****** Object:  User [alumno]    Script Date: 17/8/2023 09:08:20 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 17/8/2023 09:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 17/8/2023 09:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[iddificultad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[iddificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 17/8/2023 09:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idpregunta] [int] NOT NULL,
	[idcategoria] [int] NOT NULL,
	[iddificultad] [int] NOT NULL,
	[enunciado] [varchar](200) NOT NULL,
	[foto] [varchar](50) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idpregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 17/8/2023 09:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idrespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idpregunta] [int] NOT NULL,
	[opcion] [int] NOT NULL,
	[contenido] [varchar](50) NOT NULL,
	[correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idrespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (1, N'Arte', N'arte.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (2, N'Deportes', N'dep.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (3, N'Geografía', N'geo.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (4, N'Historia', N'historia.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (5, N'Ciencias', N'ciencias.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (6, N'Entretenimiento', N'entre.jpg')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([iddificultad], [nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([iddificultad], [nombre]) VALUES (2, N'Dificil')
INSERT [dbo].[Dificultades] ([iddificultad], [nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (1, 1, 1, N'¿Qué se celebra el 14 de Febrero?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (2, 4, 1, N'¿Qué cargo ocupa desde el 10/12/2019?', N'alberto.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (3, 2, 2, N'¿En que deporte es imposible lesionarse?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (4, 5, 2, N'¿Qué sustancia le da el color verde a las plantas?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (5, 5, 3, N'¿Cual es el nombre de esta flor?', N'verbanas.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (6, 1, 3, N'¿A quién pertenece la canción "Olha A Explosao"?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (7, 4, 3, N'¿En qué año murió Pablo Picasso?', N'picasso.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (8, 6, 1, N'¿Cómo se llama la película del oso que habla?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (9, 1, 3, N'¿Cómo sigue la frase: "Mas al pedo que..."?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (10, 5, 1, N'¿De qué raza es este perro?', N'perro.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (11, 6, 2, N'¿Que tipo de arma usa Legolas en LOTR?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (12, 3, 2, N'¿Como se llama este lugar?', N'tajmahal.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (13, 5, 2, N'¿De qué raza es este perro?', N'breton.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (14, 6, 1, N'¿Cómo se llama?', N'emmawatson.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (15, 2, 3, N'¿Qué equipo de Chaco llegó mas lejos en Copa Argentina?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (16, 2, 1, N'¿Como se llama la selección argentina de fútbol para ciegos?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (17, 3, 2, N'¿Cuál de estos países es más pequeño?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (18, 1, 3, N'¿Con qué ritmo musical se asocia a Uruguay?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (19, 3, 3, N'¿En qué país se encuentra la localidad de Tostado?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (20, 4, 3, N'¿Cuál era el nombre de pila del creador de la marca de autos Porsche?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (21, 4, 2, N'¿Cuál fue la primera universidad europea?', NULL)
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (1, 1, 1, N'El dia de la independencia', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (2, 1, 2, N'El dia de los enamorados', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (3, 1, 3, N'El dia del niño', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (4, 1, 4, N'Ninguna es correcta', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (5, 2, 1, N'Ministro de educación', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (6, 2, 2, N'VIcepresidente', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (7, 2, 3, N'Presidente', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (8, 2, 4, N'Primer Ministro', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (9, 3, 1, N'Polo', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (10, 3, 2, N'Pato', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (11, 3, 3, N'Ajedrez', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (12, 3, 4, N'Ninguna es correcta', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (14, 5, 1, N'Rosa', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (15, 5, 2, N'Violeta', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (16, 5, 3, N'Orquídea', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (17, 5, 4, N'Verbana', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (18, 6, 1, N'MC Kevinho', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (19, 6, 2, N'MC Meno K', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (20, 6, 3, N'MC Joao', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (21, 6, 4, N'MC Fioti', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (23, 7, 1, N'1857', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (24, 7, 2, N'1639', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (25, 7, 3, N'1973', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (26, 7, 4, N'2001', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (27, 8, 1, N'Vladimir', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (28, 8, 2, N'Ted', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (29, 8, 3, N'Rastroso', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (30, 8, 4, N'El Oso Cocainoso', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (31, 9, 1, N'Cenicero de moto', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (32, 9, 2, N'Bocina de avion', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (33, 9, 3, N'Teta de monja', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (35, 9, 4, N'Todas son correctas', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (36, 10, 1, N'Mastín Italiano', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (37, 10, 2, N'Dogo de Burdeos', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (38, 10, 3, N'Mastín Napolitano', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (39, 10, 4, N'Mastín Siberiano', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (40, 11, 1, N'Espada', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (41, 11, 2, N'Hacha', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (42, 11, 3, N'Ballesta', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (43, 11, 4, N'Arco', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (44, 12, 1, N'Capitolio de Budha', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (45, 12, 2, N'Museo Pakistaní de la vida', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (46, 12, 3, N'Taj Mahal', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (47, 12, 4, N'Burj Khalifa', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (48, 4, 1, N'Amponíaco', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (49, 4, 2, N'Hidrógeno', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (50, 4, 3, N'Clorofila', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (51, 4, 4, N'Oxígeno', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (52, 13, 1, N'Bretón Español', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (53, 13, 2, N'Beagle', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (54, 13, 3, N'Labrador', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (55, 13, 4, N'Ninguna es Correcta', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (56, 14, 1, N'Emma Mackey', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (57, 14, 2, N'Emma Stone', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (58, 14, 3, N'Emma Thompson', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (59, 14, 4, N'Emma Watson', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (61, 15, 1, N'Sarmiento', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (62, 15, 2, N'Chaco For Ever', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (63, 15, 3, N'Don Orione', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (64, 15, 4, N'Villa Alvear', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (65, 16, 1, N'Los Topos', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (66, 16, 2, N'Los Murciélagos', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (67, 16, 3, N'Las Mariposas', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (68, 16, 4, N'Ninguna es correcta', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (69, 17, 1, N'Vanuatu', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (70, 17, 2, N'Nauru', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (71, 17, 3, N'El Vaticano', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (72, 17, 4, N'Puerto Rico', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (73, 18, 1, N'Candombe', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (74, 18, 2, N'Milonga', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (75, 18, 3, N'Salsa', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (76, 18, 4, N'Ninguna es Correcta', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (77, 19, 1, N'Perú', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (78, 19, 2, N'Argentina', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (79, 19, 3, N'Brasil', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (80, 19, 4, N'Colombia', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (81, 20, 1, N'Jack', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (82, 20, 2, N'Louis', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (83, 20, 3, N'Thomas', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (84, 20, 4, N'Ferdinand', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (86, 21, 1, N'Universidad de Polonia', 1)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (90, 21, 2, N'Universidad de España', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (91, 21, 3, N'Universidad de Alemania', 0)
INSERT [dbo].[Respuestas] ([idrespuesta], [idpregunta], [opcion], [contenido], [correcta]) VALUES (92, 21, 4, N'Universidad de Oxford', 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[Categorias] ([idcategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([iddificultad])
REFERENCES [dbo].[Dificultades] ([iddificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
USE [master]
GO
ALTER DATABASE [Preguntados] SET  READ_WRITE 
GO
