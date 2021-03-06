USE [master]
GO
/****** Object:  Database [CarRental]    Script Date: 16/12/2019 16:24:08 ******/
CREATE DATABASE [CarRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarRental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CarRental.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarRental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CarRental_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarRental] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarRental] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CarRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarRental] SET RECOVERY FULL 
GO
ALTER DATABASE [CarRental] SET  MULTI_USER 
GO
ALTER DATABASE [CarRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarRental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarRental] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CarRental', N'ON'
GO
ALTER DATABASE [CarRental] SET QUERY_STORE = OFF
GO
USE [CarRental]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CarRental]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[ID] [int] NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Latitude] [nvarchar](100) NOT NULL,
	[Longitude] [nvarchar](100) NULL,
	[Name] [nvarchar](300) NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarTypes]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[ManufactureYear] [int] NOT NULL,
	[ManualGear] [bit] NOT NULL,
	[DailyPrice] [money] NOT NULL,
	[LatePrice] [money] NOT NULL,
 CONSTRAINT [PK_CarTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUsMessages]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUsMessages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](100) NULL,
	[TextMessage] [nvarchar](500) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactUsMessages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FleetCars]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FleetCars](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NOT NULL,
	[CarTypeID] [int] NOT NULL,
	[Mileage] [int] NOT NULL,
	[Image] [nvarchar](300) NOT NULL,
	[IsAvailableForRent] [bit] NULL,
	[IsProperForRent] [bit] NULL,
	[BranchID] [int] NULL,
 CONSTRAINT [PK_FleetCars_1] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecentSearches]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecentSearches](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[ManufactureYear] [nvarchar](50) NULL,
	[Gear] [nvarchar](50) NULL,
	[CarID] [nvarchar](50) NULL,
	[DailyPrice] [nvarchar](50) NULL,
	[LatePrice] [nvarchar](50) NULL,
	[StartDate] [nvarchar](50) NULL,
	[EndDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_RecentSearches] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[ActualReturnDate] [date] NULL,
	[IsOrderClosed] [bit] NOT NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nickname] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IdentityNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NULL,
	[Gender] [bit] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Avatar] [nvarchar](max) NULL,
 CONSTRAINT [PK__Users__1788CCAC060DEAE8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserVsRoles]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVsRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserVsRoles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Branches] ([ID], [Address], [Latitude], [Longitude], [Name]) VALUES (1, N'Tel aviv, hertzel 32', N'32.060140', N'34.770470', N'Tel aviv')
INSERT [dbo].[Branches] ([ID], [Address], [Latitude], [Longitude], [Name]) VALUES (2, N'Rishon le tzion, hertzel 23', N'43.836640', N'4.388190', N'Rishon')
INSERT [dbo].[Branches] ([ID], [Address], [Latitude], [Longitude], [Name]) VALUES (3, N'Ashkelon , Ben Azay 6', N'32.087320', N'34.840930', N'Ahkelon')
INSERT [dbo].[Branches] ([ID], [Address], [Latitude], [Longitude], [Name]) VALUES (4, N'Ashdod , Rotshild 22', N'42.069410', N'-70.753520', N'Ashdod')
INSERT [dbo].[Branches] ([ID], [Address], [Latitude], [Longitude], [Name]) VALUES (5, N'Haifa Hertzel 55', N'32.808520', N'35.000190', N'Haifa')
SET IDENTITY_INSERT [dbo].[CarTypes] ON 

INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (16, N'Toyota', N'Camery', 2013, 0, 250.0000, 300.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (17, N'Ford', N'Focus', 2014, 1, 100.0000, 150.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (18, N'Ford', N'Mondeo', 2015, 0, 130.0000, 160.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (19, N'Toyota', N'Corolla', 2014, 0, 175.0000, 200.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (20, N'Toyota', N'Prius', 2016, 0, 200.0000, 250.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (21, N'Mercedes', N'E-Class', 2016, 0, 400.0000, 500.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (22, N'Porsche ', N'911', 2013, 1, 550.0000, 680.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (23, N'Porsche   ', N'MacanA', 2016, 1, 950.0000, 1050.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (26, N'Dacia', N'Stepway', 2016, 1, 275.0000, 290.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (28, N'Volkswagen', N'Polo', 2008, 1, 350.0000, 375.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (1024, N'BMW', N'X500', 2017, 0, 550.0000, 750.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (3024, N'Tesla', N'Track', 2019, 0, 1000.0000, 1250.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (3025, N'Dacia', N'sandero manual', 2018, 0, 550.0000, 650.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (3026, N'Subaru', N'b4', 2015, 1, 660.0000, 700.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (3027, N'Seat', N'Ibiza', 2014, 1, 250.0000, 310.0000)
INSERT [dbo].[CarTypes] ([ID], [Manufacturer], [Model], [ManufactureYear], [ManualGear], [DailyPrice], [LatePrice]) VALUES (3029, N'peugeot', N'306', 2009, 1, 150.0000, 170.0000)
SET IDENTITY_INSERT [dbo].[CarTypes] OFF
SET IDENTITY_INSERT [dbo].[ContactUsMessages] ON 

INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (4, N'yakov', N'solomon', N'Email@Gmail.com', N'05245678941', N'אחלה שירות', CAST(N'2019-12-07T13:14:50.607' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (5, N'יוסף', N'חיים', N'yossi@Gmail.com', N'0832165478', N'אחלה אתר, קליל וכייפי תודה', CAST(N'2019-12-07T13:14:50.610' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (6, N'ברוך', N'חפץ', N'Yishtabah@shmo.com', N'05245678941', N'שירות מעולה אבל לטעמי קצת יקר', CAST(N'2019-12-07T13:14:50.620' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (2007, N'יעקב', N'מלמוד', N'malmud@walla.com', N'086548754', N'שלום לכולם , יש לכם במלאי טסלה?
תודה', CAST(N'2019-12-13T08:59:21.353' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (2008, N'משה', N'איבגי', N'mush@ivgi.com', NULL, N'אחלה שירות', CAST(N'2019-12-13T09:08:29.270' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (2027, N'test2', N'test2', N'test2@test2.tes', NULL, N'i want my ford very clean please', CAST(N'2019-12-14T13:54:54.943' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (2028, N'test2', N'test2', N'test2@test2.com', NULL, N'nice ford you have', CAST(N'2019-12-14T21:47:54.167' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (2029, N'test2', N'test2', N'test2@test2.com', N'03-4568759', N'please cancel my reservation', CAST(N'2019-12-15T00:03:41.833' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (2039, N'Admin', N'Admin', N'Admin@Admin.com', NULL, N'Admin Admin AdminAdminAdminAdminAdmin', CAST(N'2019-12-15T21:42:53.003' AS DateTime))
INSERT [dbo].[ContactUsMessages] ([ID], [FirstName], [LastName], [Email], [Phone], [TextMessage], [CreationDate]) VALUES (2040, N'itzhak', N'vilensky', N'itzhak.vil@gmail.com', N'0506386026', N'בס"ד תודה רבה לשפרה ומנהל פיתוח בגון ברייס,תבורכו', CAST(N'2019-12-15T21:42:53.003' AS DateTime))

SET IDENTITY_INSERT [dbo].[ContactUsMessages] OFF
SET IDENTITY_INSERT [dbo].[FleetCars] ON 

INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1055, 123, 3026, 1, N'/Content/images/uploads/subaru.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1068, 887543, 22, 12, N'/Content/images/uploads/911.jpg', 1, 1, 4)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (15, 1122233, 16, 1231232345, N'/Content/images/uploads/camery.png', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (36, 2254712, 16, 1000000, N'/Content/images/uploads/camery.png', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (14, 2255588, 18, 123123, N'/Content/images/uploads/mondeo.jpeg', 1, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (40, 2266600, 21, 44534573, N'/Content/images/uploads/EClass2016.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (9, 2312366, 19, 42000, N'/Content/images/uploads/corolla.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (10, 2565478, 20, 324234, N'/Content/images/uploads/prius.jpg', 1, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (42, 4428712, 22, 321321321, N'/Content/images/uploads/prius.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (37, 4454535, 16, 54000, N'/Content/images/uploads/camery.png', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (44, 4587453, 23, 1234234, N'/Content/images/uploads/macan.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (38, 5477752, 16, 1, N'/Content/images/uploads/camery.png', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (7, 5487835, 17, 1234, N'/Content/images/uploads/focus.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1067, 5567665, 23, 324, N'/Content/images/uploads/macan.jpg', 1, 1, 4)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1069, 5644586, 21, 243, N'/Content/images/uploads/EClass2016.jpg', 0, 1, 3)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (2, 6366635, 16, 20015, N'/Content/images/uploads/camery.png', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (33, 6645635, 16, 50000, N'/Content/images/uploads/camery.png', 1, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (8, 6878452, 18, 123, N'/Content/images/uploads/mondeo.jpeg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (39, 7454742, 16, 3, N'/Content/images/uploads/camery.png', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (12, 7788866, 20, 56000, N'/Content/images/uploads/prius.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (41, 7845600, 21, 5345, N'/Content/images/uploads/EClass2016.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (32, 8740466, 16, 234234, N'/Content/images/uploads/camery.png', 1, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (43, 8765235, 21, 52000, N'/Content/images/uploads/EClass2016.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (11, 8795175, 17, 120000, N'/Content/images/uploads/focus.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (34, 8825833, 16, 1, N'/Content/images/uploads/camery.png', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1070, 9943253, 18, 50, N'/Content/images/uploads/mondeo.jpeg', 1, 1, 345)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1060, 12343654, 3027, 350, N'/Content/images/uploads/seatIbiza.jpg', 0, 1, 4)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1058, 23434345, 26, 22, N'/Content/images/uploads/stepway.jpg', 0, 1, 2)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1057, 54365433, 3026, 100, N'/Content/images/uploads/subaru.jpg', 0, 1, 2)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1064, 65432754, 1024, 234, N'/Content/images/uploads/x5.jpg', 1, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1066, 65467546, 26, 234, N'/Content/images/uploads/stepway.jpg', 0, 1, 4)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1059, 65487654, 3029, 456, N'/Content/images/uploads/peugeot306.jpg', 0, 1, 3)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (13, 88555535, 20, 0, N'/Content/images/uploads/prius.jpg', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1061, 98767567, 3026, 224, N'/Content/images/uploads/subaru.jpg', 1, 1, 3)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (35, 99999999, 16, 43523453, N'/Content/images/uploads/camery.png', 0, 1, 1)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1065, 654345543, 28, 12332, N'/Content/images/uploads/VolkswagenPolo.jpg', 0, 1, 3)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1063, 666666666, 3024, 123, N'/Content/images/uploads/teslaSyberTrack.jpg', 0, 1, 4)
INSERT [dbo].[FleetCars] ([ID], [CarID], [CarTypeID], [Mileage], [Image], [IsAvailableForRent], [IsProperForRent], [BranchID]) VALUES (1062, 987789987, 3025, 1, N'/Content/images/uploads/sandero.jpg', 1, 1, 3)
SET IDENTITY_INSERT [dbo].[FleetCars] OFF
SET IDENTITY_INSERT [dbo].[RecentSearches] ON 

INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (1, 5014, N'Porsche ', N'911', N'2013', N'Manual gear', N'4428712', N'$550.00', N'$680.00', N'20/12/2019', N'20/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (2, 5014, N'Porsche ', N'911', N'2013', N'Manual gear', N'4428712', N'$550.00', N'$680.00', N'20/12/2019', N'20/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (3, 5019, N'Toyota', N'Camery', N'2013', N'Automatic gear', N'8740466', N'$250.00', N'$300.00', N'16/12/2019', N'16/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (4, 5012, N'Toyota', N'Camery', N'2013', N'Automatic gear', N'6645635', N'$250.00', N'$300.00', N'16/12/2019', N'16/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (5, 5019, N'Dacia', N'Stepway', N'2016', N'Manual gear', N'23434345', N'$275.00', N'$290.00', N'16/12/2019', N'16/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (6, 5012, N'Volkswagen', N'Polo', N'2008', N'Manual gear', N'654345543', N'$350.00', N'$375.00', N'17/12/2019', N'17/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (7, 5014, N'Dacia', N'Stepway', N'2016', N'Manual gear', N'65467546', N'$275.00', N'$290.00', N'16/12/2019', N'16/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (8, 5014, N'Mercedes', N'E-Class', N'2016', N'Automatic gear', N'5644586', N'$400.00', N'$500.00', N'17/12/2019', N'17/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (9, 5011, N'Subaru', N'b4', N'2015', N'Manual gear', N'123', N'$660.00', N'$700.00', N'29/12/2019', N'29/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (10, 5011, N'Seat', N'Ibiza', N'2014', N'Manual gear', N'12343654', N'$250.00', N'$310.00', N'31/12/2019', N'31/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (11, 5013, N'peugeot', N'306', N'2009', N'Manual gear', N'65487654', N'$150.00', N'$170.00', N'25/12/2019', N'25/12/2019')
INSERT [dbo].[RecentSearches] ([ID], [UserID], [Manufacturer], [Model], [ManufactureYear], [Gear], [CarID], [DailyPrice], [LatePrice], [StartDate], [EndDate]) VALUES (12, 5013, N'Tesla', N'Track', N'2019', N'Automatic gear', N'666666666', N'$1,000.00', N'$1,250.00', N'24/12/2019', N'24/12/2019')
SET IDENTITY_INSERT [dbo].[RecentSearches] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (1, 8740466, 5019, CAST(N'2019-12-16' AS Date), CAST(N'2019-12-18' AS Date), CAST(N'2019-12-16' AS Date), 1)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (2, 6645635, 5012, CAST(N'2019-12-16' AS Date), CAST(N'2019-12-17' AS Date), CAST(N'2019-12-16' AS Date), 1)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (3, 23434345, 5019, CAST(N'2019-12-16' AS Date), CAST(N'2019-12-17' AS Date), NULL, 0)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (4, 654345543, 5012, CAST(N'2019-12-17' AS Date), CAST(N'2019-12-18' AS Date), NULL, 0)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (5, 65467546, 5014, CAST(N'2019-12-16' AS Date), CAST(N'2019-12-28' AS Date), NULL, 0)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (6, 5644586, 5014, CAST(N'2019-12-17' AS Date), CAST(N'2019-12-20' AS Date), NULL, 0)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (7, 123, 5011, CAST(N'2019-12-29' AS Date), CAST(N'2019-12-31' AS Date), NULL, 0)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (8, 12343654, 5011, CAST(N'2019-12-31' AS Date), CAST(N'2020-01-01' AS Date), NULL, 0)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (9, 65487654, 5013, CAST(N'2019-12-25' AS Date), CAST(N'2019-12-26' AS Date), NULL, 0)
INSERT [dbo].[Rentals] ([ID], [CarID], [UserID], [StartDate], [EndDate], [ActualReturnDate], [IsOrderClosed]) VALUES (10, 666666666, 5013, CAST(N'2019-12-24' AS Date), CAST(N'2019-12-28' AS Date), NULL, 0)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (4, N'Guest')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Manager')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Personal')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Nickname], [Password], [FirstName], [LastName], [IdentityNumber], [Email], [BirthDate], [Gender], [RegistrationDate], [Avatar]) VALUES (5011, N'per1', N'8D9798D59E8C0B06A9342258C2E7D5744230FB29', N'per1', N'per1', N'345432345', N'per1@per1.per', CAST(N'1941-01-01T00:00:00.000' AS DateTime), 0, CAST(N'2019-12-14T13:19:24.057' AS DateTime), N'/Content/images/avatars/female.jpg')
INSERT [dbo].[Users] ([ID], [Nickname], [Password], [FirstName], [LastName], [IdentityNumber], [Email], [BirthDate], [Gender], [RegistrationDate], [Avatar]) VALUES (5012, N'Admin', N'4E7AFEBCFBAE000B22C7C85E5560F89A2A0280B4', N'Admin', N'Admin', N'432345432', N'Admin@Admin.com', CAST(N'1941-07-22T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-14T13:28:07.217' AS DateTime), N'/Content/images/avatars/male.jpg')
INSERT [dbo].[Users] ([ID], [Nickname], [Password], [FirstName], [LastName], [IdentityNumber], [Email], [BirthDate], [Gender], [RegistrationDate], [Avatar]) VALUES (5013, N'per2', N'E570D0AAE91738B87E367811DB433223388D5AD5', N'per2', N'per2', N'456787654', N'per2@per2.per', CAST(N'1988-01-02T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-14T13:29:20.297' AS DateTime), N'/Content/images/avatars/male.jpg')
INSERT [dbo].[Users] ([ID], [Nickname], [Password], [FirstName], [LastName], [IdentityNumber], [Email], [BirthDate], [Gender], [RegistrationDate], [Avatar]) VALUES (5014, N'test1', N'B444AC06613FC8D63795BE9AD0BEAF55011936AC', N'test1', N'test1', N'345678987', N'test1@test1.com', CAST(N'1997-02-28T00:00:00.000' AS DateTime), 1, CAST(N'2019-12-14T13:30:26.073' AS DateTime), N'/Content/images/avatars/male.jpg')
INSERT [dbo].[Users] ([ID], [Nickname], [Password], [FirstName], [LastName], [IdentityNumber], [Email], [BirthDate], [Gender], [RegistrationDate], [Avatar]) VALUES (5019, N'test2', N'109F4B3C50D7B0DF729D299BC6F8E9EF9066971F', N'test2', N'test2', N'123123123', N'test2@test2.com', CAST(N'1985-01-01T00:00:00.000' AS DateTime), 0, CAST(N'2019-12-14T23:57:27.000' AS DateTime), N'/Content/images/avatars/female.jpg')
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (5011, 2)
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (5012, 1)
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (5013, 2)
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (5014, 3)
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (5019, 3)
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__8A2B61604131C4F5]    Script Date: 16/12/2019 16:24:08 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E408EA5793]    Script Date: 16/12/2019 16:24:08 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__536C85E408EA5793] UNIQUE NONCLUSTERED 
(
	[Nickname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FleetCars]  WITH CHECK ADD  CONSTRAINT [FK_FleetCars_CarTypes] FOREIGN KEY([CarTypeID])
REFERENCES [dbo].[CarTypes] ([ID])
GO
ALTER TABLE [dbo].[FleetCars] CHECK CONSTRAINT [FK_FleetCars_CarTypes]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_FleetCars] FOREIGN KEY([CarID])
REFERENCES [dbo].[FleetCars] ([CarID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_FleetCars]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Users]
GO
ALTER TABLE [dbo].[UserVsRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserVsRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserVsRoles] CHECK CONSTRAINT [FK_UserVsRoles_Roles]
GO
ALTER TABLE [dbo].[UserVsRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserVsRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserVsRoles] CHECK CONSTRAINT [FK_UserVsRoles_Users]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteUser] @userId int
	
AS
BEGIN	
	SET NOCOUNT ON;

BEGIN TRY

DELETE FROM [dbo].[UserVsRoles] 
	WHERE UserID = @userId;

	DELETE FROM [dbo].[Users] 
	WHERE ID = @userId; 

END TRY
BEGIN CATCH
Print ' Error Line #'+convert(varchar,ERROR_LINE())
          + ' of procedure '+isnull(ERROR_PROCEDURE(),'(Main)')
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAvailableCarsForRent]    Script Date: 16/12/2019 16:24:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllAvailableCarsForRent]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select car.ManualGear, car.ManufactureYear,car.Manufacturer,car.Model ,fleet.CarID 
	from dbo.CarTypes as car
	inner join dbo.FleetCars as fleet
	on car.ID = fleet.CarTypeID
	inner  join dbo.Rentals as rent
	on fleet.CarID = rent.CarID
	where (fleet.IsAvailableForRent = 1 and fleet.IsProperForRent = 1)
			and rent.IsOrderClosed = 1 and rent.ActualReturnDate < GETDATE()
		   
RETURN  
END
GO
USE [master]
GO
ALTER DATABASE [CarRental] SET  READ_WRITE 
GO
