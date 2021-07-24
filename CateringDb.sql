USE [master]
GO
/****** Object:  Database [CateringDb]    Script Date: 7/24/2021 10:06:30 PM ******/
CREATE DATABASE [CateringDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CateringDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\CateringDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CateringDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\CateringDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CateringDb] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [CateringDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CateringDb', N'ON'
GO
ALTER DATABASE [CateringDb] SET QUERY_STORE = OFF
GO
USE [CateringDb]
GO
/****** Object:  Table [dbo].[ChargeInfo]    Script Date: 7/24/2021 10:06:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 7/24/2021 10:06:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodInfo]    Script Date: 7/24/2021 10:06:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 7/24/2021 10:06:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/24/2021 10:06:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 7/24/2021 10:06:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RateId] [int] IDENTITY(1,1) NOT NULL,
	[RatedId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Rate] [int] NULL,
	[InTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 7/24/2021 10:06:31 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thana]    Script Date: 7/24/2021 10:06:31 PM ******/
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
USE [master]
GO
ALTER DATABASE [CateringDb] SET  READ_WRITE 
GO
