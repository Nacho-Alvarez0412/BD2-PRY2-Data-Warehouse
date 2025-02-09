USE [master]
GO
/****** Object:  Database [SQL_VENTAS_MAIN]    Script Date: 1/15/2021 8:30:23 AM ******/
CREATE DATABASE [SQL_VENTAS_MAIN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQL_VENTAS_MAIN', FILENAME = N'G:\SQLSERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\SQL_VENTAS_MAIN_Primary.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQL_VENTAS_MAIN_log', FILENAME = N'G:\SQLSERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\SQL_VENTAS_MAIN_Primary.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQL_VENTAS_MAIN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET ANSI_NULLS ON 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET ANSI_PADDING ON 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET ARITHABORT ON 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET RECOVERY FULL 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET  MULTI_USER 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SQL_VENTAS_MAIN', N'ON'
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET QUERY_STORE = OFF
GO
USE [SQL_VENTAS_MAIN]
GO
/****** Object:  User [JOS-PC\repl_snapshot]    Script Date: 1/15/2021 8:30:23 AM ******/
CREATE USER [JOS-PC\repl_snapshot] FOR LOGIN [JOS-PC\repl_snapshot] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JOS-PC\repl_logreader]    Script Date: 1/15/2021 8:30:23 AM ******/
CREATE USER [JOS-PC\repl_logreader] FOR LOGIN [JOS-PC\repl_logreader] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [JOS-PC\repl_distribution]    Script Date: 1/15/2021 8:30:23 AM ******/
CREATE USER [JOS-PC\repl_distribution] FOR LOGIN [JOS-PC\repl_distribution] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [MStran_PAL_role]    Script Date: 1/15/2021 8:30:23 AM ******/
CREATE ROLE [MStran_PAL_role]
GO
/****** Object:  DatabaseRole [MSReplPAL_5_2]    Script Date: 1/15/2021 8:30:23 AM ******/
CREATE ROLE [MSReplPAL_5_2]
GO
ALTER ROLE [db_owner] ADD MEMBER [JOS-PC\repl_snapshot]
GO
ALTER ROLE [db_owner] ADD MEMBER [JOS-PC\repl_logreader]
GO
ALTER ROLE [MStran_PAL_role] ADD MEMBER [JOS-PC\repl_distribution]
GO
ALTER ROLE [MSReplPAL_5_2] ADD MEMBER [JOS-PC\repl_distribution]
GO
ALTER ROLE [db_owner] ADD MEMBER [JOS-PC\repl_distribution]
GO
ALTER ROLE [MStran_PAL_role] ADD MEMBER [MSReplPAL_5_2]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 1/15/2021 8:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nchar](5) NOT NULL,
	[Pais] [nchar](10) NOT NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTAS]    Script Date: 1/15/2021 8:30:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Factura] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[Cliente] [nchar](5) NOT NULL,
	[Producto] [nchar](7) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Moneda] [nchar](3) NOT NULL,
	[Precio] [decimal](30, 5) NOT NULL,
	[Total] [decimal](30, 5) NOT NULL,
	[Almacen] [int] NOT NULL,
	[Vendedor] [decimal](5, 0) NOT NULL,
	[TotalUSD] [decimal](30, 5) NOT NULL,
	[Impuesto] [decimal](30, 5) NOT NULL,
	[ImpuestoUSD] [decimal](30, 5) NOT NULL,
	[TipoDeCambio] [decimal](30, 5) NOT NULL,
	[Ganancia] [decimal](30, 5) NOT NULL,
	[GananciaUSD] [decimal](30, 5) NOT NULL,
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SQL_VENTAS_MAIN] SET  READ_WRITE 
GO
