USE [master]
GO
/****** Object:  Database [Universities]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
CREATE DATABASE [Universities]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Universities', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Universities.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Universities_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Universities_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Universities] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Universities].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Universities] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Universities] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Universities] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Universities] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Universities] SET ARITHABORT OFF 
GO
ALTER DATABASE [Universities] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Universities] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Universities] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Universities] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Universities] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Universities] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Universities] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Universities] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Universities] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Universities] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Universities] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Universities] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Universities] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Universities] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Universities] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Universities] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Universities] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Universities] SET RECOVERY FULL 
GO
ALTER DATABASE [Universities] SET  MULTI_USER 
GO
ALTER DATABASE [Universities] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Universities] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Universities] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Universities] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Universities] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Universities', N'ON'
GO
USE [Universities]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ProfessorId] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoursesStudents]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursesStudents](
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[FacultyId] [int] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyId] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[UniversityId] [int] NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfessorId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titles]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[TitleId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TitlesProfessors]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitlesProfessors](
	[TitleId] [int] NOT NULL,
	[ProfessorId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Universities]    Script Date: 5.10.2015 г. 01:00:22 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universities](
	[UniversityId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Universities] PRIMARY KEY CLUSTERED 
(
	[UniversityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([ProfessorId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Professors]
GO
ALTER TABLE [dbo].[CoursesStudents]  WITH CHECK ADD  CONSTRAINT [FK_CoursesStudents_Courses] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Courses] ([CourseId])
GO
ALTER TABLE [dbo].[CoursesStudents] CHECK CONSTRAINT [FK_CoursesStudents_Courses]
GO
ALTER TABLE [dbo].[CoursesStudents]  WITH CHECK ADD  CONSTRAINT [FK_CoursesStudents_Students] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[CoursesStudents] CHECK CONSTRAINT [FK_CoursesStudents_Students]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([FacultyId])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Faculties]
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD  CONSTRAINT [FK_Faculties_Universities] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[Universities] ([UniversityId])
GO
ALTER TABLE [dbo].[Faculties] CHECK CONSTRAINT [FK_Faculties_Universities]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Departments]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Departments1] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Departments1]
GO
ALTER TABLE [dbo].[TitlesProfessors]  WITH CHECK ADD  CONSTRAINT [FK_TitlesProfessors_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([ProfessorId])
GO
ALTER TABLE [dbo].[TitlesProfessors] CHECK CONSTRAINT [FK_TitlesProfessors_Professors]
GO
ALTER TABLE [dbo].[TitlesProfessors]  WITH CHECK ADD  CONSTRAINT [FK_TitlesProfessors_Titles] FOREIGN KEY([TitleId])
REFERENCES [dbo].[Titles] ([TitleId])
GO
ALTER TABLE [dbo].[TitlesProfessors] CHECK CONSTRAINT [FK_TitlesProfessors_Titles]
GO
USE [master]
GO
ALTER DATABASE [Universities] SET  READ_WRITE 
GO
