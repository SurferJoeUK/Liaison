USE [master]
GO
/****** Object:  Database [Liaison]    Script Date: 21/06/2018 19:51:18 ******/
CREATE DATABASE [Liaison]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Liaison', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Liaison.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Liaison_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Liaison_log.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Liaison] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Liaison].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Liaison] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Liaison] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Liaison] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Liaison] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Liaison] SET ARITHABORT OFF 
GO
ALTER DATABASE [Liaison] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Liaison] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Liaison] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Liaison] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Liaison] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Liaison] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Liaison] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Liaison] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Liaison] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Liaison] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Liaison] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Liaison] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Liaison] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Liaison] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Liaison] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Liaison] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Liaison] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Liaison] SET RECOVERY FULL 
GO
ALTER DATABASE [Liaison] SET  MULTI_USER 
GO
ALTER DATABASE [Liaison] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Liaison] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Liaison] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Liaison] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Liaison] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Liaison', N'ON'
GO
USE [Liaison]
GO
/****** Object:  Table [dbo].[AdminCorps]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminCorps](
	[AdminCorpsId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[ParentUnitId] [int] NULL,
	[Lookup] [nvarchar](5) NULL,
	[ParentAdminCorpsId] [int] NULL,
 CONSTRAINT [PK_AdminCorps] PRIMARY KEY CLUSTERED 
(
	[AdminCorpsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Aircraft]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircraft](
	[AircraftId] [int] NULL,
	[AircraftGuid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Aircraft_AircraftId]  DEFAULT (newid()),
	[Name] [nvarchar](50) NOT NULL,
	[Mark] [nvarchar](50) NOT NULL,
	[Sort] [nvarchar](50) NULL,
	[AltCode] [nvarchar](50) NULL,
	[AltName] [nvarchar](50) NULL,
	[AltSort] [nvarchar](50) NULL,
 CONSTRAINT [PK_Aircraft] PRIMARY KEY CLUSTERED 
(
	[AircraftGuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Base]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Base](
	[BaseId] [int] IDENTITY(1,1) NOT NULL,
	[SortName] [nvarchar](255) NOT NULL,
	[Prefix] [nvarchar](50) NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Suffix] [nvarchar](50) NULL,
	[CommissionedName] [nvarchar](255) NULL,
	[AltName] [nvarchar](255) NULL,
	[IATACode] [nvarchar](3) NULL,
	[ICAOCode] [nvarchar](4) NULL,
	[FAACode] [nvarchar](3) NULL,
	[AFDCode] [nvarchar](4) NULL,
	[ParentBaseId] [int] NULL,
 CONSTRAINT [PK_Base] PRIMARY KEY CLUSTERED 
(
	[BaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipmentOwner]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentOwner](
	[EquipmentOwnerId] [int] IDENTITY(1,1) NOT NULL,
	[UnitId] [int] NOT NULL,
	[Quantity] [decimal](5, 1) NULL,
	[Notes] [nvarchar](max) NULL,
	[AircraftId] [uniqueidentifier] NULL,
	[IsOwner] [bit] NULL,
 CONSTRAINT [PK_EquipmentOwner] PRIMARY KEY CLUSTERED 
(
	[EquipmentOwnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mission]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mission](
	[MissionId] [int] IDENTITY(1,1) NOT NULL,
	[Structure] [nvarchar](50) NULL,
	[MainMission] [nvarchar](255) NULL,
	[MissionVariant] [nvarchar](255) NULL,
	[DisplayName] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[ShortForm] [nvarchar](50) NULL,
	[AltShortForm] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Mission] PRIMARY KEY CLUSTERED 
(
	[MissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MissionUnit]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MissionUnit](
	[MissionId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[MissionVariant] [nvarchar](255) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_MissionUnit] PRIMARY KEY CLUSTERED 
(
	[MissionId] ASC,
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organisation]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organisation](
	[OrganisationId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Navy] [bit] NOT NULL,
	[Army] [bit] NOT NULL,
	[AirForce] [bit] NOT NULL,
	[Marines] [bit] NOT NULL,
	[Joint] [bit] NOT NULL,
	[Rank] [int] NOT NULL,
 CONSTRAINT [PK__Organisation] PRIMARY KEY CLUSTERED 
(
	[OrganisationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rank]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[Symbol] [nvarchar](1) NOT NULL,
	[Army] [nvarchar](255) NULL,
	[Navy] [nvarchar](255) NULL,
	[AirForce] [nvarchar](255) NULL,
	[Joint] [nvarchar](255) NULL,
	[Rank] [nvarchar](8) NULL,
	[RankLevel] [int] NULL,
	[InUse] [bit] NULL,
	[NavyRank] [nvarchar](50) NULL,
	[NavyRankAbbrev] [nvarchar](50) NULL,
	[ArmyRank] [nvarchar](50) NULL,
	[ArmyRankAbbrev] [nvarchar](50) NULL,
	[AirForceRank] [nvarchar](50) NULL,
	[AirForceRankAbbrev] [nvarchar](50) NULL,
	[MarineRank] [nvarchar](50) NULL,
	[MarineRankAbbrev] [nvarchar](50) NULL,
 CONSTRAINT [PK__Symbol] PRIMARY KEY CLUSTERED 
(
	[Symbol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Relationship]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relationship](
	[RelationshipId] [int] IDENTITY(1,1) NOT NULL,
	[RelationshipGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Relationship2_RelationshipGuid]  DEFAULT (newid()),
	[RelFrom] [uniqueidentifier] NULL,
	[RelTo] [uniqueidentifier] NULL,
	[RelTypeIdx] [int] NOT NULL,
	[RelFromUnitId] [int] NOT NULL,
	[RelToUnitId] [int] NOT NULL,
 CONSTRAINT [PK_Relationship] PRIMARY KEY CLUSTERED 
(
	[RelFromUnitId] ASC,
	[RelToUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelationshipType]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationshipType](
	[RelationshipTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_RelationshipType] PRIMARY KEY CLUSTERED 
(
	[RelationshipTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[ServiceTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[ServiceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ship]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ship](
	[ShipId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Ship_ShipGuid]  DEFAULT (newid()),
	[UnitId] [int] NULL,
	[ShipPrefixId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[HCS] [nvarchar](50) NULL,
	[HCSNumber] [int] NULL,
	[PennantCode] [nvarchar](5) NULL,
	[PennantNumber] [int] NULL,
	[IsBase] [bit] NOT NULL,
	[AltName] [nvarchar](255) NULL,
	[AltHCS] [nvarchar](50) NULL,
	[AltHCSNumber] [int] NULL,
	[IsInactive] [bit] NOT NULL,
	[NewShipId] [uniqueidentifier] NULL,
	[Commissioned] [date] NULL,
	[Decommissioned] [date] NULL,
	[ShipClassId] [int] NULL,
 CONSTRAINT [PK_Ship] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShipClass]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipClass](
	[ShipClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](255) NOT NULL,
	[ClassCodeHCS] [nvarchar](50) NOT NULL,
	[ClassCodeNumber] [int] NOT NULL,
	[ModFrom] [int] NULL,
	[ModName] [nvarchar](255) NULL,
 CONSTRAINT [PK_ShipClass] PRIMARY KEY CLUSTERED 
(
	[ShipClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShipClassMember]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipClassMember](
	[ShipId] [uniqueidentifier] NOT NULL,
	[ShipClassId] [int] NOT NULL,
	[IsLeadBoat] [bit] NULL,
 CONSTRAINT [PK_ShipClassMember] PRIMARY KEY CLUSTERED 
(
	[ShipId] ASC,
	[ShipClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShipPrefix]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipPrefix](
	[ShipPrefixId] [int] IDENTITY(1,1) NOT NULL,
	[ShipPrefix] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ShipPrefix] PRIMARY KEY CLUSTERED 
(
	[ShipPrefixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SortOrder]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SortOrder](
	[SortOrderId] [int] IDENTITY(1,1) NOT NULL,
	[SearchTerm] [nvarchar](255) NOT NULL,
	[SortOrderRank] [int] NOT NULL,
 CONSTRAINT [PK_SortOrder] PRIMARY KEY CLUSTERED 
(
	[SortOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskForce]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskForce](
	[UnitId] [int] NOT NULL,
	[TaskForceName] [nvarchar](50) NULL,
	[TaskForceNo] [int] NULL,
	[TaskGroup] [int] NULL,
	[TaskUnit] [int] NULL,
	[TaskElement] [int] NULL,
	[SortName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_TaskForce] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tennant]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tennant](
	[TennancyId] [int] IDENTITY(1,1) NOT NULL,
	[BaseId] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[IsHost] [bit] NOT NULL,
 CONSTRAINT [PK_Tennant] PRIMARY KEY CLUSTERED 
(
	[BaseId] ASC,
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NULL,
	[UseOrdinal] [bit] NOT NULL CONSTRAINT [DF__Unit__UseOrdinal__2A4B4B5E]  DEFAULT ((0)),
	[NickName] [nvarchar](255) NULL,
	[LegacyMissionName] [nvarchar](255) NULL,
	[MissionName] [nvarchar](255) NULL,
	[UniqueName] [nvarchar](255) NULL,
	[CommandName] [nvarchar](255) NULL,
	[UnitTypeVariant] [nvarchar](255) NULL,
	[ServiceIdx] [int] NOT NULL,
	[ServiceTypeIdx] [int] NOT NULL,
	[TerritorialDesignation] [nvarchar](5) NULL,
	[UnitGuid] [uniqueidentifier] NOT NULL CONSTRAINT [DF__Unit__UnitGuid__276EDEB3]  DEFAULT (newid()),
	[RankSymbol] [nvarchar](1) NOT NULL,
	[AdminCorpsId] [int] NULL,
	[CanHide] [bit] NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnitIndex]    Script Date: 21/06/2018 19:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitIndex](
	[UnitIndexId] [int] IDENTITY(1,1) NOT NULL,
	[IndexCode] [nvarchar](50) NOT NULL,
	[UnitGuid] [uniqueidentifier] NULL,
	[UnitId] [int] NOT NULL,
	[IsSortIndex] [bit] NOT NULL,
	[IsDisplayIndex] [bit] NOT NULL,
	[IsAlt] [bit] NOT NULL,
	[IsPlaceholder] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_UnitIndex] PRIMARY KEY CLUSTERED 
(
	[UnitIndexId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AdminCorps] ON 

INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (1, N'Fleet Air Arm', N'FAA', NULL, NULL, NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (2, N'Royal Air Force', N'RAF', NULL, NULL, NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (3, N'RAF Medical Services', N'RAFMS', NULL, N'MD', 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (4, N'RAF Civil Engineering', N'RAF', NULL, N'CE', 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (5, N'RAF Nuclear Corps', N'RAF', NULL, NULL, 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (6, N'Royal Auxiliary Air Force', N'RAuxAF', NULL, NULL, 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (7, N'RAF Comptroller', N'RAF', NULL, N'CPT', 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (8, N'RAF Operations Support', N'RAF', NULL, N'OS', 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (9, N'RAF Medical Services, Operations', N'RAFMS', NULL, N'MDO', 3)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (10, N'RAF Medical Services, Support', N'RAFMS', NULL, N'MDS', 3)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (11, N'RAF Maintenance', N'RAF', NULL, N'MX', 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (13, N'RAF Maintenance, AMX', N'RAF', NULL, N'AMX', 11)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (14, N'RAF Maintenance, Munitions', N'RAF', NULL, N'MUN', 11)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (15, N'RAF Maintenance, Operations', N'RAF', NULL, N'MO', 11)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (16, N'RAF Mission Support', N'RAF', NULL, N'MS', 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (17, N'RAF Communications', N'RAF', NULL, N'COM', 16)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (18, N'RAF Contracting', N'RAF', NULL, N'CON', 16)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (19, N'RAF Force Support', N'RAF', NULL, N'FS', 16)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (20, N'RAF Logistics Readiness', N'RAF', NULL, N'LR', 16)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (21, N'RAF Security Forces', N'RAF', NULL, N'SF', 16)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (22, N'RAF Police', N'RAFP', NULL, NULL, 21)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (23, N'RAF Regiment', N'RAF RGT', NULL, NULL, 21)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (24, N'RAF Flying', N'RAF', NULL, N'OPS', 2)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (27, N'DG Cavalry', N'DG CAV', NULL, NULL, NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (28, N'Dir., Airborne', N'DIR ABN', NULL, N'ABN', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (30, N'DG, Artillery', N'DG ART', NULL, N'ART', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (32, N'DG, Infantry', N'DG INF', NULL, N'INF', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (33, N'ACGS, Land Warfare', N'ACGS LW', NULL, N'LW', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (34, N'Royal Canadian Air Force', N'RCAF', NULL, NULL, NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (35, N'RAF Training', N'RAF', NULL, NULL, NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (36, N'RAF Medical Services, Aeromedical-Dental', N'RAFMS', NULL, N'AD', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (37, N'RAF Medical Services, Dental', N'RAFMS', NULL, N'D', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (38, N'RAF Medical Services, Aerospace Medicine', N'RAFMS', NULL, N'AMD', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (39, N'RAF Maintenance, CMX', N'RAF', NULL, N'CMX', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (40, N'RAF Maintenance, EMX', N'RAF', NULL, N'EMX', NULL)
INSERT [dbo].[AdminCorps] ([AdminCorpsId], [Name], [Code], [ParentUnitId], [Lookup], [ParentAdminCorpsId]) VALUES (41, N'RAF Air Operations', N'RAF', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AdminCorps] OFF
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (NULL, N'77658911-2404-4ad7-af4e-1fd579e10309', N'Talon', N'T.3', N'3.T', N'T-1C', N'Talon', N'T-____1C')
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (NULL, N'b104b35e-56c4-453a-b4fd-365182af277a', N'Iroquois', N'HU.14', N'14.HU', N'UH-1N', N'Iroquois', N'UH-____1N')
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (1, N'ed7e908a-5091-4d1c-bfb6-42ff153fd566', N'Mercury', N'E.1', N'1.E', N'E-6A', N'Mercury', N'E-____6A')
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (NULL, N'388d000a-9e4c-4778-b442-76bcc4233e41', N'Stratofortress', N'B.8', N'8.B', N'B-52H', N'Stratofortress', N'B-___52H')
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (NULL, N'8684d2e7-87c2-4fc3-a818-8eba5374f918', N'Lancer', N'B.2', N'2.B', N'B-1B', N'Lancer', N'B-____1B')
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (3, N'33213505-03cc-487a-ba16-bba234676c3d', N'LGM-30G Minuteman III', N'LGM.7', N'7.LGM', NULL, N'Minuteman III', N'LGM-___30G')
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (2, N'a659dd17-e9ef-40b7-9c3f-bc9d2574ecce', N'Mercury', N'E.2', N'2.E', N'E-6B', N'Mercury', N'E-____6B')
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (NULL, N'f09d2006-e351-4596-9bc8-ca38edd597eb', N'Talon', N'T.1', N'1.T', N'T-1A', N'Talon', N'T-____1A')
INSERT [dbo].[Aircraft] ([AircraftId], [AircraftGuid], [Name], [Mark], [Sort], [AltCode], [AltName], [AltSort]) VALUES (NULL, N'1ae3c240-daba-48de-855c-ea8804503622', N'Spirit', N'B.1', N'1.B', N'B-2A', N'Spirit', N'B-____2A')
SET IDENTITY_INSERT [dbo].[Base] ON 

INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (1, N'Belleville', N'RAF', N'Belleville (Scott AFB)', NULL, N'Scott AFB', N'Scott AFB', N'BLV', N'KBLV', N'BLV', N'KBLV', NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (2, N'Arlington', N'JFHQ', N'Arlington', N'(The Pentagon)', NULL, N'The Pentagon', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (3, N'Brunssum', N'JFHQ', N'Brunssum', NULL, NULL, N'JFC Brunssum', NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (4, N'Henrik', NULL, N'Henrik', N'Camp', NULL, N'JFC Brunssum', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (5, N'Mons', N'JFHQ', N'Mons', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (6, N'Casteau', N'Camp', N'Casteau', NULL, NULL, N'SHAPE', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (7, N'SHAPE', NULL, N'SHAPE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (8, N'Naples', N'JFHQ', N'Naples', NULL, NULL, N'JFC Naples', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (9, N'Norfolk', N'HMNB', N'Norfolk', NULL, N'HMS Chesapeake', N'NS Norfolk', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (10, N'Bellevue', N'RAF', N'Bellevue (Offutt AFB)', NULL, N'Offutt AFB', N'Offutt AFB', N'OFF', N'KOFF', N'OFF', N'KOFF', NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (11, N'Oklahoma City', N'RAF', N'Oklahoma City (Tinker AFB)', NULL, N'Tinker AFB', N'Tinker AFB', N'TIK', N'KTIK', N'TIK', N'KTIK', NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (12, N'Cheyenne', N'RAF', N'Cheyenne', NULL, N'Francis E. Warren AFB', N'Francis E. Warren AFB', NULL, N'KFEW', N'FEW', N'KFEW', NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (13, N'Minot', N'RAF', N'Minot', NULL, NULL, N'Minot AFB', N'MIB', N'KMIB', N'MIB', N'KMIB', NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (14, N'Great Falls', N'RAF', N'Great Falls', NULL, N'Malmstrom AFB', N'Malmstrom AFB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (15, N'Bragg', N'Fort', N'Bragg', NULL, NULL, N'Fort Bragg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (16, N'Hood', N'Fort', N'Hood', NULL, NULL, N'Fort Hood', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (17, N'King''s Bay', N'HMNSB', N'King''s Bay', NULL, N'HMS Sunfish', N'NSB King''s Bay', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (18, N'Bangor', N'HMNSB', N'Bangor', NULL, N'HMS Orca', N'NSB Bangor', NULL, NULL, NULL, NULL, 20)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (19, N'Pearl Harbour', N'HMNB', N'Pearl Harbour', NULL, N'HMS Nimitz', N'NB Pearl Harbour', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (20, N'Kitsap', N'HMNB', N'Kitsap', NULL, NULL, N'NB Kitsap', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (21, N'Bremerton', N'HMNS', N'Bremerton', NULL, NULL, N'NS Bremerton', NULL, NULL, NULL, NULL, 20)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (22, N'Bossier City', N'RAF', N'Bossier City', NULL, N'Barksdale AFB', N'Barksdale AFB', N'BAD', N'KBAD', N'BAD', N'KBAD', NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (23, N'Sedalia', N'RAF', N'Sedalia', NULL, N'Whiteman AFB', N'Whiteman AFB', N'SZL', N'KSZL', N'SZL', N'KSZL', NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (24, N'Abilene', N'RAF', N'Abilene', NULL, N'Dyess AFB', N'Dyess AFB', N'DYS', N'KDYS', N'DYS', N'KDYS', NULL)
INSERT [dbo].[Base] ([BaseId], [SortName], [Prefix], [Name], [Suffix], [CommissionedName], [AltName], [IATACode], [ICAOCode], [FAACode], [AFDCode], [ParentBaseId]) VALUES (25, N'Rapid City', N'RAF', N'Rapid City', NULL, N'Ellsworth AFB', N'Ellsworth AFB', N'RCA', N'KRCA', N'RCA', N'KRCA', NULL)
SET IDENTITY_INSERT [dbo].[Base] OFF
SET IDENTITY_INSERT [dbo].[EquipmentOwner] ON 

INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (1, 80, CAST(8.0 AS Decimal(5, 1)), NULL, N'a659dd17-e9ef-40b7-9c3f-bc9d2574ecce', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (2, 81, CAST(0.0 AS Decimal(5, 1)), NULL, N'a659dd17-e9ef-40b7-9c3f-bc9d2574ecce', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (3, 79, CAST(8.0 AS Decimal(5, 1)), NULL, N'a659dd17-e9ef-40b7-9c3f-bc9d2574ecce', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (4, 78, NULL, NULL, N'a659dd17-e9ef-40b7-9c3f-bc9d2574ecce', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (5, 239, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (6, 240, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (7, 241, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (8, 244, NULL, NULL, N'b104b35e-56c4-453a-b4fd-365182af277a', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (9, 257, NULL, NULL, N'b104b35e-56c4-453a-b4fd-365182af277a', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (10, 260, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (11, 259, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (12, 258, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (13, 268, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (14, 266, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (15, 267, NULL, NULL, N'33213505-03cc-487a-ba16-bba234676c3d', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (16, 269, NULL, NULL, N'b104b35e-56c4-453a-b4fd-365182af277a', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (17, 323, NULL, NULL, N'388d000a-9e4c-4778-b442-76bcc4233e41', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (18, 322, NULL, NULL, N'388d000a-9e4c-4778-b442-76bcc4233e41', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (19, 320, NULL, NULL, N'388d000a-9e4c-4778-b442-76bcc4233e41', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (20, 318, NULL, NULL, N'388d000a-9e4c-4778-b442-76bcc4233e41', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (21, 324, NULL, NULL, N'388d000a-9e4c-4778-b442-76bcc4233e41', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (22, 347, NULL, NULL, N'388d000a-9e4c-4778-b442-76bcc4233e41', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (23, 348, NULL, NULL, N'388d000a-9e4c-4778-b442-76bcc4233e41', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (24, 371, CAST(0.0 AS Decimal(5, 1)), NULL, N'1ae3c240-daba-48de-855c-ea8804503622', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (25, 371, CAST(14.0 AS Decimal(5, 1)), NULL, N'f09d2006-e351-4596-9bc8-ca38edd597eb', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (26, 369, CAST(10.0 AS Decimal(5, 1)), NULL, N'1ae3c240-daba-48de-855c-ea8804503622', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (27, 367, CAST(10.0 AS Decimal(5, 1)), NULL, N'1ae3c240-daba-48de-855c-ea8804503622', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (28, 349, NULL, NULL, N'1ae3c240-daba-48de-855c-ea8804503622', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (29, 326, NULL, NULL, N'8684d2e7-87c2-4fc3-a818-8eba5374f918', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (30, 400, NULL, NULL, N'8684d2e7-87c2-4fc3-a818-8eba5374f918', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (31, 401, NULL, NULL, N'8684d2e7-87c2-4fc3-a818-8eba5374f918', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (32, 405, NULL, NULL, N'8684d2e7-87c2-4fc3-a818-8eba5374f918', 0)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (33, 407, NULL, NULL, N'8684d2e7-87c2-4fc3-a818-8eba5374f918', 1)
INSERT [dbo].[EquipmentOwner] ([EquipmentOwnerId], [UnitId], [Quantity], [Notes], [AircraftId], [IsOwner]) VALUES (34, 408, NULL, NULL, N'8684d2e7-87c2-4fc3-a818-8eba5374f918', 1)
SET IDENTITY_INSERT [dbo].[EquipmentOwner] OFF
SET IDENTITY_INSERT [dbo].[Mission] ON 

INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (1, N'!', NULL, NULL, N'UCC', N'Functional Unified Combatant Command', N'UCC', N'UCC', NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (2, N'!', NULL, NULL, N'Supreme HQ', N'Supreme Headquarters', N'SHQ', N'SHQ', NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (3, N'!', NULL, NULL, N'SRC', N'Sub-Regional Command', N'SRC', N'SRC', NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (5, N'N:A:/', NULL, NULL, N'Strategic Communications', N'Communications, Strategic', N'STRATCOM', N'STRATCOM', N'Naval Air ')
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (6, N'N:A:@', NULL, NULL, N'Fleet Air Reconnaissance', N'Fleet Air Reconnaissance', N'VQ', N'VQ', NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (7, N'A:*', NULL, NULL, N'Strategic Missile', N'Strategic Missile', N'M', N'M', NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (8, N'N:HCS', NULL, NULL, N'SSBN', N'Submarine, Ballistic Missile, Nuclear', N'SSBN', N'SSBN', NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (9, N'N:HCS', NULL, NULL, N'SSGN', N'Submarine Guided Missile, Nuclear', N'SSGN', N'SSGN', NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (11, N'FAC:N', NULL, NULL, N'Submarine Support Centre', N'Submarine Support Centre', N'SUBSCEN', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (13, N'FAC:N', NULL, NULL, N'Submarine Ballistic Missile Refit', N'Submarine Ballistic Missile Refit', N'BMR', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (14, N'N:SUB:/', N'Submarine', NULL, N'Submarine Sqn', N'Submarine Squadron', N'SUBRON', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (15, N'N:SUB:*', N'Submarine', NULL, N'Submarine Flot', N'Submarine Flotilla', N'SUBFLOT', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (16, N'N:SUB:)', N'Submarine', NULL, N'Submarine Force', N'Submarine Forces', N'SUBFOR', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (17, N'A:HQ:CPT:@', N'Comptroller', N'Strategic Missile', N'Comptroller, Missile', N'Comptroller, Missile', N'CPT(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (18, N'A:MD:/', N'Medical', N'Strategic Missile', N'Medical, Missile', N'Medical, Missile', N'MD(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (19, N'A:MX:/', N'Maintenance', N'Strategic Missile', N'Maintenance, Missile', N'Maintenance, Missile', N'MX(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (20, N'A:SF:/', N'Security Forces', N'Strategic Missile', N'Security Forces, Missile', N'Security Forces, Missile', N'SF(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (21, N'A:MS:/', N'Mission Support', N'Strategic Missile', N'Mission Support, Missile', N'Mission Support, Missile', N'MS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (22, N'A:OPS:/', N'Operations', N'Strategic Missile', N'Missile', N'Missile', N'M', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (25, N'A:MD:MDO:@', N'Medical Operations', N'Strategic Missile', N'Medical Operations, Missile', N'Medical Operations, Missile', N'MDO(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (26, N'A:MD:MDS:@', N'Medical Support', N'Strategic Missile', N'Medical Support, Missile', N'Medical Support, Missile', N'MDS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (28, N'A:SF:SF:@', N'Security Forces', N'Strategic Missile', N'Security Forces, Missile', N'Security Forces, Missile', N'SFS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (30, N'A:SF:MSF:@', N'Missile Security Forces', N'Strategic Missile', N'Missile Security Forces, Missile', N'Missile Security Forces, Missile', N'MSFS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (31, N'A:SF:SS:@', N'Security Support', N'Strategic Missile', N'Security Support, Missile', N'Security Support, Missile', N'SS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (32, N'A:MS:LR:@', N'Logistics Readiness', N'Strategic Missile', N'Logistics Readiness, Missile', N'Logistics Readiness, Missile', N'LR(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (33, N'A:MS:FS:@', N'Force Support', N'Strategic Missile', N'Force Support, Missile', N'Force Support, Missile', N'FS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (34, N'A:MS:CON@', N'Contracting', N'Strategic Missile', N'Contracting, Missile', N'Contracting, Missile', N'CON(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (35, N'A:MS:COM:@', N'Communications', N'Strategic Missile', N'Communications, Missile', N'Communications, Missile', N'COM(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (36, N'A:MS:CE:@', N'Civil Engineering', N'Strategic Missile', N'Civil Engineering, Missile', N'Civil Engineering, Missile', N'CE(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (37, N'A:OPS:M:@', N'Operations', N'Missile', N'Strategic Missile', N'Strategic Missile', N'OPS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (38, N'A:OPS:H:@', N'Operations', N'Helicopter', N'Helicopter', N'Helicopter', N'OPS(H)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (39, N'A:OPS:OS:@', N'Operations Support', N'Strategic Missile', N'Operations Support, Missile', N'Operations Support, Missile', N'OPSS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (40, N'A:MX:MX:@', N'Maintenance', N'Strategic Missile', N'Maintanence, Missile', N'Maintanence, Missile', N'MX(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (41, N'A:MX:MO:@', N'Maintenance Operations', N'Strategic Missile', N'Maintenance Operations, Missile', N'Maintenance Operations, Missile', N'MO(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (42, N'A:MX:MUN:@', N'Munitions', N'Strategic Missile', N'Muntions, Strategic Missile', N'Muntions, Strategic Missile', N'MUN(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (43, N'A:MS:CE:@', N'Civil Engineer', N'Strategic Missile', N'Civil Engineering, Missile', N'Civil Engineering, Missile', N'CE(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (44, N'A:MS:COM:@', N'Communications', N'Strategic Missile', N'Communications, Missile', N'Communications, Missile', N'COM(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (45, N'A:MS:CON:@', N'Contracting', N'Strategic Missile', N'Contracting, Missile', N'Contracting, Strategic Missile', N'CON(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (46, N'A:MS:FS:@', N'Force Support', N'Strategic Missile', N'Force Support, Missile', N'Force Support, Missile', N'FS(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (47, N'A:MS:LR:@', N'Logistics Readiness', N'Strategic Missile', N'Logistics Readiness, Missile', N'Logistics Readiness, Missile', N'LR(M)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (48, N'A:*', N'Bomb', NULL, N'Bomb', N'Bomb', N'B', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (49, N'A:HQ:CPT:@', N'Comptroller', N'Bomb', N'Comptroller, Bomb', N'Comptroller, Bomb', N'CPT(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (50, N'A:MX:/', N'Maintenance', N'Bomb', N'Maintenance, Bomb', N'Maintenance, Bomb', N'MX(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (51, N'A:MX:AM:@', N'Maintenance, Aircraft', N'Bomb', N'Aircraft Maintenance, Bomb', N'Aircraft Maintenance, Bomb', N'AMX(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (52, N'A:MX:MO:@', N'Maintenance Operations', N'Bomb', N'Maintenance Operations, Bomb', N'Maintenance Operations, Bomb', N'MO(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (54, N'A:MX:MUN:@', N'Munitions', N'Bomb', N'Munitions, Bomb', N'Munitions, Bomb', N'MUN(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (55, N'A:MX:MX:@', N'Maintenance', N'Bomb', N'Maintenance, Bomb', N'Maintenance, Bomb', N'MX(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (56, N'A:MD:/', N'Medical', N'Bomb', N'Medical, Bomb', N'Medical, Bomb', N'MD(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (57, N'A:MD:@', N'Medical', N'Bomb', N'Medical, Bomb', N'Medical, Bomb', N'MD(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (58, N'A:SF:SF:@', N'Security Forces', N'Bomb', N'Security Forces, Bomb', N'Security Forces, Bomb', N'SF(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (59, N'A:MS:MS:@', N'Mission Support', N'Bomb', N'Mission Support, Bomb', N'Mission Support, Bomb', N'MS(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (60, N'A:MS:LR:@', N'Logistics Readiness', N'Bomb', N'Logistics Readiness, Bomb', N'Logistics Readiness, Bomb', N'LR(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (61, N'A:MS:FS:@', N'Force Support', N'Bomb', N'Force Support, Bomb', N'Force Support, Bomb', N'FS(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (62, N'A:MS:CON:@', N'Contracting', N'Bomb', N'Contracting, Bomb', N'Contracting, Bomb', N'CON(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (63, N'A:MS:COM:@', N'Communications', N'Bomb', N'Communications, Bomb', N'Communications, Bomb', N'COM(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (64, N'A:MS:CE:@', N'Civil Engineer', N'Bomb', N'Civil Engineer, Bomb', N'Civil Engineer, Bomb', N'CE(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (65, N'A:OPS:OS:@', N'Operations Support', N'Bomb', N'Operations Support, Bomb', N'Operations Support, Bomb', N'OS(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (66, N'A:OPS:B:@', N'Operations', N'Bomb', N'Bomb', N'Bomb', N'OPS(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (67, N'A:MS:/', N'Mission Support', N'Bomb', N'Mission Support, Bomb', N'Mission Support, Bomb', N'MS(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (68, N'A:OPS:/', N'Operations', N'Bomb', N'Bomb', N'Bomb', N'OPS(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (70, N'A:SF:AD:|', N'Airfield Defence', N'Bomb', N'Airfield Defence, Bomb', N'Airfield Defence, Bomb', N'AFLDDEF(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (71, N'A:SF:POL:|', N'Air Force Police', N'Bomb', N'Air Force Police, Bomb', N'Air Force Police, Bomb', N'AFPOL(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (72, N'A:OPS:TRG:C@', N'Combat Training', NULL, N'Combat Training', N'Combat Training', N'CT', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (73, N'A:OPS:TRG:@', N'Training', NULL, N'Training', N'Training', N'TRG', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (74, N'A:MX:CM:@', N'Maintenance, Component', N'Bomb', N'Component Maintenance, Bomb', N'Component Maintenance, Bomb', N'CMX(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (75, N'A:MX:EM:@', N'Maintenance, Equipment', N'Bomb', N'Equipment Maintenance, Bomb', N'Equipment Maintenance, Bomb', N'EMX(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (76, N'A:OPS:OPSCEN:AO:/', N'Air and Space Operations Centre', NULL, N'Air and Space Operations Centre', N'Air and Space Operations Centre', N'AOC', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (77, N'A:OPS:OPSCEN:AO:/', N'Combined Air Operations Centre', NULL, N'Combined Air Operations Centre', N'Combined Air Operations Centre', N'CAOC', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (78, N'A:MD:MDO:@', N'Medical Operations', N'Bomb', N'Medical Operations, Bomb', N'Medical Operations, Bomb', N'MDO(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (79, N'A:MD:MDS:@', N'Medical Support', N'Bomb', N'Medical Support, Bomb', N'Medical Support, Bomb', N'MDS(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (80, N'A:MD:AD:@', N'Aeromedical-Dental', N'Bomb', N'Aeromedical-Dental, Bomb', N'Aeromedical-Dental, Bomb', N'AD(B)', NULL, NULL)
INSERT [dbo].[Mission] ([MissionId], [Structure], [MainMission], [MissionVariant], [DisplayName], [FullName], [ShortForm], [AltShortForm], [Notes]) VALUES (81, N'A:OPS:ATK:@', N'Operations', N'Attack', N'Attack', N'Attack', N'ATK', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Mission] OFF
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (1, 9, N'Combined', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (1, 37, N'Functional', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (1, 38, N'Functional', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (2, 4, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (3, 13, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (3, 14, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (3, 15, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (3, 51, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (5, 78, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (6, 79, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (6, 80, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (6, 81, N'FRS', N'Fleet Replacement')
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (7, 133, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (7, 134, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (7, 136, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 178, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 186, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 187, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 193, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 196, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 197, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 198, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 199, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 200, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 201, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 203, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 204, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 205, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 206, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 207, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 208, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 209, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (8, 210, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (9, 175, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (9, 177, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (9, 190, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (9, 191, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (11, 213, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (11, 214, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (13, 211, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (14, 170, N'SSBN, SSGN', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (14, 172, N'SSBN', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (14, 173, N'SSBN, SSGN', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (14, 174, N'SSBN', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (15, 166, N'SSBN, SSGN', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (15, 167, N'SSBN, SSGN', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (16, 168, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (16, 169, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (17, 221, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (17, 286, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (18, 220, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (18, 285, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (19, 219, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (19, 249, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (19, 282, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (20, 218, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (20, 248, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (20, 265, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (21, 217, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (21, 264, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (22, 215, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (22, 246, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (22, 262, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (25, 222, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (25, 328, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (26, 223, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (26, 346, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (28, 224, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (28, 252, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (28, 255, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (28, 276, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (30, 227, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (30, 228, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (30, 253, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (30, 254, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (30, 278, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (30, 280, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (31, 229, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (31, 281, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (32, 275, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (33, 274, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (34, 273, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (35, 272, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (36, 271, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 239, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 240, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 241, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 258, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 259, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 260, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 266, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 267, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (37, 268, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (38, 244, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (38, 257, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (38, 269, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (39, 245, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (39, 256, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (39, 270, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (40, 237, NULL, NULL)
GO
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (40, 250, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (40, 283, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (41, 238, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (41, 251, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (41, 284, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (42, 236, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (43, 230, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (44, 231, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (45, 233, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (46, 234, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (47, 235, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (48, 143, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (48, 144, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (48, 145, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (48, 146, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (48, 147, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (49, 315, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (49, 344, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (49, 351, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (49, 398, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (49, 404, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (50, 299, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (50, 329, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (50, 353, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (50, 392, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (51, 300, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (51, 330, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (51, 354, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (51, 393, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (52, 303, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (52, 333, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (52, 397, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (54, 302, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (54, 332, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (54, 356, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (54, 396, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (55, 301, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (55, 331, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (55, 355, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (56, 317, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (56, 327, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (56, 388, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (58, 311, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (58, 340, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (58, 363, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (58, 382, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (59, 310, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (60, 309, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (60, 339, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (60, 362, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (60, 381, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (61, 308, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (61, 338, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (61, 361, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (61, 380, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (62, 307, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (62, 337, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (62, 360, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (62, 379, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (63, 306, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (63, 336, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (63, 359, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (63, 378, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (64, 305, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (64, 335, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (64, 358, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (64, 377, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (65, 319, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (65, 325, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (65, 350, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (65, 399, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 320, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 322, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 323, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 347, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 348, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 367, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 369, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 400, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 401, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 407, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (66, 408, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (67, 304, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (67, 334, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (67, 352, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (67, 357, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (67, 376, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (68, 318, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (68, 324, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (68, 326, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (68, 349, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (68, 405, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (70, 312, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (70, 341, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (70, 364, N'Strategic ', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (70, 383, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (71, 313, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (71, 342, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (71, 365, N'Strategic', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (71, 384, NULL, NULL)
GO
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (72, 371, N'Spirit B.1', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (73, 402, N'Lancer B.2 (Ground)', NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (74, 394, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (75, 395, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (76, 372, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (78, 390, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (79, 391, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (80, 389, NULL, NULL)
INSERT [dbo].[MissionUnit] ([MissionId], [UnitId], [MissionVariant], [Notes]) VALUES (81, 410, NULL, NULL)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (1, N'Command', 1, 1, 1, 1, 1, 100)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (2, N'Ship', 1, 1, 0, 0, 0, 850)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (3, N'NumberedAirForce', 0, 0, 1, 0, 0, 500)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (4, N'Detachment', 1, 1, 1, 1, 1, 150)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (5, N'Region', 0, 1, 1, 0, 1, 200)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (6, N'ArmyGroup', 0, 1, 0, 0, 0, 300)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (7, N'FieldArmy', 0, 1, 0, 0, 0, 400)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (8, N'Corps', 0, 1, 0, 0, 0, 500)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (9, N'Division', 1, 1, 0, 1, 0, 600)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (10, N'Brigade', 0, 1, 0, 1, 0, 700)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (11, N'Group', 1, 1, 1, 1, 1, 800)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (12, N'Battalion', 0, 1, 0, 1, 0, 900)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (13, N'Company', 0, 1, 0, 1, 0, 800)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (14, N'Battery', 0, 1, 0, 1, 0, 900)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (15, N'Base', 1, 1, 1, 1, 1, 760)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (16, N'NamedFleet', 1, 0, 0, 0, 0, 200)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (17, N'NumberedFleet', 1, 0, 0, 0, 0, 500)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (18, N'Flotilla', 1, 0, 0, 0, 0, 701)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (19, N'Squadron', 1, 0, 0, 0, 0, 800)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (21, N'Wing', 1, 0, 1, 1, 1, 800)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (22, N'Flight', 1, 0, 1, 1, 1, 900)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (23, N'Regiment', 0, 1, 1, 1, 1, 700)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (32, N'District', 1, 1, 1, 0, 1, 600)
INSERT [dbo].[Organisation] ([OrganisationId], [Name], [Navy], [Army], [AirForce], [Marines], [Joint], [Rank]) VALUES (34, N'FleetSqnDiv', 1, 0, 0, 0, 0, 900)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'-', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'!', NULL, NULL, NULL, N'JFHQ', N'XXXXXXXX', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'"', N'Land Command', N'Fleet Command', N'Air Command', N'UCC', N'XXXXXXX', 1, 1, N'Admiral of the Fleet', N'Adm. Flt.', N'Field Marshal General', N'FMG', N'Marshal of the Air Force', N'MAF', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'$', N'Military Region', N'Named Fleet ', N'Major Command', N'SubRegional Command', N'XXXXXX', 2, 1, N'Admiral', N'Adm.', N'Field Marshal', N'FM', NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'%', N'ArmyGroup', NULL, NULL, NULL, N'XXXXX', 3, 1, NULL, NULL, N'General', N'Gen.', NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'&', N'FieldArmy', NULL, NULL, NULL, N'XXXX', 4, 1, NULL, NULL, N'Colonel General', N'Col. Gen.', N'Air Chief Marshal', N'ACM', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'(', N'Corps', N'Numbered Fleet', N'Numbered Air Force', NULL, N'XXX', 5, 1, N'Vice Admiral', N'VAdm.', N'Lieutenant Colonel General', N'Lt. Col. Gen.', N'Air Marshal', N'AM', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N')', N'Division', N'Regional Type Command', N'Air Group', NULL, N'XX', 6, 1, N'Rear Admiral', N'RAdm.', N'Major General', N'Maj. Gen.', N'Air Vice Marshal', N'AVM', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'*', N'Brigade', N'Flotilla', N'AirBase', NULL, N'X', 7, 1, N'Commodore', N'Cdre.', N'Brigadier', N'Brig.', N'Air Commodore', N'ACdre.', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'/', N'Regiment', N'Fleet Sqn', N'Wing', NULL, N'|||', 8, 1, N'Captain', N'Capt.', N'Colonel', N'Col.', N'Group Captain', N'Gp. Capt.', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'?', N'Detachment', N'Detachment', N'Detachment', NULL, N'?', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'@', N'Battalion', NULL, N'Squadron', NULL, N'||', 9, 1, N'Commander', N'Cmdr.', N'Lieutenant Colonel', N'Lt. Col.', N'Wing Commander', N'Wg. Cdr.', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'\', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'^', N'Task Force', N'Task Force', N'Task Force', NULL, N'^', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'_', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'|', N'Company', NULL, N'Flight', NULL, N'|', 10, 1, N'Lieutenant Commander', N'Lt. Cmdr.', N'Major', N'Maj.', N'Squadron Leader', N'Sq. Ldr.', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'¦', N'Platoon', NULL, NULL, NULL, N'•••', 11, 1, N'Lieutenant', N'Lt.', N'Captain', N'Capt.', N'Flight Lieutenant', N'Flt. Lt.', NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'+', N'Section', NULL, NULL, NULL, N'••', 12, 1, N'Sub-Lieutenant', N'SLt.', N'Lieutenant', N'Lt.', NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'=', N'Squad', NULL, NULL, NULL, N'•', 13, 1, N'Ensign', N'Ens.', N'2nd Lieutenant', N'2Lt.', NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'£', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Rank] ([Symbol], [Army], [Navy], [AirForce], [Joint], [Rank], [RankLevel], [InUse], [NavyRank], [NavyRankAbbrev], [ArmyRank], [ArmyRankAbbrev], [AirForceRank], [AirForceRankAbbrev], [MarineRank], [MarineRankAbbrev]) VALUES (N'¬', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Relationship] ON 

INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (2, N'46be9e27-c006-4147-bc1a-bd6e57c7d25e', N'ae6f5b41-edcb-447f-b1ab-d34b424bec55', N'5b53631a-c25a-49c4-8501-848f7124b710', 2, 4, 9)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (10, N'ab94a996-07f2-4e06-8ed9-ea3a065901e9', N'ae6f5b41-edcb-447f-b1ab-d34b424bec55', N'ec641dc5-2d50-42d7-b868-f03c9b483a65', 2, 4, 29)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (19, N'ecbd5361-4895-45ae-b731-a6f2ec80ff56', NULL, NULL, 2, 4, 31)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (20, N'81591589-2886-4891-aed8-cf5975a55f80', NULL, NULL, 2, 4, 32)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (21, N'905bcbcf-e53f-4ee1-acd9-9210a475396d', NULL, NULL, 2, 4, 34)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (22, N'a0955f8d-67b3-4f58-9906-2c8239d643c9', NULL, NULL, 2, 4, 35)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (24, N'3972157d-bb1f-40c5-8a60-29e538f8d85d', NULL, NULL, 2, 4, 36)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (25, N'dff7f00e-5a85-48b4-a9f7-c6c5bd7f6f9b', NULL, NULL, 2, 4, 37)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (18, N'5f7cf0c7-cf45-4283-9d84-fe430c70b8a0', N'ae6f5b41-edcb-447f-b1ab-d34b424bec55', N'98aa349e-d96c-4301-a469-5f97ba0da085', 2, 4, 38)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (26, N'0590e708-65f1-4d19-ac09-e33e6048710a', NULL, NULL, 2, 4, 41)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (27, N'8dfc8850-3199-4856-ac1d-71d66120dc69', NULL, NULL, 2, 4, 42)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (28, N'92d11742-5cbb-4a0d-9c0e-943e2bb5ba0a', NULL, NULL, 2, 4, 44)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (29, N'67251c5b-3735-4a76-8b8b-199772584805', NULL, NULL, 2, 4, 46)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (30, N'f75daf41-70cd-4bb6-8698-d930017a6dd3', NULL, NULL, 2, 4, 47)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (23, N'bedd9528-6e32-4430-b8b7-55d2bdbdd5ce', NULL, NULL, 2, 4, 48)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (127, N'577f99d3-a7a0-4be3-851d-47fa32963129', NULL, NULL, 2, 4, 137)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (5, N'86e58a0a-e2bc-46de-946b-9e1b1f43f1ce', N'5b53631a-c25a-49c4-8501-848f7124b710', N'433f5cc8-240e-490b-9c09-46f7ca6d75da', 2, 9, 13)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (6, N'0cd369ff-1728-4b22-9ea7-83a6c433828f', N'5b53631a-c25a-49c4-8501-848f7124b710', N'5f0f5abe-2c44-490f-a65f-047d52275d15', 2, 9, 14)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (7, N'a0e2e0e2-08aa-4a07-b106-da89594fb288', N'5b53631a-c25a-49c4-8501-848f7124b710', N'8398a02f-1d9e-4ca4-bfe9-7a35fb4e7dec', 2, 9, 15)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (3, N'4ea93452-d455-4f7c-b0e8-134bdd2979fa', N'5b53631a-c25a-49c4-8501-848f7124b710', N'9308df70-66ac-4861-a9bd-6c30411cd964', 2, 9, 16)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (12, N'8f448a5e-7397-46f2-8af3-a5ae6a5484a7', N'5b53631a-c25a-49c4-8501-848f7124b710', N'e2f31a38-0a55-4edf-9052-afeea7d50ca8', 2, 9, 17)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (31, N'4facd2c0-6754-4c30-a077-184f4fa57ae9', NULL, NULL, 4, 9, 49)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (33, N'8ec072cf-6e4b-4014-bc85-c2b9f9146733', NULL, NULL, 2, 9, 51)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (45, N'91f709d0-f20d-4cf1-b24b-86991d885ca0', NULL, NULL, 2, 13, 64)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (46, N'8f152d74-6f1b-410b-a60f-b87600e4d92a', NULL, NULL, 2, 13, 65)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (47, N'6eb33639-ea9e-4b4f-93c9-e5c41b48ed76', NULL, NULL, 2, 13, 66)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (40, N'f5bfdaa2-15bb-4302-96fc-f4400317106d', NULL, NULL, 2, 14, 60)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (42, N'f5852faf-93ef-445e-b0e5-ef5b817b6f5f', NULL, NULL, 2, 14, 61)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (43, N'a2171e6f-928b-4671-bc2d-75572f90bd27', NULL, NULL, 2, 14, 62)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (44, N'e0edc9c5-543c-469a-9638-6879f7c98ca1', NULL, NULL, 2, 14, 63)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (50, N'27b9016f-da98-43f5-af6d-eed147d6daaf', NULL, NULL, 2, 15, 71)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (51, N'7442ab1f-18ff-4e53-b35c-7d8903cfbbe2', NULL, NULL, 2, 15, 72)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (52, N'dbcdb7ea-b793-48f4-a8c0-a1ae0ec7e00f', NULL, NULL, 2, 15, 73)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (53, N'4f6f1bc6-4eae-47e3-9b21-a0b4fbd24435', NULL, NULL, 2, 15, 74)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (9, N'eebe507e-7419-4f75-98e1-1b4d41d85bdc', N'e2f31a38-0a55-4edf-9052-afeea7d50ca8', N'52de1b19-f19d-4f1e-bcbe-6b1e6e7c31cc', 2, 16, 21)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (15, N'03fef671-9b4e-4c52-b395-822ad032bbea', N'52de1b19-f19d-4f1e-bcbe-6b1e6e7c31cc', N'5703fd52-9bb5-4d51-ad51-926d66e8df7b', 2, 21, 22)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (17, N'9185e0b5-4b40-4a9c-946f-83707abcfd7f', N'52de1b19-f19d-4f1e-bcbe-6b1e6e7c31cc', N'349a67a0-e0de-4156-8afe-0786d411c6a8', 2, 21, 25)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (8, N'5ba4c813-ada9-469a-8731-ee7a4260a91c', N'5703fd52-9bb5-4d51-ad51-926d66e8df7b', N'536a52b1-8c05-4351-a09c-9078b2727ff8', 2, 22, 28)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (13, N'50b5cfc7-a315-43e8-b462-deec480e1b61', N'5703fd52-9bb5-4d51-ad51-926d66e8df7b', N'a08e3e73-ce85-4834-871f-42d85439c2fd', 2, 22, 30)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (71, N'4474219b-a26a-40c4-a178-3b2efbee918f', NULL, NULL, 4, 29, 95)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (72, N'7bb3e174-1899-470e-958c-45e86338d9cd', NULL, NULL, 4, 29, 96)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (73, N'a69fdd66-286c-4cc1-80c9-44fffb437947', NULL, NULL, 4, 29, 97)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (74, N'43283bb5-bf5d-48b9-a336-849f67606324', NULL, NULL, 4, 29, 98)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (86, N'4ecb20df-d3d9-4486-87c3-9ad2371f9c13', NULL, NULL, 4, 35, 102)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (88, N'7f6329b1-a8be-4192-9a0e-6b0f79fe7809', NULL, NULL, 4, 35, 103)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (89, N'0e114610-c193-4124-9769-563542d92a14', NULL, NULL, 4, 35, 104)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (91, N'dce0e097-29e1-44fb-9e7b-59d491cc86c4', NULL, NULL, 4, 35, 105)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (94, N'5becc093-2cdc-4684-a47e-9559e5d56373', NULL, NULL, 4, 35, 106)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (92, N'5fac23fa-78eb-4101-9507-7244e339fc00', NULL, NULL, 6, 36, 105)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (97, N'fb5d8824-c3fd-4cde-9161-e13459fd7270', NULL, NULL, 1, 36, 108)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (98, N'd887a552-48aa-43d3-a389-d6eafbdeaf53', NULL, NULL, 4, 36, 109)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (101, N'39d07e12-1a88-4b6e-95a2-3ad67a60feff', NULL, NULL, 4, 36, 111)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (103, N'7d8e12f3-e5fd-42ea-b19a-27e8a08ec080', NULL, NULL, 4, 36, 112)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (66, N'7c732991-ca51-4fd9-90ca-9a3f9b30a0d3', NULL, NULL, 1, 37, 90)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (67, N'12deac41-3e22-46d4-a4fe-3863a265e66d', NULL, NULL, 1, 37, 91)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (68, N'a180612f-af0d-4e51-95b1-320b700fe670', NULL, NULL, 1, 37, 92)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (69, N'5fb7ba36-c491-4831-a9d4-e38f710aec24', NULL, NULL, 1, 37, 93)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (70, N'8fa79139-3356-4a8b-bc6c-ec47f30b9ce1', NULL, NULL, 1, 37, 94)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (106, N'817fd46b-4686-480e-8c64-b20ac5910879', NULL, NULL, 4, 37, 117)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (109, N'c98c1c11-c9a8-474c-8998-58b75593b19a', NULL, NULL, 4, 37, 118)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (119, N'f173bd05-dcbb-4c5b-a704-b9e3cb4f971e', NULL, NULL, 4, 37, 126)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (121, N'811d4e33-bf69-43a8-b16a-bd92d03190cb', NULL, NULL, 4, 37, 130)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (138, N'00a91fc3-bbbf-4b07-befc-d847938547ad', NULL, NULL, 1, 37, 151)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (144, N'a346cbfd-f4b6-4fb1-a18a-b15a91a9a7db', NULL, NULL, 4, 37, 157)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (79, N'6f257e51-3aaf-4ebd-9142-a06439b95b23', NULL, NULL, 4, 38, 99)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (80, N'eb3ce1ef-1438-4406-8c4d-5acc4f05ba54', NULL, NULL, 4, 38, 100)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (81, N'4e6d0fda-70e1-48e6-bc7a-bc5d4d290712', NULL, NULL, 4, 38, 101)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (76, N'ae3e7bb0-97a5-4dfe-91d7-f17a253f15c3', NULL, NULL, 6, 41, 95)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (82, N'd216599e-f5e7-49d2-9cf6-b31ccbb997a7', NULL, NULL, 6, 41, 99)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (87, N'c8b97b8f-97a2-443b-af3f-40fd9840e6ae', NULL, NULL, 6, 41, 103)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (100, N'1fc44693-6c47-48da-8f51-cb13c33e239a', NULL, NULL, 6, 41, 111)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (118, N'd31d46a6-2884-456a-93b8-121ab2f4083f', NULL, NULL, 6, 41, 126)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (120, N'bf513b5d-22f2-43ac-8298-bbd2134111c5', NULL, NULL, 6, 41, 130)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (32, N'4e2802e9-6d3f-48ee-91f2-b04981d049af', NULL, NULL, 6, 42, 49)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (75, N'88e56e91-364d-4041-88c1-cd271a93ac22', NULL, NULL, 6, 42, 96)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (83, N'1054cd1e-bf7b-4807-914a-5866ddb7be63', NULL, NULL, 6, 42, 101)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (85, N'5e4b3d2d-1770-4c29-93df-c4b6d2a9767a', NULL, NULL, 4, 42, 102)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (99, N'8908e56a-a825-4a4f-bf12-b5780288ade9', NULL, NULL, 6, 42, 109)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (108, N'8c9b30af-b342-41d3-855f-e0f61f10807d', NULL, NULL, 6, 42, 117)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (110, N'fb798cb0-a761-459d-85f9-22bf2a08e963', NULL, NULL, 6, 42, 118)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (35, N'6cca4670-1c50-48e1-8de7-783fa326e294', NULL, NULL, 2, 44, 54)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (77, N'aad4e47f-60aa-498d-8963-6b436e49d1d1', NULL, NULL, 6, 44, 97)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (84, N'c541b18a-d2d9-4628-a5df-3cd7ed4ceb85', NULL, NULL, 6, 44, 100)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (93, N'fb048db6-6410-4434-86c6-9835594f5366', NULL, NULL, 6, 44, 106)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (102, N'9c9077c5-508b-42f5-bd1f-fdab006e19e4', NULL, NULL, 6, 44, 112)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (78, N'f532b790-a850-4be2-8453-84ad7f6296d8', NULL, NULL, 6, 46, 98)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (90, N'94c01288-9fcf-4e12-9c90-6c25beb5a585', NULL, NULL, 6, 46, 104)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (157, N'14e7132e-3822-465a-bbbf-37c309475c76', NULL, NULL, 6, 46, 157)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (96, N'd75425a4-949c-4d9c-a5a7-5c235d4ea3dc', NULL, NULL, 4, 51, 107)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (145, N'49398136-c8b6-4668-b1f1-f168365a1e1d', NULL, NULL, 4, 51, 158)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (36, N'854c4913-d33b-492a-b0be-5e69efd4040b', NULL, NULL, 2, 54, 55)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (37, N'2e96ee8b-431c-4ae7-97ea-1c344b8aa5d3', NULL, NULL, 2, 54, 56)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (39, N'253acfec-1025-42f9-a83d-8e9d1c889878', NULL, NULL, 2, 54, 58)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (95, N'b56ed8b7-19b9-4994-b1d2-15edb6b7fc82', NULL, NULL, 6, 54, 107)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (62, N'55d29eb7-d3b1-4b19-a3a2-6e1e44928c1b', NULL, NULL, 2, 55, 82)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (158, N'42f6c4d2-439d-416d-b8cd-a931ede01c07', NULL, NULL, 1, 56, 168)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (159, N'4a4e2e2d-3a90-4824-985a-f51a81ca510e', NULL, NULL, 1, 56, 169)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (171, N'24db4401-82ff-4285-95e3-f1bc1f7d881f', NULL, NULL, 1, 56, 186)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (172, N'd9b9acdd-1f8c-4f36-9dfa-e9baa998287e', NULL, NULL, 1, 56, 187)
GO
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (175, N'68ab1aac-2a5e-4f48-b451-e06f3edec6f6', NULL, NULL, 1, 56, 193)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (176, N'dd130ca3-6c5f-4f67-aa15-4e53ad33fe0a', NULL, NULL, 1, 56, 196)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (48, N'eadd2df3-58a4-44fd-bfcf-b10e63f14d8b', NULL, NULL, 2, 66, 67)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (49, N'44fd2ffb-8b65-4acc-8d58-f4ce33b02850', NULL, NULL, 2, 66, 69)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (54, N'78483181-bea8-43d9-bb95-953f4bc7b5ac', NULL, NULL, 2, 73, 76)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (56, N'9e68e926-508c-4868-8b3d-f5f8d275aaa8', NULL, NULL, 2, 73, 77)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (58, N'e2c57ce4-a39f-4983-9abc-4029339a9b47', NULL, NULL, 2, 78, 79)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (59, N'd07d37f9-b997-404a-b609-95bef9df9c23', NULL, NULL, 2, 78, 80)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (60, N'bc20e2b1-790d-44b9-9a19-0470ada0e3d8', NULL, NULL, 2, 78, 81)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (63, N'1b4d93c2-42f1-421b-ae9e-b0b01ab31b81', NULL, NULL, 6, 82, 78)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (57, N'1325cb6b-05db-493e-a97b-ce4874601d2b', NULL, NULL, 4, 86, 78)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (104, N'00a97589-f10a-46e3-b90b-9942c57ade4b', NULL, NULL, 8, 86, 114)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (105, N'd16eeafb-b4ec-4da1-b9eb-6f7b4404c5ee', NULL, NULL, 5, 89, 116)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (153, N'ee7fe9db-c472-46e7-8cbf-203e99cf9cec', NULL, NULL, 8, 89, 128)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (154, N'676160e4-7b41-491b-92b1-ba6985851943', NULL, NULL, 4, 89, 133)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (155, N'b91856d5-981f-459f-875a-a91b99df5b23', NULL, NULL, 4, 89, 134)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (156, N'39f3cba3-303c-42a6-8507-87c595b1e746', NULL, NULL, 4, 89, 136)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (116, N'34156d52-b6a9-43e2-9843-ab612e9a0533', NULL, NULL, 1, 97, 124)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (117, N'3435a8fd-f1f9-4f4b-aa3d-a6448bff1848', NULL, NULL, 1, 97, 125)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (34, N'f703bd36-62b0-455f-836d-9965dbce820d', NULL, NULL, 2, 107, 53)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (114, N'827fe9b5-ffd9-4eaa-a4c6-675f5f62de14', NULL, NULL, 1, 117, 122)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (115, N'd7bd7606-9e04-45e0-8915-dd60019cfe3a', NULL, NULL, 1, 117, 123)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (112, N'ac7fda09-0eee-493e-8f7f-8f1a76dc3d43', NULL, NULL, 1, 118, 119)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (113, N'29c6d72b-1cff-4228-ac0b-0983077cfbf0', NULL, NULL, 1, 118, 121)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (126, N'1b794d6a-9305-4396-b1e1-f8da410a2430', NULL, NULL, 6, 128, 133)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (125, N'33205547-e2ac-4f2a-96c0-abc888303930', NULL, NULL, 6, 128, 134)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (124, N'60aa2b1b-25a4-4bb2-9c94-ed00dc3a51e8', NULL, NULL, 6, 128, 136)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (122, N'0c927576-f25d-4710-a860-fa562920ae31', NULL, NULL, 6, 130, 128)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (123, N'c6a1a24a-6266-4d51-9306-2c4049a299c8', NULL, NULL, 6, 130, 131)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (130, N'acc2a0e9-52f0-4bcf-8901-81cfec4b27dd', NULL, NULL, 6, 131, 143)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (131, N'4e51bfa2-7102-4af4-92d5-84957c465d1f', NULL, NULL, 6, 131, 144)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (132, N'078ba7aa-7967-4bc6-ac56-e7b60ac57656', NULL, NULL, 6, 131, 145)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (133, N'8d968af2-4742-452a-be2b-ba960180a3b4', NULL, NULL, 6, 131, 146)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (134, N'e2a77d1b-5d44-4df9-a353-5ff4885daf9b', NULL, NULL, 6, 131, 147)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (345, N'94d0e1c5-93a9-4f9f-b208-c743f834b0cf', NULL, NULL, 1, 131, 372)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (194, N'a5e951e5-539c-4b0b-968b-c2b56eae9c9f', NULL, NULL, 1, 133, 215)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (195, N'eafb5c54-50e8-4011-ab86-df52de4fd524', NULL, NULL, 1, 133, 217)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (196, N'61a0c591-38be-48b9-a72f-51cda3720372', NULL, NULL, 1, 133, 218)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (197, N'c81d5c92-759f-4c46-bd57-1f38e1930d8b', NULL, NULL, 1, 133, 219)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (198, N'48ab8c20-b5cb-408e-b106-bb9e0cc8f144', NULL, NULL, 1, 133, 220)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (199, N'7a33389d-549e-4572-968d-7b963a999b59', NULL, NULL, 1, 133, 221)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (219, N'ea09e2e2-83d8-47ad-840a-a6875d15112b', NULL, NULL, 1, 134, 246)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (220, N'02f9a696-71d2-42da-b577-d378af9419b5', NULL, NULL, 1, 134, 248)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (221, N'b206c13e-44c9-4526-99c6-c57aadd7b7db', NULL, NULL, 1, 134, 249)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (236, N'062cfca3-3038-4095-8499-5ee0d35663a3', NULL, NULL, 1, 136, 262)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (239, N'dbb5e2d9-bf0c-494c-a469-eed3050c3011', NULL, NULL, 1, 136, 264)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (240, N'2617e475-0b02-4c58-ade4-2e57298aafcd', NULL, NULL, 1, 136, 265)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (237, N'1b84c03c-6d78-457e-805e-790089dbefd7', NULL, NULL, 1, 136, 282)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (238, N'b80721a0-bda7-4d3c-9e3f-1dbecf4b58c7', NULL, NULL, 1, 136, 285)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (241, N'09086a15-78b1-458f-b518-bb6c99c5ef5f', NULL, NULL, 1, 136, 286)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (129, N'912f6648-c78f-4718-905d-81cbea6bbc52', NULL, NULL, 8, 138, 140)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (260, N'e3276e78-23b5-4630-86bc-4ad80f08ec7b', NULL, NULL, 4, 138, 143)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (261, N'89de4589-3d56-4357-96d0-0c1ce46e1495', NULL, NULL, 4, 138, 144)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (262, N'e94ea8be-fefb-4add-8480-78dfb63617e3', NULL, NULL, 4, 138, 145)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (263, N'b7815478-e924-4098-8a4f-24cf9ef7b34f', NULL, NULL, 4, 138, 146)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (264, N'f65366d0-2a8b-48a2-a19b-f91fb38ec2a2', NULL, NULL, 4, 138, 147)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (266, N'97472f1b-4224-4a26-a108-007c765d89dd', NULL, NULL, 1, 143, 299)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (275, N'52617acd-d113-4192-b114-6e7ffe9b9ec3', NULL, NULL, 1, 143, 304)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (283, N'6275d50c-c264-4892-a6cf-a14a8a624ac4', NULL, NULL, 1, 143, 315)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (282, N'220d2520-3fb2-477d-8d9f-f3e8d99c4d18', NULL, NULL, 1, 143, 317)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (284, N'26808b56-21a3-4756-89df-ec233c6767d6', NULL, NULL, 1, 143, 318)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (303, N'6c467adb-9bc0-4f24-943b-476e7c23907d', NULL, NULL, 1, 144, 324)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (308, N'61d0e3aa-1a35-4094-ac86-1328a16d9d70', NULL, NULL, 1, 144, 327)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (309, N'814856a9-0d52-4ec9-b93b-81a1aa585cf4', NULL, NULL, 1, 144, 329)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (310, N'cc4f1e60-6b01-4345-8ffb-db6d360b2889', NULL, NULL, 1, 144, 334)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (311, N'77dc3d51-95da-4c93-9fd9-dd6515b5c11c', NULL, NULL, 1, 144, 344)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (307, N'703a51f9-2cba-4d27-8304-bff53f93a8be', NULL, NULL, 1, 145, 326)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (347, N'59a7cc3f-3d3c-49a3-a319-24ff5e1d5518', NULL, NULL, 1, 145, 376)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (364, N'384b92dc-0d9d-4918-af9a-c82e386b05fc', NULL, NULL, 1, 145, 388)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (363, N'65848a1c-080a-48ff-b7e8-a9a63a03bef1', NULL, NULL, 1, 145, 392)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (358, N'05749554-911c-4efc-89c2-c704e2f14604', NULL, NULL, 1, 145, 398)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (348, N'4d87e8c8-b8eb-479b-9b3c-5a0fe76f3f5c', NULL, NULL, 1, 146, 373)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (346, N'67c324b9-cd70-4a74-b60d-b2865d5b6a53', NULL, NULL, 1, 146, 374)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (365, N'633585c6-f7be-4eb9-a355-f88a064aaaba', NULL, NULL, 1, 146, 404)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (366, N'df30d64c-a0ec-43f1-9196-1e7a234b6c95', NULL, NULL, 1, 146, 405)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (329, N'910fab26-6e20-4c77-828a-bde5b14d38c8', NULL, NULL, 1, 147, 349)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (316, N'b4ece958-a4c9-4873-9a81-2a1e91687ed4', NULL, NULL, 1, 147, 351)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (330, N'f303a2e3-e141-4e89-aaf8-0e19a21afb85', NULL, NULL, 1, 147, 352)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (331, N'7ad87204-0d37-42ea-908f-034e765c5ad0', NULL, NULL, 1, 147, 353)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (332, N'06ea9479-9959-4334-b910-f2f079706d26', NULL, NULL, 1, 147, 357)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (137, N'7b8198b8-6e0f-45c3-ba05-a09cc854575e', NULL, NULL, 8, 148, 149)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (64, N'7db01d10-0221-47b6-b571-38df8ac954ad', NULL, NULL, 1, 151, 86)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (65, N'3cdc27e5-dd79-4081-97a4-9b82ebc94ed7', NULL, NULL, 1, 151, 89)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (128, N'de0f5420-06dd-4f67-941b-20d481061d85', NULL, NULL, 1, 151, 138)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (136, N'4158eb21-5c44-4189-941a-b7a8c982aedf', NULL, NULL, 1, 151, 148)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (140, N'04ffce8b-3b82-4ecf-97b0-d1a9b74616a3', NULL, NULL, 1, 151, 152)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (141, N'42a6956d-91f9-4fbc-ba85-8169109cbdc7', NULL, NULL, 1, 151, 153)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (258, N'415f2dcb-3034-4840-ba7e-77d35ce18960', NULL, NULL, 4, 152, 166)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (160, N'da78adbc-c135-4af9-961b-0f30a0553b3e', NULL, NULL, 8, 152, 169)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (259, N'c8d7a0e0-3f44-4177-927c-41cc11a695be', NULL, NULL, 4, 153, 167)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (161, N'42f1c8d3-10b5-4467-8222-0cdf8b64e9f2', NULL, NULL, 8, 153, 168)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (146, N'7cacc78e-61ba-47f2-a2bf-74479a017270', NULL, NULL, 1, 158, 159)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (149, N'a42a1327-9a92-4db3-ad8d-bd020546bb5b', NULL, NULL, 1, 159, 160)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (150, N'79543bed-a051-46ad-b141-007610db67f2', NULL, NULL, 1, 159, 161)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (152, N'2057c728-6785-4273-9a92-071b66a4af1b', NULL, NULL, 1, 159, 163)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (164, N'e31536dc-1308-4cbf-953d-eaca526e99d9', NULL, NULL, 1, 166, 170)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (165, N'2d972636-0000-4623-a19e-85e6a8b9c894', NULL, NULL, 1, 166, 174)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (191, N'8bc80be1-1eea-4d92-9870-b385e2a3096c', NULL, NULL, 1, 166, 211)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (192, N'36f8ebe2-2f51-4613-b161-6819f703f6ee', NULL, NULL, 1, 166, 213)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (166, N'60a28427-9fea-4efe-90be-346bd012736e', NULL, NULL, 1, 167, 172)
GO
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (167, N'f78bdaa3-fc5d-483e-a730-791c8f3c7ef6', NULL, NULL, 1, 167, 173)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (193, N'58c2e9df-5709-46fc-987a-8e718023616a', NULL, NULL, 1, 167, 214)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (163, N'04b3b20f-5a9a-4497-8186-989f87a1656c', NULL, NULL, 6, 168, 167)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (162, N'b96d3259-ec16-4981-a064-d937ee4f23b5', NULL, NULL, 6, 169, 166)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (168, N'0f3a3622-1f56-408d-b2a3-0faa1a68e8cb', NULL, NULL, 1, 170, 175)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (169, N'a96717f9-78e0-4465-98b0-485efc470ec7', NULL, NULL, 1, 170, 177)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (180, N'cb8e97dc-5416-4a47-b057-4e74b2b2ecfc', NULL, NULL, 1, 170, 207)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (170, N'579fc57d-1640-4e8d-a87c-30b17b1927b4', NULL, NULL, 1, 172, 178)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (189, N'cb65ecef-e203-4854-9456-e239497692b1', NULL, NULL, 1, 172, 197)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (187, N'0eb2a05b-7761-4ad4-b62a-7b9fa9d75190', NULL, NULL, 1, 172, 199)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (185, N'7cf7babf-2888-459d-9628-5ef5f0ad4d8f', NULL, NULL, 1, 172, 201)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (183, N'c235b9d2-f70f-4e56-90ca-c4a77b5b25f2', NULL, NULL, 1, 172, 204)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (179, N'4216abcd-49d5-41c9-9773-765b205b2329', NULL, NULL, 1, 172, 208)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (177, N'6926ec03-bd8d-4564-83e4-ce792e3586a7', NULL, NULL, 1, 172, 210)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (173, N'8df6fcaa-3f12-473b-adbf-13f0cb734954', NULL, NULL, 1, 173, 190)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (174, N'd8af5776-e816-4207-89d8-98823c6efc55', NULL, NULL, 1, 173, 191)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (181, N'f7f9e3ec-f940-44a3-a589-45e2d1a94edf', NULL, NULL, 1, 173, 206)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (188, N'04441d21-317c-4315-a54f-19ebec3dbbe5', NULL, NULL, 1, 174, 198)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (186, N'56fc4d0a-9d68-4f0f-aeec-77a2f210d630', NULL, NULL, 1, 174, 200)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (184, N'738a1fcd-6b78-4c4e-b065-bbe58610a7db', NULL, NULL, 1, 174, 203)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (182, N'90a590ee-b170-4975-b30f-7d08214be920', NULL, NULL, 1, 174, 205)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (178, N'616548f6-b380-487a-adf7-e51af09b194c', NULL, NULL, 1, 174, 209)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (214, N'df69364f-0671-4601-8e0b-8ff3d236f2ea', NULL, NULL, 1, 215, 239)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (215, N'3dff5eb2-7e39-4eae-bdde-f9079e71f177', NULL, NULL, 1, 215, 240)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (216, N'b5d970dd-21d7-4eb4-a00c-ba3b6987f659', NULL, NULL, 1, 215, 241)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (218, N'b5f6c236-6403-4fe3-8cf1-dea155a88250', NULL, NULL, 1, 215, 244)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (217, N'4b737dce-419a-45cb-9ce4-a50fcbdf6f68', NULL, NULL, 1, 215, 245)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (210, N'993a4966-845a-4175-847b-a196e4e88137', NULL, NULL, 1, 217, 230)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (209, N'5650eeac-db04-4ffc-93ba-4cfd1ca344e0', NULL, NULL, 1, 217, 231)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (208, N'c945326d-d6d8-4ced-a885-440d6b7067f2', NULL, NULL, 1, 217, 233)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (207, N'4aac788f-d890-4d5c-bbf6-a23fa60eb54c', NULL, NULL, 1, 217, 234)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (206, N'4ae92bca-173e-4402-8f23-b68d6386148d', NULL, NULL, 1, 217, 235)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (202, N'48b8db00-1ba2-4bf1-abcc-06d113dd8dc3', NULL, NULL, 1, 218, 224)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (203, N'b0e0dcd3-78c5-4c35-a16a-d4f34b8ef06a', NULL, NULL, 1, 218, 227)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (204, N'dd9244eb-b559-4019-95ca-241ceb5b0f54', NULL, NULL, 1, 218, 228)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (205, N'58e6afe1-92cb-48c5-b727-776116402bc7', NULL, NULL, 1, 218, 229)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (211, N'7273bf05-8e52-4bff-8137-70b9c729320a', NULL, NULL, 1, 219, 236)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (212, N'845c7b98-8e35-42b2-98e0-a3b89eb4d85d', NULL, NULL, 1, 219, 237)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (213, N'1eec9dc3-b7c2-4cc6-8ce9-20f56c4f451b', NULL, NULL, 1, 219, 238)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (200, N'8a793e89-987e-4406-a3a6-e93d35e0e74b', NULL, NULL, 1, 220, 222)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (201, N'9b2d08d7-3221-435c-a7ab-aaa53586b696', NULL, NULL, 1, 220, 223)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (229, N'39378b56-6226-4d00-91fb-e9bd0fd0c54f', NULL, NULL, 1, 246, 256)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (228, N'7f071555-cd3a-4065-8c77-f7b7ea3a9edb', NULL, NULL, 1, 246, 257)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (227, N'ed091f9a-befa-4212-9ea1-c77c1458b368', NULL, NULL, 1, 246, 258)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (226, N'a5be6c27-26e3-4b43-bae3-0e78acd113c2', NULL, NULL, 1, 246, 259)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (225, N'b7e30524-4b9d-4c9c-9cd2-f0c249903819', NULL, NULL, 1, 246, 260)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (231, N'e55622c4-3e2f-4bba-8b97-88005945afa0', NULL, NULL, 4, 248, 252)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (232, N'1debfe1b-efba-4cc4-8972-2b9ba0f265aa', NULL, NULL, 1, 248, 253)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (233, N'c4e4d4cc-8f71-4405-9ec0-73f2a9e185de', NULL, NULL, 1, 248, 254)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (230, N'cf79d002-4bb1-49fa-88ad-c5726ebedaae', NULL, NULL, 1, 248, 255)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (234, N'3ee03a50-7c7c-4054-b357-249442933bdf', NULL, NULL, 1, 249, 250)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (235, N'ccab19b6-6b22-41c3-9c82-777b3d203e34', NULL, NULL, 1, 249, 251)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (242, N'f997cb2a-2fd1-4a72-8ed7-78c494e13ea0', NULL, NULL, 1, 262, 266)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (243, N'14df1345-6c1f-4658-9dd2-77131f1d27ed', NULL, NULL, 1, 262, 267)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (244, N'9031ed20-e269-4b92-a084-9220eaac6f5a', NULL, NULL, 1, 262, 268)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (245, N'd690fef9-d045-4ecc-8df8-50dbf79a00d9', NULL, NULL, 1, 262, 269)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (246, N'c0c81dec-c7f8-4b1b-99b9-bbc89ed5387e', NULL, NULL, 1, 262, 270)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (247, N'acef0c55-7b88-445b-be0c-593c44357477', NULL, NULL, 1, 264, 271)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (248, N'09aa2ad8-83ad-44bf-99c5-87484ec2335d', NULL, NULL, 1, 264, 272)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (249, N'0ba8117c-a67c-46ab-bee0-f03b11f3e327', NULL, NULL, 1, 264, 273)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (250, N'5fca01b1-a2dd-4b17-8eae-1952ddaba0f1', NULL, NULL, 1, 264, 274)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (251, N'651a18a8-44de-4a9d-acff-0c420d10511f', NULL, NULL, 1, 264, 275)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (252, N'd11887c6-48ef-43ed-b77f-2d20df7c7651', NULL, NULL, 1, 265, 276)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (253, N'cf2f7c6c-33ae-46d2-bbe8-7cabd4120623', NULL, NULL, 1, 265, 278)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (255, N'e735adff-c283-4441-a6b6-5551874b60c9', NULL, NULL, 1, 265, 280)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (254, N'25e2cfc3-4875-4766-8362-34c61efb14df', NULL, NULL, 1, 265, 281)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (256, N'cee3c4bc-5e8f-4d3c-ae2b-5668374b6db0', NULL, NULL, 1, 282, 283)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (257, N'1731da76-f6fc-474f-a6f9-303493e4cd66', NULL, NULL, 1, 282, 284)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (265, N'95dea53f-d0b0-4b6d-baf2-680df2ab9d05', NULL, NULL, 6, 287, 252)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (267, N'f851059b-eb89-487d-bd14-537026b55560', NULL, NULL, 1, 299, 300)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (268, N'2234af0b-7833-4927-a281-fa320cb71397', NULL, NULL, 1, 299, 301)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (269, N'eae50063-1103-429a-a62c-56488976362e', NULL, NULL, 1, 299, 302)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (270, N'368dac2b-6190-4296-880b-1a8354d91f7d', NULL, NULL, 1, 299, 303)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (271, N'4610a959-646d-4c99-9545-9c7cb73fe6e8', NULL, NULL, 1, 304, 305)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (272, N'bdd24bc4-b4e9-48ed-9b59-a4bc48f0eb1c', NULL, NULL, 1, 304, 306)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (273, N'57dba8ee-cdae-41e8-8001-76258d639ac8', NULL, NULL, 1, 304, 307)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (274, N'987983c9-e616-4cdc-a9c7-7ca1f5fd47b1', NULL, NULL, 1, 304, 308)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (277, N'bafb5a48-0077-4b79-a6f3-671a9a6c6474', NULL, NULL, 1, 304, 309)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (278, N'ffad487d-c57e-48fb-bb96-835c6776b388', NULL, NULL, 1, 304, 310)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (279, N'2b60e307-bf25-4f8d-bc8a-9e87c559b7fc', NULL, NULL, 1, 304, 311)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (280, N'fb447fd7-6c03-40ef-800a-500825361a03', NULL, NULL, 1, 311, 312)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (281, N'142cf56d-652f-46b7-b830-594ed99e23f7', NULL, NULL, 1, 311, 313)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (285, N'2be2160b-113b-4557-9459-59475bbc066f', NULL, NULL, 1, 318, 319)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (286, N'b2a4dd92-f4cb-4101-acf5-768d66b119a6', NULL, NULL, 1, 318, 320)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (287, N'db668f6c-0407-4c5c-9193-75cd71574d7a', NULL, NULL, 1, 318, 322)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (288, N'2d0ac621-e811-41c2-acf8-7b61c391bb24', NULL, NULL, 1, 318, 323)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (289, N'b22eb642-39a3-4b98-85bb-ea96b1056c19', NULL, NULL, 1, 324, 325)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (313, N'6ad2ce9c-690b-4941-b823-0a87654f7573', NULL, NULL, 1, 324, 347)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (314, N'ec2c99be-5960-4ae4-b616-7c83cba79fec', NULL, NULL, 1, 324, 348)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (362, N'e6b2e62d-92ff-443b-99e5-50b3d56911ca', NULL, NULL, 1, 326, 399)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (359, N'339ae8ad-27ee-4327-a3e4-a8f4fa0e5489', NULL, NULL, 1, 326, 400)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (360, N'd36b9b6c-7310-468d-9352-000d3636b173', NULL, NULL, 1, 326, 401)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (361, N'88029b92-9531-412f-bb47-cb6abdb1bfa9', NULL, NULL, 1, 326, 402)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (290, N'5bd8b065-6fca-4e3a-b977-6af641989483', NULL, NULL, 1, 327, 328)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (312, N'7573210a-ed63-4477-9ec7-1eaa24953218', NULL, NULL, 1, 327, 346)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (291, N'06c7cfeb-38ab-4cb5-821c-8702c36a2320', NULL, NULL, 1, 329, 330)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (292, N'5ee4fbef-662d-433b-86c1-cbeaddc1b9bb', NULL, NULL, 1, 329, 331)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (293, N'3523d42b-4d3b-44b8-9a43-f16903d31179', NULL, NULL, 1, 329, 332)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (294, N'8ed53fae-dfb2-47d3-af13-20101fbe3016', NULL, NULL, 1, 329, 333)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (295, N'23f881cc-fb3b-4707-ad7a-262d185462d7', NULL, NULL, 1, 334, 335)
GO
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (296, N'50b61ba7-dbb0-4a65-8810-eccc262b249e', NULL, NULL, 1, 334, 336)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (297, N'5640e4ce-36fb-48ca-b9db-a8677cc09b07', NULL, NULL, 1, 334, 337)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (298, N'71885b22-8764-42dc-8a6f-c0d655b74aa8', NULL, NULL, 1, 334, 338)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (299, N'f086a504-4e6a-47ce-b15c-5d3f77c57267', NULL, NULL, 1, 334, 339)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (300, N'bf0825e1-1aac-4e80-8c17-0f43b97962b5', NULL, NULL, 1, 334, 340)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (301, N'd2254b64-ad61-4b1b-87b1-4322ca2229cc', NULL, NULL, 1, 340, 341)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (302, N'6e78478a-854d-4bac-89af-2c98f8b29f39', NULL, NULL, 1, 340, 342)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (315, N'cedd34fb-dd66-4370-88ae-aee4c6fed3ee', NULL, NULL, 1, 349, 350)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (335, N'73e88214-2002-4ec9-b113-cdfae5d16764', NULL, NULL, 1, 349, 367)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (334, N'9f2ec807-1c91-4820-9055-e539f024f67a', NULL, NULL, 1, 349, 369)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (333, N'c17a8d0b-3e78-44cd-8c71-35d602d469af', NULL, NULL, 1, 349, 371)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (317, N'41f61fd1-9a3d-4eca-afda-42c024adc255', NULL, NULL, 1, 353, 354)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (318, N'63a1d200-efd6-499f-aad2-18ccc6110056', NULL, NULL, 1, 353, 355)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (319, N'1a0f869c-24d4-4b1f-bbaa-869dd463b4e9', NULL, NULL, 1, 353, 356)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (320, N'abc92ea1-4bff-463c-84f4-302c8aa57230', NULL, NULL, 1, 357, 358)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (321, N'c416dc9c-9323-487e-919e-803229ba3e5a', NULL, NULL, 1, 357, 359)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (322, N'f52b149c-8b7f-4cf4-aeb5-360d53bfd53a', NULL, NULL, 1, 357, 360)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (323, N'4243716b-de76-43cf-a73e-8dc2b46016fb', NULL, NULL, 1, 357, 361)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (324, N'0f576b3c-1f4c-4ac4-bbda-db95b8bdc867', NULL, NULL, 1, 357, 362)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (325, N'041d1041-c2ed-4d65-8b3c-5c926eeefa30', NULL, NULL, 1, 357, 363)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (326, N'f3c1f505-e545-4ab3-a5ab-5647927e8b49', NULL, NULL, 1, 363, 364)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (327, N'9aa97f84-8d1a-44c3-b639-90f860687f60', NULL, NULL, 1, 363, 365)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (336, N'53540f68-630d-4825-a9d7-cc6dfbabd4ca', NULL, NULL, 1, 374, 375)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (337, N'3c34d3fa-6a25-45a8-b28e-4ebaf1e4ac94', NULL, NULL, 1, 376, 377)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (338, N'56b7be5f-144c-420d-a4f0-4fde0585df29', NULL, NULL, 1, 376, 378)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (339, N'73a2f5e8-19b4-4193-852d-1b9b0170707d', NULL, NULL, 1, 376, 379)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (340, N'40f1531b-f9ee-4c47-9492-e3252e4d0f33', NULL, NULL, 1, 376, 380)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (341, N'e1d28843-5f93-4ced-b48f-2a0c149a0147', NULL, NULL, 1, 376, 381)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (342, N'19a1d49f-0c63-406c-b5cc-620b1c45e754', NULL, NULL, 1, 376, 382)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (343, N'b56968bd-caa6-457b-90fc-8f1f9e9a725c', NULL, NULL, 1, 382, 383)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (344, N'6bf92055-58d2-4f5a-aa30-5ba6e19ce3ad', NULL, NULL, 1, 382, 384)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (349, N'1efe0566-0ca0-444c-9170-8430cd5ab8d7', NULL, NULL, 1, 388, 389)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (350, N'742f7b0e-cd01-44e2-ab04-839fdbc581a2', NULL, NULL, 1, 388, 390)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (351, N'ff8692ec-2878-4b39-aac8-955cce067265', NULL, NULL, 1, 388, 391)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (352, N'c5538a38-7e3d-44a4-9a68-ef7d025c4d08', NULL, NULL, 1, 392, 393)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (353, N'db3c5d52-4e0f-4663-9f45-b68573d7035e', NULL, NULL, 1, 392, 394)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (354, N'6dce5cfc-ffe4-464a-ac24-0678e38c71b7', NULL, NULL, 1, 392, 395)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (355, N'bd6acd8f-095a-4dbf-ae9c-5554e044d99f', NULL, NULL, 1, 392, 396)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (356, N'3d22c862-733d-4495-8c04-e4b52d33db08', NULL, NULL, 1, 392, 397)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (367, N'a24eeed1-05ec-4df2-bfad-07fbb5bc946e', NULL, NULL, 1, 405, 407)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (368, N'3ee6df98-a8f8-4498-99b9-1c20dd63faf8', NULL, NULL, 1, 405, 408)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (369, N'5d0c27d0-1609-480c-8cac-34d1de47fae5', NULL, NULL, 1, 405, 409)
INSERT [dbo].[Relationship] ([RelationshipId], [RelationshipGuid], [RelFrom], [RelTo], [RelTypeIdx], [RelFromUnitId], [RelToUnitId]) VALUES (370, N'c5883238-d739-4d88-a93e-fb39beaec5c0', NULL, NULL, 1, 405, 410)
SET IDENTITY_INSERT [dbo].[Relationship] OFF
SET IDENTITY_INSERT [dbo].[RelationshipType] ON 

INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Name], [Notes]) VALUES (1, N'Organic', N'Organic assets are assigned to and forming an essential part of a military organization. Organic assets are those listed in the unit''s MTOE, and are in this command relationship when conducting missions in support of their own unit.')
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Name], [Notes]) VALUES (2, N'Assigned', N'Assigned is to place units or personnel in an organization where such placement is relatively permanent, and/or where such organization controls or administers the unit or personnel for the primary functions of the unit. As in organic, units will have this relationship when C2 is exercised by their parent headquarters.')
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Name], [Notes]) VALUES (3, N'Attached', N'Attached is the placement of units or personnel in an organization where such placement is relatively temporary. The commander of the unit that receives the attachment is responsible for the sustainment and logistics support that is beyond the capability of the attached unit. An example of this relationship is a cargo helicopter platoon being attached to a division for the duration of an operation.')
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Name], [Notes]) VALUES (4, N'OPCON', N'Operational Control OPCON is a "command relationship that gives a commander the authority over subordinate forces to organize and employ the assets, designate objectives, assign tasks, and give direction regarding accomplishment of the mission. The commander exercising OPCON authority has no responsibility for logistics sustainment of the supporting unit.')
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Name], [Notes]) VALUES (5, N'TACON', N'Tactical Control TACON is a command relationship that gives a commander authority over assigned or attached forces or commands, or military capability or forces made available for tasking, that is limited to the detailed, and, usually, local direction and control of movements or maneuvers necessary to accomplish missions or tasks assigned.')
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Name], [Notes]) VALUES (6, N'ADCON', NULL)
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Name], [Notes]) VALUES (7, N'Detached', NULL)
INSERT [dbo].[RelationshipType] ([RelationshipTypeId], [Name], [Notes]) VALUES (8, N'TaskForce', NULL)
SET IDENTITY_INSERT [dbo].[RelationshipType] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ServiceId], [Name], [SortOrder]) VALUES (1, N'Navy', 10)
INSERT [dbo].[Service] ([ServiceId], [Name], [SortOrder]) VALUES (2, N'Army', 20)
INSERT [dbo].[Service] ([ServiceId], [Name], [SortOrder]) VALUES (3, N'AirForce', 30)
INSERT [dbo].[Service] ([ServiceId], [Name], [SortOrder]) VALUES (4, N'Marines', 40)
INSERT [dbo].[Service] ([ServiceId], [Name], [SortOrder]) VALUES (6, N'CoastGuard', 50)
INSERT [dbo].[Service] ([ServiceId], [Name], [SortOrder]) VALUES (7, N'FleetAuxiliary', 60)
INSERT [dbo].[Service] ([ServiceId], [Name], [SortOrder]) VALUES (8, N'Joint', 5)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([ServiceTypeId], [Name], [SortOrder]) VALUES (1, N'Active', 10)
INSERT [dbo].[ServiceType] ([ServiceTypeId], [Name], [SortOrder]) VALUES (2, N'Integrated', 20)
INSERT [dbo].[ServiceType] ([ServiceTypeId], [Name], [SortOrder]) VALUES (3, N'Reserve', 30)
INSERT [dbo].[ServiceType] ([ServiceTypeId], [Name], [SortOrder]) VALUES (4, N'Volunteer', 40)
INSERT [dbo].[ServiceType] ([ServiceTypeId], [Name], [SortOrder]) VALUES (5, N'StateVolunteer', 50)
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'91e317c8-3ca3-4040-9d95-148087f896fb', 200, 1, N'Tennessee', N'SSBN', 734, N'S', 734, 0, N'Tennessee', N'SSBN', 734, 0, NULL, CAST(N'1988-12-17' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'19e62ea0-a063-4a46-83cc-1520eb2b2ec9', 204, 1, N'Kentucky', N'SSBN', 737, N'S', 737, 0, N'Kentucky', N'SSBN', 737, 0, NULL, CAST(N'1991-07-13' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'8224bdb8-14e3-4d01-97ff-1d4be75dc5d2', 197, 1, N'Alabama', N'SSBN', 731, N'S', 731, 0, N'Alabama', N'SSBN', 731, 0, NULL, CAST(N'1985-05-25' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'7bd50410-1032-4351-a13c-219c4e683a37', 190, 1, N'Ohio', N'SSGN', 726, N'S', 726, 0, N'Ohio', N'SSGN', 726, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'02fe6955-e89e-4a2a-b867-29cb3c7b35a6', 175, 1, N'Florida', N'SSGN', 728, N'S', 728, 0, N'Florida', N'SSGN', 728, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'749e266c-40c3-4647-b628-2bd78d24258e', 198, 1, N'Alaska', N'SSBN', 732, N'S', 732, 0, N'Alaska', N'SSBN', 732, 0, NULL, CAST(N'1986-01-25' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'217eb1e8-82a6-4a8c-b370-2cbcb51c2221', 201, 1, N'Pennsylvania', N'SSBN', 735, N'S', 735, 0, N'Pennsylvania', N'SSBN', 735, 0, NULL, CAST(N'1989-09-09' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'e6019e29-1902-49ae-a927-40a4897dc76c', 199, 1, N'Nevada', N'SSBN', 733, N'S', 733, 0, N'Nevada', N'SSBN', 733, 0, NULL, CAST(N'1986-08-16' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'7d30d232-79d9-45eb-8efd-53882437be04', 206, 1, N'Nebraska', N'SSBN', 739, N'S', 739, 0, N'Nebraska', N'SSBN', 739, 0, NULL, CAST(N'1993-07-10' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'3c821b8d-b8bc-4eb1-aa0b-56edb15d467e', 209, 1, N'Wyoming', N'SSBN', 742, N'S', 742, 0, N'Wyoming', N'SSBN', 742, 0, NULL, CAST(N'1996-07-13' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'2eea83dd-2d33-46c0-a3bb-63476feb4836', 208, 1, N'Maine', N'SSBN', 741, N'S', 741, 0, N'Maine', N'SSBN', 741, 0, NULL, CAST(N'1995-07-29' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'22af0314-e4d0-4bfa-a1bc-6a682af4c00b', 193, 3, N'Florida', N'SSBN', 728, N'S', 728, 0, N'Florida', N'SSBN', 728, 1, N'02fe6955-e89e-4a2a-b867-29cb3c7b35a6', CAST(N'1983-06-18' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'0cbabc8c-9897-443d-95fe-735da75bb33f', 207, 1, N'Rhode Island', N'SSBN', 740, N'S', 740, 0, N'Rhode Island', N'SSBN', 740, 0, NULL, CAST(N'1994-07-09' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'2952e172-ac2f-4d74-901a-805823a9eb84', 187, 3, N'Michigan', N'SSBN', 727, N'S', 727, 0, N'Ohio', N'SSBN', 727, 1, N'95172ee5-1841-430a-9c78-dc605fccd3a0', CAST(N'1982-09-11' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'25cbff50-9c5b-48af-864d-8759e7c57b00', 186, 3, N'Ohio', N'SSBN', 726, N'S', 726, 0, N'Ohio', N'SSBN', 726, 1, N'7bd50410-1032-4351-a13c-219c4e683a37', CAST(N'1981-11-11' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'cb701f87-34d1-44a5-8080-9845a5e709e1', 210, 1, N'Louisiana', N'SSBN', 743, N'S', 743, 0, N'Louisiana', N'SSBN', 743, 0, NULL, CAST(N'1997-09-06' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'06c3dd81-e5e3-4865-bf26-a56183296483', 203, 1, N'West Virginia', N'SSBN', 736, N'S', 736, 0, N'West Virginia', N'SSBN', 736, 0, NULL, CAST(N'1990-10-20' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'141fd4ea-9b08-4a27-8e31-a9ffdefe0b46', 196, 3, N'Georgia', N'SSBN', 729, N'S', 729, 0, N'Georgia', N'SSBN', 729, 1, N'91c12988-ffe1-4163-8c36-d30d67844fae', CAST(N'1984-02-11' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'ed2c7c37-56c1-41e8-9cc7-b75bcd6d8674', 205, 1, N'Maryland', N'SSBN', 738, N'S', 738, 0, N'Maryland', N'SSBN', 738, 0, NULL, CAST(N'1992-06-13' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'73b0ca04-73cb-4dd9-8503-cbdae5be8763', 178, 1, N'Henry M. Jackson', N'SSBN', 730, N'S', 730, 0, N'Henry M. Jackson', N'SSBN', 730, 0, NULL, CAST(N'1984-10-16' AS Date), NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'91c12988-ffe1-4163-8c36-d30d67844fae', 177, 1, N'Georgia', N'SSGN', 729, N'S', 729, 0, N'Georgia', N'SSGN', 729, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Ship] ([ShipId], [UnitId], [ShipPrefixId], [Name], [HCS], [HCSNumber], [PennantCode], [PennantNumber], [IsBase], [AltName], [AltHCS], [AltHCSNumber], [IsInactive], [NewShipId], [Commissioned], [Decommissioned], [ShipClassId]) VALUES (N'95172ee5-1841-430a-9c78-dc605fccd3a0', 191, 1, N'Michigan', N'SSGN', 727, N'S', 727, 0, N'Ohio', N'SSGN', 727, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ShipClass] ON 

INSERT [dbo].[ShipClass] ([ShipClassId], [ClassName], [ClassCodeHCS], [ClassCodeNumber], [ModFrom], [ModName]) VALUES (1, N'Ohio', N'SSBN', 726, NULL, NULL)
INSERT [dbo].[ShipClass] ([ShipClassId], [ClassName], [ClassCodeHCS], [ClassCodeNumber], [ModFrom], [ModName]) VALUES (2, N'Ohio', N'SSGN', 726, 1, N'SSGN refit')
SET IDENTITY_INSERT [dbo].[ShipClass] OFF
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'91e317c8-3ca3-4040-9d95-148087f896fb', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'19e62ea0-a063-4a46-83cc-1520eb2b2ec9', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'8224bdb8-14e3-4d01-97ff-1d4be75dc5d2', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'7bd50410-1032-4351-a13c-219c4e683a37', 2, 1)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'02fe6955-e89e-4a2a-b867-29cb3c7b35a6', 2, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'749e266c-40c3-4647-b628-2bd78d24258e', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'217eb1e8-82a6-4a8c-b370-2cbcb51c2221', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'e6019e29-1902-49ae-a927-40a4897dc76c', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'7d30d232-79d9-45eb-8efd-53882437be04', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'3c821b8d-b8bc-4eb1-aa0b-56edb15d467e', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'2eea83dd-2d33-46c0-a3bb-63476feb4836', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'22af0314-e4d0-4bfa-a1bc-6a682af4c00b', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'0cbabc8c-9897-443d-95fe-735da75bb33f', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'2952e172-ac2f-4d74-901a-805823a9eb84', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'25cbff50-9c5b-48af-864d-8759e7c57b00', 1, 1)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'cb701f87-34d1-44a5-8080-9845a5e709e1', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'06c3dd81-e5e3-4865-bf26-a56183296483', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'141fd4ea-9b08-4a27-8e31-a9ffdefe0b46', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'ed2c7c37-56c1-41e8-9cc7-b75bcd6d8674', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'73b0ca04-73cb-4dd9-8503-cbdae5be8763', 1, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'91c12988-ffe1-4163-8c36-d30d67844fae', 2, 0)
INSERT [dbo].[ShipClassMember] ([ShipId], [ShipClassId], [IsLeadBoat]) VALUES (N'95172ee5-1841-430a-9c78-dc605fccd3a0', 2, 0)
SET IDENTITY_INSERT [dbo].[ShipPrefix] ON 

INSERT [dbo].[ShipPrefix] ([ShipPrefixId], [ShipPrefix]) VALUES (1, N'HMS')
INSERT [dbo].[ShipPrefix] ([ShipPrefixId], [ShipPrefix]) VALUES (2, N'PCU')
INSERT [dbo].[ShipPrefix] ([ShipPrefixId], [ShipPrefix]) VALUES (3, N'ex')
SET IDENTITY_INSERT [dbo].[ShipPrefix] OFF
SET IDENTITY_INSERT [dbo].[SortOrder] ON 

INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (1, N'TRANSCOM', 110)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (4, N'CYBERCOM', 120)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (5, N'JFCOM-OPS', 10)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (6, N'PACOM', 60)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (7, N'EUCOM', 30)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (8, N'SOUTHCOM', 70)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (9, N'CENTCOM', 50)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (10, N'NORTHCOM', 40)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (11, N'AFRICOM', 80)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (12, N'SOCOM', 100)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (13, N'AIR@COM', 444)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (14, N'STRATCOM', 20)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (15, N'JFOR', 130)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (16, N'INDIACOM', 90)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (17, N'SUB/', 300)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (18, N'ARFOR', 160)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (19, N'NAVFOR', 150)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (20, N'AIRFOR', 170)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (21, N'MARFOR', 180)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (23, N'NSSC', 500)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (24, N'MDEF', 275)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (25, N'SPACE', 250)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (26, N'NAVSURFOR', 175)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (27, N'NAVSUBFOR', 176)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (28, N'NAVAIRFOR', 177)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (29, N'AIR/OPS', 400)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (30, N'AIR/MS', 440)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (31, N'AIR/SF', 460)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (32, N'AIR/MX', 420)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (33, N'AIR/MD', 480)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (35, N'AIR@FLY', 404)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (37, N'AIR@CPT', 415)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (38, N'AIR@MDO', 485)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (39, N'AIR@MDS', 488)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (40, N'AIR@SF', 462)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (41, N'AIR@MSF', 464)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (42, N'AIR@SS', 466)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (43, N'AIR@CE', 442)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (44, N'AIR@FS', 448)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (46, N'AIR@CON', 446)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (47, N'AIR@LR', 450)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (49, N'AIR@MMX', 431)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (50, N'AIR@MO', 435)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (51, N'AIR@MUN', 439)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (52, N'AIR@OPS', 405)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (53, N'AIR@TRG', 410)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (54, N'AIR@AMX', 421)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (55, N'AIR@MX', 430)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (56, N'AIR@CMX', 423)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (57, N'AIR@EMX', 424)
INSERT [dbo].[SortOrder] ([SortOrderId], [SearchTerm], [SortOrderRank]) VALUES (58, N'AIR/AO', 401)
SET IDENTITY_INSERT [dbo].[SortOrder] OFF
INSERT [dbo].[TaskForce] ([UnitId], [TaskForceName], [TaskForceNo], [TaskGroup], [TaskUnit], [TaskElement], [SortName]) VALUES (86, NULL, 124, NULL, NULL, NULL, N'_124')
INSERT [dbo].[TaskForce] ([UnitId], [TaskForceName], [TaskForceNo], [TaskGroup], [TaskUnit], [TaskElement], [SortName]) VALUES (89, NULL, 214, NULL, NULL, NULL, N'_214')
INSERT [dbo].[TaskForce] ([UnitId], [TaskForceName], [TaskForceNo], [TaskGroup], [TaskUnit], [TaskElement], [SortName]) VALUES (138, NULL, 204, NULL, NULL, NULL, N'_204')
INSERT [dbo].[TaskForce] ([UnitId], [TaskForceName], [TaskForceNo], [TaskGroup], [TaskUnit], [TaskElement], [SortName]) VALUES (148, N'- Global Network Operations', NULL, NULL, NULL, NULL, N'Global Network Operations')
INSERT [dbo].[TaskForce] ([UnitId], [TaskForceName], [TaskForceNo], [TaskGroup], [TaskUnit], [TaskElement], [SortName]) VALUES (152, NULL, 134, NULL, NULL, NULL, N'_134')
INSERT [dbo].[TaskForce] ([UnitId], [TaskForceName], [TaskForceNo], [TaskGroup], [TaskUnit], [TaskElement], [SortName]) VALUES (153, NULL, 144, NULL, NULL, NULL, N'_144')
SET IDENTITY_INSERT [dbo].[Tennant] ON 

INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (1, 1, 38, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (2, 2, 4, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (4, 3, 13, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (3, 5, 9, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (5, 8, 15, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (6, 9, 51, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (7, 9, 53, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (25, 9, 56, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (26, 9, 169, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (8, 10, 37, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (15, 10, 148, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (9, 11, 78, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (10, 11, 79, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (11, 11, 80, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (14, 11, 81, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (16, 12, 133, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (87, 12, 215, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (85, 12, 217, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (84, 12, 218, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (83, 12, 219, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (82, 12, 220, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (81, 12, 221, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (80, 12, 222, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (79, 12, 223, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (78, 12, 224, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (77, 12, 227, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (76, 12, 228, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (75, 12, 229, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (74, 12, 230, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (73, 12, 231, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (72, 12, 233, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (71, 12, 234, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (70, 12, 235, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (69, 12, 236, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (68, 12, 237, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (66, 12, 238, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (64, 12, 239, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (63, 12, 240, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (61, 12, 241, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (60, 12, 244, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (59, 12, 245, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (18, 13, 134, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (170, 13, 144, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (89, 13, 246, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (95, 13, 248, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (101, 13, 249, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (102, 13, 250, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (103, 13, 251, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (97, 13, 252, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (98, 13, 253, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (99, 13, 254, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (100, 13, 255, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (90, 13, 256, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (91, 13, 257, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (92, 13, 258, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (93, 13, 259, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (94, 13, 260, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (152, 13, 324, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (174, 13, 325, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (154, 13, 327, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (171, 13, 328, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (156, 13, 329, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (157, 13, 330, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (158, 13, 331, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (159, 13, 332, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (160, 13, 333, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (161, 13, 334, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (162, 13, 335, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (163, 13, 336, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (164, 13, 337, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (165, 13, 338, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (166, 13, 339, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (167, 13, 340, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (168, 13, 341, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (169, 13, 342, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (173, 13, 344, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (172, 13, 346, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (175, 13, 347, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (176, 13, 348, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (21, 14, 136, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (105, 14, 262, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (110, 14, 264, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (111, 14, 265, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (106, 14, 266, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (107, 14, 267, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (108, 14, 268, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (126, 14, 269, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (109, 14, 270, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (112, 14, 271, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (113, 14, 272, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (114, 14, 273, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (115, 14, 274, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (116, 14, 275, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (117, 14, 276, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (118, 14, 278, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (119, 14, 280, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (120, 14, 281, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (121, 14, 282, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (122, 14, 283, 0)
GO
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (123, 14, 284, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (124, 14, 285, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (104, 14, 286, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (23, 15, 158, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (24, 16, 159, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (27, 17, 166, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (28, 17, 170, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (29, 17, 174, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (36, 17, 175, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (37, 17, 177, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (38, 17, 198, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (39, 17, 200, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (40, 17, 203, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (41, 17, 205, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (35, 17, 207, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (42, 17, 209, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (43, 17, 211, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (45, 17, 213, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (34, 18, 167, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (31, 18, 172, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (32, 18, 173, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (46, 18, 178, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (55, 18, 190, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (56, 18, 191, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (47, 18, 197, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (48, 18, 199, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (49, 18, 201, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (50, 18, 204, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (54, 18, 206, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (51, 18, 208, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (52, 18, 210, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (57, 18, 214, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (30, 19, 168, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (127, 22, 138, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (128, 22, 143, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (135, 22, 299, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (136, 22, 300, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (139, 22, 301, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (138, 22, 302, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (137, 22, 303, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (141, 22, 304, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (142, 22, 305, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (143, 22, 306, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (144, 22, 307, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (145, 22, 308, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (146, 22, 309, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (147, 22, 310, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (148, 22, 311, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (150, 22, 312, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (149, 22, 313, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (129, 22, 315, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (151, 22, 317, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (130, 22, 318, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (134, 22, 319, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (133, 22, 320, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (132, 22, 322, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (131, 22, 323, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (194, 23, 147, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (177, 23, 349, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (178, 23, 350, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (179, 23, 351, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (180, 23, 352, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (181, 23, 353, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (182, 23, 354, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (183, 23, 355, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (184, 23, 356, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (185, 23, 357, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (186, 23, 358, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (187, 23, 359, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (188, 23, 360, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (189, 23, 361, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (190, 23, 362, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (191, 23, 363, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (192, 23, 364, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (193, 23, 365, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (197, 23, 367, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (196, 23, 369, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (195, 23, 371, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (210, 24, 145, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (222, 24, 326, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (198, 24, 372, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (199, 24, 374, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (200, 24, 375, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (201, 24, 376, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (202, 24, 377, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (203, 24, 378, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (204, 24, 379, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (205, 24, 380, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (206, 24, 381, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (207, 24, 382, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (208, 24, 383, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (209, 24, 384, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (211, 24, 388, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (212, 24, 389, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (213, 24, 390, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (214, 24, 391, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (215, 24, 392, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (216, 24, 393, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (217, 24, 394, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (218, 24, 395, 0)
GO
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (219, 24, 396, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (220, 24, 397, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (221, 24, 398, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (223, 24, 399, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (224, 24, 400, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (225, 24, 401, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (226, 24, 402, 0)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (227, 25, 146, 1)
INSERT [dbo].[Tennant] ([TennancyId], [BaseId], [UnitId], [IsHost]) VALUES (228, 25, 404, 0)
SET IDENTITY_INSERT [dbo].[Tennant] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (4, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Forces Headquarters', NULL, 8, 1, NULL, N'ae6f5b41-edcb-447f-b1ab-d34b424bec55', N'-', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (9, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Forces Command Operations', NULL, 8, 1, NULL, N'5b53631a-c25a-49c4-8501-848f7124b710', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (13, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Forces Command - Central Europe', NULL, 8, 1, NULL, N'433f5cc8-240e-490b-9c09-46f7ca6d75da', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (14, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Forces Command - Northern Europe', NULL, 8, 1, NULL, N'5f0f5abe-2c44-490f-a65f-047d52275d15', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (15, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Forces Command - Southern Europe', NULL, 8, 1, NULL, N'8398a02f-1d9e-4ca4-bfe9-7a35fb4e7dec', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (16, NULL, 0, NULL, NULL, NULL, NULL, N'Army Forces, Europe', NULL, 2, 1, NULL, N'9308df70-66ac-4861-a9bd-6c30411cd964', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (17, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Forces, Europe', NULL, 1, 1, NULL, N'e2f31a38-0a55-4edf-9052-afeea7d50ca8', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (18, NULL, 0, NULL, NULL, NULL, NULL, N'Air Forces, Europe', NULL, 3, 1, NULL, N'b67a1af1-2f35-4968-9ffe-51b2e9b68558', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (19, NULL, 0, NULL, NULL, NULL, NULL, N'Marine Forces, Europe', NULL, 4, 1, NULL, N'73a111f5-ced0-48ad-b9dd-8df1a48fcc29', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (20, NULL, 0, NULL, NULL, NULL, NULL, N'Coast Guard Forces, Europe', NULL, 6, 1, NULL, N'cd4c0dd4-267d-4da4-972c-5a42f7af97d5', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (21, 1, 0, NULL, NULL, N'Rapid Reaction', NULL, NULL, NULL, 2, 1, NULL, N'52de1b19-f19d-4f1e-bcbe-6b1e6e7c31cc', N'&', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (22, 18, 0, NULL, N'Airborne', NULL, NULL, NULL, NULL, 2, 1, NULL, N'5703fd52-9bb5-4d51-ad51-926d66e8df7b', N'(', 28, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (25, 21, 0, NULL, NULL, N'Airborne Rapid Reaction', NULL, NULL, NULL, 2, 1, NULL, N'349a67a0-e0de-4156-8afe-0786d411c6a8', N'(', 28, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (27, 2, 0, NULL, NULL, NULL, NULL, N'Deployment Army', NULL, 2, 1, NULL, N'53d5c7d3-64f4-4106-a9bd-fcdc2ecc638b', N'&', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (28, 82, 1, NULL, N'', N'Airborne', NULL, NULL, NULL, 2, 1, NULL, N'536a52b1-8c05-4351-a09c-9078b2727ff8', N')', 28, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (29, NULL, 0, NULL, NULL, NULL, NULL, N'UN Pacific Command', NULL, 8, 1, NULL, N'ec641dc5-2d50-42d7-b868-f03c9b483a65', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (30, 101, 1, N'Screaming Eagles', N'Airborne', N'Air Assault', NULL, NULL, NULL, 2, 1, NULL, N'a08e3e73-ce85-4834-871f-42d85439c2fd', N')', 28, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (31, NULL, 0, NULL, NULL, NULL, NULL, N'UN Africa Command', NULL, 8, 1, NULL, N'cf6b2da6-d9f7-417f-a04f-6321a0ceddc6', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (32, NULL, 0, NULL, NULL, NULL, NULL, N'UN Central Command', NULL, 8, 1, NULL, N'd3167c64-7e87-42ee-8543-065a6aa0ac34', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (33, NULL, 0, NULL, NULL, NULL, NULL, N'UN European Command', NULL, 8, 1, NULL, N'ce93fe7d-605a-4aad-a6ab-74adb95566a6', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (34, NULL, 0, NULL, NULL, NULL, NULL, N'UN Northern America Command', NULL, 8, 1, NULL, N'01b07adb-bfbe-4134-b00b-aea93f1fe021', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (35, NULL, 0, NULL, NULL, NULL, NULL, N'UN Southern America Command', NULL, 8, 1, NULL, N'73c1fd98-6be9-4b53-b613-5b191feb3683', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (36, NULL, 0, NULL, NULL, NULL, NULL, N'UN Special Operations Command', NULL, 8, 1, NULL, N'59c52336-124a-40a3-88fa-116cdc6d8f09', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (37, NULL, 0, NULL, NULL, NULL, NULL, N'UN Strategic Command', NULL, 8, 1, NULL, N'70702905-404a-4e8e-8910-df8791df8b9d', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (38, NULL, 0, NULL, NULL, NULL, NULL, N'UN Transportation Command', NULL, 8, 1, NULL, N'98aa349e-d96c-4301-a469-5f97ba0da085', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (39, NULL, 0, NULL, NULL, NULL, NULL, N'UN Space Command', NULL, 8, 1, NULL, N'93213443-cf7f-48e5-8442-07ede899c45b', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (41, NULL, 0, NULL, NULL, NULL, NULL, N'UN Air Command', NULL, 3, 1, NULL, N'e40f0d08-d2ce-464b-8028-932bcd35d1b7', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (42, NULL, 0, NULL, NULL, NULL, NULL, N'UN Land Command', NULL, 2, 1, NULL, N'9468f827-fe17-4ada-a98d-8f9cfa66c710', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (44, NULL, 0, NULL, NULL, NULL, NULL, N'UN Fleet Command', NULL, 1, 1, NULL, N'a2861acb-7984-4fc2-a2e8-d9533771f138', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (46, NULL, 0, NULL, NULL, NULL, NULL, N'UN Marine Forces Command', NULL, 4, 1, NULL, N'73c64d65-4dcf-4fa0-a744-c626b2374084', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (47, NULL, 0, NULL, NULL, NULL, NULL, N'HQ, HM Coastguard', NULL, 6, 1, NULL, N'9a49817a-23cf-4ef7-ac25-2d80973e57e2', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (48, NULL, 0, NULL, NULL, NULL, NULL, N'UN Cyber Command', NULL, 8, 1, NULL, N'89370ea6-3dd5-41a2-9441-edb9c9a73d05', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (49, NULL, 0, NULL, NULL, NULL, NULL, N'Army Forces Command', NULL, 2, 1, NULL, N'4232895e-b7a4-41ed-b677-1ce416277f4e', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (51, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Forces Command - Atlantic', NULL, 8, 1, NULL, N'62b97613-a859-4641-8fd6-4ba15944f2a1', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (53, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'29594624-76ea-45c3-8a3c-b8bfc6b1448d', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (54, NULL, 0, NULL, NULL, NULL, NULL, N'Fleet Forces Command', NULL, 1, 1, NULL, N'943372a3-d022-426d-8b2b-ff8edb97ad74', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (55, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Air Forces', NULL, 1, 1, NULL, N'1a5488db-2d5c-4aa5-861f-277203dd3975', N'(', 1, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (56, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Submarine Forces', NULL, 1, 1, NULL, N'ded49fac-5f91-4e00-887d-880e9c3c5b18', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (58, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Surface Forces', NULL, 1, 1, NULL, N'04fc3bf6-f08c-46df-94b4-cbe1fdbce643', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (60, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Air Forces, Northern Europe', NULL, 3, 1, NULL, N'79d2bedf-a46c-4b0f-97bd-5180e061b56e', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (61, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Naval Forces, Northern Europe', NULL, 1, 1, NULL, N'06d09975-8ad5-4d29-a264-69961ad1a69f', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (62, NULL, 0, NULL, NULL, NULL, NULL, N'Combined Joint Land Forces, Norway', NULL, 2, 1, NULL, N'1271913d-f719-415d-8d36-f23cb0c59f0c', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (63, NULL, 0, NULL, NULL, NULL, NULL, N'Combined Joint Land Forces, Denmark', NULL, 2, 1, NULL, N'bd97fb5c-2a09-4516-b593-0297a539d8c5', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (64, NULL, 0, NULL, NULL, NULL, NULL, N'Northern Army Group', NULL, 2, 1, NULL, N'4405a530-54b2-4189-a7b7-6c20c57e8956', N'%', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (65, NULL, 0, NULL, NULL, NULL, NULL, N'Central Army Group', NULL, 2, 1, NULL, N'1be9d84f-9089-4b1d-b67e-d3315a5a6c0e', N'%', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (66, NULL, 0, NULL, NULL, NULL, NULL, N'Combined Air Forces, Central Europe', NULL, 3, 1, NULL, N'83d7cd74-bffd-45da-be8d-44e470aa056b', N'%', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (67, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'd2a4c7d3-7308-4060-9f44-8b6d9f5d9047', N'&', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (69, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'cbffe08b-2790-4f46-8b08-34371fb4c028', N'&', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (71, NULL, 0, NULL, NULL, NULL, NULL, N'Combined Joint Land Forces, Southern Europe', NULL, 2, 1, NULL, N'20ae16a6-19d9-4ec4-b47a-ac589e1dcd95', N'%', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (72, NULL, 0, NULL, NULL, NULL, NULL, N'Combined Joint Land Forces, South Eastern Europe', NULL, 2, 1, NULL, N'ce176e14-5e71-42e3-a951-e91e819970e2', N'%', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (73, NULL, 0, NULL, NULL, NULL, NULL, N'Combined Joint Air Forces, Southern Europe', NULL, 3, 1, NULL, N'471a6c43-eba1-4913-a340-0f6527a3435a', N'%', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (74, NULL, 0, NULL, NULL, NULL, NULL, N'Combined Joint Naval Forces, Southern Europe', NULL, 1, 1, NULL, N'8ccbc5fd-051f-4b6b-a959-b2e249c70886', N'%', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (76, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'30327a36-1bb8-45e5-ad1e-b599c16b865e', N'&', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (77, 6, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'7f7d19fc-3342-4069-bd6c-22f3068294e9', N'&', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (78, 1, 1, NULL, NULL, N'Strategic Communications', NULL, NULL, NULL, 1, 1, NULL, N'5f8793df-f5c7-4caa-955b-5556361ad084', N'/', 1, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (79, 1803, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'49a7ed42-ef58-4449-9785-597ce84df26c', N'@', 1, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (80, 1804, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'b4ec4fa9-83c6-4e17-8760-373d92558da8', N'@', 1, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (81, 1707, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'8bf9345d-ccf1-4355-a6b5-1bd7b1eaa628', N'@', 1, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (82, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Air Forces, Pacific', NULL, 1, 1, NULL, N'30a86a82-8891-4704-9474-7e2758f30a01', N')', 1, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (86, NULL, 0, NULL, NULL, N'Strategic Communications Force', NULL, N'Task Force 124', NULL, 1, 1, NULL, N'76c81a30-89a4-4eff-8711-49bee66650cb', N'^', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (89, NULL, 0, NULL, NULL, N'Strategic Missile Force', NULL, N'Task Force 214', NULL, 1, 1, NULL, N'42bb0c06-d8dd-45e9-91b2-8d288b6532bb', N'^', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (90, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Functional Component Command for Global Strike & Integration', NULL, 8, 1, NULL, N'bb313ef6-f038-4640-b605-af45f9fbcc8e', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (91, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Functional Component Command for Integrated Missile Defence', NULL, 8, 1, NULL, N'd0f9dab0-573d-481a-b667-9d25e8fcdfdb', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (92, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Functional Component Command for Space', NULL, 8, 1, NULL, N'b7f63dcc-ed63-4494-ac01-38ef9887079a', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (93, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Functional Component Command for Intelligence, Surveillance & Reconnaissance', NULL, 8, 1, NULL, N'e23e2275-7f27-4b0f-b1b8-2db5b925be1f', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (94, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Functional Component Command for Network Warfare', NULL, 8, 1, NULL, N'1ae38688-fd85-493d-8c92-5215f28507a6', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (95, NULL, 0, NULL, NULL, NULL, NULL, N'Pacific Air Forces', NULL, 3, 1, NULL, N'4e4f5f73-eab2-4472-a148-7567fbf96d02', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (96, NULL, 0, NULL, NULL, NULL, NULL, N'Army Forces, Pacific', NULL, 2, 1, NULL, N'fbecd766-b5c0-43cb-9b04-3cfe6a363ee8', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (97, NULL, 0, NULL, NULL, NULL, NULL, N'Pacific Fleet', NULL, 1, 1, NULL, N'f5f89b2b-3b71-49e2-a253-c67ec85a86b5', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (98, NULL, 0, NULL, NULL, NULL, NULL, N'Marine Forces, Pacific', NULL, 4, 1, NULL, N'81bf2b4a-e2e2-428e-ab10-50cf9dd4a9ea', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (99, NULL, 0, NULL, NULL, NULL, NULL, N'Air Mobility Command', NULL, 3, 1, NULL, N'96abe547-b2ec-42ce-83dd-8e4746b5590a', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (100, NULL, 0, NULL, NULL, NULL, NULL, N'Military Sealift Command', NULL, 1, 1, NULL, N'2be34c75-20e7-43d0-abf1-5ea851c1c210', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (101, NULL, 0, NULL, NULL, NULL, NULL, N'Military Surface Deployment and Distribution Command', NULL, 2, 1, NULL, N'2e7ddb4e-1ae9-4925-a889-8b04d0d4cb1e', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (102, NULL, 0, NULL, NULL, NULL, NULL, N'Army Forces, Southern America', NULL, 2, 1, NULL, N'2cc98fc6-00e8-4430-b0c0-d1eb53dc131e', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (103, NULL, 0, NULL, NULL, NULL, NULL, N'Air Forces, Southern America', NULL, 2, 1, NULL, N'caa27eab-b828-4bfb-864c-8e4b49bc7caa', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (104, NULL, 0, NULL, NULL, NULL, NULL, N'Marine Forces, South', NULL, 4, 1, NULL, N'62f404b9-bca5-48f1-b25c-5e257277f48a', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (105, NULL, 0, NULL, NULL, NULL, NULL, N'Special Operations Command, Southern America', NULL, 8, 1, NULL, N'32068fb3-da9d-4cb6-b1dc-2e380c7aa17b', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (106, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Forces, Southern America', NULL, 1, 1, NULL, N'3a7a72e6-0e53-4124-bb07-95f603b484e2', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (107, NULL, 0, NULL, NULL, NULL, NULL, N'Atlantic Fleet', NULL, 1, 1, NULL, N'182242bf-6888-46b6-9fcb-1e7d1b4b57ad', N'&', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (108, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Special Operations Command', NULL, 8, 1, NULL, N'78ae5299-1cf8-4f7f-8ce8-4e2c7f7d22ac', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (109, NULL, 0, NULL, NULL, NULL, NULL, N'Army Special Operations Commadn', NULL, 2, 1, NULL, N'a0e67d6b-7015-46a9-9c7f-d975675bb226', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (111, NULL, 0, NULL, NULL, NULL, NULL, N'Air Force Special Operations Command', NULL, 3, 1, NULL, N'460fa94d-f3b6-4a26-a75b-91ab1999ce53', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (112, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Special Warfare Command', NULL, 1, 1, NULL, N'a7d866d4-6afa-4cad-8b5d-7442050bb5a0', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (114, NULL, 0, NULL, NULL, NULL, NULL, N'Strategic Communications Force', NULL, 8, 1, NULL, N'5a17d6eb-f421-4831-8cfa-d952e21230b4', N'*', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (116, NULL, 0, NULL, NULL, NULL, NULL, N'Global ICBM Force', NULL, 1, 1, NULL, N'eacb3cbe-dddb-4269-b323-0d890e0c6bf3', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (117, NULL, 0, NULL, NULL, NULL, NULL, N'Army Space and Missile Defence Command', NULL, 2, 1, NULL, N'2069ffb8-3bf3-4245-b697-de1db8f35259', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (118, NULL, 0, NULL, NULL, NULL, NULL, N'Army Strategic Command', NULL, 2, 1, NULL, N'33fca18d-834b-40cd-a1e8-86f0ebbd4efa', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (119, 21, 1, NULL, NULL, N'Artillery', NULL, NULL, NULL, 2, 1, NULL, N'8b3a7d4f-0551-4520-8e76-18df6f1e57c0', N')', 30, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (121, 22, 1, NULL, NULL, N'Artillery', NULL, NULL, NULL, 2, 1, NULL, N'5c3806c6-a034-4865-85bd-305872fbcc27', N')', 30, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (122, 1, 1, NULL, NULL, N'Space', NULL, NULL, NULL, 2, 1, NULL, N'4b3a20f5-1f3f-440d-b49a-253299a4822d', N'*', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (123, 100, 1, NULL, NULL, N'Missile Defence', NULL, NULL, NULL, 2, 1, NULL, N'9f0a9bb5-116f-4a15-806a-8ac1fe23881e', N'*', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (124, 3, 1, NULL, NULL, N'aaa', NULL, NULL, NULL, 1, 1, NULL, N'2aba1bea-e940-4c89-b1e1-381c5bed10d8', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (125, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, N'8f2715b7-c65b-453e-9de1-be5b3174a5d7', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (126, NULL, 0, NULL, NULL, NULL, NULL, N'Air Force Space Command', NULL, 3, 1, NULL, N'2b7b8ad8-9fb0-4670-8b9a-e2f7daa45607', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (128, 20, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'55a3ffe8-0688-4654-9e99-33410a4c3f22', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (130, NULL, 0, NULL, NULL, NULL, NULL, N'Air Force Global Strike Command', NULL, 3, 1, NULL, N'1c09eafe-0acd-41f2-840c-4054539953ea', N'$', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (131, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'175c5399-d4fa-40dc-8885-f5badee7c9ac', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (133, 90, 0, NULL, NULL, NULL, N'Francis E. Warren', NULL, NULL, 3, 1, NULL, N'f377665e-d6ce-4584-862e-0c8e49734ba7', N'*', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (134, 91, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'31920357-8213-43fe-a771-98aec0cb1aa5', N'*', NULL, 0)
GO
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (136, 341, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'49fca1fe-cf81-427a-b640-4b0d1c8c7fc0', N'*', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (137, NULL, 0, NULL, NULL, NULL, NULL, N'UN India Command', NULL, 8, 1, NULL, N'685ee2f6-dbf5-4b85-b9e6-e1dfd63e1750', N'"', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (138, NULL, 0, NULL, NULL, N'Strategic Bomber Force', NULL, N'Task Force 204', NULL, 1, 1, NULL, N'bfab4ff7-2ab7-41c8-9b79-b83ee0111010', N'^', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (140, NULL, 0, NULL, NULL, NULL, NULL, N'Strategic Bomber Force', NULL, 1, 1, NULL, N'706cfbf6-affb-4cba-a803-1990dff3c5a8', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (143, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'fbc4add2-0536-44e0-9f9f-923d36c89036', N'*', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (144, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'ce86d822-236c-4a2c-a946-3bf8af6d79d5', N'*', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (145, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'c5316deb-9388-4cb5-b616-ce81372ea82a', N'*', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (146, 28, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'09cbd9d6-0391-4356-a21f-1d4e81c94517', N'*', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (147, 509, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'f6ce587d-e1f5-486e-a209-bb21ad5e3217', N'*', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (148, NULL, 0, NULL, NULL, NULL, NULL, N'Joint Task Force  - Global Network Operations', NULL, 8, 1, NULL, N'd2143136-820d-4183-a6fd-3e6f5bd39b40', N'^', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (149, NULL, 0, NULL, NULL, NULL, NULL, N'Global Network Operations', NULL, 8, 1, NULL, N'765a8564-ba23-4aed-a0d5-0fdde1c92a3b', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (151, NULL, 0, NULL, NULL, NULL, NULL, N'Strategic Command Task Forces', NULL, 8, 1, NULL, N'9b23b336-f38f-4175-8dbf-b463eb6f3805', N'&', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (152, NULL, 0, NULL, NULL, N'Ballistic Missile Submarines, Atlantic', NULL, N'Task Force 134', NULL, 1, 1, NULL, N'033eb56a-9794-44e7-9589-1bdad8b25318', N'^', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (153, NULL, 0, NULL, NULL, N'Ballistic Missile Submarines, Pacific', NULL, N'Task Force 144', NULL, 1, 1, NULL, N'0528dbca-2b2a-4358-abdb-4a61ac05089f', N'^', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (157, NULL, 0, NULL, NULL, NULL, NULL, N'Marine Forces Strategic Command', NULL, 4, 1, NULL, N'ed46f8db-201c-4f4e-948e-f570b65806b9', N'(', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (158, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, N'3c3721fd-dac7-4ba3-9b09-7f73c4bf4e83', N'%', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (159, 3, 0, NULL, NULL, N'Armoured', NULL, NULL, NULL, 2, 1, NULL, N'20da2bb7-1687-45ec-952f-cbf79cf9b07e', N'(', 33, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (160, 1, 1, NULL, NULL, N'Cavalry', NULL, NULL, NULL, 2, 1, NULL, N'66a8c520-7d19-4834-8451-edcd42cd4769', N')', 27, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (161, 4, 1, NULL, N'Infantry', N'Armoured', NULL, NULL, NULL, 2, 1, NULL, N'f465df00-9240-4ba1-a841-8ea39c6d66c6', N')', 27, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (163, 1, 1, NULL, N'Infantry', N'Armoured', NULL, NULL, NULL, 2, 1, NULL, N'8f705648-f35d-4683-b283-d53ed4cb1c3c', N')', 27, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (165, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, N'9785ad6f-6d93-4761-8700-9a0759e16281', N'*', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (166, 10, 1, NULL, NULL, N'Submarine', NULL, NULL, NULL, 1, 1, NULL, N'4efbe647-5e41-4de4-b3af-e4ce796cd734', N'*', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (167, 9, 1, NULL, NULL, N'Submarine', NULL, NULL, NULL, 1, 1, NULL, N'0889eb27-9c31-45cf-8658-ef8db4b9410a', N'*', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (168, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Submarine Forces, Pacific', NULL, 1, 1, NULL, N'd1863360-3d26-4114-b26a-ae0fb4019096', N')', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (169, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Submarine Forces, Atlantic', NULL, 1, 1, NULL, N'40b686da-cfd8-4b6a-8c2f-8684025a5499', N')', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (170, 16, 1, NULL, NULL, N'Submarine', NULL, NULL, NULL, 1, 1, NULL, N'60428826-714f-4d9f-9061-247c131f83a2', N'/', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (172, 17, 1, NULL, NULL, N'Submarine', NULL, NULL, NULL, 1, 1, NULL, N'76318cd9-c05c-49ce-8b62-345e9370596c', N'/', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (173, 19, 1, NULL, NULL, N'Submarine', NULL, NULL, NULL, 1, 1, NULL, N'e44fe47e-196b-4005-8a49-af8c8d896f45', N'/', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (174, 20, 0, NULL, NULL, N'Submarine', NULL, NULL, NULL, 1, 1, NULL, N'0d6cd285-2fcd-4d20-8e3c-54448a10845a', N'/', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (175, NULL, 0, NULL, NULL, N'SSGN-728', N'HMS Florida', NULL, NULL, 1, 1, NULL, N'ab93901b-b707-40e7-bdb8-3e99e0bd823a', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (177, NULL, 0, NULL, NULL, N'SSGN-729', N'HMS Georgia', NULL, NULL, 1, 1, NULL, N'ea674548-a030-48e0-9434-709a9e53b615', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (178, NULL, 0, NULL, NULL, N'SSBN-730', N'HMS Henry M. Jackson', NULL, NULL, 1, 1, NULL, N'0b2848d0-5405-4f1a-bbb3-21c579ae5d32', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (179, NULL, 0, NULL, NULL, NULL, N'HMS Alaska', NULL, NULL, 1, 1, NULL, N'42539c0f-58b3-47b3-89b4-dde2e1c02bdd', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (180, NULL, 0, NULL, NULL, NULL, N'HMS Tennessee', NULL, NULL, 1, 1, NULL, N'272868c0-8cfe-4b00-935f-049b0b27ef99', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (181, NULL, 0, NULL, NULL, NULL, N'HMS West Virginia', NULL, NULL, 1, 1, NULL, N'976ff73e-cd9d-4978-ab7e-953517591bae', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (183, NULL, 0, NULL, NULL, NULL, N'HMS Maryland', NULL, NULL, 1, 1, NULL, N'9de8b98f-3f06-41f9-9d8c-46ab85123c49', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (184, NULL, 0, NULL, NULL, NULL, N'HMS Wyoming', NULL, NULL, 1, 1, NULL, N'f05451f9-919e-41a4-8240-b7e8f83e1f87', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (186, NULL, 0, NULL, NULL, N'SSBN-726', N'HMS Ohio', NULL, NULL, 1, 1, NULL, N'25cbff50-9c5b-48af-864d-8759e7c57b00', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (187, NULL, 0, NULL, NULL, N'SSBN-727', N'HMS Michigan', NULL, NULL, 1, 1, NULL, N'0d2f85eb-c749-4ef3-8d5a-50e4f232b36b', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (190, NULL, 0, NULL, NULL, N'SSGN-726', N'HMS Ohio', NULL, NULL, 1, 1, NULL, N'a9f6e185-6c52-458b-8303-55758ce6f747', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (191, NULL, 0, NULL, NULL, N'SSGN-727', N'HMS Michigan', NULL, NULL, 1, 1, NULL, N'baa969fd-3fda-43a3-b885-b846463a193a', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (193, NULL, 0, NULL, NULL, N'SSBN-728', N'HMS Florida', NULL, NULL, 1, 1, NULL, N'd22340d7-0438-4cda-8182-9f2e2f31b721', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (196, NULL, 0, NULL, NULL, N'SSBN-729', N'HMS Georgia', NULL, NULL, 1, 1, NULL, N'0d9d11bd-d6ea-4cf1-bb19-c6617dfe3190', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (197, NULL, 0, NULL, NULL, N'SSBN-731', N'HMS Alabama', NULL, NULL, 1, 1, NULL, N'edb34a00-32da-4325-8b16-d12589c18348', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (198, NULL, 0, NULL, NULL, N'SSBN-732', N'HMS Alaska', NULL, NULL, 1, 1, NULL, N'1361247b-4859-4957-b1ed-f736c58b6aa6', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (199, NULL, 0, NULL, NULL, N'SSBN-733', N'HMS Nevada', NULL, NULL, 1, 1, NULL, N'6459c4a3-9a7f-4698-936a-ab9b94638709', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (200, NULL, 0, NULL, NULL, N'SSBN-734', N'HMS Tennessee', NULL, NULL, 1, 1, NULL, N'568de553-3665-4b4f-9766-3fb476531e18', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (201, NULL, 0, NULL, NULL, N'SSBN-735', N'HMS Pennsylvania', NULL, NULL, 1, 1, NULL, N'5ec7279d-d0f1-46a0-9766-b2cb051c41ed', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (203, NULL, 0, NULL, NULL, N'SSBN-736', N'HMS West Virginia', NULL, NULL, 1, 1, NULL, N'd74e4224-93cf-45ab-97a8-633a4e3a519e', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (204, NULL, 0, NULL, NULL, N'SSBN-737', N'HMS Kentucky', NULL, NULL, 1, 1, NULL, N'd8cb1a38-f0fa-4c3d-b4b4-b508fa05d4fe', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (205, NULL, 0, NULL, NULL, N'SSBN-738', N'HMS Maryland', NULL, NULL, 1, 1, NULL, N'f06834b3-34b7-4aaa-b846-422bd1c7fafb', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (206, NULL, 0, NULL, NULL, N'SSBN-739', N'HMS Nebraska', NULL, NULL, 1, 1, NULL, N'73113359-9dd4-4edb-ab3a-493a4368f402', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (207, NULL, 0, NULL, NULL, N'SSBN-740', N'HMS Rhode Island', NULL, NULL, 1, 1, NULL, N'9fc07041-5137-4bcf-9af6-7c4df364812a', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (208, NULL, 0, NULL, NULL, N'SSBN-741', N'HMS Maine', NULL, NULL, 1, 1, NULL, N'84117b2d-4484-4981-8a95-a3dad3738bd0', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (209, NULL, 0, NULL, NULL, N'SSBN-742', N'HMS Wyoming', NULL, NULL, 1, 1, NULL, N'de26f8f4-7891-451d-aa5e-a75eb7b5cbc8', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (210, NULL, 0, NULL, NULL, N'SSBN-743', N'HMS Louisiana', NULL, NULL, 1, 1, NULL, N'3d33e97b-3ea0-4539-8bc9-59d4aa0db5fe', N'@', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (211, NULL, 0, NULL, NULL, NULL, NULL, N'Trident Refit Facility, King''s Bay', NULL, 1, 1, NULL, N'2f5eb64a-ff91-436f-9e1f-3b06a19d831b', N'/', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (213, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Submarine Support Centre, King''s Bay', NULL, 1, 1, NULL, N'1c4c5665-b6ff-4e7b-8d6a-a2443aa0bd66', N'/', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (214, NULL, 0, NULL, NULL, NULL, NULL, N'Naval Submarine Support Centre, Bangor', NULL, 1, 1, NULL, N'136d6e08-b822-4672-a032-79181b4d9f86', N'/', NULL, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (215, 90, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'c9d8bf79-ce13-451d-b7a1-f33932315226', N'/', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (217, 90, 0, NULL, NULL, N'Mission Support', NULL, NULL, NULL, 3, 1, NULL, N'bd8119e0-6c37-40d8-8a5a-915432e512b7', N'/', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (218, 90, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'0856b28f-e71e-4c79-bdef-acb617a53137', N'/', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (219, 90, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'750bd8a4-5ec7-4ba1-bd24-9fad200d396c', N'/', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (220, 90, 0, NULL, NULL, N'Medical', NULL, NULL, NULL, 3, 1, NULL, N'07a3a9ba-7da5-4b20-9323-dddefa287806', N'/', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (221, 90, 0, NULL, NULL, N'Comptroller', NULL, NULL, NULL, 3, 1, NULL, N'5af3293b-76c6-4272-9599-6e580d16eb25', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (222, 90, 0, NULL, NULL, N'Medical Operations', NULL, NULL, NULL, 3, 1, NULL, N'600cdf90-2973-4048-a098-d590cbf6fdc0', N'@', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (223, 90, 0, NULL, NULL, N'Medical Support', NULL, NULL, NULL, 3, 1, NULL, N'3213fc42-3fde-4f71-b19e-6f0898c773ca', N'@', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (224, 90, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'c6a7541c-3c7d-4748-b2e0-938a4fec0fdf', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (227, 90, 0, NULL, NULL, N'Missile Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'9a502a3f-26b6-4ece-a4ba-ccc8c456b8da', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (228, 790, 0, NULL, NULL, N'Missile Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'3ebfb734-3ffc-4c00-985a-490292083168', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (229, 90, 0, NULL, NULL, N'Security Support', NULL, NULL, NULL, 3, 1, NULL, N'417ef71b-a639-4c68-af3c-32e553cf9893', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (230, 90, 0, NULL, NULL, N'Civil Engineer', NULL, NULL, NULL, 3, 1, NULL, N'b559b603-f8e7-4474-bccf-c9911a8164ed', N'@', 4, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (231, 90, 0, NULL, NULL, N'Communications', NULL, NULL, NULL, 3, 1, NULL, N'01cb7ef1-d73c-4d18-a774-ea5791c2e829', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (233, 90, 0, NULL, NULL, N'Contracting', NULL, NULL, NULL, 3, 1, NULL, N'da7dfa14-ba8d-428e-9b02-8d2682be7a55', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (234, 90, 0, NULL, NULL, N'Force Support', NULL, NULL, NULL, 3, 1, NULL, N'5b4fb7f6-048f-4b20-a687-f430df149f32', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (235, 90, 0, NULL, NULL, N'Logistics Readines', NULL, NULL, NULL, 3, 1, NULL, N'be9e87ae-3ede-4bed-8b38-3a88c07e97bf', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (236, 90, 0, NULL, NULL, N'Munitions', NULL, NULL, NULL, 3, 1, NULL, N'ee7278d0-7650-457d-b408-6b992db68e39', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (237, 90, 0, NULL, NULL, N'Missile Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'abd00680-4fe5-4f60-8cb3-0f89861c01ef', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (238, 90, 0, NULL, NULL, N'Maintenance Operations', NULL, NULL, NULL, 3, 1, NULL, N'27155736-a198-40ec-a661-58174da38da7', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (239, 319, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'e89f65e6-fee7-4335-8df3-bc8886a11cb8', N'@', 5, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (240, 320, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'8ff5e8e1-27c1-4c7a-b3fe-42aacfb0f057', N'@', 5, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (241, 321, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'7055d36b-e99f-4e48-8a0a-6faf583d189e', N'@', 5, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (244, 37, 0, NULL, NULL, NULL, NULL, N'Helicopter', NULL, 3, 1, NULL, N'582a0c82-1b25-40a0-84ab-93454fa03535', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (245, 90, 0, NULL, NULL, N'Operations Support', NULL, NULL, NULL, 3, 1, NULL, N'8aed416f-c5d3-4024-b839-e69c9451104e', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (246, 91, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'563b7b7d-f34a-4032-a169-b65164d0e2a5', N'/', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (248, 91, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'c4e5a66a-4a22-4258-a322-ef3bf067b73b', N'/', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (249, 91, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'24100710-c40d-440b-81ee-5093e7165908', N'/', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (250, 91, 0, NULL, NULL, N'Missile Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'8b274ee7-2c7b-4174-9f5a-a574d784dac2', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (251, 91, 0, NULL, NULL, N'Maintenance Operations', NULL, NULL, NULL, 3, 1, NULL, N'9004f388-e112-4c3b-ab73-3d899a711b56', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (252, 219, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 4, N'ND', N'fc876ce2-65d0-48ce-a672-87a0be588d7d', N'@', 6, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (253, 791, 0, NULL, NULL, N'Missile Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'e9a86766-509b-4f2e-bee0-c0bff91a20eb', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (254, 91, 0, NULL, NULL, N'Missile Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'c0591d61-3a64-4785-9f33-176fc82c6b29', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (255, 91, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'd91b4563-4391-4b96-92e0-3fd5bc1c1705', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (256, 91, 0, NULL, NULL, N'Operations Support', NULL, NULL, NULL, 3, 1, NULL, N'7382e1f9-f74c-4838-8343-4afda24d9056', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (257, 54, 0, NULL, NULL, NULL, NULL, N'Helicopter', NULL, 3, 1, NULL, N'db901680-ffc7-4b64-b856-01d5d435a40c', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (258, 1542, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'1bdf9f05-0372-4dd3-9a4f-72e080c7cc45', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (259, 1541, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'0b474b62-22e3-478f-9208-de60320d08a0', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (260, 1540, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'26d7081f-c440-450a-ba0a-8dad0dcf0e61', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (262, 341, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'd2b78e3b-1da6-4c72-9b7f-de03d5e1625d', N'/', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (264, 341, 0, NULL, NULL, N'Mission Support', NULL, NULL, NULL, 3, 1, NULL, N'8893edb1-d553-443f-89ee-0c9455810362', N'/', 2, 1)
GO
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (265, 341, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'68bdb934-eeff-479f-bdcb-674518feec8a', N'/', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (266, 1010, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'1ff21cfe-2fb0-4bd2-a4ab-f688824f6b6f', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (267, 1012, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'e1e802f6-80b0-44be-897e-447342f04a23', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (268, 490, 0, NULL, NULL, NULL, NULL, N'Missile', NULL, 3, 1, NULL, N'4c0f8d57-ed31-4f18-82e1-4d2c73cefe13', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (269, 40, 0, NULL, NULL, NULL, NULL, N'Helicopter', NULL, 3, 1, NULL, N'04a866af-9a83-4ed0-8104-591299627b3f', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (270, 341, 0, NULL, NULL, N'Operations Support', NULL, NULL, NULL, 3, 1, NULL, N'17546504-c605-4072-8b40-bfa373db7237', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (271, 341, 0, NULL, NULL, N'Civil Engineer', NULL, NULL, NULL, 3, 1, NULL, N'd92ded4d-cb6c-4d44-8de4-d4f040f1ae6b', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (272, 341, 0, NULL, NULL, N'Communications', NULL, NULL, NULL, 3, 1, NULL, N'8cbea9ab-1845-43ab-940a-ca7ebd737032', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (273, 341, 0, NULL, NULL, N'Contracting', NULL, NULL, NULL, 3, 1, NULL, N'165f89ce-a918-450a-a3d1-3e2dab776add', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (274, 341, 0, NULL, NULL, N'Force Support', NULL, NULL, NULL, 3, 1, NULL, N'268a4f97-180a-4def-871c-98e8d9e4a98f', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (275, 341, 0, NULL, NULL, N'Logistics Readiness', NULL, NULL, NULL, 3, 1, NULL, N'99d26c09-a66a-415e-84c0-0dad96dbf562', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (276, 341, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'8cb040b0-ca1a-490e-8075-afff3ee500df', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (278, 341, 0, NULL, NULL, N'Missile Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'd2f25993-5f71-4d13-8a24-ff027395fdab', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (280, 741, 0, NULL, NULL, N'Missile Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'7a2fa055-a0e7-48bb-9059-7dc73c41e949', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (281, 341, 0, NULL, NULL, N'Security Support', NULL, NULL, NULL, 3, 1, NULL, N'c2f890b6-2852-4603-a983-771d54e32dc0', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (282, 341, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'ec65b797-1f3e-45da-8add-b42065f2f536', N'/', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (283, 341, 0, NULL, NULL, N'Missile Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'adcaab2a-9bf7-445e-a8db-e0311229ee94', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (284, 341, 0, NULL, NULL, N'Maintenance Operation', NULL, NULL, NULL, 3, 1, NULL, N'4e7c3245-cdbe-4640-8ba6-51fe625883fe', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (285, 341, 0, NULL, NULL, N'Medical', NULL, NULL, NULL, 3, 1, NULL, N'9cdd7b30-d9f3-4771-adbd-7a17573ce45a', N'/', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (286, 341, 0, NULL, NULL, N'Comptroller', NULL, NULL, NULL, 3, 1, NULL, N'a443b369-d35d-47b6-9aca-9c85ee0765a6', N'@', 2, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (287, 619, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4, NULL, N'c40e1569-0c08-4616-a7d9-1e25836b9234', N'*', 6, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (299, 2, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'ea600afd-b43d-4949-97a4-f7618de9a859', N'/', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (300, 2, 0, NULL, NULL, N'Aircraft Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'ee5f547b-00a8-48e7-8793-453ff406d5e4', N'@', 13, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (301, 2, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'1f5cfd4d-eeb7-4e4c-875c-b129bbc7a9b8', N'@', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (302, 2, 0, NULL, NULL, N'Munitions', NULL, NULL, NULL, 3, 1, NULL, N'b3bbb72c-bcad-4e9b-8e5b-0acf74a01c44', N'@', 14, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (303, 2, 0, NULL, NULL, N'Maintenance Operations', NULL, NULL, NULL, 3, 1, NULL, N'e409e6b7-3dd8-411e-8d78-6427e0f01807', N'@', 15, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (304, 2, 0, NULL, NULL, N'Mission Support', NULL, NULL, NULL, 3, 1, NULL, N'002b8039-0a72-4104-bc0a-0367f9c6493d', N'/', 16, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (305, 2, 0, NULL, NULL, N'Civil Engineer', NULL, NULL, NULL, 3, 1, NULL, N'51fb2f49-83c9-4de8-a049-9bfdbc84b719', N'@', 4, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (306, 2, 0, NULL, NULL, N'Communications', NULL, NULL, NULL, 3, 1, NULL, N'bac0cdf8-2f7f-48d1-8971-9505fd088704', N'@', 17, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (307, 2, 0, NULL, NULL, N'Contracting', NULL, NULL, NULL, 3, 1, NULL, N'e719229f-81bf-4a73-b14d-d37a60a6bae7', N'@', 18, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (308, 2, 0, NULL, NULL, N'Force Support', NULL, NULL, NULL, 3, 1, NULL, N'3d29e799-2907-4339-b314-3d437fcddc42', N'@', 19, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (309, 2, 0, NULL, NULL, N'Logistics Readiness', NULL, NULL, NULL, 3, 1, NULL, N'05435a38-4497-4333-b793-ed1a5316fcb1', N'@', 20, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (310, 2, 0, NULL, NULL, N'Mission Support', NULL, NULL, NULL, 3, 1, NULL, N'00b8dc48-0c3a-4bcc-84ee-e627d4451039', N'@', 16, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (311, 2, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'ab750586-6df8-4e98-9e36-210eaf880e7d', N'@', 21, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (312, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'2b711ed8-395c-45c5-aac9-7952b8f681c7', N'|', 23, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (313, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'11d2bb34-5060-41f0-8fd7-439255453ad4', N'|', 22, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (315, 2, 0, NULL, NULL, N'Comptroller', NULL, NULL, NULL, 3, 1, NULL, N'da3a6310-ea07-4529-a399-35be41f69c47', N'@', 7, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (317, 2, 0, NULL, NULL, N'Medical', NULL, NULL, NULL, 3, 1, NULL, N'fe5f5f86-0acc-4c9d-b14d-2530a8601edb', N'/', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (318, 2, 0, NULL, NULL, NULL, NULL, N'Bomb', NULL, 3, 1, NULL, N'82f6b2fb-2228-448a-b231-60cb7595043a', N'/', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (319, 2, 0, NULL, NULL, N'Operations Support', NULL, NULL, NULL, 3, 1, NULL, N'be1dcc7b-1543-4e38-bf16-0c2b80839362', N'@', 8, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (320, 496, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'da8d980a-d90e-4953-b6b7-4a21a1d104e3', N'@', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (322, 119, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'4974a8c0-2f40-47d3-83f2-f436695c559a', N'@', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (323, 211, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'aeeba4a1-38d6-45fd-a2f9-a6f7ea0d2b6d', N'@', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (324, 5, 0, NULL, NULL, NULL, NULL, N'Bomb', NULL, 3, 1, NULL, N'453c16b8-b4b7-4228-b9e9-66dbf58ea494', N'/', 24, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (325, 5, 0, NULL, NULL, N'Operations Support', NULL, NULL, NULL, 3, 1, NULL, N'3ef727fd-d84f-411c-9582-cda9e59a0dfd', N'@', 8, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (326, 7, 0, NULL, NULL, NULL, NULL, N'Bomb', NULL, 3, 1, NULL, N'7008a2c9-31fd-4d41-a3ac-77b8131c2330', N'/', 24, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (327, 5, 0, NULL, NULL, N'Medical', NULL, NULL, NULL, 3, 1, NULL, N'ef732490-556d-4f13-a11c-87561fca5ec4', N'/', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (328, 5, 0, NULL, NULL, N'Medical Operations', NULL, NULL, NULL, 3, 1, NULL, N'297b7961-3434-4031-9389-1b0d6871779b', N'@', 9, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (329, 5, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'80d1d993-e50c-4831-a32e-fb5e3df42d4f', N'/', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (330, 5, 0, NULL, NULL, N'Aircraft Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'09471da1-d332-4cf0-8092-ee4de8401fa8', N'@', 13, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (331, 5, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'8079aca6-2c14-452a-a9e6-0f861d0bef7c', N'@', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (332, 5, 0, NULL, NULL, N'Munitions', NULL, NULL, NULL, 3, 1, NULL, N'23eb9014-972e-4ae8-822a-28b5f87fad8e', N'@', 14, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (333, 5, 0, NULL, NULL, N'Maintenance Operations', NULL, NULL, NULL, 3, 1, NULL, N'65e2bff6-d47d-4a16-9078-fb74fda936ed', N'@', 15, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (334, 5, 0, NULL, NULL, N'Mission Support', NULL, NULL, NULL, 3, 1, NULL, N'51c3e9b4-6723-4857-a7ac-66c20f388108', N'/', 16, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (335, 5, 0, NULL, NULL, N'Civil Engineer', NULL, NULL, NULL, 3, 1, NULL, N'fc32c2dd-4de7-4242-9bf8-3a1dbd752e68', N'@', 4, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (336, 5, 0, NULL, NULL, N'Communications', NULL, NULL, NULL, 3, 1, NULL, N'26ab7e3a-e65a-466c-992e-ea2c26762484', N'@', 17, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (337, 5, 0, NULL, NULL, N'Contracting', NULL, NULL, NULL, 3, 1, NULL, N'4910cc45-4c47-4382-a9a3-d78a539381d9', N'@', 18, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (338, 5, 0, NULL, NULL, N'Force Support', NULL, NULL, NULL, 3, 1, NULL, N'e25e2f1c-2a41-491f-9764-d9057de6c150', N'@', 19, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (339, 5, 0, NULL, NULL, N'Logistics Readiness', NULL, NULL, NULL, 3, 1, NULL, N'69236ca4-8423-41d4-b614-54db025a72da', N'@', 20, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (340, 5, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'27600ec6-7417-401d-b8ca-dda84940c8ee', N'@', 21, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (341, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'91f2664a-f461-47b7-bd90-4c681d57498c', N'|', 23, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (342, 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'683b80c4-2a56-4b18-bad0-b014a8dd2ed7', N'|', 22, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (343, 5, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'9770915c-ee41-4efc-a716-4fce197c03fb', N'/', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (344, 5, 0, NULL, NULL, N'Comptroller', NULL, NULL, NULL, 3, 1, NULL, N'48f74c53-0ec4-47be-8595-86a69e0251ed', N'@', 7, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (346, 5, 0, NULL, NULL, N'Medical Support', NULL, NULL, NULL, 3, 1, NULL, N'ebfc2526-ea66-4d44-8b3b-3d8f241f5525', N'@', 10, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (347, 423, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'814937e2-2dad-4811-a5e2-1e0fcd4d81cd', N'@', 34, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (348, 469, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'e36278a4-7d72-48b1-8e74-9f27422b2f06', N'@', 34, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (349, 509, 0, NULL, NULL, NULL, NULL, N'Bomb', NULL, 3, 1, NULL, N'aee7dbc2-c105-4297-a2c2-869c06e51278', N'/', 24, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (350, 509, 0, NULL, NULL, N'Operations Support', NULL, NULL, NULL, 3, 1, NULL, N'824d6b5c-c9d4-4040-93fb-86cae980ac66', N'@', 8, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (351, 509, 0, NULL, NULL, N'Comptroller', NULL, NULL, NULL, 3, 1, NULL, N'3bfc435e-2953-4546-80f8-5825327f466a', N'@', 7, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (352, 509, 0, NULL, NULL, N'Medical', NULL, NULL, NULL, 3, 1, NULL, N'55bf2e1b-4e82-4a0a-b107-0ae14925f864', N'/', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (353, 509, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'57e7a50e-7800-4f80-b230-1f309ca3c123', N'/', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (354, 509, 0, NULL, NULL, N'Aircraft Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'3b9d3b43-48fe-44dc-81c3-b2bd2be066ff', N'@', 13, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (355, 509, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'9c1c411e-729a-4fec-b7ce-cd5bc14f45a6', N'@', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (356, 509, 0, NULL, NULL, N'Munitions', NULL, NULL, NULL, 3, 1, NULL, N'4415bdad-bd5b-4329-b709-fea67d6ed2c2', N'@', 14, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (357, 509, 0, NULL, NULL, N'Mission Support', NULL, NULL, NULL, 3, 1, NULL, N'0213fa92-5ea0-46f7-a9f4-0022bb35d9bb', N'/', 16, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (358, 509, 0, NULL, NULL, N'Civil Engineer', NULL, NULL, NULL, 3, 1, NULL, N'f946bb1c-2c57-4cf5-9170-f2e1aaf0240e', N'@', 4, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (359, 509, 0, NULL, NULL, N'Communications', NULL, NULL, NULL, 3, 1, NULL, N'611148ac-8ae1-4276-b3c4-f7ef3b6f5e34', N'@', 17, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (360, 509, 0, NULL, NULL, N'Contracting', NULL, NULL, NULL, 3, 1, NULL, N'1c86745a-ecfd-4bc5-853d-1457567dcf93', N'@', 18, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (361, 509, 0, NULL, NULL, N'Force Support', NULL, NULL, NULL, 3, 1, NULL, N'573e666e-ed22-406e-9d98-42228c6a50fb', N'@', 19, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (362, 509, 0, NULL, NULL, N'Logistics Readiness', NULL, NULL, NULL, 3, 1, NULL, N'cf3db88f-fe4a-4e06-9e03-43af076163bc', N'@', 20, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (363, 509, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'd3eb0093-e2ea-4e8c-93c0-bf197874d4e5', N'@', 21, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (364, 509, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'50e3cccd-21eb-4f88-8f2f-c0758c4e64e1', N'|', 23, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (365, 509, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'e1e636d1-a6cf-4f57-a42b-0840dc6604b0', N'|', 22, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (367, 163, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'd2febf92-01eb-4bfa-873f-eb9d04f9ae6d', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (369, 393, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'd927e9cf-512e-489b-8a6d-d27111895a80', N'@', 2, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (371, 394, 0, NULL, NULL, N'Combat Training', NULL, NULL, NULL, 3, 1, NULL, N'35a5fd83-971d-4b2a-9512-8eab5d091b64', N'@', 35, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (372, 908, 0, NULL, NULL, N'Air Operations', NULL, NULL, N'Centre', 3, 1, NULL, N'2f8712cd-cf1d-4a33-afe3-f0b0802f249b', N'/', 41, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (373, 28, 0, NULL, NULL, N'Medical', NULL, NULL, NULL, 3, 1, NULL, N'e425a324-d8e6-4b4d-a96f-b4bf6c60f9d0', N'/', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (374, 28, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'060c0f0a-5944-46e9-a373-901bc221c1bc', N'/', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (375, 7, 0, NULL, NULL, N'Aircraft Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'd74905f3-1d23-4562-8ee6-0ef261c021de', N'@', 13, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (376, 7, 0, NULL, NULL, N'Mission Support', NULL, NULL, NULL, 3, 1, NULL, N'63f2e42c-2cb0-439a-9fd1-126724aa4347', N'/', 16, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (377, 7, 0, NULL, NULL, N'Civil Engineer', NULL, NULL, NULL, 3, 1, NULL, N'8696abb0-6ddf-4b2c-97c2-65707d2ddcc3', N'@', 4, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (378, 7, 0, NULL, NULL, N'Communications', NULL, NULL, NULL, 3, 1, NULL, N'ecc77b0f-f734-4e36-b3c5-d69654f5c867', N'@', 17, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (379, 7, 0, NULL, NULL, N'Contracting', NULL, NULL, NULL, 3, 1, NULL, N'cf4b343e-e901-4247-970d-1eb82baf6b4a', N'@', 18, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (380, 7, 0, NULL, NULL, N'Force Support', NULL, NULL, NULL, 3, 1, NULL, N'459a61a1-795e-424f-8d12-e07d8651cd90', N'@', 19, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (381, 7, 0, NULL, NULL, N'Logistics Readiness', NULL, NULL, NULL, 3, 1, NULL, N'81efd6f7-3eab-4410-8e0c-a1db4c4bdc8e', N'@', 20, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (382, 7, 0, NULL, NULL, N'Security Forces', NULL, NULL, NULL, 3, 1, NULL, N'43b4a16d-0080-407a-85b3-6dbbe75892cd', N'@', 21, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (383, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'5f8252b8-3f25-4542-8b85-a278077b41c3', N'|', 23, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (384, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'62fafe52-d3cc-4759-88c0-e3b12bf1d1e8', N'|', 22, 1)
GO
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (385, 28, 0, NULL, NULL, N'Medical', NULL, NULL, NULL, 3, 1, NULL, N'6b1e2117-66ea-4fda-be35-a371fbb39afb', N'/', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (386, 28, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'9336218e-16a1-4c95-ba6a-1d1f178cb818', N'/', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (387, 7, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'63780745-0f6c-4a78-aff7-11e74d688d7c', N'/', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (388, 7, 0, NULL, NULL, N'Medical', NULL, NULL, NULL, 3, 1, NULL, N'924db3b8-35ec-4bfe-880f-8c5dc5924d93', N'/', 3, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (389, 7, 0, NULL, NULL, N'Aeromedical-Dental', NULL, NULL, NULL, 3, 1, NULL, N'b0c8c380-9ad6-4b59-9f22-342566ea8287', N'@', 36, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (390, 7, 0, NULL, NULL, N'Medical Operations', NULL, NULL, NULL, 3, 1, NULL, N'13501430-0f96-440f-b436-a6e2de7574c4', N'@', 9, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (391, 7, 0, NULL, NULL, N'Medical Support', NULL, NULL, NULL, 3, 1, NULL, N'56d5f2a7-5618-4423-945a-b02ca1685279', N'@', 10, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (392, 7, 0, NULL, NULL, N'Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'6d2ffd9d-1bc8-400e-8f73-0cc6907a511b', N'/', 11, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (393, 7, 0, NULL, NULL, N'Aircraft Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'60806df1-49ef-4740-b774-f3ee5baabf09', N'@', 13, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (394, 7, 0, NULL, NULL, N'Component Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'7a6aa055-67b3-4b68-8976-c9b38e1cc7c2', N'@', 39, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (395, 7, 0, NULL, NULL, N'Equipment Maintenance', NULL, NULL, NULL, 3, 1, NULL, N'be4abbda-403c-48d4-8f70-6bfac5847a24', N'@', 40, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (396, 7, 0, NULL, NULL, N'Munitions', NULL, NULL, NULL, 3, 1, NULL, N'0536d5bc-7cbe-49db-8231-6d8b4f7e475e', N'@', 14, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (397, 7, 0, NULL, NULL, N'Maintenance Operations', NULL, NULL, NULL, 3, 1, NULL, N'eea6d0af-98c6-41ea-b191-a3783c7add41', N'@', 15, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (398, 7, 0, NULL, NULL, N'Comptroller', NULL, NULL, NULL, 3, 1, NULL, N'0f26c1d4-6411-4eb9-bf2e-cd55d6577142', N'@', 7, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (399, 7, 0, NULL, NULL, N'Operations Support', NULL, NULL, NULL, 3, 1, NULL, N'382f5ed1-e96b-482b-8708-75a800223e39', N'@', 8, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (400, 209, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'35eab079-5e35-4108-8374-4931729d1e4b', N'@', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (401, 323, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'04826323-ac8a-429e-93e1-4b88bae18f04', N'@', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (402, 436, 0, NULL, NULL, N'Training', NULL, NULL, NULL, 3, 1, NULL, N'b923c713-50ed-4963-a420-6d8c8c7e4cd8', N'@', 35, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (404, 28, 0, NULL, NULL, N'Comptroller', NULL, NULL, NULL, 3, 1, NULL, N'559f26bd-24ea-4011-87c0-c80151263014', N'@', 7, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (405, 28, 0, NULL, NULL, NULL, NULL, N'Bomb', NULL, 3, 1, NULL, N'51f48d40-ea1e-438f-9c45-52049aa881e8', N'/', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (407, 534, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'aab36661-81b0-4af0-9e54-7fc33d97e21b', N'@', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (408, 537, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'2d1e5d0b-7c33-4bf0-b431-677fe84fd9a1', N'@', 24, 0)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (409, 28, 0, NULL, NULL, N'Operations Support', NULL, NULL, NULL, 3, 1, NULL, N'49268df6-6a23-419b-9663-0bea4c572683', N'@', 8, 1)
INSERT [dbo].[Unit] ([UnitId], [Number], [UseOrdinal], [NickName], [LegacyMissionName], [MissionName], [UniqueName], [CommandName], [UnitTypeVariant], [ServiceIdx], [ServiceTypeIdx], [TerritorialDesignation], [UnitGuid], [RankSymbol], [AdminCorpsId], [CanHide]) VALUES (410, 432, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, N'68ed0bb1-d855-4f3c-ad56-1d1ab326411a', N'@', 34, 0)
SET IDENTITY_INSERT [dbo].[Unit] OFF
SET IDENTITY_INSERT [dbo].[UnitIndex] ON 

INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (3, N'JFHQ', N'ae6f5b41-edcb-447f-b1ab-d34b424bec55', 4, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (4, N'JFCOM-OPS', N'5b53631a-c25a-49c4-8501-848f7124b710', 9, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (5, N'JFCENT', NULL, 13, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (6, N'PACOM', NULL, 29, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (7, N'AFRICOM', NULL, 31, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (8, N'CENTCOM', NULL, 32, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (9, N'NORTHCOM', NULL, 34, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (10, N'SOUTHCOM', NULL, 35, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (11, N'SOCOM', NULL, 36, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (12, N'STRATCOM', NULL, 37, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (13, N'TRANSCOM', NULL, 38, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (14, N'AIRCOM', NULL, 41, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (15, N'LANDCOM', NULL, 42, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (16, N'FLEETCOM', NULL, 44, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (17, N'CYBERCOM', NULL, 48, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (18, N'JFNORTH', NULL, 14, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (19, N'JFSOUTH', NULL, 15, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (20, N'ARFOREUR', NULL, 16, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (21, N'NAVFOREUR', NULL, 17, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (22, N'AIRFOREUR', NULL, 18, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (23, N'MARFOREUR', NULL, 19, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (24, N'JFORATL', NULL, 51, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (25, N'JFLANT', NULL, 51, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (26, N'JFORCENT', NULL, 13, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (27, N'JFORNORTH', NULL, 14, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (28, N'JFORSOUTH', NULL, 15, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (30, N'NORTHAG', NULL, 64, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (31, N'CENTAG', NULL, 65, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (32, N'LANDSOUTH', NULL, 71, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (33, N'LANDSOUTHEAST', NULL, 72, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (34, N'AIRSOUTH', NULL, 73, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (35, N'NAVSOUTH', NULL, 74, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (36, N'AIRCENT', NULL, 66, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (37, N'____2 CTAF', NULL, 67, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (38, N'____4 CTAF', NULL, 69, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (39, N'AIRNORTH', NULL, 60, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (40, N'NAVNORTH', NULL, 61, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (41, N'LANDNORWAY', NULL, 62, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (42, N'LANDDENMARK', NULL, 63, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (43, N'FAA/____1', NULL, 78, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (44, N'____1 SCW', NULL, 78, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (46, N'STRATCOMWING ONE', NULL, 78, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (48, N'_1803 NAS', NULL, 79, 1, 1, 0, 0, 10)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (49, N'VQ-___3', NULL, 79, 0, 1, 1, 0, 50)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (50, N'_1804 NAS', NULL, 80, 1, 1, 0, 0, 10)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (51, N'VQ-___7', NULL, 81, 0, 1, 0, 0, 50)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (52, N'_1707 NAS', NULL, 81, 1, 1, 0, 0, 10)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (54, N'VQ-___4', NULL, 80, 0, 1, 1, 0, 50)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (55, N'JFCC-GSI', NULL, 90, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (56, N'JFCC-IMD', NULL, 91, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (57, N'JFCC-SPACE', NULL, 92, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (58, N'IFCC-ISR', NULL, 93, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (59, N'JFCC-NW', NULL, 94, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (60, N'AIR&____4', NULL, 69, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (61, N'AIR&____2', NULL, 67, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (62, N'LANTFLEET', NULL, 107, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (63, N'____5 CTAF', NULL, 76, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (64, N'AIR&____5', NULL, 76, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (65, N'____6 CTAF', NULL, 77, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (66, N'AIR&____6', NULL, 77, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (67, N'LAND&____1', NULL, 21, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (68, N'____1 ARMY', NULL, 21, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (70, N'___18 CORPS', NULL, 22, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (72, N'LAND(___18', NULL, 22, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (73, N'ABN)___82', NULL, 28, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (74, N'___82 ABN DIV', NULL, 28, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (75, N'__101 ABN DIV (AA)', NULL, 30, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (76, N'ABN)__101', NULL, 30, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (78, N'LAND(___21', NULL, 25, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (79, N'___21 CORPS', NULL, 25, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (80, N'ARFORCOM', NULL, 49, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (81, N'PACAF', NULL, 95, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (82, N'ARFORPAC', NULL, 96, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (83, N'PACFLEET', NULL, 97, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (84, N'MARFORPAC', NULL, 98, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (85, N'ARFORSOUTH', NULL, 102, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (86, N'AIRFORSOUTH', NULL, 103, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (87, N'MARFORSOUTH', NULL, 104, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (88, N'SOCSOUTH', NULL, 105, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (89, N'NAVFORSOUTH', NULL, 106, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (90, N'JSOC', NULL, 108, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (91, N'ARSOC', NULL, 109, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (92, N'AFSOC', NULL, 111, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (93, N'NSPWC', NULL, 112, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (94, N'AMC', NULL, 99, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (95, N'MSC', NULL, 100, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (96, N'SDDC', NULL, 101, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (97, N'ASMDC', NULL, 117, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (99, N'____1 SPC BDE', NULL, 122, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (100, N'SPACE*___1', NULL, 122, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (101, N'__100 MD BDE', NULL, 123, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (102, N'MDEF*_100', NULL, 123, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (103, N'ARSTRAT', NULL, 118, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (105, N'___21 ART DIV', NULL, 119, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (106, N'ART)___21', NULL, 119, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (109, N'___22 ART DIV', NULL, 121, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (110, N'ART)___22', NULL, 121, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (111, N'NAVSURFOR', NULL, 58, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (112, N'NAVSUBFOR', NULL, 56, 1, 1, 1, 0, NULL)
GO
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (113, N'NAVAIRFOR', NULL, 55, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (114, N'FLEETFORCOM', NULL, 54, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (115, N'____2 FLT', NULL, 53, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (116, N'FLEET(____2', NULL, 53, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (118, N'NAVAIRFORPAC', NULL, 82, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (119, N'____3 FLT', NULL, 124, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (120, N'FLEET(____3', NULL, 124, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (121, N'FLEET(____7', NULL, 125, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (122, N'____7 FLT', NULL, 125, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (123, N'AFSPC', NULL, 126, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (124, N'AIR(____8', NULL, 131, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (125, N'AIR(___20', NULL, 128, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (126, N'____8 AF', NULL, 131, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (127, N'___20 AF', NULL, 128, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (128, N'INDIACOM', NULL, 137, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (129, N'___90 AFB', NULL, 133, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (130, N'AIR*___90', NULL, 133, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (131, N'___91 AFB', NULL, 134, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (132, N'AIR*___91', NULL, 134, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (133, N'__341 AFB', NULL, 136, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (134, N'AIR*__341', NULL, 136, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (135, N'TF-GNO', NULL, 148, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (136, N'TF-__204', NULL, 138, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (137, N'TF-__214', NULL, 89, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (138, N'TF-__124', NULL, 86, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (139, N'TF-__134', NULL, 152, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (140, N'TF-__144', NULL, 153, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (142, N'AFGSC', NULL, 130, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (146, N'MARFORSTRAT', NULL, 157, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (147, N'LAND%____1', NULL, 158, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (148, N'____1 AG', NULL, 158, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (149, N'____3 CORPS', NULL, 159, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (150, N'LAND(____3', NULL, 159, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (151, N'NAVSUBFORLANT', NULL, 169, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (153, N'SUBFLOT __10', NULL, 166, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (155, N'SUB*__10', NULL, 166, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (156, N'NAVSUBFORPAC', NULL, 168, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (157, N'SUBFLOT ___9', NULL, 167, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (158, N'SUB*___9', NULL, 167, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (159, N'SUBRON __16', NULL, 170, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (160, N'SUB/__16', NULL, 170, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (161, N'SUBRON __17', NULL, 172, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (162, N'SUB/__17', NULL, 172, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (163, N'SUBRON __19', NULL, 173, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (164, N'SUB/__19', NULL, 173, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (165, N'SUBRON __20', NULL, 174, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (166, N'SUB/__20', NULL, 174, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (167, N'SSBN-__730', NULL, 178, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (168, N'S __730', NULL, 178, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (169, N'SSBN-__726', NULL, 186, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (170, N'S __726', NULL, 190, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (171, N'SSBN-__727', NULL, 187, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (172, N'S __727', NULL, 191, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (173, N'SSBN-__728', NULL, 193, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (174, N'S __728', NULL, 175, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (175, N'SSBN-__729', NULL, 196, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (176, N'S __729', NULL, 177, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (177, N'SSBN-__731', NULL, 197, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (178, N'S __731', NULL, 197, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (179, N'SSBN-__732', NULL, 198, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (180, N'S __732', NULL, 198, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (181, N'SSBN-__733', NULL, 199, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (182, N'S __733', NULL, 199, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (183, N'SSBN-__734', NULL, 200, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (184, N'S __734', NULL, 200, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (185, N'SSBN-__735', NULL, 201, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (186, N'S __735', NULL, 201, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (187, N'SSBN-__736', NULL, 203, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (188, N'S __736', NULL, 203, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (189, N'SSBN-__737', NULL, 204, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (190, N'S __737', NULL, 204, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (191, N'SSBN-__738', NULL, 205, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (192, N'S __738', NULL, 205, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (193, N'SSBN-__739', NULL, 206, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (194, N'S __739', NULL, 206, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (195, N'SSBN-__740', NULL, 207, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (196, N'S __740', NULL, 207, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (197, N'SSBN-__741', NULL, 208, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (198, N'S __741', NULL, 208, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (199, N'SSBN-__742', NULL, 209, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (200, N'S __742', NULL, 209, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (201, N'SSBN-__743', NULL, 210, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (202, N'S __743', NULL, 210, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (203, N'SSGN-__726', NULL, 190, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (205, N'SSGN-__727', NULL, 191, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (206, N'SSGN-__728', NULL, 175, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (207, N'SSGN-__729', NULL, 177, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (208, N'NSSC KB', NULL, 213, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (209, N'TRF KB', NULL, 211, 1, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (210, N'NSSC BGR', NULL, 214, 1, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (211, N'AIR@CPT___90', NULL, 221, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (213, N'___90 CPTS', NULL, 221, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (214, N'AIR/MD___90', NULL, 220, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (215, N'___90 MDW', NULL, 220, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (216, N'AIR/MX___90', NULL, 219, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (217, N'___90 MXW', NULL, 219, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (218, N'AIR/SF___90', NULL, 218, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (219, N'___90 SFW', NULL, 218, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (220, N'AIR/MS___90', NULL, 217, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (221, N'___90 MSW', NULL, 217, 0, 1, 1, 0, NULL)
GO
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (222, N'AIR/OPS___90', NULL, 215, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (223, N'___90 MW', NULL, 215, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (224, N'AIR@MDO___90', NULL, 222, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (225, N'___90 MDOS', NULL, 222, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (226, N'AIR@MDS___90', NULL, 223, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (227, N'___90 MDSS', NULL, 223, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (228, N'AIR@SS___90', NULL, 229, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (229, N'___90 SSS', NULL, 229, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (230, N'AIR@MSFS__790', NULL, 228, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (231, N'__790 MSFS', NULL, 228, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (232, N'AIR@MSFS___90', NULL, 227, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (233, N'___90 MSFS', NULL, 227, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (235, N'AIR@SFS___90', NULL, 224, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (236, N'___90 SFS', NULL, 224, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (237, N'AIR@CE___90', NULL, 230, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (238, N'___90 CES', NULL, 230, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (239, N'AIR@COM___90', NULL, 231, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (240, N'___90 COMS', NULL, 231, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (241, N'AIR@CON___90', NULL, 233, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (242, N'___90 CONS', NULL, 233, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (243, N'AIR@FS___90', NULL, 234, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (244, N'___90 FSS', NULL, 234, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (245, N'AIR@LR___90', NULL, 235, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (246, N'___90 LRS', NULL, 235, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (247, N'AIR@MUN___90', NULL, 236, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (248, N'___90 MUNS', NULL, 236, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (249, N'AIR@MMX___90', NULL, 237, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (250, N'___90 MMXS', NULL, 237, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (251, N'AIR@MOS___90', NULL, 238, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (252, N'___90 MOS', NULL, 238, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (253, N'AIR@OPS___90', NULL, 245, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (254, N'___90 OSS', NULL, 245, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (255, N'AIR@FLY__319', NULL, 239, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (256, N'AIR@FLY__320', NULL, 240, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (257, N'AIR@FLY__321', NULL, 241, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (258, N'AIR@FLY___37', NULL, 244, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (259, N'AIR/MD__341', NULL, 285, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (260, N'__341 MDW', NULL, 285, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (261, N'AIR@MOS__341', NULL, 284, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (262, N'__341 MOS', NULL, 284, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (263, N'AIR@MMX__341', NULL, 283, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (264, N'__341 MMXS', NULL, 283, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (265, N'AIR/MX__341', NULL, 282, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (266, N'__341 MXW', NULL, 282, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (268, N'AIR/OPS___91', NULL, 246, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (269, N'___91 MW', NULL, 246, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (270, N'AIR@OSS___91', NULL, 256, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (271, N'___91 OSS', NULL, 256, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (273, N'AIR@FLY___54', NULL, 257, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (274, N'AIR@FLY_1542', NULL, 258, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (276, N'AIR@FLY_1541', NULL, 259, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (277, N'AIR@FLY_1540', NULL, 260, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (278, N'AIR/SF___91', NULL, 248, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (279, N'___91 SFW', NULL, 248, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (280, N'AIR@SF__219', NULL, 252, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (281, N'__219 SFS', NULL, 252, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (282, N'AIR@MSF__791', NULL, 253, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (283, N'__791 MSFS', NULL, 253, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (284, N'AIR@MSF___91', NULL, 254, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (285, N'___91 MSFS', NULL, 254, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (286, N'AIR@SF___91', NULL, 255, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (287, N'___91 SFS', NULL, 255, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (288, N'AIR/MX___91', NULL, 249, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (289, N'___91 MXW', NULL, 249, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (290, N'AIR@CPT__341', NULL, 286, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (291, N'__341 CPTS', NULL, 286, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (293, N'AIR@SS__341', NULL, 281, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (294, N'__341 SSS', NULL, 281, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (295, N'AIR@MSF__741', NULL, 280, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (296, N'__741 MSFS', NULL, 280, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (297, N'AIR@MSF__341', NULL, 278, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (298, N'__341 MSFS', NULL, 278, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (299, N'AIR@SF__341', NULL, 276, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (300, N'__341 SFS', NULL, 276, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (301, N'AIR/SF__341', NULL, 265, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (302, N'__341 SFW', NULL, 265, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (303, N'AIR@LR__341', NULL, 275, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (304, N'__341 LRS', NULL, 275, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (305, N'AIR@FS__341', NULL, 274, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (306, N'__341 FSS', NULL, 274, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (307, N'AIR@CON__341', NULL, 273, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (308, N'__341 CONS', NULL, 273, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (309, N'AIR@COM__341', NULL, 272, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (310, N'__341 COMS', NULL, 272, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (311, N'AIR@CE__341', NULL, 271, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (312, N'__341 CES', NULL, 271, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (313, N'AIR/MS__341', NULL, 264, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (314, N'__341 MSW', NULL, 264, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (315, N'AIR@OS__341', NULL, 270, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (316, N'__341 OSS', NULL, 270, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (318, N'AIR@FLY___40', NULL, 269, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (319, N'AIR@FLY__490', NULL, 268, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (320, N'AIR@FLY_1012', NULL, 267, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (321, N'AIR@FLY_1010', NULL, 266, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (322, N'__341 MW', NULL, 262, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (323, N'AIR/OPS__341', NULL, 262, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (324, N'AIR*____2', NULL, 143, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (325, N'____2 AFB', NULL, 143, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (326, N'AIR*____5', NULL, 144, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (327, N'____5 AFB', NULL, 144, 0, 1, 0, 0, NULL)
GO
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (328, N'AIR*____7', NULL, 145, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (329, N'____7 AFB', NULL, 145, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (330, N'AIR*___28', NULL, 146, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (331, N'___28 AFB', NULL, 146, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (332, N'AIR*__509', NULL, 147, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (333, N'___509 AFB', NULL, 147, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (349, N'AIR/MX____2', NULL, 299, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (350, N'____2 MXW/RAF', NULL, 299, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (351, N'AIR@AMX____2', NULL, 300, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (352, N'____2 AMXS/RAF', NULL, 300, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (353, N'AIR@MX____2', NULL, 301, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (354, N'____2 MXS/RAF', NULL, 301, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (355, N'AIR@MUN____2', NULL, 302, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (356, N'____2 MUNS/RAF', NULL, 302, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (357, N'AIR@MO____2', NULL, 303, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (358, N'____2 MOS/RAF', NULL, 303, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (359, N'AIR/MS____2', NULL, 304, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (360, N'____2 MSW/RAF', NULL, 304, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (361, N'AIR@CE____2', NULL, 305, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (362, N'____2 CES/RAF', NULL, 305, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (363, N'AIR@COM____2', NULL, 306, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (364, N'____2 COMS/RAF', NULL, 306, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (365, N'AIR@CON____2', NULL, 307, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (366, N'____2 CONS/RAF', NULL, 307, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (367, N'AIR@FS____2', NULL, 308, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (368, N'____2 FSS/RAF', NULL, 308, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (369, N'AIR@CPT____2', NULL, 315, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (370, N'____2 CPTS/RAF', NULL, 315, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (371, N'AIR@LR____2', NULL, 309, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (372, N'____2 LRS/RAF', NULL, 309, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (373, N'AIR@MS____2', NULL, 310, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (374, N'____2 MSS/RAF', NULL, 310, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (375, N'AIR@SF____2', NULL, 311, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (376, N'____2 SFS/RAF', NULL, 311, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (377, N'RAFRGT|____2', NULL, 312, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (380, N'____2 FLT., RAF RGT.', NULL, 312, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (381, N'RAFP|____2', NULL, 313, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (382, N'____2 FLT., RAFP', NULL, 313, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (383, N'AIR/MD____2', NULL, 317, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (384, N'____2 MDW/RAF', NULL, 317, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (386, N'AIR/OPS____2', NULL, 318, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (387, N'____2 BW/RAF', NULL, 318, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (388, N'AIR@OS___2', NULL, 319, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (389, N'____2 OSS/RAF', NULL, 319, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (391, N'AIR@FLY__496', NULL, 320, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (392, N'AIR@FLY__119', NULL, 322, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (393, N'AIR@FLY__211', NULL, 323, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (394, N'AIR@FLY_1707', NULL, 81, 0, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (395, N'AIR@FLY_1803', NULL, 79, 0, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (396, N'AIR@FLY_1804', NULL, 80, 0, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (397, N'AIR/OPS____5', NULL, 324, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (398, N'____5 BW/RAF', NULL, 324, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (399, N'AIR@OPS____5', NULL, 325, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (400, N'____5 OPSS/RAF', NULL, 325, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (402, N'AIR/MD____5', NULL, 327, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (403, N'____5 MDW/RAF', NULL, 327, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (404, N'AIR@MDO____5', NULL, 328, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (405, N'____5 MDOS/RAF', NULL, 328, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (406, N'AIR/MX____5', NULL, 329, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (407, N'____5 MXW/RAF', NULL, 329, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (408, N'AIR@AMX____5', NULL, 330, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (409, N'____5 AMXS/RAF', NULL, 330, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (410, N'AIR@MX____5', NULL, 331, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (411, N'____5 MXS/RAF', NULL, 331, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (412, N'AIR@MUN____5', NULL, 332, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (413, N'____5 MUNS/RAF', NULL, 332, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (414, N'AIR@MO____5', NULL, 333, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (415, N'____5 MOS/RAF', NULL, 333, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (416, N'AIR/MS____5', NULL, 334, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (417, N'____5 MSW/RAF', NULL, 334, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (418, N'AIR@CE____5', NULL, 335, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (419, N'____5 CES/RAF', NULL, 335, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (420, N'AIR@COM____5', NULL, 336, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (421, N'____5 COMS/RAF', NULL, 336, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (422, N'AIR@CON____5', NULL, 337, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (423, N'____5 CONS/RAF', NULL, 337, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (424, N'AIR@FS____5', NULL, 338, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (425, N'____5 FSS/RAF', NULL, 338, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (426, N'AIR@LR____5', NULL, 339, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (427, N'____5 LRS/RAF', NULL, 339, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (428, N'AIR@SF____5', NULL, 340, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (429, N'____5 SFS/RAF', NULL, 340, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (430, N'RAFRGT|____5', NULL, 341, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (431, N'____5 FLT., RAF RGT.', NULL, 341, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (432, N'RAFP|____5', NULL, 342, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (433, N'____5 FLT., RAFP', NULL, 342, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (435, N'AIR@CPT____5', NULL, 344, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (436, N'____5 CPTS/RAF', NULL, 344, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (437, N'AIR@MDS____5', NULL, 346, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (438, N'____5 MDS/RAF', NULL, 346, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (439, N'AIR@FLY__423', NULL, 347, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (440, N'RCAF@__423', NULL, 347, 0, 0, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (441, N'AIR@FLY__469', NULL, 348, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (442, N'RCAF@__469', NULL, 348, 0, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (443, N'USAF BS ___20', NULL, 322, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (444, N'USAF BS ___11', NULL, 323, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (445, N'USAF BS ___96', NULL, 320, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (446, N'USAF BS ___23', NULL, 347, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (448, N'USAF BS ___69', NULL, 348, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (449, N'AIR/OPS__509', NULL, 349, 1, 0, 0, 0, NULL)
GO
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (450, N'__509 BW/RAF', NULL, 349, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (451, N'AIR@OS__509', NULL, 350, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (452, N'__509 OSS/RAF', NULL, 350, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (453, N'AIR@CPT__509', NULL, 351, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (454, N'__509 CPTS/RAF', NULL, 351, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (455, N'AIR/MD__509', NULL, 352, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (456, N'__509 MDW/RAF', NULL, 352, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (457, N'AIR/MX__509', NULL, 353, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (458, N'__509 MXW/RAF', NULL, 353, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (459, N'AIR@AMX__509', NULL, 354, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (460, N'__509 AMXS/RAF', NULL, 354, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (461, N'AIR@MX__509', NULL, 355, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (462, N'__509 MXS/RAF', NULL, 355, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (463, N'AIR@MUN__509', NULL, 356, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (464, N'__509 MUNS/RAF', NULL, 356, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (465, N'AIR/MS__509', NULL, 357, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (466, N'__509 MSW/RAF', NULL, 357, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (467, N'AIR@CE__509', NULL, 358, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (468, N'__509 CES/RAF', NULL, 358, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (469, N'AIR@COM__509', NULL, 359, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (470, N'__509 COMS/RAF', NULL, 359, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (471, N'AIR@CON__509', NULL, 360, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (472, N'__509 CONS/RAF', NULL, 360, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (473, N'AIR@FS__509', NULL, 361, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (474, N'__509 FSS/RAF', NULL, 361, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (475, N'AIR@LR__509', NULL, 362, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (476, N'__509 LRS/RAF', NULL, 362, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (477, N'AIR@SF__509', NULL, 363, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (478, N'__509 SFS/RAF', NULL, 363, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (479, N'RAFRGT|__509', NULL, 364, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (480, N'__509 FLT., RAF RGT.', NULL, 364, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (481, N'RAFP|__509', NULL, 365, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (482, N'__509 FLT., RAFP', NULL, 365, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (483, N'AIR@FLY__163', NULL, 367, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (484, N'USAF BS ___13', NULL, 367, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (485, N'AIR@FLY__393', NULL, 369, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (487, N'USAF BS __393', NULL, 369, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (488, N'USAF CTS __394', NULL, 371, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (489, N'AIR@TRG__394', NULL, 371, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (490, N'__394 CTU', NULL, 371, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (491, N'AIR@FLY__394', NULL, 371, 0, 0, 0, 1, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (501, N'____7 MSW/RAF', NULL, 376, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (502, N'AIR@CE____7', NULL, 377, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (503, N'____7 CES/RAF', NULL, 377, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (504, N'AIR@COM____7', NULL, 378, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (505, N'____7 COMS/RAF', NULL, 378, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (506, N'AIR@CON____7', NULL, 379, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (507, N'____7 CONS/RAF', NULL, 379, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (508, N'AIR@FS____7', NULL, 380, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (509, N'____7 FSS/RAF', NULL, 380, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (510, N'AIR@LR____7', NULL, 381, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (511, N'____7 LRS/RAF', NULL, 381, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (512, N'AIR@SF____7', NULL, 382, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (513, N'____7 SFS/RAF', NULL, 382, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (514, N'RAFRGT|____7', NULL, 383, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (515, N'____7 FLT., RAF RGT.', NULL, 383, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (516, N'RAFP|____7', NULL, 384, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (517, N'____7 FLT., RAFP', NULL, 384, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (521, N'AIR/MD____7', NULL, 388, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (522, N'____7 MDW/RAF', NULL, 388, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (523, N'AIR@AD____7', NULL, 389, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (524, N'____7 ADS/RAF', NULL, 389, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (525, N'AIR@MDO____7', NULL, 390, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (526, N'____7 MDOS/RAF', NULL, 390, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (527, N'AIR@MDS____7', NULL, 391, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (528, N'____7 MDSS/RAF', NULL, 391, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (529, N'AIR/MX____7', NULL, 392, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (530, N'____7 MXW/RAF', NULL, 392, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (531, N'AIR@AMX____7', NULL, 393, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (532, N'____7 AMXS/RAF', NULL, 393, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (533, N'AIR@CMX____7', NULL, 394, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (534, N'____7 CMXS/RAF', NULL, 394, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (535, N'AIR@EMX____7', NULL, 395, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (536, N'____7 EMXS/RAF', NULL, 395, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (537, N'AIR@MUN____7', NULL, 396, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (538, N'____7 MUNS/RAF', NULL, 396, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (539, N'AIR@MO____7', NULL, 397, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (540, N'____7 MOS/RAF', NULL, 397, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (544, N'AIR@CPT____7', NULL, 398, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (545, N'____7 CPTS/RAF', NULL, 398, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (546, N'AIR/OPS____7', NULL, 326, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (547, N'____7 BW/RAF', NULL, 326, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (548, N'AIR@OS____7', NULL, 399, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (549, N'____7 OSS/RAF', NULL, 399, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (550, N'USAF BS ____9', NULL, 400, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (551, N'AIR@FLY__209', NULL, 400, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (552, N'USAF BS ___28', NULL, 401, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (553, N'AIR@FLY__328', NULL, 401, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (554, N'USAF TRS __436', NULL, 402, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (556, N'AIR@TRG__436', NULL, 402, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (557, N'AIR@FLY__436', NULL, 402, 0, 0, 0, 1, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (559, N'__436 TU/RAF', NULL, 402, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (563, N'AIR/MS____7', NULL, 376, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (565, N'AIR/AO__908', NULL, 372, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (566, N'__908 AOC/RAF', NULL, 372, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (568, N'AIR/OPS__908', NULL, 372, 0, 0, 0, 1, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (569, N'AIR@CPT___28', NULL, 404, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (570, N'___28 CPTS/RAF', NULL, 404, 0, 1, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (572, N'AIR/OPS___28', NULL, 405, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (573, N'___28 BW/RAF', NULL, 405, 0, 1, 0, 0, NULL)
GO
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (574, N'AIR@FLY__534', NULL, 407, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (575, N'USAF BS ___34', NULL, 407, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (576, N'AIR@FLY__537', NULL, 408, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (578, N'USAF BS ___37', NULL, 408, 0, 1, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (581, N'AIR@FLY__432', NULL, 410, 1, 0, 0, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (582, N'RCAF@__432', NULL, 410, 0, 0, 1, 0, NULL)
INSERT [dbo].[UnitIndex] ([UnitIndexId], [IndexCode], [UnitGuid], [UnitId], [IsSortIndex], [IsDisplayIndex], [IsAlt], [IsPlaceholder], [DisplayOrder]) VALUES (584, N'USAF ATKS __432', NULL, 410, 0, 1, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[UnitIndex] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IndexCode]    Script Date: 21/06/2018 19:51:18 ******/
ALTER TABLE [dbo].[UnitIndex] ADD  CONSTRAINT [IX_IndexCode] UNIQUE NONCLUSTERED 
(
	[IndexCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminCorps]  WITH CHECK ADD  CONSTRAINT [FK_AdminCorps_AdminCorps] FOREIGN KEY([ParentUnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[AdminCorps] CHECK CONSTRAINT [FK_AdminCorps_AdminCorps]
GO
ALTER TABLE [dbo].[Base]  WITH CHECK ADD  CONSTRAINT [FK_Base_Base] FOREIGN KEY([ParentBaseId])
REFERENCES [dbo].[Base] ([BaseId])
GO
ALTER TABLE [dbo].[Base] CHECK CONSTRAINT [FK_Base_Base]
GO
ALTER TABLE [dbo].[EquipmentOwner]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentOwner_Aircraft] FOREIGN KEY([AircraftId])
REFERENCES [dbo].[Aircraft] ([AircraftGuid])
GO
ALTER TABLE [dbo].[EquipmentOwner] CHECK CONSTRAINT [FK_EquipmentOwner_Aircraft]
GO
ALTER TABLE [dbo].[EquipmentOwner]  WITH CHECK ADD  CONSTRAINT [FK_EquipmentOwner_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[EquipmentOwner] CHECK CONSTRAINT [FK_EquipmentOwner_Unit]
GO
ALTER TABLE [dbo].[MissionUnit]  WITH CHECK ADD  CONSTRAINT [FK_MissionUnit_Mission] FOREIGN KEY([MissionId])
REFERENCES [dbo].[Mission] ([MissionId])
GO
ALTER TABLE [dbo].[MissionUnit] CHECK CONSTRAINT [FK_MissionUnit_Mission]
GO
ALTER TABLE [dbo].[MissionUnit]  WITH CHECK ADD  CONSTRAINT [FK_MissionUnit_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[MissionUnit] CHECK CONSTRAINT [FK_MissionUnit_Unit]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Relationship_RelationshipType] FOREIGN KEY([RelTypeIdx])
REFERENCES [dbo].[RelationshipType] ([RelationshipTypeId])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_Relationship_RelationshipType]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipFrom_Unit] FOREIGN KEY([RelFromUnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_RelationshipFrom_Unit]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_RelationshipTo_Unit] FOREIGN KEY([RelToUnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_RelationshipTo_Unit]
GO
ALTER TABLE [dbo].[Ship]  WITH CHECK ADD  CONSTRAINT [FK_Ship_NewShip] FOREIGN KEY([NewShipId])
REFERENCES [dbo].[Ship] ([ShipId])
GO
ALTER TABLE [dbo].[Ship] CHECK CONSTRAINT [FK_Ship_NewShip]
GO
ALTER TABLE [dbo].[Ship]  WITH CHECK ADD  CONSTRAINT [FK_Ship_ShipPrefix] FOREIGN KEY([ShipPrefixId])
REFERENCES [dbo].[ShipPrefix] ([ShipPrefixId])
GO
ALTER TABLE [dbo].[Ship] CHECK CONSTRAINT [FK_Ship_ShipPrefix]
GO
ALTER TABLE [dbo].[Ship]  WITH CHECK ADD  CONSTRAINT [FK_Ship_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Ship] CHECK CONSTRAINT [FK_Ship_Unit]
GO
ALTER TABLE [dbo].[ShipClass]  WITH CHECK ADD  CONSTRAINT [FK_ShipClass_Mod] FOREIGN KEY([ModFrom])
REFERENCES [dbo].[ShipClass] ([ShipClassId])
GO
ALTER TABLE [dbo].[ShipClass] CHECK CONSTRAINT [FK_ShipClass_Mod]
GO
ALTER TABLE [dbo].[ShipClassMember]  WITH CHECK ADD  CONSTRAINT [FK_ShipClassMember_Ship] FOREIGN KEY([ShipId])
REFERENCES [dbo].[Ship] ([ShipId])
GO
ALTER TABLE [dbo].[ShipClassMember] CHECK CONSTRAINT [FK_ShipClassMember_Ship]
GO
ALTER TABLE [dbo].[ShipClassMember]  WITH CHECK ADD  CONSTRAINT [FK_ShipClassMember_ShipClass] FOREIGN KEY([ShipClassId])
REFERENCES [dbo].[ShipClass] ([ShipClassId])
GO
ALTER TABLE [dbo].[ShipClassMember] CHECK CONSTRAINT [FK_ShipClassMember_ShipClass]
GO
ALTER TABLE [dbo].[TaskForce]  WITH CHECK ADD  CONSTRAINT [FK_TaskForce_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[TaskForce] CHECK CONSTRAINT [FK_TaskForce_Unit]
GO
ALTER TABLE [dbo].[Tennant]  WITH CHECK ADD  CONSTRAINT [FK_Tennant_Base] FOREIGN KEY([BaseId])
REFERENCES [dbo].[Base] ([BaseId])
GO
ALTER TABLE [dbo].[Tennant] CHECK CONSTRAINT [FK_Tennant_Base]
GO
ALTER TABLE [dbo].[Tennant]  WITH CHECK ADD  CONSTRAINT [FK_Tennant_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Tennant] CHECK CONSTRAINT [FK_Tennant_Unit]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_AdminCorps] FOREIGN KEY([AdminCorpsId])
REFERENCES [dbo].[AdminCorps] ([AdminCorpsId])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_Unit_AdminCorps]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Rank] FOREIGN KEY([RankSymbol])
REFERENCES [dbo].[Rank] ([Symbol])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_Unit_Rank]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Service] FOREIGN KEY([ServiceIdx])
REFERENCES [dbo].[Service] ([ServiceId])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_Unit_Service]
GO
ALTER TABLE [dbo].[Unit]  WITH CHECK ADD  CONSTRAINT [FK_Unit_ServiceType] FOREIGN KEY([ServiceTypeIdx])
REFERENCES [dbo].[ServiceType] ([ServiceTypeId])
GO
ALTER TABLE [dbo].[Unit] CHECK CONSTRAINT [FK_Unit_ServiceType]
GO
ALTER TABLE [dbo].[UnitIndex]  WITH CHECK ADD  CONSTRAINT [FK_UnitIndex_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[UnitIndex] CHECK CONSTRAINT [FK_UnitIndex_Unit]
GO
USE [master]
GO
ALTER DATABASE [Liaison] SET  READ_WRITE 
GO
