USE [Auth]
GO
/****** Object:  StoredProcedure [core].[Get_Users]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP PROCEDURE [core].[Get_Users]
GO
ALTER TABLE [core].[Function_User_Role] DROP CONSTRAINT [DF__Function___Is_De__01142BA1]
GO
ALTER TABLE [core].[Component_User_Role] DROP CONSTRAINT [DF_Component_User_Role_Is_Deleted]
GO
/****** Object:  Table [core].[User_Archived]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[User_Archived]') AND type in (N'U'))
DROP TABLE [core].[User_Archived]
GO
/****** Object:  Table [core].[Data_Role_Business_Unit]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Data_Role_Business_Unit]') AND type in (N'U'))
DROP TABLE [core].[Data_Role_Business_Unit]
GO
/****** Object:  Table [core].[Business_Unit_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Business_Unit_Role]') AND type in (N'U'))
DROP TABLE [core].[Business_Unit_Role]
GO
/****** Object:  View [core].[View_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP VIEW [core].[View_User_Role]
GO
/****** Object:  View [core].[View_Component_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP VIEW [core].[View_Component_User_Role]
GO
/****** Object:  Table [core].[Component_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Component_User_Role]') AND type in (N'U'))
DROP TABLE [core].[Component_User_Role]
GO
/****** Object:  View [core].[View_Function_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP VIEW [core].[View_Function_User_Role]
GO
/****** Object:  Table [core].[Function_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Function_User_Role]') AND type in (N'U'))
DROP TABLE [core].[Function_User_Role]
GO
/****** Object:  View [core].[View_Data_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP VIEW [core].[View_Data_User_Role]
GO
/****** Object:  Table [core].[User]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[User]') AND type in (N'U'))
DROP TABLE [core].[User]
GO
/****** Object:  View [core].[View_Data_User_Role_Full]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP VIEW [core].[View_Data_User_Role_Full]
GO
/****** Object:  Table [core].[Data_Permission_Entity]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Data_Permission_Entity]') AND type in (N'U'))
DROP TABLE [core].[Data_Permission_Entity]
GO
/****** Object:  Table [core].[Data_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Data_User_Role]') AND type in (N'U'))
DROP TABLE [core].[Data_User_Role]
GO
/****** Object:  Table [core].[Data_Role_Permission]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Data_Role_Permission]') AND type in (N'U'))
DROP TABLE [core].[Data_Role_Permission]
GO
/****** Object:  Table [core].[Data_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Data_Role]') AND type in (N'U'))
DROP TABLE [core].[Data_Role]
GO
/****** Object:  Table [core].[Data_Permission_Engine]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Data_Permission_Engine]') AND type in (N'U'))
DROP TABLE [core].[Data_Permission_Engine]
GO
/****** Object:  Table [core].[Data_Permission]    Script Date: 2/4/2021 6:20:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[core].[Data_Permission]') AND type in (N'U'))
DROP TABLE [core].[Data_Permission]
GO
/****** Object:  Schema [core]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP SCHEMA [core]
GO
/****** Object:  User [dev_user]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP USER [dev_user]
GO
/****** Object:  User [HP336S7-PHX-PRI\SQLServerDev]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP USER [HP336S7-PHX-PRI\SQLServerDev]
GO
USE [master]
GO
/****** Object:  Database [Auth]    Script Date: 2/4/2021 6:20:40 PM ******/
DROP DATABASE [Auth]
GO
/****** Object:  Database [Auth]    Script Date: 2/4/2021 6:20:40 PM ******/
CREATE DATABASE [Auth]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Auth', FILENAME = N'E:\TEST\MSSQL13.TEST\MSSQL\DATA\Auth.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Auth_log', FILENAME = N'E:\TEST\MSSQL13.TEST\MSSQL\DATA\Auth_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Auth] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Auth].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Auth] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Auth] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Auth] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Auth] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Auth] SET ARITHABORT OFF 
GO
ALTER DATABASE [Auth] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Auth] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Auth] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Auth] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Auth] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Auth] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Auth] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Auth] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Auth] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Auth] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Auth] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Auth] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Auth] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Auth] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Auth] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Auth] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Auth] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Auth] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Auth] SET  MULTI_USER 
GO
ALTER DATABASE [Auth] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Auth] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Auth] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Auth] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Auth] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Auth', N'ON'
GO
ALTER DATABASE [Auth] SET QUERY_STORE = OFF
GO
USE [Auth]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Auth]
GO
/****** Object:  User [HP336S7-PHX-PRI\SQLServerDev]    Script Date: 2/4/2021 6:20:40 PM ******/
CREATE USER [HP336S7-PHX-PRI\SQLServerDev]
GO
/****** Object:  User [dev_user]    Script Date: 2/4/2021 6:20:40 PM ******/
CREATE USER [dev_user] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [HP336S7-PHX-PRI\SQLServerDev]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dev_user]
GO
/****** Object:  Schema [core]    Script Date: 2/4/2021 6:20:40 PM ******/
CREATE SCHEMA [core]
GO
/****** Object:  Table [core].[Data_Permission]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Data_Permission](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [core].[Data_Permission_Engine]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Data_Permission_Engine](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fk_Permission_ID] [int] NOT NULL,
	[Engine_Code] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [core].[Data_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Data_Role](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [core].[Data_Role_Permission]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Data_Role_Permission](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fk_Role_ID] [int] NOT NULL,
	[Fk_Permission_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [core].[Data_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Data_User_Role](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Fk_Role_ID] [int] NOT NULL,
	[Fk_Business_Unit_ID] [int] NOT NULL,
 CONSTRAINT [PK_Data_User_Role] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Fk_Role_ID] ASC,
	[Fk_Business_Unit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [core].[Data_Permission_Entity]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Data_Permission_Entity](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Fk_Permission_ID] [int] NOT NULL,
	[Entity_Code] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [core].[View_Data_User_Role_Full]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE     VIEW [core].[View_Data_User_Role_Full]
AS
select 	a1.Username, 
	a1.Fk_Role_ID, 
	a2.Name,
	a4.PK_ID as Fk_Permission_ID,
	a4.Code,
	a5.Engine_Code,
	a6.Entity_Code from core.Data_User_Role a1 
		left join core.Data_Role a2 ON a1.Fk_Role_ID = a2.PK_ID
		left join core.Data_Role_Permission a3 on a2.PK_ID = a3.Fk_Role_ID
		left join core.Data_Permission a4 on a4.PK_ID = a3.Fk_Permission_ID
		left join core.Data_Permission_Engine a5 on a4.PK_ID = a5.Fk_Permission_ID
		left join core.Data_Permission_Entity a6 on a4.PK_ID = a6.Fk_Permission_ID
		--WHERE IsNull(a5.Fk_Sys_Engine,'') <> '' OR IsNull(a6.Entity_Code,'') <> ''

GO
/****** Object:  Table [core].[User]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[User](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Display_Name] [nvarchar](200) NULL,
	[Password] [nvarchar](100) NULL,
	[Super_Role] [varchar](50) NULL,
	[Type] [nvarchar](10) NULL,
	[Status] [char](1) NULL,
	[Is_Deleted] [bit] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Create_User] [nvarchar](100) NULL,
	[Modified_Date] [datetime2](7) NULL,
	[Modified_By] [nvarchar](100) NULL,
	[Email] [nvarchar](200) NULL,
	[Phone] [nvarchar](50) NULL,
	[Last_Login] [datetime2](7) NULL,
 CONSTRAINT [PK__User__F4A24B2246689C6D] PRIMARY KEY CLUSTERED 
(
	[PK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [core].[View_Data_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE     VIEW [core].[View_Data_User_Role]
AS
Select 
	B1.Username, 
	B2.Super_Role,
	NullIf(Concat(STUFF((Select Concat(';', A1.Name, '') FROM core.View_Data_User_Role_Full A1 
			WHERE A1.Username = B1.Username And IsNull(A1.Engine_Code,'') <> ''
			FOR XML PATH(''),TYPE).value('(./text())[1]','NVARCHAR(MAX)'),1,1,''),''),'') As Engine_Roles,
	NullIf(Concat(STUFF((Select Concat(';', A1.Name, '') FROM core.View_Data_User_Role_Full A1 
			WHERE A1.Username = B1.Username And IsNull(A1.Entity_Code,'') <> ''
			FOR XML PATH(''),TYPE).value('(./text())[1]','NVARCHAR(MAX)'),1,1,''),''),'') As Entity_Roles,
	NullIf(Concat(STUFF((Select Concat(';', A1.Engine_Code, '') FROM core.View_Data_User_Role_Full A1 
			WHERE A1.Username = B1.Username And IsNull(A1.Engine_Code,'') <> ''
			FOR XML PATH(''),TYPE).value('(./text())[1]','NVARCHAR(MAX)'),1,1,''),''),'') As Engine_Codes,
	NullIf(Concat(STUFF((Select Concat(';', A1.Entity_Code, '') FROM core.View_Data_User_Role_Full A1 
			WHERE A1.Username = B1.Username And IsNull(A1.Entity_Code,'') <> ''
			FOR XML PATH(''),TYPE).value('(./text())[1]','NVARCHAR(MAX)'),1,1,''),''),'') As Entity_Codes,
	NullIf(Concat(STUFF((Select Concat(';', A1.Fk_Role_ID, '') FROM core.View_Data_User_Role_Full A1 
			WHERE A1.Username = B1.Username And IsNull(A1.Fk_Role_ID,'') <> ''
			FOR XML PATH(''),TYPE).value('(./text())[1]','NVARCHAR(MAX)'),1,1,''),''),'') As Fk_Data_Role
From core.Data_User_Role B1
Left Join core.[User] B2 ON B1.Username = B2.Username
Group By B1.Username, 
B2.Super_Role

GO
/****** Object:  Table [core].[Function_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Function_User_Role](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Is_Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [core].[View_Function_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE     VIEW [core].[View_Function_User_Role]
AS
Select B1.Username,
NullIf(Concat(STUFF((Select Concat(';', A1.Role, '') FROM core.Function_User_Role A1 
		WHERE A1.Username = B1.Username And IsNull(A1.Role,'') <> '' AND A1.Is_Deleted = 0
		FOR XML PATH(''),TYPE).value('(./text())[1]','NVARCHAR(MAX)'),1,1,''),''),'') As Role
From core.Function_User_Role B1
Where B1.Is_Deleted = 0
Group By B1.Username

GO
/****** Object:  Table [core].[Component_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Component_User_Role](
	[PK_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[Is_Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Component_User_Role_Id] PRIMARY KEY CLUSTERED 
(
	[PK_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [core].[View_Component_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE       VIEW [core].[View_Component_User_Role]
AS
Select 
	B1.Username,
	NullIf(Concat(STUFF((Select Concat(';', A1.[Role], '') FROM core.Component_User_Role A1 
			WHERE A1.Username = B1.Username And IsNull(A1.[Role],'') <> '' AND A1.Is_Deleted = 0
			FOR XML PATH(''),TYPE).value('(./text())[1]','NVARCHAR(MAX)'), 1, 1, ''), ''), '') As [Role]
From core.Component_User_Role B1
Where B1.Is_Deleted = 0
Group By B1.Username
GO
/****** Object:  View [core].[View_User_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE       VIEW [core].[View_User_Role]
AS
SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS PK_Id, * FROM (
	SELECT  
		ISNULL(A.Username, B.Username) as Username,
		A.Super_Role,
		CONCAT(Engine_Roles, IIF(Engine_Roles IS NULL, Entity_Roles, ';' + Entity_Roles)) as Data_Role,
		B.[Role] as Function_Role,
		C.[Role] as Component_Role,
		A.Fk_Data_Role as Fk_Data_Role
	FROM Auth.core.View_Data_User_Role A
		FULL OUTER JOIN core.View_Function_User_Role B ON B.Username = A.Username
		FULL OUTER JOIN core.View_Component_User_Role C ON C.Username = A.Username
	WHERE ISNULL(A.Username, B.Username) IS NOT NULL
) a
GO
/****** Object:  Table [core].[Business_Unit_Role]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Business_Unit_Role](
	[Pk_Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Data_Business_Unit] PRIMARY KEY CLUSTERED 
(
	[Pk_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [core].[Data_Role_Business_Unit]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[Data_Role_Business_Unit](
	[Pk_Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [core].[User_Archived]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [core].[User_Archived](
	[PK_Id] [int] NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Display_Name] [nvarchar](200) NULL,
	[Password] [nvarchar](100) NULL,
	[Super_Role] [varchar](50) NULL,
	[Type] [nvarchar](10) NULL,
	[Status] [char](1) NULL,
	[Is_Deleted] [bit] NULL,
	[Created_Date] [datetime2](7) NULL,
	[Create_User] [nvarchar](100) NULL,
	[Modified_Date] [datetime2](7) NULL,
	[Modified_By] [nvarchar](100) NULL,
	[Email] [nvarchar](200) NULL,
	[Phone] [nvarchar](50) NULL,
	[Last_Login] [datetime2](7) NULL
) ON [PRIMARY]
GO
ALTER TABLE [core].[Component_User_Role] ADD  CONSTRAINT [DF_Component_User_Role_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
ALTER TABLE [core].[Function_User_Role] ADD  DEFAULT ((0)) FOR [Is_Deleted]
GO
/****** Object:  StoredProcedure [core].[Get_Users]    Script Date: 2/4/2021 6:20:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [core].[Get_Users]
	-- Add the parameters for the stored procedure here
	@IsDeleted BIT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM core.[User]
END
GO
USE [master]
GO
ALTER DATABASE [Auth] SET  READ_WRITE 
GO






USE [Auth]
GO

-- 1. Conf Engine or Entity
INSERT INTO [core].[Data_Role] ([Name] ,[Description]) VALUES ('ENGINE_CAR_RPT' ,'CAR_RPT Desc')
INSERT INTO [core].[Data_Role] ([Name] ,[Description]) VALUES ('ENTITY_RPT' ,'RPT Desc')
INSERT INTO [core].[Data_Permission] ([Code]) VALUES ('EN_CAR_RPT')
INSERT INTO [core].[Data_Permission] ([Code]) VALUES ('ET_RPT')
GO

-- 2. Select Pk_Id Role & Permission
DECLARE @Fk_Role_ID INT
SELECT @Fk_Role_ID = PK_Id FROM [core].[Data_Role] WHERE [Name] = 'ENGINE_CAR_RPT'
DECLARE @Fk_Permission_ID INT
SELECT @Fk_Permission_ID = PK_Id FROM [core].[Data_Permission] WHERE [Code] = 'EN_CAR_RPT'

-- 3. Insert into mapping ro Data_Role_Permission, Data_Permission_Engine, Data_Permission_Entity
INSERT INTO [core].[Data_Role_Permission] ([Fk_Role_ID] ,[Fk_Permission_ID]) VALUES (@Fk_Role_ID ,@Fk_Permission_ID)
INSERT INTO [core].[Data_Permission_Engine] ([Fk_Permission_ID] ,[Engine_Code]) VALUES ( @Fk_Permission_ID, 'CAR_RPT')
GO

select * from [core].[Data_User_Role]
select * from [core].[View_Data_User_Role]
select * from [core].[View_Data_User_Role_Full]
select * from [core].[View_Function_User_Role]
select * from [core].[View_User_Role]

-- config
select * from [core].[Data_Permission]
select * from [core].[Data_Permission_Engine]
select * from [core].[Data_Permission_Entity]
select * from [core].[Data_Role]
select * from [core].[Data_Role_Permission]

select * from [core].[Function_User_Role]

-- BUSINESS_UNIT_CODE
