USE [master]
GO
/****** Object:  Database [World]    Script Date: 4.10.2015 г. 21:29:32 ч. ******/
CREATE DATABASE [World]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'World', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\World.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'World_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\World_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [World] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [World].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [World] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [World] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [World] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [World] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [World] SET ARITHABORT OFF 
GO
ALTER DATABASE [World] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [World] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [World] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [World] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [World] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [World] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [World] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [World] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [World] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [World] SET  DISABLE_BROKER 
GO
ALTER DATABASE [World] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [World] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [World] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [World] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [World] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [World] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [World] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [World] SET RECOVERY FULL 
GO
ALTER DATABASE [World] SET  MULTI_USER 
GO
ALTER DATABASE [World] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [World] SET DB_CHAINING OFF 
GO
ALTER DATABASE [World] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [World] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [World] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'World', N'ON'
GO
USE [World]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 4.10.2015 г. 21:29:32 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] NOT NULL,
	[AddressText] [nvarchar](30) NOT NULL,
	[TownId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continents]    Script Date: 4.10.2015 г. 21:29:32 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Continents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 4.10.2015 г. 21:29:32 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 4.10.2015 г. 21:29:32 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 4.10.2015 г. 21:29:32 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (1, N'Mladost', 5)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (2, N'Drujba', 6)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (3, N'Nadejda', 3)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (4, N'Lulin', 4)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (5, N'Sveta Troica', 1)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (6, N'Iztok', 2)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (7, N'Geo Milev', 3)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (8, N'Obelq', 2)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (9, N'Suhata Reka', 8)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (10, N'Boqna', 7)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (11, N'Diana Bad', 5)
INSERT [dbo].[Addresses] ([Id], [AddressText], [TownId]) VALUES (12, N'Lozenec', 5)
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (1, N'Asia')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (2, N'Europe')
INSERT [dbo].[Continents] ([Id], [Name]) VALUES (3, N'South America')
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (1, N'Italy', 2)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (2, N'Spain', 2)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (3, N'China', 1)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (4, N'Bulgaria', 2)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (5, N'Japan', 1)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (6, N'Venezuela', 3)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (7, N'Chile', 3)
INSERT [dbo].[Countries] ([Id], [Name], [ContinentId]) VALUES (8, N'Iran', 1)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (1, N'Gosho', N'Ivanov', 2)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (2, N'Pencho', N'Penev', 3)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (3, N'Muncho', N'Genev', 1)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (4, N'Ivan', N'Petkov', 7)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (5, N'Todor', N'Stoev', 8)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (6, N'Mihail', N'Petev', 9)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (7, N'Sasho', N'Velev', 5)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (8, N'Ismail', N'Zarkov', 4)
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [AddressId]) VALUES (9, N'Simeon', N'Blagoev', 6)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (1, N'Sofia', 4)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (2, N'Turin', 1)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (3, N'Madrid', 2)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (4, N'Caracas', 6)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (5, N'Pekin', 3)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (6, N'Tokio', 5)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (7, N'Santiago', 6)
INSERT [dbo].[Towns] ([Id], [Name], [CountryId]) VALUES (8, N'Tehran', 8)
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Towns] FOREIGN KEY([TownId])
REFERENCES [dbo].[Towns] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Towns]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Continents] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continents] ([Id])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Continents]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Addresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Addresses]
GO
ALTER TABLE [dbo].[Towns]  WITH CHECK ADD  CONSTRAINT [FK_Towns_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Towns] CHECK CONSTRAINT [FK_Towns_Countries]
GO
USE [master]
GO
ALTER DATABASE [World] SET  READ_WRITE 
GO
