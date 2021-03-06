USE [master]
GO
/****** Object:  Database [CateringDb]    Script Date: 9/29/2021 12:09:02 PM ******/
CREATE DATABASE [CateringDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CateringDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\CateringDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CateringDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\CateringDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CateringDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CateringDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CateringDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CateringDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CateringDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CateringDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CateringDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CateringDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CateringDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CateringDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CateringDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CateringDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CateringDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CateringDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CateringDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CateringDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CateringDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CateringDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CateringDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CateringDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CateringDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CateringDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CateringDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CateringDb] SET RECOVERY FULL 
GO
ALTER DATABASE [CateringDb] SET  MULTI_USER 
GO
ALTER DATABASE [CateringDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CateringDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CateringDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CateringDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CateringDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CateringDb', N'ON'
GO
USE [CateringDb]
GO
/****** Object:  Table [dbo].[ChargeInfo]    Script Date: 9/29/2021 12:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChargeInfo](
	[ChargeId] [int] IDENTITY(1,1) NOT NULL,
	[CateId] [int] NULL,
	[Month] [nvarchar](50) NULL,
	[BkashNo] [nvarchar](50) NULL,
	[TransactionNo] [nvarchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Status] [nvarchar](50) NULL,
	[PaymentTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChargeInfo] PRIMARY KEY CLUSTERED 
(
	[ChargeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 9/29/2021 12:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[Id] [int] NOT NULL,
	[DivisionId] [int] NOT NULL,
	[District] [varchar](30) NOT NULL,
	[lat] [nvarchar](50) NULL,
	[lon] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodInfo]    Script Date: 9/29/2021 12:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodInfo](
	[FoodId] [int] IDENTITY(1,1) NOT NULL,
	[FoodName] [nvarchar](50) NOT NULL,
	[Quantity] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](max) NULL,
	[InTime] [nvarchar](50) NULL,
	[CateId] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_FoodInfo] PRIMARY KEY CLUSTERED 
(
	[FoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 9/29/2021 12:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderInvoice] [nvarchar](50) NULL,
	[CustId] [int] NULL,
	[CateId] [int] NULL,
	[FoodId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[DeliveryLocation] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[Ordertime] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderList] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 9/29/2021 12:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PayId] [int] IDENTITY(1,1) NOT NULL,
	[OrderInvoice] [nvarchar](50) NULL,
	[BkashNo] [nvarchar](50) NULL,
	[TransNo] [nvarchar](50) NULL,
	[PayTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 9/29/2021 12:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[RatedId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Rate] [int] NULL,
	[Review] [nvarchar](max) NULL,
	[InTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 9/29/2021 12:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[RegId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Dob] [nvarchar](50) NULL,
	[District] [int] NULL,
	[Thana] [int] NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[BkashNo] [nvarchar](50) NULL,
	[TransNo] [nvarchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[Intime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[RegId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thana]    Script Date: 9/29/2021 12:09:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thana](
	[Id] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Thana] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChargeInfo] ON 

INSERT [dbo].[ChargeInfo] ([ChargeId], [CateId], [Month], [BkashNo], [TransactionNo], [Amount], [Status], [PaymentTime]) VALUES (1, 7, N'2021-07', N'685506', N'fd82hjhasye', CAST(11.00 AS Decimal(18, 2)), N'A', N'24/07/2021_08:05:07')
SET IDENTITY_INSERT [dbo].[ChargeInfo] OFF
GO
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (1, 3, N'Dhaka', N'23.7115253', N'90.4111451')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (2, 3, N'Faridpur', N'23.6070822', N'89.8429406')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (3, 3, N'Gazipur', N'24.0022858', N'90.4264283')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (4, 3, N'Gopalganj', N'23.0050857', N'89.8266059')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (5, 8, N'Jamalpur', N'24.9375330', N'89.9377750')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (6, 3, N'Kishoreganj', N'24.4449370', N'90.7765750')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (7, 3, N'Madaripur', N'23.1641020', N'90.1896805')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (8, 3, N'Manikganj', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (9, 3, N'Munshiganj', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (10, 8, N'Mymensingh', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (11, 3, N'Narayanganj', N'23.6336600', N'90.4964820')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (12, 3, N'Narsingdi', N'23.9322330', N'90.7154100')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (13, 8, N'Netrokona', N'24.8709550', N'90.7278870')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (14, 3, N'Rajbari', N'23.7574305', N'89.6444665')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (15, 3, N'Shariatpur', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (16, 8, N'Sherpur', N'25.0204933', N'90.0152966')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (17, 3, N'Tangail', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (18, 5, N'Bogra', N'24.8465228', N'89.3777550')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (19, 5, N'Joypurhat', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (20, 5, N'Naogaon', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (21, 5, N'Natore', N'24.4205560', N'89.0002820')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (22, 5, N'Nawabganj', N'24.5965034', N'88.2775122')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (23, 5, N'Pabna', N'23.9985240', N'89.2336450')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (24, 5, N'Rajshahi', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (25, 5, N'Sirajgonj', N'24.4533978', N'89.7006815')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (26, 6, N'Dinajpur', N'25.6217061', N'88.6354504')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (27, 6, N'Gaibandha', N'25.3287510', N'89.5280880')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (28, 6, N'Kurigram', N'25.8054450', N'89.6361740')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (29, 6, N'Lalmonirhat', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (30, 6, N'Nilphamari', N'25.9317940', N'88.8560060')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (31, 6, N'Panchagarh', N'26.3411000', N'88.5541606')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (32, 6, N'Rangpur', N'25.7558096', N'89.2444620')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (33, 6, N'Thakurgaon', N'26.0336945', N'88.4616834')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (34, 1, N'Barguna', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (35, 1, N'Barisal', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (36, 1, N'Bhola', N'22.6859230', N'90.6481790')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (37, 1, N'Jhalokati', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (38, 1, N'Patuakhali', N'22.3596316', N'90.3298712')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (39, 1, N'Pirojpur', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (40, 2, N'Bandarban', N'22.1953275', N'92.2183773')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (41, 2, N'Brahmanbaria', N'23.9570904', N'91.1119286')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (42, 2, N'Chandpur', N'23.2332585', N'90.6712912')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (43, 2, N'Chittagong', N'22.3351090', N'91.8340730')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (44, 2, N'Comilla', N'23.4682747', N'91.1788135')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (45, 2, N'Cox''s Bazar', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (46, 2, N'Feni', N'23.0232310', N'91.3840844')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (47, 2, N'Khagrachari', N'23.1192850', N'91.9846630')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (48, 2, N'Lakshmipur', N'22.9424770', N'90.8411840')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (49, 2, N'Noakhali', N'22.8695630', N'91.0993980')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (50, 2, N'Rangamati', N'0.0000000', N'0.0000000')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (51, 7, N'Habiganj', N'24.3749450', N'91.4155300')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (52, 7, N'Maulvibazar', N'24.4829340', N'91.7774170')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (53, 7, N'Sunamganj', N'25.0658042', N'91.3950115')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (54, 7, N'Sylhet', N'24.8897956', N'91.8697894')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (55, 4, N'Bagerhat', N'22.6515680', N'89.7859380')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (56, 4, N'Chuadanga', N'23.6401961', N'88.8418410')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (57, 4, N'Jessore', N'23.1664300', N'89.2081126')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (58, 4, N'Jhenaidah', N'23.5448176', N'89.1539213')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (59, 4, N'Khulna', N'22.8157740', N'89.5686790')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (60, 4, N'Kushtia', N'23.9012580', N'89.1204820')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (61, 4, N'Magura', N'23.4873370', N'89.4199560')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (62, 4, N'Meherpur', N'23.7622130', N'88.6318210')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (63, 4, N'Narail', N'23.1725340', N'89.5126720')
INSERT [dbo].[District] ([Id], [DivisionId], [District], [lat], [lon]) VALUES (64, 4, N'Satkhira', N'0.0000000', N'0.0000000')
GO
SET IDENTITY_INSERT [dbo].[FoodInfo] ON 

INSERT [dbo].[FoodInfo] ([FoodId], [FoodName], [Quantity], [Price], [Type], [Picture], [InTime], [CateId], [Status]) VALUES (3, N'Fried Rice', N'1:2', CAST(190.00 AS Decimal(18, 2)), N'Rice', N'/photos/fried rice.jpg967502.png', N'10/07/2021_10:14:04', 7, N'A')
INSERT [dbo].[FoodInfo] ([FoodId], [FoodName], [Quantity], [Price], [Type], [Picture], [InTime], [CateId], [Status]) VALUES (9, N'Pink Sauce Pasta', N'1:2', CAST(180.00 AS Decimal(18, 2)), N'Snacks', N'/photos/461071pasta.jpg.png', N'18/07/2021_09:33:01', 7, N'A')
INSERT [dbo].[FoodInfo] ([FoodId], [FoodName], [Quantity], [Price], [Type], [Picture], [InTime], [CateId], [Status]) VALUES (10, N'Special Meal 1', N'1:1', CAST(220.00 AS Decimal(18, 2)), N'Special Item', N'/photos/929131set meal.jpg.png', N'18/07/2021_09:39:11', 7, N'A')
INSERT [dbo].[FoodInfo] ([FoodId], [FoodName], [Quantity], [Price], [Type], [Picture], [InTime], [CateId], [Status]) VALUES (11, N'Pudding', N'1:1', CAST(15.00 AS Decimal(18, 2)), N'Snacks', N'/photos/860072pudding.jpg.png', N'18/07/2021_09:42:41', 1008, N'A')
INSERT [dbo].[FoodInfo] ([FoodId], [FoodName], [Quantity], [Price], [Type], [Picture], [InTime], [CateId], [Status]) VALUES (12, N'Beaf Burger', N'1:1', CAST(80.00 AS Decimal(18, 2)), N'Snacks', N'/photos/642486burger.jpg.png', N'18/07/2021_09:43:23', 1008, N'A')
INSERT [dbo].[FoodInfo] ([FoodId], [FoodName], [Quantity], [Price], [Type], [Picture], [InTime], [CateId], [Status]) VALUES (13, N'Chicken Fry', N'1:6', CAST(230.00 AS Decimal(18, 2)), N'Snacks', N'/photos/957871chicken fry.jpg.png', N'18/07/2021_09:43:51', 1008, N'A')
SET IDENTITY_INSERT [dbo].[FoodInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderList] ON 

INSERT [dbo].[OrderList] ([OrderId], [OrderInvoice], [CustId], [CateId], [FoodId], [Quantity], [Price], [Total], [DeliveryLocation], [Status], [Ordertime]) VALUES (4, N'202107231001', 6, 7, 10, 1, CAST(220.00 AS Decimal(18, 2)), CAST(220.00 AS Decimal(18, 2)), N'Lalkhanbazar, Chittagong', N'C', N'23/07/2021_08:50:34')
SET IDENTITY_INSERT [dbo].[OrderList] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PayId], [OrderInvoice], [BkashNo], [TransNo], [PayTime]) VALUES (4, N'202107231001', N'685506', N'ds82sddsd2', N'23/07/2021_09:35:45')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RateId], [RatedId], [UserId], [Rate], [Review], [InTime]) VALUES (1, 7, 6, 3, N'Great pasta I ever have.', N'23/07/2021_11:08:57')
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[Register] ON 

INSERT [dbo].[Register] ([RegId], [Name], [Email], [MobileNo], [Type], [Gender], [Dob], [District], [Thana], [Password], [Picture], [Status], [BkashNo], [TransNo], [Amount], [Intime]) VALUES (6, N'Trisha Dutta', N'moderatetech17@gmail.com', N'01900112232', N'Cust', N'Female', N'2021-07-06', 0, 0, N'123', N'/photos/2248572cloudy.png.png', N'A', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'06/07/2021_09:43:36')
INSERT [dbo].[Register] ([RegId], [Name], [Email], [MobileNo], [Type], [Gender], [Dob], [District], [Thana], [Password], [Picture], [Status], [BkashNo], [TransNo], [Amount], [Intime]) VALUES (7, N'Delicious Catering Service', N'foodservice710@gmail.com', N'01821981233', N'Cate', N'--Select--', N'', 43, 560, N'123', N'/photos/9247931logo.png.png', N'A', N'685506', N'sfrwdzsew34w', CAST(200.00 AS Decimal(18, 2)), N'06/07/2021_09:44:55')
INSERT [dbo].[Register] ([RegId], [Name], [Email], [MobileNo], [Type], [Gender], [Dob], [District], [Thana], [Password], [Picture], [Status], [BkashNo], [TransNo], [Amount], [Intime]) VALUES (8, N'Mr. Admin', N'admin@gmail.com', N'01800112234', N'Admin', N'Male', N'1996-08-02', 0, 0, N'1', N'/photos/2248572cloudy.png.png', N'A', N'', N'', CAST(0.00 AS Decimal(18, 2)), N'06/07/2021_09:44:55')
INSERT [dbo].[Register] ([RegId], [Name], [Email], [MobileNo], [Type], [Gender], [Dob], [District], [Thana], [Password], [Picture], [Status], [BkashNo], [TransNo], [Amount], [Intime]) VALUES (1008, N'Home Food Fusion', N'shfkte@gmail.com', N'01909212341', N'Cate', N'', N'', 43, 569, N'123', N'/photos/6003182logo (2).png.png', N'A', N'987822', N'sa93238s81a', CAST(200.00 AS Decimal(18, 2)), N'18/07/2021_09:27:07')
SET IDENTITY_INSERT [dbo].[Register] OFF
GO
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (1, 34, N'Amtali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (2, 34, N'Bamna ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (3, 34, N'Barguna Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (4, 34, N'Betagi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (5, 34, N'Patharghata ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (6, 34, N'Taltali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (7, 35, N'Muladi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (8, 35, N'Babuganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (9, 35, N'Agailjhara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (10, 35, N'Barisal Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (11, 35, N'Bakerganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (12, 35, N'Banaripara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (13, 35, N'Gaurnadi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (14, 35, N'Hizla ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (15, 35, N'Mehendiganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (16, 35, N'Wazirpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (17, 36, N'Bhola Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (18, 36, N'Burhanuddin ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (19, 36, N'Char Fasson ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (20, 36, N'Daulatkhan ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (21, 36, N'Lalmohan ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (22, 36, N'Manpura ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (23, 36, N'Tazumuddin ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (24, 37, N'Jhalokati Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (25, 37, N'Kathalia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (26, 37, N'Nalchity ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (27, 37, N'Rajapur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (28, 38, N'Bauphal ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (29, 38, N'Dashmina ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (30, 38, N'Galachipa ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (31, 38, N'Kalapara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (32, 38, N'Mirzaganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (33, 38, N'Patuakhali Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (34, 38, N'Dumki ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (35, 38, N'Rangabali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (36, 39, N'Bhandaria')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (37, 39, N'Kaukhali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (38, 39, N'Mathbaria')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (39, 39, N'Nazirpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (40, 39, N'Nesarabad')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (41, 39, N'Pirojpur Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (42, 39, N'Zianagar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (43, 40, N'Bandarban Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (44, 40, N'Thanchi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (45, 40, N'Lama')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (46, 40, N'Naikhongchhari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (47, 40, N'Ali kadam')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (48, 40, N'Rowangchhari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (49, 40, N'Ruma')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (50, 41, N'Brahmanbaria Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (51, 41, N'Ashuganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (52, 41, N'Nasirnagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (53, 41, N'Nabinagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (54, 41, N'Sarail ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (55, 41, N'Shahbazpur Town')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (56, 41, N'Kasba ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (57, 41, N'Akhaura ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (58, 41, N'Bancharampur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (59, 41, N'Bijoynagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (60, 42, N'Chandpur Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (61, 42, N'Faridganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (62, 42, N'Haimchar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (63, 42, N'Haziganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (64, 42, N'Kachua')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (65, 42, N'Matlab Uttar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (66, 42, N'Matlab Dakkhin')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (67, 42, N'Shahrasti')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (68, 43, N'Anwara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (69, 43, N'Banshkhali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (70, 43, N'Boalkhali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (71, 43, N'Chandanaish ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (72, 43, N'Fatikchhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (73, 43, N'Hathazari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (74, 43, N'Lohagara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (75, 43, N'Mirsharai ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (76, 43, N'Patiya ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (77, 43, N'Rangunia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (78, 43, N'Raozan ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (79, 43, N'Sandwip ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (80, 43, N'Satkania ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (81, 43, N'Sitakunda ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (82, 44, N'Barura ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (83, 44, N'Brahmanpara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (84, 44, N'Burichong ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (85, 44, N'Chandina ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (86, 44, N'Chauddagram ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (87, 44, N'Daudkandi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (88, 44, N'Debidwar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (89, 44, N'Homna ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (90, 44, N'Comilla Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (91, 44, N'Laksam ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (92, 44, N'Monohorgonj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (93, 44, N'Meghna ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (94, 44, N'Muradnagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (95, 44, N'Nangalkot ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (96, 44, N'Comilla Sadar South ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (97, 44, N'Titas ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (98, 45, N'Chakaria ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (99, 45, N'Chakaria ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (100, 45, N'Cox''s Bazar Sadar ')
GO
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (101, 45, N'Kutubdia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (102, 45, N'Maheshkhali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (103, 45, N'Ramu ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (104, 45, N'Teknaf ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (105, 45, N'Ukhia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (106, 45, N'Pekua ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (107, 46, N'Feni Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (108, 46, N'Chagalnaiya')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (109, 46, N'Daganbhyan')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (110, 46, N'Parshuram')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (111, 46, N'Fhulgazi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (112, 46, N'Sonagazi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (113, 47, N'Dighinala ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (114, 47, N'Khagrachhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (115, 47, N'Lakshmichhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (116, 47, N'Mahalchhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (117, 47, N'Manikchhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (118, 47, N'Matiranga ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (119, 47, N'Panchhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (120, 47, N'Ramgarh ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (121, 48, N'Lakshmipur Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (122, 48, N'Raipur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (123, 48, N'Ramganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (124, 48, N'Ramgati ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (125, 48, N'Komol Nagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (126, 49, N'Noakhali Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (127, 49, N'Begumganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (128, 49, N'Chatkhil ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (129, 49, N'Companyganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (130, 49, N'Shenbag ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (131, 49, N'Hatia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (132, 49, N'Kobirhat ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (133, 49, N'Sonaimuri ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (134, 49, N'Suborno Char ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (135, 50, N'Rangamati Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (136, 50, N'Belaichhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (137, 50, N'Bagaichhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (138, 50, N'Barkal ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (139, 50, N'Juraichhari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (140, 50, N'Rajasthali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (141, 50, N'Kaptai ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (142, 50, N'Langadu ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (143, 50, N'Nannerchar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (144, 50, N'Kaukhali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (150, 2, N'Faridpur Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (151, 2, N'Boalmari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (152, 2, N'Alfadanga ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (153, 2, N'Madhukhali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (154, 2, N'Bhanga ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (155, 2, N'Nagarkanda ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (156, 2, N'Charbhadrasan ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (157, 2, N'Sadarpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (158, 2, N'Shaltha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (159, 3, N'Gazipur Sadar-Joydebpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (160, 3, N'Kaliakior')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (161, 3, N'Kapasia')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (162, 3, N'Sripur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (163, 3, N'Kaliganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (164, 3, N'Tongi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (165, 4, N'Gopalganj Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (166, 4, N'Kashiani ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (167, 4, N'Kotalipara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (168, 4, N'Muksudpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (169, 4, N'Tungipara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (170, 5, N'Dewanganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (171, 5, N'Baksiganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (172, 5, N'Islampur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (173, 5, N'Jamalpur Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (174, 5, N'Madarganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (175, 5, N'Melandaha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (176, 5, N'Sarishabari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (177, 5, N'Narundi Police I.C')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (178, 6, N'Astagram ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (179, 6, N'Bajitpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (180, 6, N'Bhairab ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (181, 6, N'Hossainpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (182, 6, N'Itna ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (183, 6, N'Karimganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (184, 6, N'Katiadi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (185, 6, N'Kishoreganj Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (186, 6, N'Kuliarchar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (187, 6, N'Mithamain ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (188, 6, N'Nikli ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (189, 6, N'Pakundia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (190, 6, N'Tarail ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (191, 7, N'Madaripur Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (192, 7, N'Kalkini')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (193, 7, N'Rajoir')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (194, 7, N'Shibchar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (195, 8, N'Manikganj Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (196, 8, N'Singair ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (197, 8, N'Shibalaya ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (198, 8, N'Saturia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (199, 8, N'Harirampur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (200, 8, N'Ghior ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (201, 8, N'Daulatpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (202, 9, N'Lohajang ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (203, 9, N'Sreenagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (204, 9, N'Munshiganj Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (205, 9, N'Sirajdikhan ')
GO
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (206, 9, N'Tongibari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (207, 9, N'Gazaria ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (208, 10, N'Bhaluka')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (209, 10, N'Trishal')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (210, 10, N'Haluaghat')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (211, 10, N'Muktagachha')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (212, 10, N'Dhobaura')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (213, 10, N'Fulbaria')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (214, 10, N'Gaffargaon')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (215, 10, N'Gauripur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (216, 10, N'Ishwarganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (217, 10, N'Mymensingh Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (218, 10, N'Nandail')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (219, 10, N'Phulpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (220, 11, N'Araihazar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (221, 11, N'Sonargaon ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (222, 11, N'Bandar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (223, 11, N'Naryanganj Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (224, 11, N'Rupganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (225, 11, N'Siddirgonj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (226, 12, N'Belabo ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (227, 12, N'Monohardi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (228, 12, N'Narsingdi Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (229, 12, N'Palash ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (230, 12, N'Raipura , Narsingdi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (231, 12, N'Shibpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (232, 13, N'Kendua Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (233, 13, N'Atpara Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (234, 13, N'Barhatta Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (235, 13, N'Durgapur Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (236, 13, N'Kalmakanda Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (237, 13, N'Madan Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (238, 13, N'Mohanganj Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (239, 13, N'Netrakona-S Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (240, 13, N'Purbadhala Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (241, 13, N'Khaliajuri Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (242, 14, N'Baliakandi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (243, 14, N'Goalandaghat ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (244, 14, N'Pangsha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (245, 14, N'Kalukhali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (246, 14, N'Rajbari Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (247, 15, N'Shariatpur Sadar -Palong')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (248, 15, N'Damudya ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (249, 15, N'Naria ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (250, 15, N'Jajira ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (251, 15, N'Bhedarganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (252, 15, N'Gosairhat ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (253, 16, N'Jhenaigati ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (254, 16, N'Nakla ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (255, 16, N'Nalitabari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (256, 16, N'Sherpur Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (257, 16, N'Sreebardi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (258, 17, N'Tangail Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (259, 17, N'Sakhipur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (260, 17, N'Basail ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (261, 17, N'Madhupur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (262, 17, N'Ghatail ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (263, 17, N'Kalihati ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (264, 17, N'Nagarpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (265, 17, N'Mirzapur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (266, 17, N'Gopalpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (267, 17, N'Delduar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (268, 17, N'Bhuapur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (269, 17, N'Dhanbari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (270, 55, N'Bagerhat Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (271, 55, N'Chitalmari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (272, 55, N'Fakirhat ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (273, 55, N'Kachua ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (274, 55, N'Mollahat ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (275, 55, N'Mongla ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (276, 55, N'Morrelganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (277, 55, N'Rampal ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (278, 55, N'Sarankhola ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (279, 56, N'Damurhuda ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (280, 56, N'Chuadanga-S ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (281, 56, N'Jibannagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (282, 56, N'Alamdanga ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (283, 57, N'Abhaynagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (284, 57, N'Keshabpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (285, 57, N'Bagherpara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (286, 57, N'Jessore Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (287, 57, N'Chaugachha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (288, 57, N'Manirampur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (289, 57, N'Jhikargachha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (290, 57, N'Sharsha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (291, 58, N'Jhenaidah Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (292, 58, N'Maheshpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (293, 58, N'Kaliganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (294, 58, N'Kotchandpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (295, 58, N'Shailkupa ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (296, 58, N'Harinakunda ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (297, 59, N'Terokhada ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (298, 59, N'Batiaghata ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (299, 59, N'Dacope ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (300, 59, N'Dumuria ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (301, 59, N'Dighalia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (302, 59, N'Koyra ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (303, 59, N'Paikgachha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (304, 59, N'Phultala ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (305, 59, N'Rupsa ')
GO
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (306, 60, N'Kushtia Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (307, 60, N'Kumarkhali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (308, 60, N'Daulatpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (309, 60, N'Mirpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (310, 60, N'Bheramara')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (311, 60, N'Khoksa')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (312, 61, N'Magura Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (313, 61, N'Mohammadpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (314, 61, N'Shalikha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (315, 61, N'Sreepur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (316, 62, N'angni ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (317, 62, N'Mujib Nagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (318, 62, N'Meherpur-S ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (319, 63, N'Narail-S Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (320, 63, N'Lohagara Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (321, 63, N'Kalia Upazilla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (322, 64, N'Satkhira Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (323, 64, N'Assasuni ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (324, 64, N'Debhata ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (325, 64, N'Tala ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (326, 64, N'Kalaroa ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (327, 64, N'Kaliganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (328, 64, N'Shyamnagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (329, 18, N'Adamdighi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (330, 18, N'Bogra Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (331, 18, N'Sherpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (332, 18, N'Dhunat')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (333, 18, N'Dhupchanchia')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (334, 18, N'Gabtali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (335, 18, N'Kahaloo')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (336, 18, N'Nandigram')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (337, 18, N'Sahajanpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (338, 18, N'Sariakandi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (339, 18, N'Shibganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (340, 18, N'Sonatala')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (341, 19, N'Joypurhat S')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (342, 19, N'Akkelpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (343, 19, N'Kalai')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (344, 19, N'Khetlal')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (345, 19, N'Panchbibi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (346, 20, N'Naogaon Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (347, 20, N'Mohadevpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (348, 20, N'Manda ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (349, 20, N'Niamatpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (350, 20, N'Atrai ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (351, 20, N'Raninagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (352, 20, N'Patnitala ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (353, 20, N'Dhamoirhat ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (354, 20, N'Sapahar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (355, 20, N'Porsha ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (356, 20, N'Badalgachhi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (357, 21, N'Natore Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (358, 21, N'Baraigram ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (359, 21, N'Bagatipara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (360, 21, N'Lalpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (361, 21, N'Natore Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (362, 21, N'Baraigram ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (363, 22, N'Bholahat ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (364, 22, N'Gomastapur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (365, 22, N'Nachole ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (366, 22, N'Nawabganj Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (367, 22, N'Shibganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (368, 23, N'Atgharia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (369, 23, N'Bera ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (370, 23, N'Bhangura ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (371, 23, N'Chatmohar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (372, 23, N'Faridpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (373, 23, N'Ishwardi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (374, 23, N'Pabna Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (375, 23, N'Santhia ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (376, 23, N'Sujanagar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (377, 24, N'Bagha')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (378, 24, N'Bagmara')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (379, 24, N'Charghat')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (380, 24, N'Durgapur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (381, 24, N'Godagari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (382, 24, N'Mohanpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (383, 24, N'Paba')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (384, 24, N'Puthia')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (385, 24, N'Tanore')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (386, 25, N'Sirajganj Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (387, 25, N'Belkuchi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (388, 25, N'Chauhali ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (389, 25, N'Kamarkhanda ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (390, 25, N'Kazipur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (391, 25, N'Raiganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (392, 25, N'Shahjadpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (393, 25, N'Tarash ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (394, 25, N'Ullahpara ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (395, 26, N'Birampur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (396, 26, N'Birganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (397, 26, N'Biral ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (398, 26, N'Bochaganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (399, 26, N'Chirirbandar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (400, 26, N'Phulbari ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (401, 26, N'Ghoraghat ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (402, 26, N'Hakimpur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (403, 26, N'Kaharole ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (404, 26, N'Khansama ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (405, 26, N'Dinajpur Sadar ')
GO
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (406, 26, N'Nawabganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (407, 26, N'Parbatipur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (408, 27, N'Fulchhari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (409, 27, N'Gaibandha sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (410, 27, N'Gobindaganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (411, 27, N'Palashbari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (412, 27, N'Sadullapur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (413, 27, N'Saghata')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (414, 27, N'Sundarganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (415, 28, N'Kurigram Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (416, 28, N'Nageshwari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (417, 28, N'Bhurungamari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (418, 28, N'Phulbari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (419, 28, N'Rajarhat')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (420, 28, N'Ulipur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (421, 28, N'Chilmari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (422, 28, N'Rowmari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (423, 28, N'Char Rajibpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (424, 29, N'Lalmanirhat Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (425, 29, N'Aditmari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (426, 29, N'Kaliganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (427, 29, N'Hatibandha')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (428, 29, N'Patgram')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (429, 30, N'Nilphamari Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (430, 30, N'Saidpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (431, 30, N'Jaldhaka')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (432, 30, N'Kishoreganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (433, 30, N'Domar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (434, 30, N'Dimla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (435, 31, N'Panchagarh Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (436, 31, N'Debiganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (437, 31, N'Boda')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (438, 31, N'Atwari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (439, 31, N'Tetulia')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (440, 32, N'Badarganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (441, 32, N'Mithapukur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (442, 32, N'Gangachara')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (443, 32, N'Kaunia')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (444, 32, N'Rangpur Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (445, 32, N'Pirgachha')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (446, 32, N'Pirganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (447, 32, N'Taraganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (448, 33, N'Thakurgaon Sadar ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (449, 33, N'Pirganj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (450, 33, N'Baliadangi ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (451, 33, N'Haripur ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (452, 33, N'Ranisankail ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (453, 51, N'Ajmiriganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (454, 51, N'Baniachang')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (455, 51, N'Bahubal')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (456, 51, N'Chunarughat')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (457, 51, N'Habiganj Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (458, 51, N'Lakhai')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (459, 51, N'Madhabpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (460, 51, N'Nabiganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (461, 51, N'Shaistagonj ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (462, 52, N'Moulvibazar Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (463, 52, N'Barlekha')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (464, 52, N'Juri')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (465, 52, N'Kamalganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (466, 52, N'Kulaura')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (467, 52, N'Rajnagar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (468, 52, N'Sreemangal')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (469, 53, N'Bishwamvarpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (470, 53, N'Chhatak')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (471, 53, N'Derai')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (472, 53, N'Dharampasha')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (473, 53, N'Dowarabazar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (474, 53, N'Jagannathpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (475, 53, N'Jamalganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (476, 53, N'Sulla')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (477, 53, N'Sunamganj Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (478, 53, N'Shanthiganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (479, 53, N'Tahirpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (480, 54, N'Sylhet Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (481, 54, N'Beanibazar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (482, 54, N'Bishwanath')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (483, 54, N'Dakshin Surma ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (484, 54, N'Balaganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (485, 54, N'Companiganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (486, 54, N'Fenchuganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (487, 54, N'Golapganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (488, 54, N'Gowainghat')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (489, 54, N'Jaintiapur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (490, 54, N'Kanaighat')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (491, 54, N'Zakiganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (492, 54, N'Nobigonj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (493, 1, N'Adabor')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (494, 1, N'Airport')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (495, 1, N'Badda')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (496, 1, N'Banani')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (497, 1, N'Bangshal')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (498, 1, N'Bhashantek')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (499, 1, N'Cantonment')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (500, 1, N'Chackbazar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (501, 1, N'Darussalam')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (502, 1, N'Daskhinkhan')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (503, 1, N'Demra')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (504, 1, N'Dhamrai')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (505, 1, N'Dhanmondi')
GO
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (506, 1, N'Dohar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (507, 1, N'Gandaria')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (508, 1, N'Gulshan')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (509, 1, N'Hazaribag')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (510, 1, N'Jatrabari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (511, 1, N'Kafrul')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (512, 1, N'Kalabagan')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (513, 1, N'Kamrangirchar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (514, 1, N'Keraniganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (515, 1, N'Khilgaon')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (516, 1, N'Khilkhet')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (517, 1, N'Kotwali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (518, 1, N'Lalbag')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (519, 1, N'Mirpur Model')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (520, 1, N'Mohammadpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (521, 1, N'Motijheel')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (522, 1, N'Mugda')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (523, 1, N'Nawabganj')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (524, 1, N'New Market')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (525, 1, N'Pallabi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (526, 1, N'Paltan')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (527, 1, N'Ramna')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (528, 1, N'Rampura')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (529, 1, N'Rupnagar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (530, 1, N'Sabujbag')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (531, 1, N'Savar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (532, 1, N'Shah Ali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (533, 1, N'Shahbag')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (534, 1, N'Shahjahanpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (535, 1, N'Sherebanglanagar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (536, 1, N'Shyampur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (537, 1, N'Sutrapur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (538, 1, N'Tejgaon')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (539, 1, N'Tejgaon I/A')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (540, 1, N'Turag')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (541, 1, N'Uttara')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (542, 1, N'Uttara West')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (543, 1, N'Uttarkhan')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (544, 1, N'Vatara')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (545, 1, N'Wari')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (546, 1, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (547, 35, N'Airport')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (548, 35, N'Kawnia')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (549, 35, N'Bondor')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (550, 35, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (551, 24, N'Boalia')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (552, 24, N'Motihar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (553, 24, N'Shahmokhdum')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (554, 24, N'Rajpara')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (555, 24, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (556, 43, N'Akborsha')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (557, 43, N'Baijid bostami')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (558, 43, N'Bakolia')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (559, 43, N'Bandar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (560, 43, N'Chandgaon')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (561, 43, N'Chokbazar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (562, 43, N'Doublemooring')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (563, 43, N'EPZ')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (564, 43, N'Hali Shohor')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (565, 43, N'Kornafuli')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (566, 43, N'Kotwali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (567, 43, N'Kulshi')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (568, 43, N'Pahartali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (569, 43, N'Panchlaish')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (570, 43, N'Potenga')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (571, 43, N'Shodhorgat')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (572, 43, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (573, 44, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (574, 59, N'Aranghata')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (575, 59, N'Daulatpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (576, 59, N'Harintana')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (577, 59, N'Horintana')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (578, 59, N'Khalishpur')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (579, 59, N'Khanjahan Ali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (580, 59, N'Khulna Sadar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (581, 59, N'Labanchora')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (582, 59, N'Sonadanga')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (583, 59, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (584, 2, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (585, 4, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (586, 5, N'Others')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (587, 54, N'Airport')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (588, 54, N'Hazrat Shah Paran')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (589, 54, N'Jalalabad')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (590, 54, N'Kowtali')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (591, 54, N'Moglabazar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (592, 54, N'Osmani Nagar')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (593, 54, N'South Surma')
INSERT [dbo].[Thana] ([Id], [DistrictId], [Thana]) VALUES (594, 54, N'Others')
GO
USE [master]
GO
ALTER DATABASE [CateringDb] SET  READ_WRITE 
GO
