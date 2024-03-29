USE [master]
GO
/****** Object:  Database [Tourism]    Script Date: 14.02.2024 14:37:39 ******/
CREATE DATABASE [Tourism]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tourism', FILENAME = N'C:\1\Tourism.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tourism_log', FILENAME = N'C:\1\Tourism_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tourism] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tourism].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tourism] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tourism] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tourism] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tourism] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tourism] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tourism] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tourism] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tourism] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tourism] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tourism] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tourism] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tourism] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tourism] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tourism] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tourism] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tourism] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tourism] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tourism] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tourism] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tourism] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tourism] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tourism] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tourism] SET RECOVERY FULL 
GO
ALTER DATABASE [Tourism] SET  MULTI_USER 
GO
ALTER DATABASE [Tourism] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tourism] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tourism] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tourism] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tourism] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tourism] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tourism', N'ON'
GO
ALTER DATABASE [Tourism] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tourism] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tourism]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK__Cities__F2D21A9645392FD2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[MiddleName] [nvarchar](255) NULL,
	[Position] [nvarchar](255) NULL,
	[Salary] [decimal](10, 2) NULL,
	[id_resort] [int] NULL,
	[id_hotel] [int] NULL,
	[id_city] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excursions]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excursions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_resort] [int] NULL,
	[SignificantPlaces] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Stars] [int] NULL,
	[FreeRooms] [int] NULL,
	[RoomTypes] [nvarchar](max) NULL,
	[id_resort] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resorts]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resorts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TravelCosts]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TravelCosts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_traveler] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Travelers]    Script Date: 14.02.2024 14:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Travelers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[MiddleName] [nvarchar](255) NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[Nationality] [nvarchar](255) NULL,
	[Profession] [nvarchar](255) NULL,
	[DepartureDate] [date] NULL,
	[PurposeOfTrip] [nvarchar](max) NULL,
	[id_resort] [int] NULL,
	[Duration] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Region]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__CityI__4CA06362] FOREIGN KEY([id_city])
REFERENCES [dbo].[Cities] ([id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__CityI__4CA06362]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([id_hotel])
REFERENCES [dbo].[Hotels] ([id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([id_resort])
REFERENCES [dbo].[Resorts] ([id])
GO
ALTER TABLE [dbo].[Excursions]  WITH CHECK ADD FOREIGN KEY([id_resort])
REFERENCES [dbo].[Resorts] ([id])
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD FOREIGN KEY([id_resort])
REFERENCES [dbo].[Resorts] ([id])
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[TravelCosts]  WITH CHECK ADD FOREIGN KEY([id_traveler])
REFERENCES [dbo].[Travelers] ([id])
GO
ALTER TABLE [dbo].[Travelers]  WITH CHECK ADD FOREIGN KEY([id_resort])
REFERENCES [dbo].[Resorts] ([id])
GO
USE [master]
GO
ALTER DATABASE [Tourism] SET  READ_WRITE 
GO
