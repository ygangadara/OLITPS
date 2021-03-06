USE [master]
GO
/****** Object:  Database [OLITPS]    Script Date: 10/9/2019 12:11:27 PM ******/
CREATE DATABASE [OLITPS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OLITPS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OLITPS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OLITPS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OLITPS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OLITPS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OLITPS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OLITPS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OLITPS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OLITPS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OLITPS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OLITPS] SET ARITHABORT OFF 
GO
ALTER DATABASE [OLITPS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OLITPS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OLITPS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OLITPS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OLITPS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OLITPS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OLITPS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OLITPS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OLITPS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OLITPS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OLITPS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OLITPS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OLITPS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OLITPS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OLITPS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OLITPS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OLITPS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OLITPS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OLITPS] SET  MULTI_USER 
GO
ALTER DATABASE [OLITPS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OLITPS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OLITPS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OLITPS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OLITPS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OLITPS] SET QUERY_STORE = OFF
GO
USE [OLITPS]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 10/9/2019 12:11:27 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Table [dbo].[Tbl_Emp_Type_Mapping]    Script Date: 10/9/2019 12:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Emp_Type_Mapping](
	[Emp_Type_Map_Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Id] [int] NOT NULL,
	[Emp_Type_Id] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Tbl_Emp_Type_Mapping] PRIMARY KEY CLUSTERED 
(
	[Emp_Type_Map_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_EmployeeMaster]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_EmployeeMaster](
	[Emp_Id] [int] IDENTITY(1,1) NOT NULL,
	[PortalId] [int] NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Fname] [varchar](max) NOT NULL,
	[Lname] [varchar](max) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Email] [varchar](max) NULL,
	[Designation] [varchar](max) NULL,
	[Mobile_No] [varchar](50) NOT NULL,
	[Pan_No] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[Emp_Type_Id] [int] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_EmployeeMaster] PRIMARY KEY CLUSTERED 
(
	[Emp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_EmployeeType]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_EmployeeType](
	[Emp_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Type] [varchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_EmployeeType] PRIMARY KEY CLUSTERED 
(
	[Emp_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_FY]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_FY](
	[FY_Id] [int] IDENTITY(1,1) NOT NULL,
	[FY_StartDateTime] [datetime] NULL,
	[FY_EndDateTime] [datetime] NULL,
	[Is_Current_FY] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_FY] PRIMARY KEY CLUSTERED 
(
	[FY_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Guidelines]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Guidelines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [varchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Guidelines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_HouseLoan_PropertyDetails]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_HouseLoan_PropertyDetails](
	[HLPD_Id] [int] IDENTITY(1,1) NOT NULL,
	[FY_Id] [int] NOT NULL,
	[Portal_Id] [int] NOT NULL,
	[TypeOfProperty] [varchar](255) NULL,
	[Owner] [varchar](255) NULL,
	[AddressOfProperty] [varchar](2550) NULL,
	[FinancialInstituteDetails] [varchar](2550) NULL,
	[Possession_Completion_Date] [datetime] NULL,
	[InterestPaid] [decimal](18, 2) NULL,
	[HouseLoanPrincipalAmount] [decimal](18, 2) NULL,
	[ApprovedAmount] [decimal](18, 2) NULL,
	[ApprovedBy] [varchar](255) NULL,
	[ApprovedOn] [datetime] NULL,
	[UpoadedFileName] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[Remarks] [varchar](2550) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](255) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_HouseLoan_PropertyDetails] PRIMARY KEY CLUSTERED 
(
	[HLPD_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_HRA]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_HRA](
	[HRA_Id] [int] IDENTITY(1,1) NOT NULL,
	[FY_Id] [int] NOT NULL,
	[Portal_Id] [int] NOT NULL,
	[MonthName] [varchar](50) NULL,
	[City] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
	[LandlordName] [varchar](100) NULL,
	[LandlordAddress] [varchar](2000) NULL,
	[LandlardPan] [nvarchar](10) NULL,
	[Amount] [decimal](18, 0) NULL,
	[ApprovedAmount] [decimal](18, 0) NULL,
	[ApprovedBy] [varchar](100) NULL,
	[ApprovedOn] [datetime] NULL,
	[Status] [varchar](100) NULL,
	[Remarks] [varchar](100) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_HRA] PRIMARY KEY CLUSTERED 
