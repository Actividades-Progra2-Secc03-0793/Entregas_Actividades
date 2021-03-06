USE [master]
GO
/****** Object:  Database [GeoMediaBD]    Script Date: 12/17/2020 5:52:06 PM ******/
CREATE DATABASE [GeoMediaBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GeoMediaBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GeoMediaBD.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GeoMediaBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GeoMediaBD_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GeoMediaBD] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GeoMediaBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GeoMediaBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GeoMediaBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GeoMediaBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GeoMediaBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GeoMediaBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [GeoMediaBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GeoMediaBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GeoMediaBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GeoMediaBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GeoMediaBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GeoMediaBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GeoMediaBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GeoMediaBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GeoMediaBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GeoMediaBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GeoMediaBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GeoMediaBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GeoMediaBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GeoMediaBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GeoMediaBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GeoMediaBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GeoMediaBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GeoMediaBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GeoMediaBD] SET  MULTI_USER 
GO
ALTER DATABASE [GeoMediaBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GeoMediaBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GeoMediaBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GeoMediaBD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GeoMediaBD] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GeoMediaBD]
GO
/****** Object:  Table [dbo].[tblArchivos]    Script Date: 12/17/2020 5:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblArchivos](
	[idArchivo] [int] NOT NULL,
	[titulo] [nvarchar](50) NULL,
	[idTipoFile] [int] NULL,
	[formato] [varchar](10) NULL,
	[precio] [decimal](4, 2) NULL,
	[ruta] [nvarchar](1000) NULL,
	[detalles] [nvarchar](500) NULL,
	[sinopsis] [nvarchar](1500) NULL,
	[codCategoria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idArchivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCategorias]    Script Date: 12/17/2020 5:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategorias](
	[codCategoria] [int] NOT NULL,
	[categoria] [nchar](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[codCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRegistroAlquiler]    Script Date: 12/17/2020 5:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistroAlquiler](
	[codAlquiler] [int] NOT NULL,
	[fecha_alquiler] [date] NULL,
	[subTotal] [decimal](4, 2) NULL,
	[costoTotal] [decimal](5, 2) NULL,
	[idArchivo] [int] NULL,
	[idUsuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[codAlquiler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 12/17/2020 5:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[idRol] [int] NOT NULL,
	[nomRol] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTiposFile]    Script Date: 12/17/2020 5:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTiposFile](
	[idTipoFile] [int] NOT NULL,
	[nomTipoFile] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoFile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsuarios]    Script Date: 12/17/2020 5:52:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsuarios](
	[idUsuario] [int] NOT NULL,
	[nomUsuario] [nvarchar](30) NULL,
	[pass] [nvarchar](30) NULL,
	[idRol] [int] NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Correo] [nvarchar](100) NULL,
	[Telefono] [char](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (1, N'Shrek', 2, N'MPG', CAST(56.99 AS Decimal(4, 2)), N'https://es.web.img3.acsta.net/pictures/14/03/06/10/13/369709.jpg', N'Un clasico de Dreamworks que toma referencias de cuentos de hadas convirtiendolas en satida', N'Habia una vez un ogro que vivia su vida en un pantano, su vida es relativamente pacifica hasta que se junta con distintas criaturas de cuentos de hadas las cuales son depojadas de sus respectivos terrirtorios y será trabajo de Shrek enbarcarse en una aventura donde entendera que es mas valioso de lo que el pesaba y que los finales felices realmente existen.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (2, N'Bob Esponja', 2, N'MPG', CAST(34.00 AS Decimal(4, 2)), N'https://www.formulatv.com/images/series/posters/300/375/1_m3.jpg', N'Serie animada para niños', N'Juntate con Bob Esponja pantalones Cuadrados y sus amigos en una serie donde encontraras una gran cantidad de momentos, aventura y alguna que otra referencia.', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (3, N'Que pasa con los Bisontes', 2, N'MPG', CAST(0.00 AS Decimal(4, 2)), N'https://www.anipedia.net/imagenes/bufalo.jpg', N'Mini Documental del cana de Robot de Colon (YouTube)', N'Hay algunas cosas que deberías saber para entender mejor a los bisontes.', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (4, N'Porter Robinson & Madeon - Shelter ', 1, N'AUDIO', CAST(0.00 AS Decimal(4, 2)), N'https://upload.wikimedia.org/wikipedia/en/a/af/ShelterPorterRobinson%26Madeon.jpeg', N'Video musica con animacion 2D estilo oriental (Anime)', N'Shelter cuenta la historia de Rin, una niña de 17 años que vive su vida dentro de una simulación futurística sola en una infinita y bella soledad. Cada día, Rin despierta en una realidad virtual, la cual maneja con una tableta para crear nuevos y diferentes mundos para ella misma. Hasta que un día todo cambia, y Rin descubre el verdadero origen detrás de su vida dentro de la simulación.', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (5, N'Bajo la misma estrella', 2, N'MPG', CAST(45.99 AS Decimal(4, 2)), N'https://lurda55.files.wordpress.com/2014/10/bajo-la-misma-estrella-cover-dvdrip-subtitulada.jpg', N'Pelicula estrenada el 2 de junio de 2014', N'Dos adolescentes pacientes de cáncer inician un viaje para reafirmar sus vidas y visitar a un escritor solitario en Ámsterdam', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (6, N'Interestelar', 2, N'AVI', CAST(65.99 AS Decimal(4, 2)), N'https://hips.hearstapps.com/es.h-cdn.co/fotoes/images/peliculas/interstellar/posters/18799170-1-esl-ES/Posters.jpg', N'Pelicula estrenada el 26 de octubre de 2014, trata sobre la odisea de un astronauta por el espacio exterior donde será anfitrión de grandes sucesos que impactaran a los espectadores  ', N'Gracias a un descubrimiento, un grupo de científicos y exploradores, encabezados por Cooper, se embarcan en un viaje espacial para encontrar un lugar con las condiciones necesarias para reemplazar a la Tierra y comenzar una nueva vida allí', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (7, N'Disney Coco', 2, N'MPG', CAST(35.99 AS Decimal(4, 2)), N'https://es.web.img2.acsta.net/pictures/17/09/14/10/49/2019727.jpg', N'Pelicula estrenada el 27 de octubre de 2017 por productores Mexicanos', N'Miguel es un niño que sueña con ser músico, pero su familia se lo prohíbe porque su tatarabuelo, músico, los abandonó, y quieren obligar a Miguel a ser zapatero, como todos los miembros de la familia. Por accidente, Miguel entra en la Tierra de los Muertos, de donde sólo podrá salir si un familiar difunto le concede su bendición, pero su tatarabuela se niega a dejarlo volver con los vivos si no promete que no será músico. Debido a eso, Miguel escapa de ella y empieza a buscar a su tatarabuelo', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (8, N'Disney El Rey León', 2, N'WMV', CAST(36.99 AS Decimal(4, 2)), N'https://images-na.ssl-images-amazon.com/images/I/8194AkoNv8L.jpg', N'Pelicula estrenada el 7 de mayo de 1994, trata sobre una historia de superación de Simba y como este deberá afrontar a sus problemas de niño por el nombre de su padre Mufasa', N'Tras la muerte de su padre, Simba vuelve a enfrentar a su malvado tío, Scar, y reclamar el trono de rey.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (9, N'Shrek 2', 2, N'H. 264', CAST(35.99 AS Decimal(4, 2)), N'https://images-na.ssl-images-amazon.com/images/I/71PM3ZsLZaL._SY445_.jpg', N'Pelicula estrenada el 19 de mayo de 2004 en Estados Unidos, donde nuestros viejos amigos deberán embarcarse a una nueva aventura en la Tierra de muy, muy Lejano  ', N'En esta ocasión, Shrek debe enfrentarse al mayor de los problemas que se podía imaginar: conocer a sus suegros.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (10, N'Shrek Tercero', 2, N'DIVX', CAST(30.99 AS Decimal(4, 2)), N'https://es.web.img3.acsta.net/medias/nmedia/18/68/23/20/20054548.jpg', N'Pelicula estrenada el  6 de mayo de 2007, donde deberemos acompañar a nuestros amigos en una travesía en busca del nuevo heredero de la corona del reino de Muy, muy Lejano ', N'Cuando el Rey Harold enferma, Shrek y la Princesa Fiona descubren que tendrán que dirigir la Tierra Muy Muy Lejana a menos que puedan encontrar al Príncipe Artie, el verdadero heredero, y llevarlo a casa. Desafortunadamente, no tiene interés en ser rey; no obstante, Shrek, Burro y el Gato con Botas planean recuperarlo. Mientras tanto, la Princesa Fiona le pide ayuda a sus compañeras heroínas para alejar del trono al Príncipe Encantador.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (11, N'Shrek para siempre', 2, N'AVI', CAST(32.99 AS Decimal(4, 2)), N'https://d3ddkgxe55ca6c.cloudfront.net/assets/t1497100759/a/9e/e7/134266-ml-692021.jpg', N'Pelicula estrenada el 16 de mayo de 2010, ahora en que problemas se meterá nuestro protagonista, descúbrelo en esta cuarta pelicula de Shrek  ', N'Instalado en su vida matrimonial y totalmente domesticado, Shrek empieza a extrañar los días en los que él se sentía como un verdadero ogro. Engañado para firmar un contrato con el tortuoso Rumpelstiltskin, él se encuentra a sí mismo en una versión alterna de Muy Muy Lejano, donde los ogros son cazados, Rumpelstiltskin manda, y él y Fiona nunca se conocieron. Shrek debe hallar la forma de cancelar el contrato para restaurar su mundo y reclamar su amor verdadero.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (12, N'Transformers', 2, N'MPG', CAST(39.99 AS Decimal(4, 2)), N'https://upload.wikimedia.org/wikipedia/en/thumb/6/66/Transformers07.jpg/220px-Transformers07.jpg', N'Fecha de estreno: 12 de junio de 2007', N'El destino de la humanidad está en juego cuando dos razas de robots, los buenos Autobots y los villanos Decepticons, llevan su guerra a la Tierra. Los robots tienen la habilidad de transformarse en diferentes objetos mecánicos mientras buscan la clave del poder supremo. Sólo un joven humano, Sam Witwicky puede salvar al mundo de la destrucción total', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (13, N'Transformers 2: la venganza de los caídos', 2, N'AVI', CAST(41.99 AS Decimal(4, 2)), N'https://i.pinimg.com/originals/41/41/b6/4141b602b64d2d5c4264ff7f899145a4.jpg', N'Pelicula estrenada el 24 de junio de 2009, una nueva amenaza esta por llegar a la tierra desde el lugar menos esperado.', N'Han pasado dos años desde que los Transformers irrumpieran en la vida de Sam Witwicky. Ahora, el objetivo de Sam es ingresar en la universidad y llevar una vida tranquila, pero se ve otra vez involucrado en la guerra entre Autobots y Decepticons.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (14, N'Transformers 3: El lado oscuro de la luna', 2, N'WMV', CAST(38.99 AS Decimal(4, 2)), N'https://upload.wikimedia.org/wikipedia/en/b/bf/Transformers_dark_of_the_moon_ver5.jpg', N'Pelicula estrenada el 23 de junio de 2011, los Autobots deberán enfrentarse a una nueva amenaza no solo de los Decepticons, sino que además con un antiguo Prime.', N'Una vez más, la Tierra se ve atrapada en el medio cuando la resurrección de un antiguo Transformer parece cambiar el rumbo de los Autobots en su larga guerra con los malvados Decepticons.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (15, N'Transformers: la era de la extinción', 2, N'MPG', CAST(42.99 AS Decimal(4, 2)), N'https://i.blogs.es/43ea6a/transformers_4_cartel_estreno_la_pelicula/450_1000.jpg', N'Pelicula estrenada el 19 de junio de 2014', N'Mientras la humanidad recoge las piezas después de una batalla épica, un grupo oscuro emerge para ganar control de la historia. Mientras tanto, una poderosa y nueva amenaza pone su mirada en la Tierra', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (16, N'Transformers: El ultimo caballero', 2, N'WMV', CAST(40.99 AS Decimal(4, 2)), N'https://www.utrera.org/wp-content/uploads/2019/08/transfomers-el-ultimo-caballero-cine-verano-utrera-2019.jpg', N'Fecha de estreno: 20 de junio de 2017 ', N'La guerra entre los Transformers y los humanos amenaza con destruir la Tierra. Con el gigante Optimus Prime muy lejos, realizando una misión espacial, el futuro del planeta depende ahora de la extraña alianza forjada entre el inventor Cade Yeager, Bumblebee, un lord inglés y un profesor de Oxford.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (17, N'Spiderman 2002', 2, N'DIVX', CAST(54.99 AS Decimal(4, 2)), N'https://www.ecartelera.com/carteles/4500/4578/001_m.jpg', N'Fecha de estreno: 30 de abril de 2002, origen y desarrollo de uno de los héroes más reconocidos en la actuaildad ', N'Luego de sufrir la picadura de una araña genéticamente modificada, un estudiante de secundaria tímido y torpe adquiere increíbles capacidades como arácnido. Pronto comprenderá que su misión es utilizarlas para luchar contra el mal y defender a sus vecinos', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (18, N'Spiderman 2', 2, N'WMV', CAST(54.99 AS Decimal(4, 2)), N'https://www.ecartelera.com/carteles/4500/4579/001_m.jpg', N'Fecha de estreno: 2 de julio de 2004, Peter Parker deberá no solo enfrentarse a sus enemigos sino también con su propia identidad', N'El atormentado Peter Parker lucha contra un científico siniestro que utiliza sus tentáculos mecánicos con fines destructivos.', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (19, N'Spiderman 3', 2, N'MPG', CAST(52.99 AS Decimal(4, 2)), N'https://i.pinimg.com/originals/a9/57/a2/a957a2e50c8e2f0b36d1f893c6d510ef.jpg', N'Fecha de estreno: 16 de abril de 2007, nuestro amigo y vecino Hombre Araña deberá enfrentarse con más de una amenaza e incluso con sigo mismo', N'Peter Parker sufre una terrible transformación cuando su traje de Hombre Araña se vuelve negro y libera una personalidad oscura y vengativa', 1)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (20, N'Avatar: La leyenda de Aang', 2, N'MPG', CAST(15.99 AS Decimal(4, 2)), N'https://pm1.narvii.com/6179/74c0db052c50a66f12e343281e7a04ac4083e36d_00.jpg', N'Serie que cuenta con un total de 61 episodios y de 3 temporadas nombradas como libros', N'Un chico de 12 años y sus amigos deben usar sus poderes para salvar al mundo del maléfico Señor del Fuego y traer paz para las tres naciones', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (21, N'Tom y Jerry', 2, N'MPG', CAST(12.99 AS Decimal(4, 2)), N'https://www.filo.news/__export/1581331108877/sites/claro/img/2020/02/10/animanga-5_331978.jpg_1359985831.jpg', N'La serie cuenta con un total de 164 cortos creado por  William Hanna y Joseph Barbera', N'Tom y Jerry son dos personajes animados, un gato y un ratón, que protagonizaron un gran número de cortometrajes creados, escritos y dirigidos por William Hanna y Joseph Barbera.', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (22, N'Dragon Ball Z', 2, N'MPG', CAST(10.99 AS Decimal(4, 2)), N'https://i.pinimg.com/originals/76/84/60/768460f9de25bd4c2d88b4dae19a24b8.jpg', N'Anime japonés desarrollado por el mangaca Akira Toriyama   ', N'Conoce las nuevas aventuras que el joven Goku, ya un adulto y su hijo Gohan, tendrá junto a los Guerreros Z, quienes afrontaran todo tipo de nuevas amenaza de un nivel superior a la de planeta Tierra, donde deberán superar sus propios limites y romper las barreras que se pongan en su camino ', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (23, N'Oye! Arnold', 2, N'MPG', CAST(12.99 AS Decimal(4, 2)), N'https://i.pinimg.com/originals/6e/d2/03/6ed20374ee19d68fb9b0a673d95724ee.jpg', N'Una serie que cuenta con un total de 100 episodios dividido en 5 temporadas ', N'Arnold es soñador e idealista y siempre trata de ver lo mejor de la gente y hacer lo correcto.', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (24, N'Dragon Ball ', 2, N'MPG', CAST(12.99 AS Decimal(4, 2)), N'https://www.alfabetajuega.com/wp-content/uploads/2020/07/db.jpg', N'Uno de los primeros mangas que escribió Akira Toriyama adaptada a anime (Serie de televisión)  ', N'Un valiente joven con poderes increíbles se aventura hacia un viaje místico en tierras exóticas llenas de guerreros nobles, princesas hermosas, monstruos mutantes, extraterrestres y crueles ejércitos', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (25, N'Dragon Ball GT', 2, N'MPG', CAST(9.99 AS Decimal(4, 2)), N'https://pm1.narvii.com/6541/37b9074be4ec963d07e93bfca988ab8fe7aeea2b_00.jpg', N'Esta adaptación fue desarrollada por la casa productora Toei Animation que trata de ampliar aun más el universo de Dragon Ball Z', N'Secuela no canónica del anime de Dragon Ball Z, continuando con una nueva travesía en busca de unas misteriosas esferas del dragón que amenazan con destruir la Tierra en un año.', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (26, N'Hora de Aventura', 2, N'MPG', CAST(16.99 AS Decimal(4, 2)), N'https://images-na.ssl-images-amazon.com/images/I/61mr99Y71OL.jpg', N'Serie animada con un total de 283 episodios y un total de 10 temporadas', N'Finn, que tiene doce años, lucha contra el mal en la Tierra de Ooo. Ayudado por su canino mágico, Jake, Fin recorre la Tierra de Ooo reparando lo incorrecto y luchando contra el mal. Usualmente la maldad proviene del Rey del Hielo, quien está buscando una esposa. Él ha decidido contraer nupcias con la princesa Bubblegum, aunque ella no desea casarse con él. Él insiste en arrebatarla y llevársela lejos, pero Finn y Jake, junto a Lady Raincorn, procuran hasta lo imposible por mantenerla alejada de todo peligro.', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (27, N'Un Show Más', 2, N'MPG', CAST(14.99 AS Decimal(4, 2)), N'https://i.pinimg.com/originals/60/27/33/60273358ab125ba386ba8dc5ad2a66bb.jpg', N'Una seria animada con un total de 261 episodios creada por  J. G. Quintel', N'Un par de cuidadores de un parque y grandes amigos dejan de lado sus responsabilidades en horas de trabajo para divertirse.', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (28, N'El increíble mundo de Gumball', 2, N'MPG', CAST(11.99 AS Decimal(4, 2)), N'https://mx.web.img3.acsta.net/pictures/18/01/23/00/56/0950731.jpg', N'Una seria animada con un total de 240 episodios creada por  Ben Bocquelet', N'Se cuentan las aventuras de un gato joven llamado Gumball Watterson que tiene una predilección especial por meterse en problemas', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (29, N'Ben 10', 2, N'MPG', CAST(14.99 AS Decimal(4, 2)), N'https://m.media-amazon.com/images/M/MV5BMGU1MGQ1YTgtZTdkYi00ODI3LWFjMzItYmZkN2IxMmM0M2M4XkEyXkFqcGdeQXVyOTgwMzk1MTA@._V1_UY1200_CR93,0,630,1200_AL_.jpg', N'Serie animada con un total de 52 episodios ', N'Ben Tennyson es un niño de 10 años de edad que descubre un dispositivo mágico que lo puede convertir en 10 héroes alienígenas diferentes cada uno con sus propias habilidades, ayudando a los demás contra los malhechores', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (30, N'Drake y Johs', 2, N'MPG', CAST(12.99 AS Decimal(4, 2)), N'https://images-na.ssl-images-amazon.com/images/I/71FDRVJWggL._SL1000_.jpg', N'Serie de televisión sintonizada en Nickelodeon con un total de 57 episodios transmitidos divididos en 4 temporadas', N'Drake y Josh dos adolescentes muy diferentes que se han convertido en hermanastros y que tienen que convivir en la misma casa, teniendo impredecibles y divertidas aventuras.', 2)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (31, N'madeon the city', 1, N'AUDIO', CAST(2.99 AS Decimal(4, 2)), N'https://slm-assets.secondlife.com/assets/6795648/lightbox/JustinBieberBabyVideoBLog.jpg', N'Compuesto por el artista Madeon, del genero Dance/Electrónica, con una duración de 3:53 minutos', N'Traducción del inglés-The City es una obra extendida (EP) del DJ francés y productor discográfico Madeon. La canción principal se lanzó como single el 27 de agosto de 2012, con un lanzamiento del EP el 8 de octubre de 2012, con remixes y versiones alternativas de sus canciones "Finale" e "Icarus"', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (32, N'Happier Marshmello Bastille', 1, N'AUDIO', CAST(1.99 AS Decimal(4, 2)), N'https://upload.wikimedia.org/wikipedia/en/thumb/e/e5/Marshmello_and_Bastille_Happier.png/220px-Marshmello_and_Bastille_Happier.png', N'Compuesto por el artista Marshmello y Bastille, del genero Electrónica, con una duración de 3.53 minutos', N'Una obra musical para alégrate el día', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (33, N'Daft Punk - One More Time', 1, N'AUDIO', CAST(2.99 AS Decimal(4, 2)), N'https://vignette.wikia.nocookie.net/daftpunk/images/5/50/One_More_Time.jpg', N'Compuesto por la banda Daft Punk, del genero PartyHouse/Electrónica, un clásico de los años 2000, con una duración de 5.21 minutos aprox.', N'Cuenta la historia de una banda que es abducida y enviada a un nuevo planeta, donde los habitantes notaran el ritmo de la banda, ganando terreno en dicho planeta como una banda famosa de otro mundo, pero que tendrá un digo inesperado llamando la atención de otros mundos', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (34, N'Daft Punk - Get Lucky', 1, N'AUDIO', CAST(4.99 AS Decimal(4, 2)), N'https://i1.sndcdn.com/artworks-000047107873-70i5bu-t500x500.jpg', N'Artista: Daft Punk Artista invitado: Pharrell Williams, Nile Rodgers Álbum: Random Access Memories Fecha de lanzamiento: 2013 Género: Dance/electrónica', N'Obra musical de la banda Daft Punk junto a Pharrell Williams y Nile Rodgers', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (35, N'Deorro - Five Hours', 1, N'AUDIO', CAST(2.99 AS Decimal(4, 2)), N'https://upload.wikimedia.org/wikipedia/en/d/d8/Five-Hours-by-Deorro.jpg', N'Artista: Deorro Álbum: Five Hours Fecha de lanzamiento: 2014 Género: Dance/electrónica', N'Un tema música para pasar el rato solo, con algunos colegas o para tenerla de fondo', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (36, N'GALA - Freed from desire', 1, N'AUDIO', CAST(1.99 AS Decimal(4, 2)), N'https://www.mp3yukleindir.com/storage/album/gala-freed-from-desire-1997.jpg', N'Artistas: Gala Rizzatto, Gala Álbum: Tough Love (Deluxe Version) Fecha de lanzamiento: 2009 Género: Pop', N'Un tema movidoso para  poner en reuniones o fiestas', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (37, N'Sweet Dreams', 1, N'AUDIO', CAST(2.99 AS Decimal(4, 2)), N'https://i.ytimg.com/vi/qeMFqkcPYcg/maxresdefault.jpg', N'Tema musical famoso para los años 90´s', N'Un tema para escuchar junto a un grupo de personas', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (38, N'Madeon - All My Friends', 1, N'AUDIO', CAST(4.99 AS Decimal(4, 2)), N'https://upload.wikimedia.org/wikipedia/en/1/19/Madeon_-_All_My_Friends.png', N'Artista: Madeon Álbum: Good Faith Fecha de lanzamiento: 2019 Género: Dance/electrónica', N'Un tema musical poco conocido', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (39, N'Stonebank - Be Alright (feat. EMEL)', 1, N'AUDIO', CAST(5.99 AS Decimal(4, 2)), N'https://s.mxmcdn.net/images-storage/albums4/6/0/5/0/4/2/34240506_800_800.jpg', N'Artista: Stonebank Artista invitado: EMEL Álbum: Be Alright Fecha de lanzamiento: 2016 Género: Dance/electrónica', N'...', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (40, N'Stonebank - Stronger (feat. EMEL) ', 1, N'AUDIO', CAST(5.99 AS Decimal(4, 2)), N'https://i.ytimg.com/vi/I1NuCWfYeYc/hqdefault.jpg', N'Artista: Stonebank Artista invitado: EMEL Álbum: Stronger Fecha de lanzamiento: 2015 Género: Dance/electrónica', N'...', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (41, N'Disconnected - Monster Cat ', 1, N'AUDIO', CAST(5.99 AS Decimal(4, 2)), N'https://images.genius.com/5798bc72ea97cc656c4bf65261087ebb.1000x1000x1.jpg', N'Artista: Pegboard Nerds Álbum: Monstercat 007 - Solace Fecha de lanzamiento: 2012 Género: Dance/electrónica', N'...', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (42, N'Jaden - On My Own ft. Kid Cudi', 1, N'AUDIO', CAST(7.99 AS Decimal(4, 2)), N'https://images.genius.com/2304451c0f70de33678df62fb4ad32ff.1000x1000x1.png', N'Tema utilizado para el reciente juego de Marven Spider Man Miles Morales', N'...', 4)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (43, N'RAISING KRATOS en ESPAÑOL', 2, N'WMV', CAST(0.00 AS Decimal(4, 2)), N'https://i.ytimg.com/vi/1lLLuEE1hgA/maxresdefault.jpg', N'Un documental acerca del desarrollo del juego God of War para Play Station 4, hecho por Santa Monica Studio y Play Station Estados Unidos (Subtitulado al español)', N'''God of War: Raising Kratos''. Un trabajo de cinco años, en el que Cory Barlog, el director de juego, le da la vuelta a la historia de Kratos en algo más que un ‘Making Off’. ¡Sumérgete en esta aventura cinematográfica.', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (44, N'Documental sobre animales (HD)', 2, N'MPG', CAST(0.00 AS Decimal(4, 2)), N'https://i.ytimg.com/vi/2QKV4LKfizs/maxresdefault.jpg', N'Música en este vídeo Más información Escucha música sin anuncios con YouTube Premium Canción Waterphone Oddness - Main version Artista BENJI PAUL MERRISON, PRS Álbum SATVDG 61 - NATURE''S MYSTERY Con licencia cedida a YouTube', N'Las praderas africanas, un paisaje gigante, controlado por una sola cosa: el sol. Cada día, cuando sale, su calor da vida a las llanuras y los gigantes de África comienzan a moverse. Mientras que las musarañas elefante se pasan todo el día cazando, los leones prefieren hacerlo al anochecer. Estos grandes felinos son nocturnos y pasan hasta veinte horas al día durmiendo a menos que tengan cachorros. Si el sol se esconde y aparecen las nubes, la actividad cesa en las praderas. Es el momento de los pangolines, este curioso animal aprovecha el mal tiempo para escarbar en la tierra mojada en busca de hormigas, su mayor fuente de energía. A lo largo del día pueden consumir una media de ciento noventa mil insectos que cazan con su puntiaguda y pegajosa lengua que puede alcanzar los cuarenta centímetros.', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (45, N'Tigres y Hombres.', 2, N'MPG', CAST(0.00 AS Decimal(4, 2)), N'https://imagenes.20minutos.es/files/image_656_370/uploads/imagenes/2018/06/01/714624.jpg', N'...', N'Documental en español sobre la guerra mortal que existe entre tigres y hombres debido al trafico ilegal de partes de este felino. En el extremo oriente Ruso ha habido un ataque de un tigre que merodeaba por el pueblo. La sangre en el suelo confirma que el tigre ha atacado a un humano. La patrulla sigue la pista del tigre por el bosque. Al final encuentran restos ensangrentados del cuerpo de la persona que fue atacada por el tigre. Al final se confirma lo que más temían: el tigre ha matado a un hombre. Los ataques de tigres a humanos son extraordinariamente raros, mas aun si lo hacen para comer. Pero parece que este tigre se ha convertido en un devorador de hombres y ahora, la misión de la patrulla se convierte en buscar y dar muerte al tigre.   Esta es la historia de una guerra sin cuartel, una batalla entre hombres que decidirá el futuro de los tigres, es una guerra con víctimas inocentes en ambos lados, una contienda internacional donde tigres y hombres mueren por la avaricia inmoral de empresarios invisibles que mueven el comercio ilegal de las partes del tigre. Esta es la historia de la lucha de una especie por salvar a otra, del hombre contra su lado oscuro, de un superpredador que intenta ayudar a otro al que ha llevado al borde de la extinción.', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (46, N'MUNDO JURÁSICO -  History', 2, N'AVI', CAST(0.00 AS Decimal(4, 2)), N'https://i.ytimg.com/vi/5JFkVY6C0D0/maxresdefault.jpg', N'Programa emitido por el canal History', N'El Alosaurio y el Ceratosaurio se enfrentan, en lo que sería una de las peleas más sangrientas registradas en la paleo-historia.', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (47, N'BESTIAS MEDIEVALES MITOLÓGICAS ', 2, N'DIVX', CAST(0.00 AS Decimal(4, 2)), N'https://i.ytimg.com/vi/bttrcziTeZE/sddefault.jpg', N'''Pero eso es otra Historia'' es una serie documental semanal emitida a través de Youtube que aspira a ser un resumen de toda la historia de la humanidad, desde la creación de la Tierra hasta la actualidad.', N'Mini documental que trata sobre las bestias mitológicas que existían en la Antigua Edad Media', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (48, N'Toda la Historia de JAPÓN ANTIGUO Y FEUDAL', 2, N'DIVX', CAST(0.00 AS Decimal(4, 2)), N'https://i.ytimg.com/vi/bvelnl4kbUk/mqdefault.jpg', N'Documental resumen sobre la historia de la Japón antigua y feudal ', N'''Pero eso es otra Historia'' es una serie documental semanal emitida a través de Youtube que aspira a ser un resumen de toda la historia de la humanidad, desde la creación de la Tierra hasta la actualidad.', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (49, N'ESPAÑA: Prehistoria y Antigüedad', 2, N'WMV', CAST(0.00 AS Decimal(4, 2)), N'https://i.pinimg.com/564x/f2/af/84/f2af8449b67f133199bbf5a50799b72a.jpg', N'Pero eso es otra Historia es una serie documental semanal emitida a través de Youtube que busca ser un resumen divertido de toda la historia de la humanidad, desde la creación de la Tierra hasta la actualidad. Si buscas curiosidades sobre la Historia, este es tu sitio.', N'Antes de entrar en la Edad Media demos un pequeño repaso a la prehistoria y a la antigüedad en la península ibérica. Nuestra primera parada es Atapuerca, lugar de reunión de diversos homínidos que precedieron a las primeras culturas, como los Millares o el Argar.  Se cree que el primer reino de la península fue Tartessos, mientras el resto de lo que ahora es España estaba salpicada por diferentes tribus de celtas, íberos y vascones. La historia cambia cuando llegan los fenicios y los griegos primero, y cartagineses y romanos después.   Hispania se convirtió en un campo de batalla durante dos guerras púnicas y dos guerras civiles romanas, hasta que finalmente Roma logró su objetivo y la conquistó por completo tras las Guerras Cántabras. La romanización de Hispania llevaría varios siglos, hasta la invasión de los visigodos en en el siglo V d.C.', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (50, N'Historia de los VIKINGOS', 2, N'MPG', CAST(0.00 AS Decimal(4, 2)), N'https://i.ytimg.com/vi/xi0nKTwbYVg/sddefault.jpg', N'''Pero eso es otra Historia'' es una serie documental semanal emitida a través de Youtube que aspira a ser un resumen de toda la historia de la humanidad, desde la creación de la Tierra hasta la actualidad', N'Un documenta que trata sobre la historia y desarrollo de los antiguos Vikingos', 3)
INSERT [dbo].[tblArchivos] ([idArchivo], [titulo], [idTipoFile], [formato], [precio], [ruta], [detalles], [sinopsis], [codCategoria]) VALUES (51, N'CALIFATOS MEDIEVALES 1: La Arabia Preislámica', 2, N'MPG', CAST(0.00 AS Decimal(4, 2)), N'https://i.pinimg.com/564x/89/84/51/898451db3fc4e7790639529ce069136d.jpg', N'Pero eso es otra Historia'' es una serie documental semanal emitida a través de Youtube que aspira a ser un resumen de toda la historia de la humanidad, desde la creación de la Tierra hasta la actualidad', N'Documental sobre la Historia de la Arabia Preislámica', 3)
INSERT [dbo].[tblCategorias] ([codCategoria], [categoria]) VALUES (1, N'Peliculas')
INSERT [dbo].[tblCategorias] ([codCategoria], [categoria]) VALUES (2, N'Series   ')
INSERT [dbo].[tblCategorias] ([codCategoria], [categoria]) VALUES (3, N'Videos   ')
INSERT [dbo].[tblCategorias] ([codCategoria], [categoria]) VALUES (4, N'Musica   ')
INSERT [dbo].[tblRegistroAlquiler] ([codAlquiler], [fecha_alquiler], [subTotal], [costoTotal], [idArchivo], [idUsuario]) VALUES (1, CAST(N'2020-12-16' AS Date), CAST(45.99 AS Decimal(4, 2)), CAST(45.99 AS Decimal(5, 2)), 5, 1)
INSERT [dbo].[tblRegistroAlquiler] ([codAlquiler], [fecha_alquiler], [subTotal], [costoTotal], [idArchivo], [idUsuario]) VALUES (2, CAST(N'2020-12-16' AS Date), CAST(36.99 AS Decimal(4, 2)), CAST(157.97 AS Decimal(5, 2)), 8, 3)
INSERT [dbo].[tblRegistroAlquiler] ([codAlquiler], [fecha_alquiler], [subTotal], [costoTotal], [idArchivo], [idUsuario]) VALUES (3, CAST(N'2020-12-16' AS Date), CAST(65.99 AS Decimal(4, 2)), CAST(157.97 AS Decimal(5, 2)), 6, 3)
INSERT [dbo].[tblRegistroAlquiler] ([codAlquiler], [fecha_alquiler], [subTotal], [costoTotal], [idArchivo], [idUsuario]) VALUES (4, CAST(N'2020-12-16' AS Date), CAST(54.99 AS Decimal(4, 2)), CAST(157.97 AS Decimal(5, 2)), 17, 3)
INSERT [dbo].[tblRegistroAlquiler] ([codAlquiler], [fecha_alquiler], [subTotal], [costoTotal], [idArchivo], [idUsuario]) VALUES (5, CAST(N'2020-12-16' AS Date), CAST(15.99 AS Decimal(4, 2)), CAST(28.98 AS Decimal(5, 2)), 20, 2)
INSERT [dbo].[tblRegistroAlquiler] ([codAlquiler], [fecha_alquiler], [subTotal], [costoTotal], [idArchivo], [idUsuario]) VALUES (6, CAST(N'2020-12-16' AS Date), CAST(12.99 AS Decimal(4, 2)), CAST(28.98 AS Decimal(5, 2)), 30, 2)
INSERT [dbo].[tblRoles] ([idRol], [nomRol]) VALUES (1, N'Admin')
INSERT [dbo].[tblRoles] ([idRol], [nomRol]) VALUES (2, N'User')
INSERT [dbo].[tblRoles] ([idRol], [nomRol]) VALUES (3, N'Block')
INSERT [dbo].[tblTiposFile] ([idTipoFile], [nomTipoFile]) VALUES (1, N'MP3')
INSERT [dbo].[tblTiposFile] ([idTipoFile], [nomTipoFile]) VALUES (2, N'MP4')
INSERT [dbo].[tblTiposFile] ([idTipoFile], [nomTipoFile]) VALUES (3, N'PNG')
INSERT [dbo].[tblTiposFile] ([idTipoFile], [nomTipoFile]) VALUES (4, N'JPG')
INSERT [dbo].[tblTiposFile] ([idTipoFile], [nomTipoFile]) VALUES (5, N'JPEG')
INSERT [dbo].[tblTiposFile] ([idTipoFile], [nomTipoFile]) VALUES (6, N'GIF')
INSERT [dbo].[tblUsuarios] ([idUsuario], [nomUsuario], [pass], [idRol], [Nombre], [Apellido], [Correo], [Telefono]) VALUES (1, N'Daniel L', N'12345', 1, N'Daniel', N'Landaverde', N'daniel@gmail.com', N'1234-5678')
INSERT [dbo].[tblUsuarios] ([idUsuario], [nomUsuario], [pass], [idRol], [Nombre], [Apellido], [Correo], [Telefono]) VALUES (2, N'Diana L', N'54321', 2, N'Diana', N'Landaverde', N'diana@gmail.com', N'8765-4321')
INSERT [dbo].[tblUsuarios] ([idUsuario], [nomUsuario], [pass], [idRol], [Nombre], [Apellido], [Correo], [Telefono]) VALUES (3, N'ClienteGenerico123', N'cliente', 2, N'Mauricio', N'Recinos', N'clientegenerico@mail.com', N'2468-1357')
ALTER TABLE [dbo].[tblArchivos]  WITH CHECK ADD  CONSTRAINT [fk_codCategoria] FOREIGN KEY([codCategoria])
REFERENCES [dbo].[tblCategorias] ([codCategoria])
GO
ALTER TABLE [dbo].[tblArchivos] CHECK CONSTRAINT [fk_codCategoria]
GO
ALTER TABLE [dbo].[tblArchivos]  WITH CHECK ADD  CONSTRAINT [fk_idTipoFile] FOREIGN KEY([idTipoFile])
REFERENCES [dbo].[tblTiposFile] ([idTipoFile])
GO
ALTER TABLE [dbo].[tblArchivos] CHECK CONSTRAINT [fk_idTipoFile]
GO
ALTER TABLE [dbo].[tblRegistroAlquiler]  WITH CHECK ADD  CONSTRAINT [fk_idArchivo1] FOREIGN KEY([idArchivo])
REFERENCES [dbo].[tblArchivos] ([idArchivo])
GO
ALTER TABLE [dbo].[tblRegistroAlquiler] CHECK CONSTRAINT [fk_idArchivo1]
GO
ALTER TABLE [dbo].[tblRegistroAlquiler]  WITH CHECK ADD  CONSTRAINT [fk_idUsuario1] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[tblUsuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[tblRegistroAlquiler] CHECK CONSTRAINT [fk_idUsuario1]
GO
ALTER TABLE [dbo].[tblUsuarios]  WITH CHECK ADD  CONSTRAINT [fk_idRol] FOREIGN KEY([idRol])
REFERENCES [dbo].[tblRoles] ([idRol])
GO
ALTER TABLE [dbo].[tblUsuarios] CHECK CONSTRAINT [fk_idRol]
GO
USE [master]
GO
ALTER DATABASE [GeoMediaBD] SET  READ_WRITE 
GO
