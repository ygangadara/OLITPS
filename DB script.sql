USE [master]
GO
/****** Object:  Database [OLITPS]    Script Date: 11/20/2019 5:14:14 PM ******/
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
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 11/20/2019 5:14:14 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Table [dbo].[Tbl_App_Logger]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_App_Logger](
	[Logger_Id] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](255) NULL,
	[Portal_Id] [int] NULL,
	[LogFrom] [varchar](50) NULL,
	[LogType] [varchar](255) NULL,
	[ModuleName] [varchar](255) NULL,
	[ClassName] [varchar](255) NULL,
	[FunctionName] [varchar](255) NULL,
	[ProcedureName] [varchar](255) NULL,
	[Error_Msg] [nvarchar](max) NULL,
	[LoggedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_App_Logger] PRIMARY KEY CLUSTERED 
(
	[Logger_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Decleration_Duration]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Decleration_Duration](
	[DD_Id] [int] IDENTITY(1,1) NOT NULL,
	[FY_ID] [int] NULL,
	[Declaration_StartDate] [datetime] NULL,
	[Declaration_EndDate] [datetime] NULL,
	[Approver_StartDate] [datetime] NULL,
	[Approver_EndDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](255) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Decleration_Duration] PRIMARY KEY CLUSTERED 
(
	[DD_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Deduction_Details]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Deduction_Details](
	[Deduction_Dtl_Id] [int] IDENTITY(1,1) NOT NULL,
	[FY_Id] [int] NULL,
	[Portal_Id] [int] NULL,
	[Deduction_Type_Id] [int] NULL,
	[Section_ID] [int] NULL,
	[BeneficialName] [varchar](255) NULL,
	[Relation] [varchar](255) NULL,
	[ReferenceNo] [varchar](255) NULL,
	[Amount] [decimal](16, 2) NULL,
	[ApprovedAmount] [decimal](16, 2) NULL,
	[ApprovedBy] [varchar](255) NULL,
	[ApprovedOn] [datetime] NULL,
	[Status] [varchar](100) NULL,
	[Remarks] [varchar](1000) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](255) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Deduction_Details] PRIMARY KEY CLUSTERED 
(
	[Deduction_Dtl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Deduction_Details_UploadDocuments]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Deduction_Details_UploadDocuments](
	[Deduction_Dtl_UD_Id] [int] IDENTITY(1,1) NOT NULL,
	[Deduction_Dtl_Id] [int] NULL,
	[FY_Id] [int] NULL,
	[Portal_Id] [int] NULL,
	[FileName] [varchar](255) NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Deduction_Details_UploadDocuments] PRIMARY KEY CLUSTERED 
(
	[Deduction_Dtl_UD_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_DeductionType]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DeductionType](
	[Deduction_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Deduction_Type] [varchar](255) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_DeductionType] PRIMARY KEY CLUSTERED 