(
	[HRA_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_HRAdminMapping]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_HRAdminMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NOT NULL,
	[EmpTypeID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_HRAUploadFiles]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_HRAUploadFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PortalID] [int] NOT NULL,
	[FY_ID] [int] NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_HRAUploadFiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Emp_Type_Mapping] ON 

INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (7, 4, 1, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (8, 4, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (9, 5, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (10, 6, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (11, 7, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (12, 8, 2, 1)
SET IDENTITY_INSERT [dbo].[Tbl_Emp_Type_Mapping] OFF
SET IDENTITY_INSERT [dbo].[Tbl_EmployeeMaster] ON 

INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 190025, N'5TGzCS7pm3N5KmgK+RIkpuZb3nBP6JJ18lXw3rucdjn24GwKmGv6jA==', N'Naveen', N'Manral', CAST(N'1984-07-01T00:00:00.000' AS DateTime), N'naveensingh.manral@nttdata.com', N'SSE', N'9013341210', N'APTPM8833N', 1, 1, N'190025', CAST(N'2019-09-26T12:57:54.743' AS DateTime), N'190025', CAST(N'2019-09-26T12:57:54.743' AS DateTime))
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 190529, N'RZysdkm8npJ3x6LIxjvxFouTyqdXq6yw7evFtK/hxvtO2xyvfyvS9w==', N'Ravikant', N'Tyagi', CAST(N'1985-07-05T00:00:00.000' AS DateTime), N'ravikant.ravikant@nttdata.com', N'SSE', N'9650498556', N'APTPM8833TT', 1, 2, N'190025', CAST(N'2019-09-26T15:30:41.663' AS DateTime), N'190025', CAST(N'2019-09-26T15:30:41.663' AS DateTime))
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 181289, N'9Q2atWi+1BlSl8Qqkl2w+En0xscRYSYevqRbix6w4Q6P7JQ+aq/Y5A==', N'Yanamala', N'Gangadara', CAST(N'1996-08-19T00:00:00.000' AS DateTime), N'Gangadara.Yanamala@nttdata.com', N'SSE', N'9177500447', N'ATZPY1710D', 1, 2, N'190025', CAST(N'2019-09-27T17:06:07.100' AS DateTime), N'190025', CAST(N'2019-09-27T17:06:07.100' AS DateTime))
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 111, N'hg0/8ZF3lNasQi9Zak7xIw==', N'Test', N'Dev', CAST(N'1984-07-01T00:00:00.000' AS DateTime), N'naveensingh.manral1@nttdata.co', N'SSE', N'9177500447', N'TTT', 1, 2, N'190025', CAST(N'2019-10-03T10:51:39.950' AS DateTime), N'190025', CAST(N'2019-10-03T10:51:39.950' AS DateTime))
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 1111, N'y49zlbf+rc3zR7YYoRKWgrlufdp07uP+S40Jhn6FV8c=', N'Naveen', N'Manral', CAST(N'1984-07-01T00:00:00.000' AS DateTime), N'manral.naveen@gmail.com', N'SSIS', N'9013341210', N'APTPM8833N', 1, 2, N'190025', CAST(N'2019-10-05T20:52:57.133' AS DateTime), N'190025', CAST(N'2019-10-05T20:52:57.133' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_EmployeeMaster] OFF
SET IDENTITY_INSERT [dbo].[Tbl_EmployeeType] ON 

INSERT [dbo].[Tbl_EmployeeType] ([Emp_Type_Id], [Emp_Type], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'HR', 1, N'190025', CAST(N'2019-09-25T12:05:21.140' AS DateTime), N'190025', CAST(N'2019-09-25T12:05:21.140' AS DateTime))
INSERT [dbo].[Tbl_EmployeeType] ([Emp_Type_Id], [Emp_Type], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Employee', 1, N'190025', CAST(N'2019-09-25T12:05:34.953' AS DateTime), N'190025', CAST(N'2019-09-25T12:05:34.953' AS DateTime))
INSERT [dbo].[Tbl_EmployeeType] ([Emp_Type_Id], [Emp_Type], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Admin', 1, N'190025', CAST(N'2019-09-25T12:05:42.917' AS DateTime), N'190025', CAST(N'2019-09-25T12:05:42.917' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_EmployeeType] OFF
SET IDENTITY_INSERT [dbo].[Tbl_FY] ON 

INSERT [dbo].[Tbl_FY] ([FY_Id], [FY_StartDateTime], [FY_EndDateTime], [Is_Current_FY], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1, CAST(N'2019-04-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 1, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_FY] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Guidelines] ON 

INSERT [dbo].[Tbl_Guidelines] ([Id], [Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'The file should be uploaded for crrent financial year', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guidelines] ([Id], [Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Please fill the declared column.Edit/Update can be done to the input fields which are not in grey', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guidelines] ([Id], [Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Tax will be deducted till Dec/Jan on the basis of investment declaration updated under this', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guidelines] ([Id], [Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'In case the tax is paid more than Rs.8333 per month/Rs.100000 per annum,Land lord PAN has to be updated', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guidelines] ([Id], [Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Rent details has to be filled for entire Financial Year.', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guidelines] ([Id], [Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, N'If you have joined in the current financial year(i.e., after 1st April 2019),needs to update their income', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Guidelines] OFF
SET IDENTITY_INSERT [dbo].[Tbl_HouseLoan_PropertyDetails] ON 

INSERT [dbo].[Tbl_HouseLoan_PropertyDetails] ([HLPD_Id], [FY_Id], [Portal_Id], [TypeOfProperty], [Owner], [AddressOfProperty], [FinancialInstituteDetails], [Possession_Completion_Date], [InterestPaid], [HouseLoanPrincipalAmount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [UpoadedFileName], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 1, 111, N'Joined', N'Naveen Singh ManralTest', N'NOida', N'PNB', CAST(N'2019-10-09T11:20:22.880' AS DateTime), CAST(32000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'', CAST(N'2019-10-09T11:20:22.880' AS DateTime), N'HOmeLoan_111_0af170f609e34be29397437cd93b1a42.pdf', N'Submitted', NULL, 1, N'111', CAST(N'2019-10-08T18:53:58.470' AS DateTime), N'111', CAST(N'2019-10-09T11:20:22.880' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_HouseLoan_PropertyDetails] OFF
SET IDENTITY_INSERT [dbo].[Tbl_HRA] ON 

INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 1, 111, N'April-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.383' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 1, 111, N'May-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.410' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 1, 111, N'June-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.417' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 1, 111, N'July-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.423' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 1, 111, N'August-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.430' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 1, 111, N'September-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.437' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 1, 111, N'October-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.440' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 1, 111, N'November-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.450' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 1, 111, N'December-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.457' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 1, 111, N'January-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.463' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 1, 111, N'February-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.470' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 1, 111, N'March-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'111', CAST(N'2019-10-07T15:56:57.477' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_HRA] OFF
SET IDENTITY_INSERT [dbo].[Tbl_HRAdminMapping] ON 

INSERT [dbo].[Tbl_HRAdminMapping] ([Id], [PortalID], [EmpTypeID], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 190025, 1, 1, NULL, CAST(N'2019-10-04T19:39:16.793' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAdminMapping] ([Id], [PortalID], [EmpTypeID], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 190025, 2, 1, NULL, CAST(N'2019-10-04T19:39:25.827' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAdminMapping] ([Id], [PortalID], [EmpTypeID], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 190025, 3, 1, NULL, CAST(N'2019-10-04T19:39:35.877' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_HRAdminMapping] OFF
SET IDENTITY_INSERT [dbo].[Tbl_HRAUploadFiles] ON 

INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 111, 1, N'HRA_111_7be2d09375284f1b80e098cb1900d87d.pdf', 0, NULL, CAST(N'2019-10-06T15:54:03.797' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 111, 1, N'HRA_111_bbcebe666d6e4c1bbad8cff515c759af.pdf', 0, NULL, CAST(N'2019-10-06T16:05:04.040' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 111, 1, N'HRA_111_226b2e08fb5e4094ae7eac6a7c4eb2cd.pdf', 0, NULL, CAST(N'2019-10-06T16:23:35.183' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 111, 1, N'HRA_111_56a167b42ae945788682bfea06058d6a.pdf', 0, NULL, CAST(N'2019-10-06T16:25:10.897' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 111, 1, N'HRA_111_f92e2da15cb64754b66b2d5f49db6669.pdf', 0, NULL, CAST(N'2019-10-06T17:11:14.493' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 111, 1, N'HRA_111_84b07fefb0c3410699562b41706ceb45.pdf', 0, NULL, CAST(N'2019-10-09T10:42:03.723' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 111, 1, N'HRA_111_d0a3f47b80e2409496195b4e0913fc02.pdf', 0, NULL, CAST(N'2019-10-09T10:51:58.127' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 111, 1, N'HRA_111_8135bab97d0e4c68a0f370295522d54d.pdf', 0, NULL, CAST(N'2019-10-09T10:52:04.553' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 111, 1, N'HRA_111_91cc99fc5d7c4439852fc256b782fb03.pdf', 1, NULL, CAST(N'2019-10-09T11:04:33.420' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 111, 1, N'HRA_111_004b907bce844e10a9e430c813e7f00d.pdf', 0, NULL, CAST(N'2019-10-09T11:15:09.620' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 111, 1, N'HRA_111_83fe026c00d140daa199c6661903ae1b.pdf', 1, NULL, CAST(N'2019-10-09T12:01:10.703' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 111, 1, N'HRA_111_c97ba5cdccbf451ebfdf2945dbe63127.pdf', 0, NULL, CAST(N'2019-10-09T12:04:08.243' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_HRAUploadFiles] OFF
/****** Object:  StoredProcedure [dbo].[Insert_User]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[Insert_User]
@PortalId			int,
@Password			varchar(max),
@Fname				NVARCHAR(30),
@Lname				NVARCHAR(30),
@DOB				DATETIME	,
@Email				NVARCHAR(30),
@Designation		NVARCHAR(30),
@Mobile_No			NVARCHAR(30),
@Pan_No				NVARCHAR(30),
@Emp_Type_Id		int

AS

BEGIN

       SET NOCOUNT ON;

       IF EXISTS(SELECT PortalId FROM Tbl_EmployeeMaster WHERE PortalId = @PortalId)

       BEGIN

              SELECT -1 AS PortalId -- Username exists.

       END

       ELSE IF EXISTS(SELECT PortalId FROM Tbl_EmployeeMaster WHERE Email = @Email)

       BEGIN

              SELECT -2 AS PortalId -- Email exists.

       END

	  ELSE IF (@Emp_Type_Id=1)--For HR 

       BEGIN
	  
						 
					INSERT INTO Tbl_EmployeeMaster

											(PortalId
					,Password
					,Fname
					,Lname
					,DOB
					,Email
					,Designation
					,Mobile_No
					,Pan_No
					,IsActive
					,Emp_Type_Id
					,CreatedBy
					,CreatedOn
					,UpdatedBy
					,UpdatedOn)

								  VALUES(
								  @PortalId	
								  ,@Password	
								  ,@Fname		
								  ,@Lname		
								  ,@DOB		
								  ,@Email		
								  ,@Designation
								  ,@Mobile_No	
								  ,@Pan_No
								  ,1		
								  ,1
								  ,'190025'
								  ,GETDATE()
								  ,'190025'
								  ,GETDATE())

					--For HR
					 DECLARE @HREmpID as INT
					 select @HREmpID = Scope_Identity() 
					 --set @EmpID=SELECT SCOPE_IDENTITY()
					--	print @EmpID
					INSERT INTO Tbl_Emp_Type_Mapping

											(Emp_Id,
												Emp_Type_Id,
													IsActive)

								  VALUES(
								  	@HREmpID
								  ,1	
								  ,1		
								  )
								  --For EMP
								  INSERT INTO Tbl_Emp_Type_Mapping

											(Emp_Id,
												Emp_Type_Id,
													IsActive)

								  VALUES(
								  @HREmpID	
								  ,2	
								  ,1		
								  )
								   SELECT @PortalId 

       END
	   ELSE IF (@Emp_Type_Id=2)--For Emp

       BEGIN

						INSERT INTO Tbl_EmployeeMaster

									(PortalId
			,Password
			,Fname
			,Lname
			,DOB
			,Email
			,Designation
			,Mobile_No
			,Pan_No
			,IsActive
			,Emp_Type_Id
			,CreatedBy
			,CreatedOn
			,UpdatedBy
			,UpdatedOn)

						  VALUES(
						  @PortalId	
						  ,@Password	
						  ,@Fname		
						  ,@Lname		
						  ,@DOB		
						  ,@Email		
						  ,@Designation
						  ,@Mobile_No	
						  ,@Pan_No
						  ,1		
						  ,2
						  ,'190025'
						  ,GETDATE()
						  ,'190025'
						  ,GETDATE())
					DECLARE @EmpID as INT
					 select @EmpID = Scope_Identity() 
					  --For EMP
								  INSERT INTO Tbl_Emp_Type_Mapping

											(Emp_Id,
												Emp_Type_Id,
													IsActive)

								  VALUES(
								  @EmpID	
								  ,2	
								  ,1		
								  )
								   SELECT @PortalId 
       END
	    ELSE IF (@Emp_Type_Id=3)

       BEGIN

							  --For Emp
							  INSERT INTO Tbl_EmployeeMaster

										(PortalId
				,Password
				,Fname
				,Lname
				,DOB
				,Email
				,Designation
				,Mobile_No
				,Pan_No
				,IsActive
				,Emp_Type_Id
				,CreatedBy
				,CreatedOn
				,UpdatedBy
				,UpdatedOn)

							  VALUES(
							  @PortalId	
							  ,@Password	
							  ,@Fname		
							  ,@Lname		
							  ,@DOB		
							  ,@Email		
							  ,@Designation
							  ,@Mobile_No	
							  ,@Pan_No
							  ,1		
							  ,2
							  ,'190025'
							  ,GETDATE()
							  ,'190025'
							  ,GETDATE())
							  --For Admin

							  INSERT INTO Tbl_EmployeeMaster

										(PortalId
				,Password
				,Fname
				,Lname
				,DOB
				,Email
				,Designation
				,Mobile_No
				,Pan_No
				,IsActive
				,Emp_Type_Id
				,CreatedBy
				,CreatedOn
				,UpdatedBy
				,UpdatedOn)

							  VALUES(
							  @PortalId	
							  ,@Password	
							  ,@Fname		
							  ,@Lname		
							  ,@DOB		
							  ,@Email		
							  ,@Designation
							  ,@Mobile_No	
							  ,@Pan_No
							  ,1		
							  ,3
							  ,'190025'
							  ,GETDATE()
							  ,'190025'
							  ,GETDATE())

       END

       ELSE

--       BEGIN

--              INSERT INTO Tbl_EmployeeMaster

--                        (PortalId
--,Password
--,Fname
--,Lname
--,DOB
--,Email
--,Designation
--,Mobile_No
--,Pan_No
--,IsActive
--,Emp_Type_Id
--,CreatedBy
--,CreatedOn
--,UpdatedBy
--,UpdatedOn)

--              VALUES(
--			  @PortalId	
--			  ,@Password	
--			  ,@Fname		
--			  ,@Lname		
--			  ,@DOB		
--			  ,@Email		
--			  ,@Designation
--			  ,@Mobile_No	
--			  ,@Pan_No
--			  ,1		
--			  ,@Emp_Type_Id
--			  ,'190025'
--			  ,GETDATE()
--			  ,'190025'
--			  ,GETDATE())

                        

              

              --SELECT SCOPE_IDENTITY() AS UserId -- UserId     
			  SELECT @PortalId -- PortalId                   

     --END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterNewUser]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SP_RegisterNewUser]
@PortalId			int,
@Password			varchar(max),
@Fname				NVARCHAR(30),
@Lname				NVARCHAR(30),
@DOB				DATETIME	,
@Email				NVARCHAR(30),
@Designation		NVARCHAR(50),
@Mobile_No			NVARCHAR(30),
@Pan_No				NVARCHAR(30)


AS

BEGIN

       SET NOCOUNT ON;

IF EXISTS(SELECT PortalId FROM Tbl_EmployeeMaster WHERE PortalId = @PortalId)

				   BEGIN

						  SELECT -1 AS PortalId -- Username exists.

				   END

 ELSE IF EXISTS(SELECT PortalId FROM Tbl_EmployeeMaster WHERE Email = @Email)

			   BEGIN

					  SELECT -2 AS PortalId -- Email exists.

			   END
ELSE IF EXISTS(select * from [dbo].[Tbl_HRAdminMapping] where PortalID=@PortalId and EmpTypeID=1)--For HR 

       BEGIN
	  
						 
					INSERT INTO Tbl_EmployeeMaster

											(PortalId
					,Password
					,Fname
					,Lname
					,DOB
					,Email
					,Designation
					,Mobile_No
					,Pan_No
					,IsActive
					,Emp_Type_Id
					,CreatedBy
					,CreatedOn
					,UpdatedBy
					,UpdatedOn)

								  VALUES(
								  @PortalId	
								  ,@Password	
								  ,@Fname		
								  ,@Lname		
								  ,@DOB		
								  ,@Email		
								  ,@Designation
								  ,@Mobile_No	
								  ,@Pan_No
								  ,1		
								  ,1
								  ,'190025'
								  ,GETDATE()
								  ,'190025'
								  ,GETDATE())

					--For HR
					 DECLARE @HREmpID as INT
					 select @HREmpID = Scope_Identity() 
					 --set @EmpID=SELECT SCOPE_IDENTITY()
					--	print @EmpID
					INSERT INTO Tbl_Emp_Type_Mapping

											(Emp_Id,
												Emp_Type_Id,
													IsActive)

								  VALUES(
								  	@HREmpID
								  ,1	
								  ,1		
								  )
								  --For EMP
								  INSERT INTO Tbl_Emp_Type_Mapping

											(Emp_Id,
												Emp_Type_Id,
													IsActive)

								  VALUES(
								  @HREmpID	
								  ,2	
								  ,1		
								  )
								   SELECT @PortalId 

						 END
--ELSE IF EXISTS(select * from [dbo].[Tbl_HRAdminMapping] where PortalID=@PortalId and EmpTypeID=2)--For Emp

--       BEGIN

--						INSERT INTO Tbl_EmployeeMaster

--									(PortalId
--			,Password
--			,Fname
--			,Lname
--			,DOB
--			,Email
--			,Designation
--			,Mobile_No
--			,Pan_No
--			,IsActive
--			,Emp_Type_Id
--			,CreatedBy
--			,CreatedOn
--			,UpdatedBy
--			,UpdatedOn)

--						  VALUES(
--						  @PortalId	
--						  ,@Password	
--						  ,@Fname		
--						  ,@Lname		
--						  ,@DOB		
--						  ,@Email		
--						  ,@Designation
--						  ,@Mobile_No	
--						  ,@Pan_No
--						  ,1		
--						  ,2
--						  ,'190025'
--						  ,GETDATE()
--						  ,'190025'
--						  ,GETDATE())
--					DECLARE @EmpID as INT
--					 select @EmpID = Scope_Identity() 
--					  --For EMP
--								  INSERT INTO Tbl_Emp_Type_Mapping

--											(Emp_Id,
--												Emp_Type_Id,
--													IsActive)

--								  VALUES(
--								  @EmpID	
--								  ,2	
--								  ,1		
--								  )
--								   SELECT @PortalId 
--					 END
ELSE IF EXISTS(select * from [dbo].[Tbl_HRAdminMapping] where PortalID=@PortalId and EmpTypeID=3)--For Admin

       BEGIN

							  
		INSERT INTO Tbl_EmployeeMaster

										(PortalId
				,Password
				,Fname
				,Lname
				,DOB
				,Email
				,Designation
				,Mobile_No
				,Pan_No
				,IsActive
				,Emp_Type_Id
				,CreatedBy
				,CreatedOn
				,UpdatedBy
				,UpdatedOn)

							  VALUES(
							  @PortalId	
							  ,@Password	
							  ,@Fname		
							  ,@Lname		
							  ,@DOB		
							  ,@Email		
							  ,@Designation
							  ,@Mobile_No	
							  ,@Pan_No
							  ,1		
							  ,2
							  ,'190025'
							  ,GETDATE()
							  ,'190025'
							  ,GETDATE())
							  
					--For Admin		  
					 DECLARE @AdminEmpID as INT
					 select @AdminEmpID = Scope_Identity() 
					
					INSERT INTO Tbl_Emp_Type_Mapping

											(Emp_Id,
												Emp_Type_Id,
													IsActive)

								  VALUES(
								  	@AdminEmpID
								  ,3	
								  ,1		
								  )
								  --For EMP
								  INSERT INTO Tbl_Emp_Type_Mapping

											(Emp_Id,
												Emp_Type_Id,
													IsActive)

								  VALUES(
								  @HREmpID	
								  ,2	
								  ,1		
								  )
								   SELECT @PortalId 
							  

       END

ELSE--For New User Registration

     BEGIN

						INSERT INTO Tbl_EmployeeMaster

									(PortalId
			,Password
			,Fname
			,Lname
			,DOB
			,Email
			,Designation
			,Mobile_No
			,Pan_No
			,IsActive
			,Emp_Type_Id
			,CreatedBy
			,CreatedOn
			,UpdatedBy
			,UpdatedOn)

						  VALUES(
						  @PortalId	
						  ,@Password	
						  ,@Fname		
						  ,@Lname		
						  ,@DOB		
						  ,@Email		
						  ,@Designation
						  ,@Mobile_No	
						  ,@Pan_No
						  ,1		
						  ,2
						  ,'190025'
						  ,GETDATE()
						  ,'190025'
						  ,GETDATE())
					DECLARE @EmpID as INT
					 select @EmpID = Scope_Identity() 
					  --For EMP
								  INSERT INTO Tbl_Emp_Type_Mapping

											(Emp_Id,
												Emp_Type_Id,
													IsActive)

								  VALUES(
								  @EmpID	
								  ,2	
								  ,1		
								  )
								   SELECT @PortalId 
					 END
			  SELECT @PortalId -- PortalId                   

     --END

END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetHomeLoan]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[USP_GetHomeLoan]
( @FY_Id int,  
 @Portal_Id int
 )
AS
BEGIN
Select * from Tbl_HouseLoan_PropertyDetails  WHERE Portal_Id = @Portal_Id and FY_Id=@FY_Id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Update_HomeLoan]    Script Date: 10/9/2019 12:11:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
    
CREATE  PROCEDURE [dbo].[USP_Insert_Update_HomeLoan]    
 (  
 @FY_Id int,    
 @Portal_Id int,    
 @TypeOfProperty NVARCHAR(225),    
 @Owner NVARCHAR(225),    
 @AddressOfProperty NVARCHAR(225),    
 @FinancialInstituteDetails NVARCHAR(225),    
 @Possession_Completion_Date datetime,    
 @InterestPaid decimal,    
 @HouseLoanPrincipalAmount  decimal,    
 @ApprovedAmount decimal,    
 @ApprovedBy NVARCHAR(225)='',  
 @UpoadedFileName NVARCHAR(225),    
 @Status NVARCHAR(225),    
 @Remarks NVARCHAR(225),  
 @UpdatedBy NVARCHAR(225)     
)  
  
AS    
    
BEGIN    
    
       SET NOCOUNT ON;    
    
       IF EXISTS(SELECT Portal_Id FROM Tbl_HouseLoan_PropertyDetails WHERE Portal_Id = @Portal_Id and FY_Id=@FY_Id)    
    
       BEGIN    
              BEGIN TRY   
   Update Tbl_HouseLoan_PropertyDetails    
     SET    
     TypeOfProperty =@TypeOfProperty,    
     [Owner] =@Owner,    
     AddressOfProperty =@AddressOfProperty,    
     FinancialInstituteDetails =@FinancialInstituteDetails,    
     Possession_Completion_Date =GETDATE(),    
     InterestPaid =@InterestPaid ,    
     HouseLoanPrincipalAmount=@HouseLoanPrincipalAmount ,    
     ApprovedAmount=@ApprovedAmount,    
     ApprovedBy=@ApprovedBy,    
     ApprovedOn =GETDATE(),    
     UpoadedFileName=@UpoadedFileName,    
     [Status]=@Status,    
     Remarks =@Remarks,     
     UpdatedBy=@UpdatedBy ,    
     UpdatedOn =GETDATE()    
     WHERE Portal_Id = @Portal_Id  and FY_Id=@FY_Id  
  
    SELECT 1  

       END TRY  
  BEGIN CATCH   
       SELECT -1  
  END CATCH  
    
       END    
    
       ELSE     
    
       BEGIN    
         BEGIN TRY   
   INSERT INTO Tbl_HouseLoan_PropertyDetails    
     (    
     FY_Id ,    
     Portal_Id ,    
     TypeOfProperty ,    
     Owner ,    
     AddressOfProperty ,    
     FinancialInstituteDetails ,    
     Possession_Completion_Date ,    
     InterestPaid ,    
     HouseLoanPrincipalAmount ,    
     ApprovedAmount ,    
     ApprovedBy,    
     ApprovedOn ,    
     UpoadedFileName,    
     Status,    
     Remarks ,    
     IsActive ,    
     CreatedBy,    
     CreatedOn ,    
     UpdatedBy ,    
     UpdatedOn     
     )    
    
   VALUES(    
     @FY_Id ,    
     @Portal_Id ,    
     @TypeOfProperty ,    
     @Owner ,    
     @AddressOfProperty ,    
     @FinancialInstituteDetails ,    
     GETDATE(),    
     @InterestPaid ,    
     @HouseLoanPrincipalAmount ,    
     @ApprovedAmount ,    
     @ApprovedBy,    
     GETDATE(),    
     @UpoadedFileName,    
     @Status,    
     @Remarks ,    
     1 ,    
     @Portal_Id,    
     GETDATE(),    
     @UpdatedBy ,    
     GETDATE()    
     )  
	 
	   SELECT 1    
  END TRY  
  BEGIN CATCH   
       SELECT -1  
  END CATCH  
  
       END      
        
END  
GO
USE [master]
GO
ALTER DATABASE [OLITPS] SET  READ_WRITE 
GO
