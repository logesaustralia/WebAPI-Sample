USE [master]
GO
/****** Object:  Database [WeatherDB]    Script Date: 22-09-2019 14:18:49 ******/
CREATE DATABASE [WeatherDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WeatherDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WeatherDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WeatherDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\WeatherDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WeatherDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WeatherDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WeatherDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WeatherDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WeatherDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WeatherDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WeatherDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WeatherDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WeatherDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WeatherDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WeatherDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WeatherDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WeatherDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WeatherDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WeatherDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WeatherDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WeatherDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WeatherDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WeatherDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WeatherDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WeatherDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WeatherDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WeatherDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WeatherDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WeatherDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WeatherDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WeatherDB] SET  MULTI_USER 
GO
ALTER DATABASE [WeatherDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WeatherDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WeatherDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WeatherDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [WeatherDB]
GO
/****** Object:  Table [dbo].[tblCities]    Script Date: 22-09-2019 14:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCities](
	[CityID] [int] NOT NULL,
	[CountyID] [int] NULL,
	[CityName] [varchar](50) NULL,
 CONSTRAINT [PK_tblCities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCountries]    Script Date: 22-09-2019 14:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountries](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCountries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTemperature]    Script Date: 22-09-2019 14:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTemperature](
	[CityID] [int] NOT NULL,
	[Location] [varchar](50) NULL,
	[Time] [datetime] NULL,
	[Visibility] [int] NULL,
	[SkyCondition] [varchar](50) NULL,
	[Temperature] [numeric](18, 0) NULL,
	[DewPoint] [int] NULL,
	[RelativeHumidity] [int] NULL,
	[Preasure] [int] NULL,
 CONSTRAINT [PK_tblTemperature] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblCities] ([CityID], [CountyID], [CityName]) VALUES (1, 1, N'Sydney')
INSERT [dbo].[tblCities] ([CityID], [CountyID], [CityName]) VALUES (2, 1, N'Melbourne')
INSERT [dbo].[tblCities] ([CityID], [CountyID], [CityName]) VALUES (3, 2, N'NewYork')
INSERT [dbo].[tblCities] ([CityID], [CountyID], [CityName]) VALUES (4, 2, N'WashingTonDC')
INSERT [dbo].[tblCities] ([CityID], [CountyID], [CityName]) VALUES (5, 3, N'Landon')
INSERT [dbo].[tblCities] ([CityID], [CountyID], [CityName]) VALUES (6, 3, N'Liverpool')
INSERT [dbo].[tblCountries] ([ID], [Name]) VALUES (1, N'Australia')
INSERT [dbo].[tblCountries] ([ID], [Name]) VALUES (2, N'America')
INSERT [dbo].[tblCountries] ([ID], [Name]) VALUES (3, N'England')
INSERT [dbo].[tblTemperature] ([CityID], [Location], [Time], [Visibility], [SkyCondition], [Temperature], [DewPoint], [RelativeHumidity], [Preasure]) VALUES (1, N'Paramatta', CAST(N'1900-01-01 07:47:30.240' AS DateTime), 1, N'Good', CAST(10 AS Numeric(18, 0)), 10, 30, 40)
INSERT [dbo].[tblTemperature] ([CityID], [Location], [Time], [Visibility], [SkyCondition], [Temperature], [DewPoint], [RelativeHumidity], [Preasure]) VALUES (2, N'Burwood', CAST(N'1900-01-01 07:48:32.080' AS DateTime), 1, N'Good', CAST(10 AS Numeric(18, 0)), 10, 30, 40)
INSERT [dbo].[tblTemperature] ([CityID], [Location], [Time], [Visibility], [SkyCondition], [Temperature], [DewPoint], [RelativeHumidity], [Preasure]) VALUES (3, N'Burwood', CAST(N'1900-01-01 07:48:41.270' AS DateTime), 1, N'Good', CAST(10 AS Numeric(18, 0)), 10, 30, 40)
INSERT [dbo].[tblTemperature] ([CityID], [Location], [Time], [Visibility], [SkyCondition], [Temperature], [DewPoint], [RelativeHumidity], [Preasure]) VALUES (4, N'NewYork', CAST(N'2019-09-22 13:47:13.027' AS DateTime), 1, N'Cloudy', CAST(10 AS Numeric(18, 0)), 10, 30, 40)
INSERT [dbo].[tblTemperature] ([CityID], [Location], [Time], [Visibility], [SkyCondition], [Temperature], [DewPoint], [RelativeHumidity], [Preasure]) VALUES (5, N'Landon', CAST(N'2019-09-22 13:48:30.813' AS DateTime), 1, N'Cloudy', CAST(10 AS Numeric(18, 0)), 10, 30, 40)
INSERT [dbo].[tblTemperature] ([CityID], [Location], [Time], [Visibility], [SkyCondition], [Temperature], [DewPoint], [RelativeHumidity], [Preasure]) VALUES (6, N'LiverPool', CAST(N'2019-09-22 13:48:42.150' AS DateTime), 1, N'Cloudy', CAST(10 AS Numeric(18, 0)), 10, 30, 40)
ALTER TABLE [dbo].[tblCities]  WITH CHECK ADD  CONSTRAINT [FK_tblCities_tblCities] FOREIGN KEY([CountyID])
REFERENCES [dbo].[tblCountries] ([ID])
GO
ALTER TABLE [dbo].[tblCities] CHECK CONSTRAINT [FK_tblCities_tblCities]
GO
USE [master]
GO
ALTER DATABASE [WeatherDB] SET  READ_WRITE 
GO