(
	[Deduction_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Emp_Type_Mapping]    Script Date: 11/20/2019 5:14:15 PM ******/
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
/****** Object:  Table [dbo].[Tbl_EmployeeMaster]    Script Date: 11/20/2019 5:14:15 PM ******/
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
	[Loaction] [varchar](max) NULL,
	[CommAddress] [varchar](max) NULL,
	[FatherName] [varchar](max) NULL,
 CONSTRAINT [PK_Tbl_EmployeeMaster] PRIMARY KEY CLUSTERED 
(
	[Emp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_EmployeeType]    Script Date: 11/20/2019 5:14:15 PM ******/
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
/****** Object:  Table [dbo].[Tbl_FY]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_FY](
	[FY_Id] [int] IDENTITY(1,1) NOT NULL,
	[FY_StartDateTime] [datetime] NULL,
	[FY_EndDateTime] [datetime] NULL,
	[Declaration_StartDate] [datetime] NULL,
	[Declaration_EndDate] [datetime] NULL,
	[Actual_StartDate] [datetime] NULL,
	[Actual_EndDate] [datetime] NULL,
	[Approver_StartDate] [datetime] NULL,
	[Approver_EndDate] [datetime] NULL,
	[Is_Current_FY] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](255) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_FY] PRIMARY KEY CLUSTERED 
(
	[FY_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_FY_Employee_Saving_Master]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_FY_Employee_Saving_Master](
	[ESM_Id] [int] IDENTITY(1,1) NOT NULL,
	[FY_ID] [int] NULL,
	[Portal_Id] [int] NULL,
	[Is_Completed_Employee] [bit] NULL,
	[Is_Completed_HR] [bit] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[Employee_Completion_Date] [datetime] NULL,
	[ApprovedBy] [varchar](255) NULL,
	[ApprovedOn] [datetime] NULL,
	[LastModifiedBy] [varchar](255) NULL,
	[LastModifiedOn] [datetime] NULL,
	[Form12BBFileName] [varchar](max) NULL,
	[SignatureFileName] [varchar](max) NULL,
 CONSTRAINT [PK_Tbl_FY_Employee_Saving_Master] PRIMARY KEY CLUSTERED 
(
	[ESM_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Guideline]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Guideline](
	[Guideline_Id] [int] IDENTITY(1,1) NOT NULL,
	[Guideline_Text] [varchar](max) NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Guidelines] PRIMARY KEY CLUSTERED 
(
	[Guideline_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_HouseLoan_PropertyDetails]    Script Date: 11/20/2019 5:14:15 PM ******/
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
/****** Object:  Table [dbo].[Tbl_HRA]    Script Date: 11/20/2019 5:14:15 PM ******/
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
/****** Object:  Table [dbo].[Tbl_HRAdminMapping]    Script Date: 11/20/2019 5:14:15 PM ******/
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
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_HRAdminMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_HRAUploadFiles]    Script Date: 11/20/2019 5:14:15 PM ******/
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
/****** Object:  Table [dbo].[Tbl_SectionMaster]    Script Date: 11/20/2019 5:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SectionMaster](
	[Section_Id] [int] IDENTITY(1,1) NOT NULL,
	[Section_SName] [varchar](255) NULL,
	[Section_LName] [varchar](255) NULL,
	[Deduction_Type_Id] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Tbl_SectionMaster] PRIMARY KEY CLUSTERED 
(
	[Section_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Deduction_Details] ON 

INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 1, 111, 2, 22, N'RK', N'Self', N'Ref1', CAST(11113.99 AS Decimal(16, 2)), CAST(1111.00 AS Decimal(16, 2)), N'111', CAST(N'2019-10-30T13:38:06.657' AS DateTime), N'Approved', N'ok', 1, N'111', CAST(N'2019-10-15T13:23:31.977' AS DateTime), N'188888', CAST(N'2019-10-16T13:41:24.920' AS DateTime))
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 1, 111, 2, 21, N'rk3', N'Spouse', N'ref2', CAST(2132.00 AS Decimal(16, 2)), CAST(2132.00 AS Decimal(16, 2)), N'111', CAST(N'2019-10-30T13:38:06.657' AS DateTime), N'Approved', N'ok', 1, N'111', CAST(N'2019-10-15T13:25:38.153' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 1, 111, 2, 21, N'rk4', N'Child', N'Ref3', CAST(2132.00 AS Decimal(16, 2)), CAST(2132.00 AS Decimal(16, 2)), N'111', CAST(N'2019-10-30T13:38:06.657' AS DateTime), N'Approved', N'ok', 1, N'111', CAST(N'2019-10-15T13:36:20.053' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 1, 111, 3, 12, N'RK', N'Self', N'OthersRef1', CAST(1200.00 AS Decimal(16, 2)), CAST(1200.00 AS Decimal(16, 2)), N'111', CAST(N'2019-10-25T16:57:47.833' AS DateTime), N'Approved', N'ok', 1, N'111', CAST(N'2019-10-15T14:28:31.950' AS DateTime), N'188888', CAST(N'2019-10-16T12:58:20.003' AS DateTime))
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, 1, 188888, 3, 12, N'mm', N'Spouse', N'ref2', CAST(4466.00 AS Decimal(16, 2)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'188888', CAST(N'2019-10-15T19:47:24.453' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (15, 1, 181227, 1, 1, N'Batta Ramanamma', N'Self', N'AWEd12345AS123', CAST(14300.00 AS Decimal(16, 2)), CAST(12300.00 AS Decimal(16, 2)), N'111', CAST(N'2019-10-30T19:40:13.677' AS DateTime), N'Approved', N'Done', 1, N'181227', CAST(N'2019-10-22T13:46:56.063' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (16, 1, 181227, 1, 3, N'Batta Suresh', N'Child', N'AJHDAJKD', CAST(12000.00 AS Decimal(16, 2)), CAST(11000.00 AS Decimal(16, 2)), N'111', CAST(N'2019-10-30T19:40:13.677' AS DateTime), N'Approved', N'Done', 1, N'181227', CAST(N'2019-10-22T13:50:32.813' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (17, 1, 181227, 2, 13, N'Batta Prabhakar', N'Self', N'SAJKDKA', CAST(12549.00 AS Decimal(16, 2)), CAST(12000.00 AS Decimal(16, 2)), N'111', CAST(N'2019-10-30T19:40:29.513' AS DateTime), N'Approved', N'Done', 1, N'181227', CAST(N'2019-10-22T13:51:28.367' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (18, 1, 181227, 3, 12, N'Batta Sushmitha', N'Spouse', N'dfhkjhgfew112', CAST(13273.00 AS Decimal(16, 2)), CAST(13000.00 AS Decimal(16, 2)), N'111', CAST(N'2019-10-30T19:41:10.607' AS DateTime), N'Approved', N'Done', 1, N'181227', CAST(N'2019-10-22T14:07:04.247' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (19, 1, 181278, 1, 2, N'Manasa', N'Self', N'AXHSINXjks', CAST(13800.00 AS Decimal(16, 2)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'181278', CAST(N'2019-10-22T18:04:03.037' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (20, 1, 181278, 2, 16, N'Ramadevi', N'Self', N'AJKDNJDW', CAST(120000.00 AS Decimal(16, 2)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'181278', CAST(N'2019-10-22T18:05:19.680' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (21, 1, 181278, 3, 12, N'Awsdnkjfn', N'Self', N'WQIJEQDM131A1', CAST(180000.00 AS Decimal(16, 2)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'181278', CAST(N'2019-10-22T18:06:21.060' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_Deduction_Details] ([Deduction_Dtl_Id], [FY_Id], [Portal_Id], [Deduction_Type_Id], [Section_ID], [BeneficialName], [Relation], [ReferenceNo], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (35, 1, 190025, 1, 1, N'Naveen', N'Self', N'232323', CAST(50000.00 AS Decimal(16, 2)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T03:17:04.147' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Deduction_Details] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Deduction_Details_UploadDocuments] ON 

INSERT [dbo].[Tbl_Deduction_Details_UploadDocuments] ([Deduction_Dtl_UD_Id], [Deduction_Dtl_Id], [FY_Id], [Portal_Id], [FileName], [CreatedBy], [CreatedOn]) VALUES (1, 13, 1, 111, N'Others_111_de575bfd6f8e41ee832a8562401cf731.pdf', N'111', CAST(N'2019-10-16T17:36:25.180' AS DateTime))
INSERT [dbo].[Tbl_Deduction_Details_UploadDocuments] ([Deduction_Dtl_UD_Id], [Deduction_Dtl_Id], [FY_Id], [Portal_Id], [FileName], [CreatedBy], [CreatedOn]) VALUES (3, 15, 1, 181227, N'80C_181227_aa8f32e7c61b467a853a1053a390978f.pdf', N'181227', CAST(N'2019-10-22T13:47:12.803' AS DateTime))
INSERT [dbo].[Tbl_Deduction_Details_UploadDocuments] ([Deduction_Dtl_UD_Id], [Deduction_Dtl_Id], [FY_Id], [Portal_Id], [FileName], [CreatedBy], [CreatedOn]) VALUES (4, 16, 1, 181227, N'80C_181227_ca139294e9e7432ca92747e823300d61.pdf', N'181227', CAST(N'2019-10-22T13:50:48.783' AS DateTime))
INSERT [dbo].[Tbl_Deduction_Details_UploadDocuments] ([Deduction_Dtl_UD_Id], [Deduction_Dtl_Id], [FY_Id], [Portal_Id], [FileName], [CreatedBy], [CreatedOn]) VALUES (5, 17, 1, 181227, N'80D_181227_262c95047bb04377b17d1d0ae3d763d5.pdf', N'181227', CAST(N'2019-10-22T13:52:04.210' AS DateTime))
INSERT [dbo].[Tbl_Deduction_Details_UploadDocuments] ([Deduction_Dtl_UD_Id], [Deduction_Dtl_Id], [FY_Id], [Portal_Id], [FileName], [CreatedBy], [CreatedOn]) VALUES (6, 18, 1, 181227, N'Others_181227_f75c8f1cb5184f479b3d47846040a397.pdf', N'181227', CAST(N'2019-10-22T14:07:13.903' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Deduction_Details_UploadDocuments] OFF
SET IDENTITY_INSERT [dbo].[Tbl_DeductionType] ON 

INSERT [dbo].[Tbl_DeductionType] ([Deduction_Type_Id], [Deduction_Type], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1, N'80C', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_DeductionType] ([Deduction_Type_Id], [Deduction_Type], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2, N'80D', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_DeductionType] ([Deduction_Type_Id], [Deduction_Type], [IsActive], [CreatedBy], [CreatedOn]) VALUES (3, N'Others', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_DeductionType] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Emp_Type_Mapping] ON 

INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (7, 4, 1, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (8, 4, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (9, 5, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (10, 6, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (11, 7, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (12, 8, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (13, 7, 3, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (14, 7, 1, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (15, 9, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (16, 10, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (17, 11, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (18, 12, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (19, 13, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (20, 14, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (21, 15, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (22, 16, 2, 1)
INSERT [dbo].[Tbl_Emp_Type_Mapping] ([Emp_Type_Map_Id], [Emp_Id], [Emp_Type_Id], [IsActive]) VALUES (23, 4, 3, 1)
SET IDENTITY_INSERT [dbo].[Tbl_Emp_Type_Mapping] OFF
SET IDENTITY_INSERT [dbo].[Tbl_EmployeeMaster] ON 

INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (4, 190025, N'5TGzCS7pm3N5KmgK+RIkpuZb3nBP6JJ18lXw3rucdjn24GwKmGv6jA==', N'Naveen', N'Manral', CAST(N'1984-07-01T00:00:00.000' AS DateTime), N'naveensingh.manral@nttdata.com', N'SSE', N'9013341210', N'APTPM8833N', 1, 1, N'190025', CAST(N'2019-09-26T12:57:54.743' AS DateTime), N'190025', CAST(N'2019-09-26T12:57:54.743' AS DateTime), N'Noida', NULL, NULL)
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (5, 190529, N'RZysdkm8npJ3x6LIxjvxFouTyqdXq6yw7evFtK/hxvtO2xyvfyvS9w==', N'Ravikant', N'Tyagi', CAST(N'1985-07-05T00:00:00.000' AS DateTime), N'ravikant.ravikant@nttdata.com', N'SSE', N'9650498556', N'APTPM8833TT', 1, 2, N'190025', CAST(N'2019-09-26T15:30:41.663' AS DateTime), N'190025', CAST(N'2019-09-26T15:30:41.663' AS DateTime), N'Noida', NULL, NULL)
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (6, 181289, N'9Q2atWi+1BlSl8Qqkl2w+En0xscRYSYevqRbix6w4Q6P7JQ+aq/Y5A==', N'Yanamala', N'Gangadara', CAST(N'1996-08-19T00:00:00.000' AS DateTime), N'Gangadara.Yanamala@nttdata.com', N'SSE', N'9177500447', N'ATZPY1710D', 1, 2, N'190025', CAST(N'2019-09-27T17:06:07.100' AS DateTime), N'190025', CAST(N'2019-09-27T17:06:07.100' AS DateTime), N'Noida', NULL, NULL)
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (7, 111, N'hg0/8ZF3lNasQi9Zak7xIw==', N'Naveen Singh', N'Manral', CAST(N'1984-07-01T00:00:00.000' AS DateTime), N'naveensingh.manral1@nttdata.co', N'SSE', N'9177500447', N'TTT', 1, 2, N'190025', CAST(N'2019-10-03T10:51:39.950' AS DateTime), N'190025', CAST(N'2019-10-03T10:51:39.950' AS DateTime), N'Noida', N'K-411,DDA LIG FLATS ,MOLARBAND,SARITA VIHAR DELHI110076', N'K S MANRAL')
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (8, 1111, N'y49zlbf+rc3zR7YYoRKWgrlufdp07uP+S40Jhn6FV8c=', N'Naveen', N'Manral', CAST(N'1984-07-01T00:00:00.000' AS DateTime), N'manral.naveen@gmail.com', N'SSIS', N'9013341210', N'APTPM8833N', 1, 2, N'190025', CAST(N'2019-10-05T20:52:57.133' AS DateTime), N'190025', CAST(N'2019-10-05T20:52:57.133' AS DateTime), N'Noida', NULL, NULL)
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (9, 2222, N'ydrKX6/kFpxz9+O3C71ADKxihS26d/w3tFCDjh30w6s=', N'NAVEEN SINGH', N'MANRAL', CAST(N'1989-10-03T00:00:00.000' AS DateTime), N'NSMANRAL@GMAIL.COM', N'SSE', N'9013341210', N'APTPM8833O', 1, 2, N'190025', CAST(N'2019-10-21T16:26:20.673' AS DateTime), N'190025', CAST(N'2019-10-21T16:26:20.673' AS DateTime), N'Noida', N'K-411,DDA LIG FLATS ,MOLARBAND,SARITA VIHAR DELHI110076', N'K S MANRAL')
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (11, 181227, N'9Q2atWi+1BmpQkpXFT9J1ezzfVcKLIHAfCtvZCIWlWXZkujVwZRNKQ==', N'Prabhakar ', N'Batta', CAST(N'1996-10-07T00:00:00.000' AS DateTime), N'Prabhakar', N'SSE', N'8008931391', N'APTPM2132C', 1, 2, N'190025', CAST(N'2019-10-22T13:33:48.843' AS DateTime), N'190025', CAST(N'2019-10-22T13:33:48.843' AS DateTime), N'Bangalore', N'Anantapur, AP', N'B.Ramana')
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (12, 181278, N'9Q2atWi+1BkM7g4GAtj/WpYTEYsQhITkLZhJtcQ3bSGd7Gfk0k2lSQ==', N'Haneesha ', N'Mannava', CAST(N'2019-06-01T00:00:00.000' AS DateTime), N'Mannava.Haneesha@nttdata.com', N'SSE', N'8790184849', N'MANNA1710D', 1, 2, N'190025', CAST(N'2019-10-22T18:00:41.000' AS DateTime), N'190025', CAST(N'2019-10-22T18:00:41.000' AS DateTime), N'Bangalore', N'Jubleehills, Hydrerabad', N'Chow')
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (13, 125084, N'lGmKvi32HLzbvKKM1Fkq+xH8oes4UyVpt8K2x04NJOluM7yMbWhJ+Q==', N'Pankaj', N'Tripathi', CAST(N'2011-10-12T00:00:00.000' AS DateTime), N'pankaj.t@nttdata.com', N'Systems Integration Advisor', N'+91-9650839326', N'AEDPT0172M', 1, 2, N'190025', CAST(N'2019-10-24T15:57:55.067' AS DateTime), N'190025', CAST(N'2019-10-24T15:57:55.067' AS DateTime), N'Noida', N'Delhi', N'K. C. Tripathi')
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (14, 44444, N'm2o8yQ3PjMtpe3kvUKF/+U8hS3JpPl1XSYHxcNnqbeY=', N'sdsd', N'Dev', CAST(N'2019-10-09T00:00:00.000' AS DateTime), N'sdsdsd@gmail.com', N'SSE', N'9013341210', N'APTPM8833N', 1, 2, N'190025', CAST(N'2019-10-24T17:06:13.693' AS DateTime), N'190025', CAST(N'2019-10-24T17:06:13.693' AS DateTime), N'Delhi', N'dfdfd', N'fddfd')
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (15, 176427, N'rXyWkaQVMk2N+QZ+vFCVsodaEVNi3QQAsObflVvljaxXXheG54ax7g==', N'Sushmita', N'Roy', CAST(N'1997-03-09T00:00:00.000' AS DateTime), N'sushmita.roy@nttdata.com', N'SDSA', N'8218589086', N'DMYPR4565N', 1, 2, N'190025', CAST(N'2019-10-25T16:12:09.887' AS DateTime), N'190025', CAST(N'2019-10-25T16:12:09.887' AS DateTime), N'Noida', N'Paras Tierea,noida sector 137', N'Mr.Prabhat k. Roy')
INSERT [dbo].[Tbl_EmployeeMaster] ([Emp_Id], [PortalId], [Password], [Fname], [Lname], [DOB], [Email], [Designation], [Mobile_No], [Pan_No], [IsActive], [Emp_Type_Id], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [Loaction], [CommAddress], [FatherName]) VALUES (16, 181282, N'9Q2atWi+1BkFknG8pbhZkvYe09+sg/lol57Q/SVXd7kipLoIobsksA==', N'Naveed', N'Inamdar', CAST(N'2019-10-08T00:00:00.000' AS DateTime), N'naveed.Inamdar@nttdata.com', N'SSE', N'8088662853', N'AFJPI3460A', 1, 2, N'190025', CAST(N'2019-10-29T17:08:26.750' AS DateTime), N'190025', CAST(N'2019-10-29T17:08:26.750' AS DateTime), N'Noida', N'NOIDA', N'Mr.Nazeer Ahmed')
SET IDENTITY_INSERT [dbo].[Tbl_EmployeeMaster] OFF
SET IDENTITY_INSERT [dbo].[Tbl_EmployeeType] ON 

INSERT [dbo].[Tbl_EmployeeType] ([Emp_Type_Id], [Emp_Type], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'HR', 1, N'190025', CAST(N'2019-09-25T12:05:21.140' AS DateTime), N'190025', CAST(N'2019-09-25T12:05:21.140' AS DateTime))
INSERT [dbo].[Tbl_EmployeeType] ([Emp_Type_Id], [Emp_Type], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Employee', 1, N'190025', CAST(N'2019-09-25T12:05:34.953' AS DateTime), N'190025', CAST(N'2019-09-25T12:05:34.953' AS DateTime))
INSERT [dbo].[Tbl_EmployeeType] ([Emp_Type_Id], [Emp_Type], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Admin', 1, N'190025', CAST(N'2019-09-25T12:05:42.917' AS DateTime), N'190025', CAST(N'2019-09-25T12:05:42.917' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_EmployeeType] OFF
SET IDENTITY_INSERT [dbo].[Tbl_FY] ON 

INSERT [dbo].[Tbl_FY] ([FY_Id], [FY_StartDateTime], [FY_EndDateTime], [Declaration_StartDate], [Declaration_EndDate], [Actual_StartDate], [Actual_EndDate], [Approver_StartDate], [Approver_EndDate], [Is_Current_FY], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, CAST(N'2019-04-01T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2019-10-31T00:00:00.000' AS DateTime), CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2019-12-31T00:00:00.000' AS DateTime), CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2019-12-31T00:00:00.000' AS DateTime), 1, 1, N'188888', CAST(N'2019-10-21T13:25:43.050' AS DateTime), N'111', CAST(N'2019-10-30T19:36:26.800' AS DateTime))
INSERT [dbo].[Tbl_FY] ([FY_Id], [FY_StartDateTime], [FY_EndDateTime], [Declaration_StartDate], [Declaration_EndDate], [Actual_StartDate], [Actual_EndDate], [Approver_StartDate], [Approver_EndDate], [Is_Current_FY], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2019-10-15T00:00:00.000' AS DateTime), CAST(N'2019-10-16T00:00:00.000' AS DateTime), CAST(N'2019-10-17T00:00:00.000' AS DateTime), CAST(N'2019-10-09T00:00:00.000' AS DateTime), CAST(N'2019-10-30T00:00:00.000' AS DateTime), CAST(N'2019-10-20T00:00:00.000' AS DateTime), CAST(N'2019-10-20T00:00:00.000' AS DateTime), 0, 0, N'188888', CAST(N'2019-10-21T13:25:43.050' AS DateTime), N'188888', CAST(N'2019-10-24T19:54:16.867' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_FY] OFF
SET IDENTITY_INSERT [dbo].[Tbl_FY_Employee_Saving_Master] ON 

INSERT [dbo].[Tbl_FY_Employee_Saving_Master] ([ESM_Id], [FY_ID], [Portal_Id], [Is_Completed_Employee], [Is_Completed_HR], [CreatedBy], [CreatedOn], [Employee_Completion_Date], [ApprovedBy], [ApprovedOn], [LastModifiedBy], [LastModifiedOn], [Form12BBFileName], [SignatureFileName]) VALUES (1, 1, 111, 1, 1, N'111', CAST(N'2019-10-20T23:43:35.153' AS DateTime), CAST(N'2019-10-30T19:24:32.110' AS DateTime), N'111', CAST(N'2019-10-22T19:44:07.470' AS DateTime), N'111', CAST(N'2019-11-20T04:36:52.693' AS DateTime), N'UploadForm12BB_111_97c846e6aff044178bf434f36b408569.pdf', N'Signature_111_335f04d25868444a948095f4edb03772sign1.png')
INSERT [dbo].[Tbl_FY_Employee_Saving_Master] ([ESM_Id], [FY_ID], [Portal_Id], [Is_Completed_Employee], [Is_Completed_HR], [CreatedBy], [CreatedOn], [Employee_Completion_Date], [ApprovedBy], [ApprovedOn], [LastModifiedBy], [LastModifiedOn], [Form12BBFileName], [SignatureFileName]) VALUES (2, 1, 181227, 1, 1, N'181227', CAST(N'2019-10-22T14:17:39.493' AS DateTime), CAST(N'2019-10-30T19:41:26.817' AS DateTime), N'111', CAST(N'2019-10-30T19:41:26.817' AS DateTime), N'181227', CAST(N'2019-10-30T12:28:07.297' AS DateTime), N'UploadForm12BB_181227_650647bbfa95423a8b987ab6cfde94ed.pdf', NULL)
INSERT [dbo].[Tbl_FY_Employee_Saving_Master] ([ESM_Id], [FY_ID], [Portal_Id], [Is_Completed_Employee], [Is_Completed_HR], [CreatedBy], [CreatedOn], [Employee_Completion_Date], [ApprovedBy], [ApprovedOn], [LastModifiedBy], [LastModifiedOn], [Form12BBFileName], [SignatureFileName]) VALUES (3, 1, 181278, 1, NULL, N'181278', CAST(N'2019-10-22T18:08:03.750' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Tbl_FY_Employee_Saving_Master] ([ESM_Id], [FY_ID], [Portal_Id], [Is_Completed_Employee], [Is_Completed_HR], [CreatedBy], [CreatedOn], [Employee_Completion_Date], [ApprovedBy], [ApprovedOn], [LastModifiedBy], [LastModifiedOn], [Form12BBFileName], [SignatureFileName]) VALUES (8, 1, 176427, 1, NULL, NULL, CAST(N'2019-10-29T17:49:18.047' AS DateTime), CAST(N'2019-11-01T11:23:49.520' AS DateTime), NULL, NULL, N'176427', CAST(N'2019-11-01T11:23:49.520' AS DateTime), N'UploadForm12BB_176427_2bf978b570084d06a25dc41c530ecf2c.pdf', NULL)
INSERT [dbo].[Tbl_FY_Employee_Saving_Master] ([ESM_Id], [FY_ID], [Portal_Id], [Is_Completed_Employee], [Is_Completed_HR], [CreatedBy], [CreatedOn], [Employee_Completion_Date], [ApprovedBy], [ApprovedOn], [LastModifiedBy], [LastModifiedOn], [Form12BBFileName], [SignatureFileName]) VALUES (15, 1, 125084, 1, NULL, N'125084', CAST(N'2019-11-20T04:46:18.953' AS DateTime), CAST(N'2019-11-20T04:46:18.953' AS DateTime), NULL, NULL, NULL, NULL, NULL, N'Signature_125084_1a3be985bda64a75947e793a7f1d36dasign1.png')
SET IDENTITY_INSERT [dbo].[Tbl_FY_Employee_Saving_Master] OFF
SET IDENTITY_INSERT [dbo].[Tbl_Guideline] ON 

INSERT [dbo].[Tbl_Guideline] ([Guideline_Id], [Guideline_Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'The file should be uploaded for crrent financial year', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-10-15T20:01:53.907' AS DateTime))
INSERT [dbo].[Tbl_Guideline] ([Guideline_Id], [Guideline_Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Please fill the declared column.Edit/Update can be done to the input fields which are not in grey', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guideline] ([Guideline_Id], [Guideline_Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Tax will be deducted till Dec/Jan on the basis of investment declaration updated under this', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guideline] ([Guideline_Id], [Guideline_Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'In case the tax is paid more than Rs.8333 per month/Rs.100000 per annum,Land lord PAN has to be updated', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guideline] ([Guideline_Id], [Guideline_Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Rent details has to be filled for entire Financial Year.', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guideline] ([Guideline_Id], [Guideline_Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, N'If you have joined in the current financial year(i.e., after 1st April 2019),needs to update their income', 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime), N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_Guideline] ([Guideline_Id], [Guideline_Text], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, N'Update your Tax Savings Details with the projected investments for the Financial Year 2019 - 2020.', 1, N'111', CAST(N'2019-10-11T13:11:54.430' AS DateTime), N'188888', CAST(N'2019-10-15T19:02:53.573' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_Guideline] OFF
SET IDENTITY_INSERT [dbo].[Tbl_HouseLoan_PropertyDetails] ON 

INSERT [dbo].[Tbl_HouseLoan_PropertyDetails] ([HLPD_Id], [FY_Id], [Portal_Id], [TypeOfProperty], [Owner], [AddressOfProperty], [FinancialInstituteDetails], [Possession_Completion_Date], [InterestPaid], [HouseLoanPrincipalAmount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [UpoadedFileName], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 1, 111, N'Joined', N'Naveen Singh ManralTest', N'NOida2323', N'PNB', CAST(N'2019-10-10T14:44:18.377' AS DateTime), CAST(32000.00 AS Decimal(18, 2)), CAST(15000.00 AS Decimal(18, 2)), CAST(10000.00 AS Decimal(18, 2)), N'111', CAST(N'2019-10-16T19:16:31.340' AS DateTime), N'HOmeLoan_111_81e31d1de9e04fa0a32fea7e09b1acbd.pdf', N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-08T18:53:58.470' AS DateTime), N'111', CAST(N'2019-10-10T14:44:18.377' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_HouseLoan_PropertyDetails] OFF
SET IDENTITY_INSERT [dbo].[Tbl_HRA] ON 

INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (25, 1, 111, N'April-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:39.990' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.490' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.017' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (26, 1, 111, N'May-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.527' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.500' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.027' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (27, 1, 111, N'June-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.533' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.503' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.030' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (28, 1, 111, N'July-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.540' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.510' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.033' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (29, 1, 111, N'August-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.547' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.517' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.043' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (30, 1, 111, N'September-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.553' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.520' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.047' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (31, 1, 111, N'October-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.560' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.523' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.050' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (32, 1, 111, N'November-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.570' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.530' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.057' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (33, 1, 111, N'December-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.577' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.533' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.060' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (34, 1, 111, N'January-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral1', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.583' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.537' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.067' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (35, 1, 111, N'February-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.590' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.543' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.070' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (36, 1, 111, N'March-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), CAST(96000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-18T18:07:40.593' AS DateTime), N'Approved', N'Tested OK', 1, N'111', CAST(N'2019-10-11T11:17:10.547' AS DateTime), N'111', CAST(N'2019-10-18T14:11:16.077' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (49, 1, 181227, N'April-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:57.753' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:22.623' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (50, 1, 181227, N'May-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.127' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.023' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (51, 1, 181227, N'June-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.133' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.027' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (52, 1, 181227, N'July-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.137' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.030' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (53, 1, 181227, N'August-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.143' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.030' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (54, 1, 181227, N'September-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.147' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.033' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (55, 1, 181227, N'October-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.150' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.037' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (56, 1, 181227, N'November-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.157' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.037' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (57, 1, 181227, N'December-2019', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.160' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.040' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (58, 1, 181227, N'January-2020', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.163' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.040' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (59, 1, 181227, N'February-2020', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.170' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.043' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (60, 1, 181227, N'March-2020', N'Metro', N'Banglore', N'Vanitha', N'#40, Subramanya Nilaya, Ayyappanagar, Kr puram, Banglore-201307', NULL, CAST(8333 AS Decimal(18, 0)), CAST(99996 AS Decimal(18, 0)), N'111', CAST(N'2019-10-22T13:55:58.173' AS DateTime), N'Approved', N'Acceped your HRA', 1, N'181227', CAST(N'2019-10-22T13:39:23.047' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (61, 1, 181278, N'April-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.840' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.540' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (62, 1, 181278, N'May-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.870' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.970' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (63, 1, 181278, N'June-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.873' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.973' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (64, 1, 181278, N'July-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.877' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.977' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (65, 1, 181278, N'August-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.883' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.980' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (66, 1, 181278, N'September-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.887' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.983' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (67, 1, 181278, N'October-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.893' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.987' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (68, 1, 181278, N'November-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.897' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.990' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (69, 1, 181278, N'December-2019', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.903' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.993' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (70, 1, 181278, N'January-2020', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.907' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:42.997' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (71, 1, 181278, N'February-2020', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.913' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:43.003' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (72, 1, 181278, N'March-2020', N'Non-Metro', N'NoIda', N'navaeen Singh Mnaral', N'Delhi', NULL, CAST(8000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), N'111', CAST(N'2019-10-24T16:11:55.917' AS DateTime), N'Approved', N'Only thousnd approved', 1, N'181278', CAST(N'2019-10-24T16:09:43.007' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (73, 1, 176427, N'April-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.670' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (74, 1, 176427, N'May-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.907' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (75, 1, 176427, N'June-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.907' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (76, 1, 176427, N'July-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.910' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (77, 1, 176427, N'August-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.910' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (78, 1, 176427, N'September-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.913' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (79, 1, 176427, N'October-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.917' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (80, 1, 176427, N'November-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.917' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (81, 1, 176427, N'December-2019', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.917' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (82, 1, 176427, N'January-2020', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.920' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (83, 1, 176427, N'February-2020', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.923' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (84, 1, 176427, N'March-2020', N'Metro', N'NOIDA', N'KARAN SINGH', N'GURGAON', NULL, CAST(5000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'176427', CAST(N'2019-10-25T16:19:27.927' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (133, 1, 190025, N'April-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.560' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.640' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (134, 1, 190025, N'May-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.580' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.650' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (135, 1, 190025, N'June-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.583' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.657' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (136, 1, 190025, N'July-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.590' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.663' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (137, 1, 190025, N'August-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.600' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.667' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (138, 1, 190025, N'September-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.613' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.673' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (139, 1, 190025, N'October-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.620' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.680' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (140, 1, 190025, N'November-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.627' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.683' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (141, 1, 190025, N'December-2019', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.633' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.690' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (142, 1, 190025, N'January-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.640' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.697' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (143, 1, 190025, N'February-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.650' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.700' AS DateTime))
INSERT [dbo].[Tbl_HRA] ([HRA_Id], [FY_Id], [Portal_Id], [MonthName], [City], [Location], [LandlordName], [LandlordAddress], [LandlardPan], [Amount], [ApprovedAmount], [ApprovedBy], [ApprovedOn], [Status], [Remarks], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (144, 1, 190025, N'March-2020', N'Metro', N'New Delhi', N'Naveen Singh Manral', N'NOIDA', NULL, CAST(8000 AS Decimal(18, 0)), NULL, NULL, NULL, N'Submitted', NULL, 1, N'190025', CAST(N'2019-11-19T02:58:20.653' AS DateTime), N'190025', CAST(N'2019-11-19T02:58:25.703' AS DateTime))
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
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 111, 1, N'HRA_111_91cc99fc5d7c4439852fc256b782fb03.pdf', 0, NULL, CAST(N'2019-10-09T11:04:33.420' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 111, 1, N'HRA_111_004b907bce844e10a9e430c813e7f00d.pdf', 0, NULL, CAST(N'2019-10-09T11:15:09.620' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 111, 1, N'HRA_111_83fe026c00d140daa199c6661903ae1b.pdf', 0, NULL, CAST(N'2019-10-09T12:01:10.703' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 111, 1, N'HRA_111_c97ba5cdccbf451ebfdf2945dbe63127.pdf', 0, NULL, CAST(N'2019-10-09T12:04:08.243' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 111, 1, N'HRA_111_af37162a5dac46e59fbf496fba955684.pdf', 0, NULL, CAST(N'2019-10-09T13:24:23.757' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, 111, 1, N'HRA_111_9bf78aced176433e9862ce3fd171043f.pdf', 1, NULL, CAST(N'2019-10-10T14:42:48.720' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (15, 111, 1, N'HRA_111_7cc0c5519d8a46769be1ba1b7d0e1abe.pdf', 1, NULL, CAST(N'2019-10-15T13:32:59.260' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (17, 181227, 1, N'HRA_181227_af7f9e58b9414f04b1fc1a3d3f9d9614.pdf', 1, NULL, CAST(N'2019-10-22T13:39:56.970' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (25, 190025, 1, N'HRA_190025_bdcd69858eec4112a6e2631a56a18643.pdf', 0, NULL, CAST(N'2019-11-19T02:56:52.990' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (26, 190025, 1, N'HRA_190025_0a6b450125b64665a55a0383fcf83b2a.pdf', 0, NULL, CAST(N'2019-11-19T02:58:38.033' AS DateTime), NULL, NULL)
INSERT [dbo].[Tbl_HRAUploadFiles] ([Id], [PortalID], [FY_ID], [FileName], [IsActive], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (27, 190025, 1, N'HRA_190025_250dd3c368664d7eb3a80e0a6e6a28a8.pdf', 1, NULL, CAST(N'2019-11-19T03:06:17.520' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_HRAUploadFiles] OFF
SET IDENTITY_INSERT [dbo].[Tbl_SectionMaster] ON 

INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (1, N'80C', N'Public Provident Fund', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (2, N'80C', N'Life Insurance Corporation', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (3, N'80CCC', N'Deduction under Life Insurance Pension Scheme', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (4, N'80C', N'Children Education Expenses', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (5, N'80C', N'National Savings Certificate', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (6, N'80C', N'Insurance Premium', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (7, N'80C', N'Housing Loan Principal Repayment', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (8, N'80C', N'Others - Post Office Savings Schemes , Tax Saver Term Deposit - 5 years', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (9, N'80C', N'Sukanya Samriddhi Scheme', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (10, N'80C', N'Accrued NSC Interest', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (11, N'80C', N'Mutual Funds / ULIP', 1, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (12, N'80C', N'Employee''s contribution towards NPS', 3, 1, N'188888', CAST(N'2019-09-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (13, N'80D', N'Medical Insurance Premium', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (14, N'80D', N'Medical Insurance Premium for parents', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (15, N'80D', N'Medical Insurance Premium paid for Senior Citizen (Parents)', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (16, N'80DD', N'Medical for Handicapped Dependents', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (17, N'80DD', N'Medical for Handicapped Dependents (severe disability)', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (18, N'80DDB', N'Medical for Specified Diseases', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (19, N'80DDB', N'Medical for Specified Diseases for Senior Citizen', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (20, N'80E', N'Interest Paid on Higher Education Loan', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (21, N'80U', N'Deduction for Permanent Disability', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Tbl_SectionMaster] ([Section_Id], [Section_SName], [Section_LName], [Deduction_Type_Id], [IsActive], [CreatedBy], [CreatedOn]) VALUES (22, N'80D', N'Interest on House Property - Additional Exemption', 2, 1, N'188888', CAST(N'2019-09-30T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_SectionMaster] OFF
/****** Object:  StoredProcedure [dbo].[AddUpdateDeductionDetails]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUpdateDeductionDetails]
(
	@Deduction_Dtl_Id INT,
	@FY_Id INT,
	@Portal_Id INT,
	@Deduction_Type_Id INT,
	@Section_ID INT,
	@BeneficialName VARCHAR(255),
	@Relation VARCHAR(255),
	@ReferenceNo VARCHAR(255),
	@Amount DECIMAL(16,2),
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		IF(ISNULL(@Deduction_Dtl_Id,0) = 0)
		BEGIN
			INSERT INTO Tbl_Deduction_Details(FY_Id, Portal_Id, Deduction_Type_Id, Section_ID, BeneficialName, Relation, ReferenceNo, Amount, Status, IsActive, CreatedBy, CreatedOn)
			SELECT @FY_Id, @Portal_Id, @Deduction_Type_Id, @Section_ID, @BeneficialName, @Relation, @ReferenceNo, @Amount, 'Submitted', 1, @LoginUser, GETDATE()
		END
		ELSE
		BEGIN
			UPDATE Tbl_Deduction_Details SET Deduction_Type_Id = @Deduction_Type_Id, Section_ID = @Section_ID, BeneficialName = @BeneficialName, 
			Relation = @Relation, ReferenceNo = @ReferenceNo, Amount = @Amount, UpdatedBy = @LoginUser, UpdatedOn = GETDATE()
			WHERE Deduction_Dtl_Id = @Deduction_Dtl_Id
		END

		SELECT 1

	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateFY]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[AddUpdateFY]
(
	@FY_Id INT,
	@FY_StartDateTime NVARCHAR(50),
	@FY_EndDateTime NVARCHAR(50),
	@Declaration_StartDate NVARCHAR(50),
	@Declaration_EndDate NVARCHAR(50),
	@Actual_StartDate NVARCHAR(50),
	@Actual_EndDate NVARCHAR(50),
	@Approver_StartDate NVARCHAR(50),
	@Approver_EndDate NVARCHAR(50),
	@Is_Current_FY INT,
	@IsActive INT,
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		IF(ISNULL(@Is_Current_FY,0) = 1)
		BEGIN
			UPDATE Tbl_FY SET Is_Current_FY = 0
		END

		IF(ISNULL(@FY_Id,0) = 0)
		BEGIN
			INSERT INTO Tbl_FY(FY_StartDateTime, FY_EndDateTime, Declaration_StartDate, Declaration_EndDate, Actual_StartDate, Actual_EndDate, Approver_StartDate, Approver_EndDate, Is_Current_FY, IsActive, CreatedBy, CreatedOn)
			SELECT @FY_StartDateTime, @FY_EndDateTime, @Declaration_StartDate, @Declaration_EndDate, @Actual_StartDate, @Actual_EndDate, @Approver_StartDate, @Approver_EndDate, CASE WHEN ISNULL(@Is_Current_FY,0) = 2 THEN 0 ELSE @Is_Current_FY END, CASE WHEN ISNULL(@IsActive,0) = 2 THEN 0 ELSE @IsActive END, @LoginUser, GETDATE()
		END
		ELSE
		BEGIN
			UPDATE Tbl_FY SET 
			FY_StartDateTime = @FY_StartDateTime, FY_EndDateTime = @FY_EndDateTime, 
			Declaration_StartDate = @Declaration_StartDate, Declaration_EndDate = @Declaration_EndDate,
			Actual_StartDate = @Actual_StartDate, Actual_EndDate = @Actual_EndDate,
			Approver_StartDate = @Approver_StartDate, Approver_EndDate = @Approver_EndDate, 
			Is_Current_FY = CASE WHEN ISNULL(@Is_Current_FY,0) = 2 THEN 0 ELSE @Is_Current_FY END,
			IsActive = CASE WHEN ISNULL(@IsActive,0) = 2 THEN 0 ELSE @IsActive END, 
			UpdatedBy = @LoginUser, UpdatedOn = GETDATE() WHERE FY_Id = @FY_Id
		END

		SELECT 1

	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateGuideline]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[AddUpdateGuideline]
(
	@Guideline_Id INT,
	@Guideline_Text NVARCHAR(1000),
	@IsActive INT,
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		IF(ISNULL(@Guideline_Id,0) = 0)
		BEGIN
			INSERT INTO Tbl_Guideline(Guideline_Text, IsActive, CreatedBy, CreatedOn)
			SELECT @Guideline_Text, CASE WHEN ISNULL(@IsActive,0) = 2 THEN 0 ELSE @IsActive END, @LoginUser, GETDATE()
		END
		ELSE
		BEGIN
			UPDATE Tbl_Guideline SET Guideline_Text = @Guideline_Text, IsActive = CASE WHEN ISNULL(@IsActive,0) = 2 THEN 0 ELSE @IsActive END, UpdatedBy = @LoginUser, UpdatedOn = GETDATE() WHERE  Guideline_Id = @Guideline_Id
		END

		SELECT 1

	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ApproveDeductionDetails]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ApproveDeductionDetails]
(
	@ApproveDeductionXml VARCHAR(MAX),
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @ApproveDeductionXmlHandle INT 

		EXEC sp_xml_preparedocument @ApproveDeductionXmlHandle OUTPUT, @ApproveDeductionXml

		SELECT * INTO #TempApproveDeduction  
		FROM OPENXML (@ApproveDeductionXmlHandle, 'ROOT/ROW', 1) 
		WITH (
		    DeductionDtlId INT,
			ApproveAmount VARCHAR(200),  
			Remarks VARCHAR(255)
		)

		UPDATE TDD SET TDD.ApprovedAmount = TAD.ApproveAmount, TDD.ApprovedBy =  @LoginUser, TDD.ApprovedOn = GETDATE(), TDD.Remarks = TAD.Remarks, Status = 'Approved' FROM Tbl_Deduction_Details TDD INNER JOIN #TempApproveDeduction TAD ON TDD.Deduction_Dtl_Id = TAD.DeductionDtlId
		
		EXEC sp_xml_removedocument @ApproveDeductionXmlHandle

		SELECT 1

	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDataforEmployee]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[DeleteDataforEmployee]
(@Portal_Id INT)
AS
BEGIN
delete from [dbo].[Tbl_FY_Employee_Saving_Master] where Portal_Id=@Portal_Id
delete from [dbo].[Tbl_HRAUploadFiles] where PortalID=@Portal_Id
delete from [dbo].[Tbl_HRA] where Portal_Id=@Portal_Id
delete from [dbo].[Tbl_FY_Employee_Saving_Master] where Portal_Id=@Portal_Id
delete from [dbo].[Tbl_HouseLoan_PropertyDetails] where Portal_Id=@Portal_Id
delete from [dbo].[Tbl_Deduction_Details_UploadDocuments] where Portal_Id=@Portal_Id
delete from [dbo].[Tbl_Deduction_Details] where Portal_Id=@Portal_Id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDeductionDetails]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteDeductionDetails]
(
	@Deduction_Dtl_Id INT,
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		
		IF(ISNULL(@Deduction_Dtl_Id,0)<>0)
		BEGIN
			DELETE FROM Tbl_Deduction_Details WHERE Deduction_Dtl_Id = @Deduction_Dtl_Id
		END
		
		SELECT 1

	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteDeductionDetailsDocuments]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDeductionDetailsDocuments]
(
	@Deduction_Dtl_UD_Id INT,
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		
		DELETE FROM Tbl_Deduction_Details_UploadDocuments WHERE Deduction_Dtl_UD_Id = @Deduction_Dtl_UD_Id

		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFY]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteFY]
(
	@FY_Id INT,
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		
		IF(ISNULL(@FY_Id,0)<>0)
		BEGIN
			DELETE FROM Tbl_FY WHERE FY_Id = @FY_Id
		END
		
		SELECT 1

	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteGuideline]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteGuideline]
(
	@Guideline_Id INT,
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		
		IF(ISNULL(@Guideline_Id,0)<>0)
		BEGIN
			DELETE FROM Tbl_Guideline WHERE Guideline_Id = @Guideline_Id
		END
		
		SELECT 1

	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetDeductionDetailsByDedectionType]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[GetDeductionDetailsByDedectionType] --[GetDeductionDetailsByDedectionType] 1, 111
(
	@Deduction_Type_Id INT,
	@Portal_Id INT
)
AS
BEGIN
	BEGIN TRY
		SELECT ROW_NUMBER() OVER(ORDER BY Deduction_Dtl_Id) AS SNo, * FROM(
		SELECT DD.Deduction_Dtl_Id, DD.FY_Id, DD.Portal_Id, DD.Deduction_Type_Id, DD.Section_ID, DD.BeneficialName, DD.Relation, DD.ReferenceNo, DD.Amount,
		ISNULL(DD.ApprovedAmount, 0) AS ApprovedAmount, ISNULL(DD.ApprovedBy,'') AS ApprovedBy, 
		CASE WHEN DD.ApprovedOn IS NULL THEN '' ELSE CONVERT(VARCHAR(10), DD.ApprovedOn,103) + ' '+ CONVERT(VARCHAR(20), DD.ApprovedOn,108) END AS ApprovedOn, 
		DD.Status, ISNULL(DD.Remarks,'') AS Remarks, SM.Section_SName, SM.Section_LName
		FROM Tbl_Deduction_Details DD INNER JOIN Tbl_SectionMaster SM ON DD.Section_ID = SM.Section_Id
		WHERE DD.Deduction_Type_Id = @Deduction_Type_Id AND DD.Portal_Id = @Portal_Id AND DD.FY_Id IN (SELECT FY_Id FROM Tbl_FY WHERE Is_Current_FY = 1 AND IsActive = 1)) AS TBL1 
	END TRY
	BEGIN CATCH
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetDeductionDetailsDocumentsByDeductionDtlId]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDeductionDetailsDocumentsByDeductionDtlId] --1,''
(
	@Deduction_Dtl_Id INT,
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		
		SELECT ROW_NUMBER () OVER (ORDER BY Deduction_Dtl_UD_Id) AS SNo, * FROM(
		SELECT Deduction_Dtl_UD_Id, Deduction_Dtl_Id, FileName FROM Tbl_Deduction_Details_UploadDocuments WHERE Deduction_Dtl_Id = @Deduction_Dtl_Id) AS TABLE1 

	END TRY
	BEGIN CATCH

	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetFYList]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[GetFYList]
AS
BEGIN
	BEGIN TRY

		SELECT FY_Id,
		CASE WHEN FY_StartDateTime IS NULL THEN '' ELSE CONVERT(VARCHAR(10), FY_StartDateTime,101) END AS FY_StartDateTime, 
		CASE WHEN FY_EndDateTime IS NULL THEN '' ELSE CONVERT(VARCHAR(10), FY_EndDateTime,101) END AS FY_EndDateTime, 
		CASE WHEN Declaration_StartDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10), Declaration_StartDate,101) END AS Declaration_StartDate, 
		CASE WHEN Declaration_EndDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10), Declaration_EndDate,101) END AS Declaration_EndDate, 
		CASE WHEN Actual_StartDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10), Actual_StartDate,101) END AS Actual_StartDate, 
		CASE WHEN Actual_EndDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10), Actual_EndDate,101) END AS Actual_EndDate, 
		CASE WHEN Approver_StartDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10), Approver_StartDate,101) END AS Approver_StartDate, 
		CASE WHEN Approver_EndDate IS NULL THEN '' ELSE CONVERT(VARCHAR(10), Approver_EndDate,101) END AS Approver_EndDate,		
		CASE WHEN ISNULL(Is_Current_FY,0) = 1 THEN 'Yes' ELSE 'No' END AS Is_Current_FY, 
		CASE WHEN ISNULL(IsActive,0) = 1 THEN 'Yes' ELSE 'No' END AS IsActive, 
		CASE WHEN CreatedBy IS NULL THEN '' ELSE CreatedBy END AS CreatedBy, 
		CASE WHEN CreatedOn IS NULL THEN '' ELSE CONVERT(VARCHAR(10), CreatedOn,101) + ' '+ CONVERT(VARCHAR(20), CreatedOn,108) END AS CreatedOn, 
		CASE WHEN UpdatedBy IS NULL THEN '' ELSE UpdatedBy END AS UpdatedBy,
		CASE WHEN UpdatedOn IS NULL THEN '' ELSE CONVERT(VARCHAR(10), UpdatedOn,101) + ' '+ CONVERT(VARCHAR(20), UpdatedOn,108) END AS UpdatedOn 
		FROM Tbl_FY 
	END TRY
	BEGIN CATCH
		
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetGuidelineList]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetGuidelineList]
AS
BEGIN
	BEGIN TRY
		SELECT Guideline_Id, Guideline_Text, CASE WHEN ISNULL(IsActive,0) = 1 THEN 'Yes' ELSE 'No' END AS IsActive, 
		CASE WHEN CreatedBy IS NULL THEN '' ELSE CreatedBy END AS CreatedBy, 
		CASE WHEN CreatedOn IS NULL THEN '' ELSE CONVERT(VARCHAR(10), CreatedOn,103) + ' '+ CONVERT(VARCHAR(20), CreatedOn,108) END AS CreatedOn, 
		CASE WHEN UpdatedBy IS NULL THEN '' ELSE UpdatedBy END AS UpdatedBy,
		CASE WHEN UpdatedOn IS NULL THEN '' ELSE CONVERT(VARCHAR(10), UpdatedOn,103) + ' '+ CONVERT(VARCHAR(20), UpdatedOn,108) END AS UpdatedOn FROM Tbl_Guideline 
	END TRY
	BEGIN CATCH
		
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[GetSectionListByDeductionTypeId]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetSectionListByDeductionTypeId]
(
	@Deduction_Type_Id INT = 0
)
AS
BEGIN
	SELECT DISTINCT Section_SName FROM Tbl_SectionMaster WHERE ISNULL(IsActive,0) = 1 AND Deduction_Type_Id = @Deduction_Type_Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetSectionListBySectionSName]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetSectionListBySectionSName]
(
	@Section_SName VARCHAR(10),
	@Deduction_Type_Id INT = 0
)
AS
BEGIN
	SELECT Section_Id, Section_SName, Section_LName FROM Tbl_SectionMaster WHERE ISNULL(IsActive,0) = 1 AND Section_SName = @Section_SName AND  Deduction_Type_Id = @Deduction_Type_Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetWindowFlag]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetWindowFlag] --EXEC GetWindowFlag 'HR', 190025,111
(
	@UserType VARCHAR(50),
	@EmpPortalID INT,
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @ShowAllCtrl INT = 0
		
		IF(@UserType = 'EMP')
		BEGIN
			IF EXISTS(SELECT 1 FROM Tbl_FY_Employee_Saving_Master ESM WITH(NOLOCK)
					  INNER JOIN Tbl_FY FY ON FY.FY_ID = ESM.FY_ID
					  WHERE ESM.Portal_Id = @EmpPortalID AND ISNULL(FY.Is_Current_FY,0) = 1 AND ISNULL(FY.IsActive,0) = 1)
			BEGIN
				IF EXISTS(SELECT 1 FROM Tbl_FY_Employee_Saving_Master ESM WITH(NOLOCK)
						  INNER JOIN Tbl_FY FY ON FY.FY_ID = ESM.FY_ID
						  WHERE ESM.Portal_Id = @EmpPortalID AND ISNULL(FY.Is_Current_FY,0) = 1 AND ISNULL(FY.IsActive,0) = 1
						  AND ISNULL(ESM.Is_Completed_Employee,0) = 0
						  AND CAST(GETDATE() AS DATE) BETWEEN CAST(FY.Actual_StartDate AS DATE) AND CAST(FY.Actual_EndDate AS DATE)
						  )
				BEGIN
					SET @ShowAllCtrl = 1
				END
				ELSE
				BEGIN				
					SET @ShowAllCtrl = 0
				END
			END
			ELSE
			BEGIN
				IF EXISTS(SELECT 1 FROM Tbl_FY FY WHERE ISNULL(FY.Is_Current_FY,0) = 1 AND ISNULL(FY.IsActive,0) = 1
					  AND CAST(GETDATE() AS DATE) BETWEEN CAST(FY.Actual_StartDate AS DATE) AND CAST(FY.Actual_EndDate AS DATE))
				BEGIN
					SET @ShowAllCtrl = 1
				END
				ELSE
				BEGIN				
					SET @ShowAllCtrl = 0
				END
			END
		END		
		ELSE IF(@UserType = 'HR')
		BEGIN
			IF EXISTS(SELECT 1 FROM Tbl_FY_Employee_Saving_Master ESM WITH(NOLOCK)
						INNER JOIN Tbl_FY FY ON ESM.FY_ID = FY.FY_Id
						WHERE Portal_Id = @EmpPortalID AND ISNULL(FY.Is_Current_FY,0) = 1 AND ISNULL(FY.IsActive,0) = 1 
						AND ISNULL(ESM.Is_Completed_HR,0) = 0
						AND CAST(GETDATE() AS DATE) BETWEEN CAST(FY.Approver_StartDate AS DATE) AND CAST(FY.Actual_EndDate AS DATE) 
					  )
			BEGIN
				SET @ShowAllCtrl = 1
			END
			ELSE
			BEGIN
				SET @ShowAllCtrl = 0
			END
		END

		SELECT @ShowAllCtrl

	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_User]    Script Date: 11/20/2019 5:14:16 PM ******/
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
@Emp_Type_Id		int,
@FatherName			varchar(max),
@Location			varchar(max),
@CommAddress		varchar(max)

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
					,UpdatedOn
					,Loaction
			,CommAddress
			,FatherName)

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
								  ,GETDATE()
								  ,@Location
						  ,@CommAddress
						  ,@FatherName)

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
			,UpdatedOn
			,Loaction
			,CommAddress
			,FatherName)

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
						  ,GETDATE()
						  ,@Location
						  ,@CommAddress
						  ,@FatherName)
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
				,UpdatedOn
				,Loaction
			,CommAddress
			,FatherName)

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
							  ,GETDATE()
							  ,@Location
						  ,@CommAddress
						  ,@FatherName)
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
				,UpdatedOn
				,Loaction
			,CommAddress
			,FatherName)

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
							  ,GETDATE()
							  ,@Location
						  ,@CommAddress
						  ,@FatherName)

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
/****** Object:  StoredProcedure [dbo].[SP_RegisterNewUser]    Script Date: 11/20/2019 5:14:16 PM ******/
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
@Pan_No				NVARCHAR(30),
@Location			varchar(max),
@FatherName			varchar(max),
@CommAddress		varchar(max)


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
					,UpdatedOn
					,Loaction
			,CommAddress
			,FatherName)

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
								  ,GETDATE()
								  ,@Location
						  ,@CommAddress
						  ,@FatherName)

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
				,UpdatedOn
				,Loaction
			,CommAddress
			,FatherName)

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
							  ,GETDATE()
							  ,@Location
						  ,@CommAddress
						  ,@FatherName)
							  
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
			,UpdatedOn
			,Loaction
			,CommAddress
			,FatherName)

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
						  ,GETDATE()
						  ,@Location
						  ,@CommAddress
						  ,@FatherName)
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
/****** Object:  StoredProcedure [dbo].[UploadDeductionDetailsDocuments]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UploadDeductionDetailsDocuments]
(
	@Deduction_Dtl_Id INT,
	@FY_Id INT,
	@Portal_Id INT,
	@FileName VARCHAR(255),
	@LoginUser VARCHAR(255)
)
AS
BEGIN
	BEGIN TRY
		
		INSERT INTO Tbl_Deduction_Details_UploadDocuments(Deduction_Dtl_Id, FY_Id, Portal_Id, FileName, CreatedBy, CreatedOn)
		SELECT @Deduction_Dtl_Id, @FY_Id, @Portal_Id, @FileName, @LoginUser, GETDATE()

		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetHomeLoan]    Script Date: 11/20/2019 5:14:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[USP_HR_Update_HomeLoan]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  
    
CREATE  PROCEDURE [dbo].[USP_HR_Update_HomeLoan]    
 (  
 @FY_Id int,    
 @Portal_Id int,
 @ApprovedAmount decimal,    
 @ApprovedBy NVARCHAR(225),
 @Status NVARCHAR(225),    
 @Remarks NVARCHAR(225)
)  
  
AS    
    
BEGIN    
    
       SET NOCOUNT ON;    
    
       IF EXISTS(SELECT Portal_Id FROM Tbl_HouseLoan_PropertyDetails WHERE Portal_Id = @Portal_Id and FY_Id=@FY_Id)    
    
       BEGIN    
              BEGIN TRY  
			   
     Update Tbl_HouseLoan_PropertyDetails  
	 	  
     SET
	 ApprovedAmount=@ApprovedAmount,    
     ApprovedBy=@ApprovedBy,    
     ApprovedOn =GETDATE(), 
	 [Status]=@Status,    
     Remarks =@Remarks 
     WHERE Portal_Id = @Portal_Id  and FY_Id=@FY_Id  
  
    SELECT 1  

       END TRY  
  BEGIN CATCH   
       SELECT -1  
  END CATCH  
    
       END    
           
        
END  
GO
/****** Object:  StoredProcedure [dbo].[USP_Insert_Update_HomeLoan]    Script Date: 11/20/2019 5:14:16 PM ******/
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
     Possession_Completion_Date =@Possession_Completion_Date,    
     InterestPaid =@InterestPaid ,    
     HouseLoanPrincipalAmount=@HouseLoanPrincipalAmount ,    
     ApprovedAmount=@ApprovedAmount, 
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
     @Possession_Completion_Date,   
     @InterestPaid ,    
     @HouseLoanPrincipalAmount ,    
     @ApprovedAmount ,    
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
/****** Object:  StoredProcedure [dbo].[USP_UPDATE_EMPMapping_Details]    Script Date: 11/20/2019 5:14:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[USP_UPDATE_EMPMapping_Details]  
@PortalId INT,  
@isHR  BIT,  
@isAdmin BIT  

AS      
      
BEGIN      
      
    SET NOCOUNT ON;   
         
    DECLARE @Emp_Id int; 
  
    Set @Emp_Id= (select Emp_Id from Tbl_EmployeeMaster where PortalId=@PortalId)  
  
  IF (@isHR=1)  
  
     BEGIN  
		 IF EXISTS(select * from Tbl_Emp_Type_Mapping where Emp_Id =@Emp_Id  and  Emp_Type_Id =1)  
		 BEGIN  
		 UPDATE Tbl_Emp_Type_Mapping set IsActive=1 where Emp_Id =@Emp_Id  and  Emp_Type_Id =1  
     END  
     ELSE  
		   BEGIN  
		   INSERT INTO Tbl_Emp_Type_Mapping (Emp_Id,Emp_Type_Id,IsActive) values(@Emp_Id,1,1)  
		   END   
      END  

  ELSE  IF (@isHR=0)  

    BEGIN  
     IF EXISTS(select * from Tbl_Emp_Type_Mapping where Emp_Id =@Emp_Id  and  Emp_Type_Id =1)  
		BEGIN  
		  UPDATE Tbl_Emp_Type_Mapping set IsActive=0 where Emp_Id =@Emp_Id  and  Emp_Type_Id =1  
		  END  
        END  
  
    IF (@isAdmin=1)  
  
     BEGIN  
			 IF EXISTS(select * from Tbl_Emp_Type_Mapping where Emp_Id =@Emp_Id  and  Emp_Type_Id =3)  
			  BEGIN  
		      UPDATE Tbl_Emp_Type_Mapping set IsActive=1 where Emp_Id =@Emp_Id  and  Emp_Type_Id =3  
			 END  
     ELSE  
		   BEGIN  
		   INSERT INTO Tbl_Emp_Type_Mapping (Emp_Id,Emp_Type_Id,IsActive) values(@Emp_Id,3,1)  
		   END  
    END  
  
  ELSE  IF (@isAdmin=0)  
    BEGIN  
     IF EXISTS(select * from Tbl_Emp_Type_Mapping where Emp_Id =@Emp_Id  and  Emp_Type_Id =3)  
			BEGIN  
			UPDATE Tbl_Emp_Type_Mapping set IsActive=0 where Emp_Id =@Emp_Id  and  Emp_Type_Id =3  
			END  
     END  
  
END      
GO
USE [master]
GO
ALTER DATABASE [OLITPS] SET  READ_WRITE 
GO
