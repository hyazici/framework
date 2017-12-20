/****** Object:  UserDefinedFunction [dbo].[fn_ConvertToString]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_ConvertToString]
(
   @Code int,
   @digit int
)   
RETURNS NVARCHAR(200)    
AS    
BEGIN   
  RETURN RIGHT('0000000000'+CAST(@Code AS VARCHAR(10)),@digit)
END


GO
/****** Object:  UserDefinedFunction [dbo].[fn_ReadContext]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_ReadContext] ()
RETURNS INT
AS
BEGIN
	RETURN (
			SELECT CONVERT(INT, context_info)
			FROM sys.dm_exec_sessions
			WHERE session_id = @@SPID
			)
END

GO
/****** Object:  Table [dbo].[CR_ROLE_ACTION]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CR_ROLE_ACTION](
	[IdCrRoleAction] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[IdAction] [int] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CR_ROLE_ACITON] PRIMARY KEY CLUSTERED 
(
	[IdCrRoleAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CR_ROLE_MENU]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CR_ROLE_MENU](
	[IdCrRoleMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[IdMenu] [int] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CR_ROLE_MENU] PRIMARY KEY CLUSTERED 
(
	[IdCrRoleMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CR_ROLE_USER]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CR_ROLE_USER](
	[IdCrRoleUser] [int] IDENTITY(1,1) NOT NULL,
	[IdRole] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CR_ROLE_USER] PRIMARY KEY CLUSTERED 
(
	[IdCrRoleUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CR_USER_ACTION]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CR_USER_ACTION](
	[IdCrUserAction] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdAction] [int] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CR_USER_ACITON] PRIMARY KEY CLUSTERED 
(
	[IdCrUserAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CR_USER_MENU]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CR_USER_MENU](
	[IdCrUserMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdMenu] [int] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_CR_USER_MENU] PRIMARY KEY CLUSTERED 
(
	[IdCrUserMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GN_COLUMN]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GN_COLUMN](
	[IdColumn] [int] IDENTITY(1,1) NOT NULL,
	[ColumnName] [nvarchar](50) NOT NULL,
	[ColumnNewName] [nvarchar](50) NULL,
	[Placeholder] [nvarchar](50) NULL,
	[MinValue] [int] NOT NULL,
	[MaxValue] [int] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_GN_COLUMN] PRIMARY KEY CLUSTERED 
(
	[IdColumn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GN_TABLE]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GN_TABLE](
	[IdTable] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[TableShortName] [nvarchar](50) NULL,
	[TableTRName] [nvarchar](50) NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_GN_TABLE] PRIMARY KEY CLUSTERED 
(
	[IdTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RP_REPORT]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RP_REPORT](
	[IdReport] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](150) NULL,
	[SourceName] [nvarchar](50) NULL,
	[IsPublic] [bit] NOT NULL,
	[ColumnLists] [nvarchar](max) NULL,
	[GroupByList] [nvarchar](max) NULL,
	[OrderByList] [nvarchar](max) NULL,
	[SQLString] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_RP_REPORT] PRIMARY KEY CLUSTERED 
(
	[IdReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC_ACTION]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_ACTION](
	[IdAction] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [nvarchar](50) NOT NULL,
	[FullPath] [nvarchar](50) NOT NULL,
	[ActionDesc] [nvarchar](500) NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SC_ACTION] PRIMARY KEY CLUSTERED 
(
	[IdAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC_LOG]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_LOG](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[ShortMessage] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[RequestUrl] [nvarchar](500) NULL,
	[ControllerName] [nvarchar](200) NULL,
	[ActionName] [nvarchar](50) NULL,
	[IdLogType] [int] NULL,
	[IsVisible] [bit] NULL,
	[IdCompany] [int] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SC_LOG] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC_LOG_TYPE]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_LOG_TYPE](
	[IdLogType] [int] IDENTITY(1,1) NOT NULL,
	[LogType] [nvarchar](50) NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SC_LOG_TYPE] PRIMARY KEY CLUSTERED 
(
	[IdLogType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC_MENU]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_MENU](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[Area] [nvarchar](50) NULL,
	[Controller] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Parametre] [nvarchar](50) NULL,
	[imageClass] [nvarchar](50) NULL,
	[ParentId] [int] NOT NULL,
	[isParent] [bit] NOT NULL,
	[hasChild] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SC_MENU] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC_ROLE]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_ROLE](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[MainPage] [nvarchar](50) NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_SC_ROLE] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC_USER]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_USER](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RealName] [nvarchar](50) NOT NULL,
	[FailedLoginCount] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreUser] [int] NULL,
	[CreDate] [datetime] NOT NULL,
	[ModUser] [int] NULL,
	[ModDate] [datetime] NULL,
	[Client] [nvarchar](50) NULL,
	[ClientIp] [nvarchar](50) NULL,
	[Deleted] [bit] NOT NULL,
	[Fotograf] [nvarchar](500) NULL,
	[Adi] [nvarchar](50) NULL,
	[Soyadi] [nvarchar](50) NULL,
	[CepTelefonu] [nvarchar](50) NULL,
	[Aciklama] [nvarchar](50) NULL,
 CONSTRAINT [PK_SC_USER] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Action]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Soner ACAR
-- Create date: 4 Aralık 2015
-- Description:	IdCompany ve IdUser parametrelerine göre yetkili olduğu Action lar listeleniyor.
-- =============================================
CREATE FUNCTION [dbo].[fn_Action] (
    @IdUser INT
	)
RETURNS TABLE
AS
RETURN (
		SELECT *
		FROM SC_ACTION
		WHERE IdAction IN (
				SELECT IdAction
				FROM CR_ROLE_ACTION
				WHERE Deleted = 0
					AND IdRole IN (
						SELECT IdRole
						FROM CR_ROLE_USER
						WHERE Deleted = 0
							AND IdUser = @IdUser
						)
				)
			OR IdAction IN (
				SELECT IdAction
				FROM CR_USER_ACTION
				WHERE Deleted = 0
					AND IdUser = @IdUser
				)
		)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Menu]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Soner ACAR
-- Create date: 4 Aralık 2015
-- Description:	IdUser parametrelerine göre yetkili olduğu menuler listeleniyor.
-- =============================================
CREATE FUNCTION [dbo].[fn_Menu] (
	@IdUser INT
	)
RETURNS TABLE
AS
RETURN (
		SELECT *
		FROM SC_MENU
		WHERE Deleted = 0
			AND isActive = 1
			AND IdMenu IN (
				SELECT IdMenu
				FROM CR_ROLE_MENU
				WHERE Deleted = 0
					AND IdRole IN (
						SELECT IdRole
						FROM CR_ROLE_USER
						WHERE Deleted = 0
							AND IdUser = @IdUser
						)
					OR IdMenu IN (
						SELECT IdMenu
						FROM CR_USER_MENU
						WHERE Deleted = 0
							AND IdUser = @IdUser
						)
				)
		)
GO
/****** Object:  View [dbo].[VW_FIELD]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_FIELD]
AS
SELECT o.NAME AS TableName
	,CASE WHEN c.column_id = 1 THEN 1111 ELSE c.column_id END AS TabIndex
	,c.NAME AS ColumnName
	,CO.ColumnNewName AS ColumnLabel
	,t.NAME AS ColumnType
	,CO.Placeholder
	,CO.MinValue
	,CO.MaxValue
	,CASE 
		WHEN t.NAME IN (
				'decimal'
				,'int'
				)
			AND c.is_identity = 1
			THEN 'number'
		WHEN t.NAME IN (
				'decimal'
				,'int'
				)
			AND c.is_identity = 0
			AND SUBSTRING(c.NAME, 1, 2) = 'Id'
			THEN 'select'
		WHEN t.NAME IN (
				'decimal'
				,'int'
				)
			AND c.is_identity = 0
			AND SUBSTRING(c.NAME, 1, 2) != 'Id'
			THEN 'number'
		WHEN t.NAME IN (
				'varchar'
				,'nvarchar'
				,'ntext'
				,'text'
				)
			THEN 'text'
		WHEN t.NAME IN (
				'datetime'
				,'date'
				)
			THEN 'date'
		WHEN t.NAME IN ('bit')
			THEN 'checkbox'
		ELSE ''
		END AS FieldType
	,c.max_length AS MaxLenght
	,c.is_nullable AS IsNullable
	,c.is_identity AS IsIdentity
	,c.is_computed AS IsComputed
FROM sys.columns AS c WITH (NOLOCK)
LEFT OUTER JOIN sys.objects AS o WITH (NOLOCK) ON c.object_id = o.object_id
LEFT OUTER JOIN sys.types AS t WITH (NOLOCK) ON c.system_type_id = t.system_type_id
	AND c.user_type_id = t.user_type_id
LEFT OUTER JOIN dbo.GN_COLUMN AS CO ON CO.ColumnName = c.NAME
WHERE (o.type = 'U')
	AND (
		c.NAME NOT IN (
			'CreUser'
			,'CreDate'
			,'ModUser'
			,'ModDate'
			,'Client'
			,'ClientIp'
			,'Deleted'
			)
		)

GO
/****** Object:  View [dbo].[VW_LOG]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_LOG]
AS
SELECT L.IdLog
	,L.ShortMessage
	,L.Message
	,L.RequestUrl
	,L.ControllerName
	,L.ActionName
	,L.IdLogType
	,LT.LogType
	,L.IsVisible
	,L.CreUser
	,L.CreDate
	,L.ModUser
	,L.ModDate
	,L.Client
	,L.ClientIp
	,L.Deleted
FROM dbo.SC_LOG AS L
LEFT OUTER JOIN dbo.SC_LOG_TYPE AS LT ON L.IdLogType = LT.IdLogType

GO
/****** Object:  View [dbo].[VW_ROLE_USER]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ROLE_USER]
AS
SELECT        R.IdRole, R.RoleName, ISNULL(RU.IdUser, 0) AS IdUser, CASE WHEN RU.IdUser > 0 THEN 1 ELSE 0 END AS Active, R.CreUser, R.CreDate, R.ModUser, R.ModDate, R.Client, R.ClientIp, R.Deleted
FROM            dbo.SC_ROLE AS R LEFT OUTER JOIN
                         dbo.CR_ROLE_USER AS RU ON RU.IdRole = R.IdRole


GO
/****** Object:  View [dbo].[VW_RP_Kullanıcı]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_RP_Kullanıcı]
AS
SELECT *
FROM SC_USER 

GO
SET IDENTITY_INSERT [dbo].[CR_ROLE_ACTION] ON 
GO
INSERT [dbo].[CR_ROLE_ACTION] ([IdCrRoleAction], [IdRole], [IdAction], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, 3, 1, 0, CAST(N'2016-08-14T14:36:08.267' AS DateTime), 0, CAST(N'2016-08-14T14:36:09.463' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[CR_ROLE_ACTION] OFF
GO
SET IDENTITY_INSERT [dbo].[CR_ROLE_MENU] ON 
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, 1, 1, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (2, 1, 2, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, 1, 3, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, 1, 4, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (5, 1, 5, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (6, 1, 6, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (7, 1, 7, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (8, 1, 8, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (9, 1, 9, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (10, 1, 10, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (11, 1, 11, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (12, 1, 12, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (13, 1, 13, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (14, 1, 14, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (15, 1, 15, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (16, 1, 16, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (17, 1, 17, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (18, 1, 18, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (19, 1, 19, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (20, 1, 20, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (21, 2, 1, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (22, 2, 2, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (23, 2, 3, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (24, 2, 4, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (25, 2, 5, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (26, 2, 6, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (27, 2, 7, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (28, 2, 8, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (29, 2, 9, 0, CAST(N'2016-01-06T22:36:04.870' AS DateTime), 0, CAST(N'2016-02-15T12:56:45.167' AS DateTime), NULL, NULL, 1)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (30, 2, 10, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (31, 2, 11, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (32, 2, 12, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (33, 2, 13, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (34, 2, 14, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (35, 2, 15, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (36, 2, 16, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (37, 2, 17, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (38, 2, 18, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (39, 2, 19, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (40, 2, 20, NULL, CAST(N'2016-01-06T22:36:04.870' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (111, 2, 9, 0, CAST(N'2016-08-13T14:36:55.140' AS DateTime), 0, CAST(N'2016-08-13T14:36:50.287' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (112, 3, 1, 0, CAST(N'2016-08-13T14:37:06.413' AS DateTime), 0, CAST(N'2016-08-13T14:37:01.580' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (113, 3, 14, 0, CAST(N'2016-08-13T14:37:19.493' AS DateTime), 0, CAST(N'2016-08-13T14:37:14.660' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (114, 3, 15, 0, CAST(N'2016-08-13T14:37:20.113' AS DateTime), 0, CAST(N'2016-08-13T14:37:15.230' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (115, 3, 16, 0, CAST(N'2016-08-13T14:37:21.850' AS DateTime), 0, CAST(N'2016-08-13T14:37:17.010' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (116, 3, 17, 0, CAST(N'2016-08-13T14:37:22.433' AS DateTime), 0, CAST(N'2016-08-13T14:37:17.600' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (117, 3, 2, 0, CAST(N'2016-08-14T14:36:40.603' AS DateTime), 0, CAST(N'2016-08-14T14:36:41.827' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (118, 1, 21, 0, CAST(N'2016-08-23T14:26:19.430' AS DateTime), 0, CAST(N'2016-08-23T14:26:09.690' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (119, 2, 21, 0, CAST(N'2016-08-23T14:26:48.367' AS DateTime), 0, CAST(N'2016-08-23T14:26:38.633' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (120, 2, 21, 0, CAST(N'2016-08-23T14:27:05.793' AS DateTime), 0, CAST(N'2016-08-23T14:26:56.060' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (121, 1, 22, 0, CAST(N'2016-08-23T14:33:59.817' AS DateTime), 0, CAST(N'2016-08-23T14:33:50.053' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (122, 1, 23, 1, CAST(N'2016-09-01T19:58:28.877' AS DateTime), 1, CAST(N'2016-09-01T19:58:02.633' AS DateTime), N'SON-PC', N'::1', 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (123, 1, 24, 1, CAST(N'2016-11-14T00:23:25.277' AS DateTime), 1, CAST(N'2016-11-14T00:22:57.050' AS DateTime), N'SON-PC', N'::1', 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (124, 1, 25, 1, CAST(N'2016-11-16T15:04:16.687' AS DateTime), 1, CAST(N'2016-11-16T15:03:43.707' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (125, 1, 26, 1, CAST(N'2016-11-16T15:04:17.653' AS DateTime), 1, CAST(N'2016-11-16T15:03:44.673' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (126, 1, 27, 1, CAST(N'2017-04-05T17:54:06.160' AS DateTime), 1, CAST(N'2017-04-05T17:53:37.297' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[CR_ROLE_MENU] ([IdCrRoleMenu], [IdRole], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (127, 3, 4, 1, CAST(N'2017-04-15T00:55:36.963' AS DateTime), 1, CAST(N'2017-04-15T00:55:36.947' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
SET IDENTITY_INSERT [dbo].[CR_ROLE_MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[CR_ROLE_USER] ON 
GO
INSERT [dbo].[CR_ROLE_USER] ([IdCrRoleUser], [IdRole], [IdUser], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, 1, 1, 1, CAST(N'2016-01-06T22:36:04.743' AS DateTime), 1, CAST(N'2017-04-14T23:28:32.903' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[CR_ROLE_USER] ([IdCrRoleUser], [IdRole], [IdUser], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (8, 3, 1, 1, CAST(N'2017-04-01T14:31:00.323' AS DateTime), 1, CAST(N'2017-04-01T14:30:39.467' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[CR_ROLE_USER] ([IdCrRoleUser], [IdRole], [IdUser], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (9, 2, 1, 1, CAST(N'2017-04-13T20:41:54.587' AS DateTime), 1, CAST(N'2017-04-13T20:41:54.560' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
SET IDENTITY_INSERT [dbo].[CR_ROLE_USER] OFF
GO
SET IDENTITY_INSERT [dbo].[CR_USER_ACTION] ON 
GO
INSERT [dbo].[CR_USER_ACTION] ([IdCrUserAction], [IdUser], [IdAction], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, 1, 1, 0, CAST(N'2016-08-14T13:56:44.247' AS DateTime), 1, CAST(N'2016-08-14T13:56:45.410' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[CR_USER_ACTION] ([IdCrUserAction], [IdUser], [IdAction], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (2, 1, 2, 0, CAST(N'2016-08-14T16:07:13.497' AS DateTime), 0, CAST(N'2016-08-14T16:07:13.340' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[CR_USER_ACTION] ([IdCrUserAction], [IdUser], [IdAction], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, 1, 3, 1, CAST(N'2017-04-01T14:44:16.773' AS DateTime), 1, CAST(N'2017-04-01T14:43:55.880' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
SET IDENTITY_INSERT [dbo].[CR_USER_ACTION] OFF
GO
SET IDENTITY_INSERT [dbo].[CR_USER_MENU] ON 
GO
INSERT [dbo].[CR_USER_MENU] ([IdCrUserMenu], [IdUser], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, 1, 19, 0, CAST(N'2016-08-19T17:24:51.030' AS DateTime), 1, CAST(N'2016-08-19T17:24:50.813' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[CR_USER_MENU] ([IdCrUserMenu], [IdUser], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (2, 1, 2, 1, CAST(N'2016-10-31T10:30:32.510' AS DateTime), 1, CAST(N'2016-10-31T10:29:21.443' AS DateTime), N'Vbt2-PC', N'127.0.0.1', 0)
GO
INSERT [dbo].[CR_USER_MENU] ([IdCrUserMenu], [IdUser], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, 1, 24, 1, CAST(N'2016-10-31T11:34:39.390' AS DateTime), 1, CAST(N'2016-10-31T11:33:28.203' AS DateTime), N'Vbt2-PC', N'127.0.0.1', 0)
GO
INSERT [dbo].[CR_USER_MENU] ([IdCrUserMenu], [IdUser], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, 1, 3, 1, CAST(N'2016-11-14T14:52:16.780' AS DateTime), 1, CAST(N'2016-11-14T14:51:46.743' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[CR_USER_MENU] ([IdCrUserMenu], [IdUser], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (5, 1, 26, 1, CAST(N'2016-11-16T15:02:59.760' AS DateTime), 1, CAST(N'2016-11-16T15:02:26.777' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[CR_USER_MENU] ([IdCrUserMenu], [IdUser], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (6, 1, 25, 1, CAST(N'2016-11-16T15:03:02.070' AS DateTime), 1, CAST(N'2016-11-16T15:02:29.083' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[CR_USER_MENU] ([IdCrUserMenu], [IdUser], [IdMenu], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (7, 1, 1, 1, CAST(N'2017-04-14T23:28:47.467' AS DateTime), 1, CAST(N'2017-04-14T23:28:47.430' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
SET IDENTITY_INSERT [dbo].[CR_USER_MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[GN_COLUMN] ON 
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, N'Action', N'Action Orj Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (2, N'ActionDesc', N'Action Açıklaması', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, N'ActionName', N'Action Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, N'Active', N'Aktif Mi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (5, N'Adresses', N'Adresses', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (6, N'Client', N'Client Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (7, N'ClientIp', N'Client Ipsi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (8, N'ColumnLists', N'ColumnLists', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (9, N'ColumnName', N'Sütun Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (10, N'ColumnNewName', N'Sütun Yeni Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (11, N'CompanyName', N'Firma Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (12, N'ContactName', N'İletişim Ad Bilgisi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (13, N'ContactPhone', N'İletişim Numarası', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (14, N'Controller', N'Controller', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (15, N'ControllerName', N'Controller Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (16, N'CreDate', N'Oluşturulma Tarihi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (17, N'CreUser', N'Oluşturan Kullanıcı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (18, N'Deleted', N'Silindi Mi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (19, N'Email', N'Eposta', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (20, N'FullPath', N'Tam Adresi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (21, N'GroupByList', N'GrupListesi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (22, N'hasChild', N'Alt Menü Mü', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (23, N'IdAction', N'IdAction', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (24, N'IdColumn', N'IdColumn', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (25, N'IdCompany', N'IdCompany', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (26, N'IdCrRoleAction', N'IdCrRoleAction', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (27, N'IdCrRoleCompany', N'IdCrRoleCompany', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (28, N'IdCrRoleMenu', N'IdCrRoleMenu', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (29, N'IdCrRoleUser', N'IdCrRoleUser', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (30, N'IdCrUserAction', N'IdCrUserAction', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (31, N'IdCrUserCompany', N'IdCrUserCompany', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (32, N'IdCrUserMenu', N'IdCrUserMenu', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (33, N'IdLog', N'IdLog', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (34, N'IdLogType', N'IdLogType', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (35, N'IdMenu', N'IdMenu', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (36, N'IdReport', N'IdReport', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (37, N'IdRole', N'IdRole', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (38, N'IdUser', N'IdUser', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (39, N'IsActive', N'Aktif Mi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (40, N'IsPublic', N'Yayında Mı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (41, N'IsVisible', N'Görünür Mü', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (42, N'imageClass', N'imageClass', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (43, N'isActive', N'Aktif Mi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (44, N'isParent', N'Ana Menu mü', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (45, N'LicenseEndDate', N'Lisans Son Tarihi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (46, N'LicenseStartDate', N'Lisans Başlangıç Tarihi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (47, N'LogType', N'Log Tip Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (48, N'MainPage', N'Anasayfa', N'Home vb...', 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (49, N'MenuName', N'Menu Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (50, N'Message', N'Mesaj', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (51, N'ModDate', N'Düzenleme Tarihi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (52, N'ModUser', N'Düzenleyen Kullanıcı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (53, N'OrderByList', N'Sıralama Listesi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (54, N'OrderNumber', N'Sıra Numarası', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (55, N'ParentId', N'Ana Id', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (56, N'Password', N'Şifre', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (57, N'RealName', N'Gerçek Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (58, N'ReportName', N'Rapor Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (59, N'RequestUrl', N'Sorgu Adresi', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (60, N'RoleName', N'Rol Adı', N'Test Rolü', 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (61, N'ShortMessage', N'Kısa Mesaj', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (62, N'SourceName', N'Kaynak Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (63, N'SQLString', N'SQLString', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (64, N'UserName', N'Kullanıcı Adı', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (65, N'VKN', N'VKN', NULL, 0, 0, 1, CAST(N'2016-11-11T10:37:24.420' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_COLUMN] ([IdColumn], [ColumnName], [ColumnNewName], [Placeholder], [MinValue], [MaxValue], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (66, N'FailedLoginCount', N'Hatalı Giriş Sayısı', NULL, 0, 0, 1, CAST(N'2017-04-01T13:47:33.077' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[GN_COLUMN] OFF
GO
SET IDENTITY_INSERT [dbo].[GN_TABLE] ON 
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, N'CR_ROLE_ACTION', N'CrRoleAction', N'CrRoleAction', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, N'CR_ROLE_MENU', N'CrRoleMenu', N'CrRoleMenu', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, N'CR_ROLE_USER', N'CrRoleUser', N'CrRoleUser', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (5, N'CR_USER_ACTION', N'CrUserAction', N'CrUserAction', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (7, N'CR_USER_MENU', N'CrUserMenu', N'CrUserMenu', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (8, N'GN_COLUMN', N'Column', N'Sütun', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (9, N'GN_TABLE', N'Table', N'Tablo', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (10, N'RP_REPORT', N'Report', N'Rapor', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (11, N'SC_ACTION', N'Action', N'Action', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (12, N'SC_LOG', N'Log', N'Log', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (13, N'SC_LOG_TYPE', N'LogType', N'Log Tipi', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (14, N'SC_MENU', N'Menu', N'Menü', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (15, N'SC_ROLE', N'Role', N'Rol', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[GN_TABLE] ([IdTable], [TableName], [TableShortName], [TableTRName], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (16, N'SC_USER', N'User', N'Kullanıcı', 1, CAST(N'2016-11-16T13:58:01.250' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[GN_TABLE] OFF
GO
SET IDENTITY_INSERT [dbo].[RP_REPORT] ON 
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, N'Kullanıcı Raporu', N'VW_RP_Kullanıcı', 1, N'Email, UserName, RealName', NULL, N'RealName DESC, UserName ASC', N'SELECT Email, UserName, RealName FROM VW_RP_Kullanıcı ORDER BY RealName DESC, UserName ASC', 1, 1, CAST(N'2016-08-24T14:26:15.950' AS DateTime), 1, CAST(N'2017-04-01T13:53:31.837' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (2, N'Kullanıcı Raporu 2', N'VW_RP_Kullanıcı', 0, N'IdUser, UserName, RealName, Email, Active, Deleted', NULL, N'IdUser ASD', N'SELECT IdUser, UserName, RealName, Email, Active, Deleted FROM VW_RP_Kullanıcı', 1, 1, CAST(N'2016-08-26T00:56:18.050' AS DateTime), 1, CAST(N'2017-04-03T12:25:29.523' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, N'Test Soner', N'VW_RP_Kullanıcı', 1, N'IdUser, UserName, RealName, Email, Active', NULL, N'UserName ASD, Email DESC', N'SELECT IdUser, UserName, RealName, Email, Active FROM VW_RP_Kullanıcı ORDER BY UserName ASC, Email DESC', 1, 1, CAST(N'2016-11-10T00:17:19.063' AS DateTime), 1, CAST(N'2016-11-10T23:14:18.393' AS DateTime), N'SON-PC', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (5, N'soni test', N'VW_RP_Kullanıcı', 1, N'Email, UserName', NULL, N'RealName ASC, UserName ASC', N'SELECT Email, UserName VW_RP_Kullanıcı ORDER BY RealName ASC, UserName ASC', 0, 1, CAST(N'2016-11-10T09:19:36.693' AS DateTime), 1, CAST(N'2016-11-10T22:40:43.047' AS DateTime), N'SON-PC', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (6, N'Test User 2', N'VW_RP_Kullanıcı', 1, N'IdUser, RealName, Email, UserName, Active, CompanyName, CreUser', NULL, N'UserName DESC, RealName ASC', N'SELECT IdUser, RealName, Email, UserName, Active, CompanyName, CreUser FROM VW_RP_Kullanıcı ORDER BY UserName DESC, RealName ASC', 1, 1, CAST(N'2016-11-10T09:53:57.453' AS DateTime), 1, CAST(N'2017-04-03T12:25:37.537' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (7, N'soni test 2', N'VW_RP_Kullanıcı', 1, N'UserName, RealName', NULL, N'UserName ASC, RealName ASC', N'SELECT UserName, RealName VW_RP_Kullanıcı ORDER BY UserName ASC, RealName ASC', 0, 1, CAST(N'2016-11-10T10:32:19.397' AS DateTime), 1, CAST(N'2016-11-10T23:15:48.063' AS DateTime), N'SON-PC', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (8, N'test', N'VW_RP_Kullanıcı', 1, NULL, NULL, N'UserName ASC', N'SELECT  *  FROM VW_RP_Kullanıcı ORDER BY UserName ASC', 0, 1, CAST(N'2016-11-10T10:36:12.363' AS DateTime), 1, CAST(N'2016-11-10T10:36:12.180' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (9, N'test 2 aktif', N'VW_RP_Kullanıcı', 1, NULL, NULL, NULL, N'SELECT  *  FROM VW_RP_Kullanıcı', 0, 1, CAST(N'2016-11-10T10:48:35.730' AS DateTime), 1, CAST(N'2016-11-10T10:48:28.533' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (10, N'soni test ssss', N'VW_RP_Kullanıcı', 1, NULL, NULL, NULL, N'SELECT  *  FROM VW_RP_Kullanıcı', 1, 1, CAST(N'2016-11-10T10:50:05.760' AS DateTime), 1, CAST(N'2017-04-01T13:53:19.167' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (11, N'hjhjhj', N'VW_RP_Kullanıcı', 1, N'UserName, RealName, Email', NULL, N'UserName ASC', N'SELECT UserName, RealName, Email FROM VW_RP_Kullanıcı ORDER BY UserName ASC', 1, 1, CAST(N'2016-11-10T22:12:35.720' AS DateTime), 1, CAST(N'2016-11-10T22:36:15.687' AS DateTime), N'SON-PC', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (12, N'Soner Test 01', N'VW_RP_Kullanıcı', 1, N'UserName, RealName, Email, Active', NULL, N'UserName ASC', N'SELECT UserName, RealName, Email, Active FROM VW_RP_Kullanıcı ORDER BY UserName ASC', 1, 1, CAST(N'2016-11-12T17:02:13.883' AS DateTime), 1, CAST(N'2016-11-12T17:01:49.570' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (13, N'Kullanıcı Raporu 3', N'VW_RP_Kullanıcı', 1, N'CompanyName, Email, RealName, UserName, Active', NULL, N'RealName ASC, UserName DESC', N'SELECT CompanyName, Email, RealName, UserName, Active FROM VW_RP_Kullanıcı ORDER BY RealName ASC, UserName DESC', 1, 1, CAST(N'2016-11-12T17:45:19.220' AS DateTime), 1, CAST(N'2017-04-03T12:25:47.177' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (14, N'test 333', N'VW_RP_Kullanıcı', 1, N'UserName, RealName, Email, Active', NULL, N'UserName DESC', N'SELECT UserName, RealName, Email, Active FROM VW_RP_Kullanıcı ORDER BY UserName DESC', 1, 1, CAST(N'2016-11-14T14:55:36.613' AS DateTime), 1, CAST(N'2016-11-14T14:55:06.453' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[RP_REPORT] ([IdReport], [ReportName], [SourceName], [IsPublic], [ColumnLists], [GroupByList], [OrderByList], [SQLString], [IsActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (15, N'Test 112312312312', N'VW_RP_Kullanıcı', 1, N'UserName, Password, RealName', NULL, N'IdUser ASC', N'SELECT UserName, Password, RealName FROM VW_RP_Kullanıcı ORDER BY IdUser ASC', 1, 1, CAST(N'2017-04-01T13:45:14.923' AS DateTime), 1, CAST(N'2017-04-03T12:25:59.517' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
SET IDENTITY_INSERT [dbo].[RP_REPORT] OFF
GO
SET IDENTITY_INSERT [dbo].[SC_ACTION] ON 
GO
INSERT [dbo].[SC_ACTION] ([IdAction], [ActionName], [FullPath], [ActionDesc], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, N'Kullanıcı Kaydetme', N'/User/Save/', N'Kullanıcı Kaydetme İşlemi', 0, CAST(N'2016-02-14T15:13:13.413' AS DateTime), 0, CAST(N'2016-08-13T15:53:33.820' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[SC_ACTION] ([IdAction], [ActionName], [FullPath], [ActionDesc], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (2, N'Kullanıcı Silme', N'/User/Delete/', N'Kullanıcı Silme İşlemi', 0, CAST(N'2016-02-14T15:13:19.943' AS DateTime), 0, CAST(N'2016-08-13T14:38:19.223' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[SC_ACTION] ([IdAction], [ActionName], [FullPath], [ActionDesc], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, N'Rol Kaydetme', N'/Role/Save', N'Rol Kaydetme İşlemi', 0, CAST(N'2016-08-14T16:23:15.470' AS DateTime), 1, CAST(N'2016-11-18T14:28:56.110' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[SC_ACTION] ([IdAction], [ActionName], [FullPath], [ActionDesc], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, N'Rol Silme', N'/Role/Delete', N'Rol Silme İşlemi', 0, CAST(N'2016-08-14T16:23:28.430' AS DateTime), 0, CAST(N'2016-08-14T16:23:28.213' AS DateTime), NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[SC_ACTION] OFF
GO
SET IDENTITY_INSERT [dbo].[SC_LOG_TYPE] ON 
GO
INSERT [dbo].[SC_LOG_TYPE] ([IdLogType], [LogType], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (0, N'Debug', NULL, CAST(N'2016-01-06T22:36:05.330' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_LOG_TYPE] ([IdLogType], [LogType], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, N'Başarılı', NULL, CAST(N'2016-01-06T22:36:05.330' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_LOG_TYPE] ([IdLogType], [LogType], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (2, N'Bilgi', NULL, CAST(N'2016-01-06T22:36:05.330' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_LOG_TYPE] ([IdLogType], [LogType], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, N'Uyarı', NULL, CAST(N'2016-01-06T22:36:05.330' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_LOG_TYPE] ([IdLogType], [LogType], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, N'Hata', NULL, CAST(N'2016-01-06T22:36:05.330' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_LOG_TYPE] ([IdLogType], [LogType], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (5, N'Kritik', NULL, CAST(N'2016-01-06T22:36:05.330' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[SC_LOG_TYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[SC_MENU] ON 
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, 100, N'Anasayfa', NULL, N'Home', N'Index', NULL, N'icon-home', 0, 1, 0, 1, 0, CAST(N'2016-01-06T22:36:04.617' AS DateTime), 0, CAST(N'2016-08-01T18:01:55.987' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, 500, N'Güvenlik', NULL, N'', N'', NULL, N'icon-lock', 0, 1, 1, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (4, 510, N'Kullanıcı Tanımı', N'System', N'User', N'Index', NULL, N'', 3, 0, 0, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (5, 520, N'Kullanıcı Yetki Yönetimi', N'System', N'UserAuthorisation', N'Index', NULL, N'', 3, 0, 0, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (6, 530, N'Rol Tanımı', NULL, N'Definition', N'Index', N'Role', NULL, 3, 0, 0, 1, 0, CAST(N'2016-01-06T22:36:04.617' AS DateTime), 1, CAST(N'2017-04-15T00:11:29.703' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (7, 540, N'Rol Yetki Yönetimi', N'System', N'RoleAuthorisation', N'Index', NULL, N'', 3, 0, 0, 1, NULL, CAST(N'2016-02-10T21:20:50.627' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (8, 544, N'Sayfa İçi Yetki Tanımı', NULL, N'Definition', N'Index', N'Action', NULL, 3, 0, 0, 1, 0, CAST(N'2016-02-17T19:21:58.270' AS DateTime), 1, CAST(N'2017-04-15T00:12:15.383' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (10, 550, N'Log Kayıtları', N'System', N'Log', N'Index', NULL, N'', 3, 0, 0, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (11, 820, N'Menü Yönetimi', N'System', N'MenuManagement', N'Index', NULL, N'', 18, 0, 0, 1, 0, CAST(N'2016-02-13T22:44:10.087' AS DateTime), 0, CAST(N'2016-02-14T00:32:45.980' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (12, 600, N'Raporlar', NULL, N'', N'', NULL, N'icon-graph', 0, 1, 1, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (13, 610, N'Genel Rapor', NULL, N'Report', N'Index', NULL, N'', 12, 0, 0, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (14, 700, N'Yardım', NULL, N'', N'', NULL, N'icon-puzzle', 0, 1, 1, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (15, 710, N'Hakkımızda', NULL, N'', N'', NULL, N'', 14, 0, 0, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (16, 720, N'Soru&Cevap', NULL, N'', N'', NULL, N'', 14, 0, 0, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (17, 730, N'Dökümanlar', NULL, N'', N'', NULL, N'', 14, 0, 0, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (18, 800, N'Uygulama Ayarları', NULL, N'', N'', NULL, N'icon-settings', 0, 1, 1, 1, NULL, CAST(N'2016-01-06T22:36:04.617' AS DateTime), NULL, NULL, NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (20, 830, N'Web Config Ayarları', N'System', N'WebConfig', N'Index', NULL, N'', 18, 0, 0, 1, 0, CAST(N'2016-01-06T22:36:04.617' AS DateTime), 0, CAST(N'2016-02-14T00:21:50.700' AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (23, 620, N'Yeni Rapor', NULL, N'Report', N'New', NULL, NULL, 12, 0, 0, 1, 1, CAST(N'2016-09-01T19:58:04.420' AS DateTime), 1, CAST(N'2016-10-29T16:52:01.307' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[SC_MENU] ([IdMenu], [OrderNumber], [MenuName], [Area], [Controller], [Action], [Parametre], [imageClass], [ParentId], [isParent], [hasChild], [isActive], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (26, 430, N'Sütun Tanımı', NULL, N'Definition', N'Index', N'Column', NULL, 18, 0, 0, 1, 1, CAST(N'2016-10-31T11:30:30.790' AS DateTime), 1, CAST(N'2017-04-01T11:08:44.237' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
SET IDENTITY_INSERT [dbo].[SC_MENU] OFF
GO
SET IDENTITY_INSERT [dbo].[SC_ROLE] ON 
GO
INSERT [dbo].[SC_ROLE] ([IdRole], [RoleName], [MainPage], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (1, N'SuperAdmin', N'Home', 1, CAST(N'2016-01-06T22:36:05.217' AS DateTime), 1, CAST(N'2017-04-15T00:14:02.403' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[SC_ROLE] ([IdRole], [RoleName], [MainPage], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (2, N'Admin', N'Home', 1, CAST(N'2016-01-06T22:36:05.217' AS DateTime), 1, CAST(N'2016-08-30T14:26:32.893' AS DateTime), N'SON-PC', N'::1', 0)
GO
INSERT [dbo].[SC_ROLE] ([IdRole], [RoleName], [MainPage], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (3, N'User', N'Home', 1, CAST(N'2016-01-06T22:36:05.217' AS DateTime), 1, CAST(N'2016-11-24T17:50:11.623' AS DateTime), N'SONER-VBT', N'::1', 0)
GO
INSERT [dbo].[SC_ROLE] ([IdRole], [RoleName], [MainPage], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (5, N'roladi', N'anasayfa', 1, CAST(N'2016-11-15T15:59:12.727' AS DateTime), 1, CAST(N'2016-11-15T15:58:41.323' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
INSERT [dbo].[SC_ROLE] ([IdRole], [RoleName], [MainPage], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (6, N'RolAdi333', N'anasayfa333', 1, CAST(N'2016-11-15T17:07:47.157' AS DateTime), 1, CAST(N'2016-11-17T00:03:23.107' AS DateTime), N'SON-PC', N'::1', 1)
GO
INSERT [dbo].[SC_ROLE] ([IdRole], [RoleName], [MainPage], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (7, N'test222', N'tete666', 1, CAST(N'2016-11-17T00:13:36.880' AS DateTime), 1, CAST(N'2016-11-17T00:03:23.107' AS DateTime), N'SON-PC', N'::1', 1)
GO
INSERT [dbo].[SC_ROLE] ([IdRole], [RoleName], [MainPage], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted]) VALUES (8, N'test', N'test', 1, CAST(N'2016-11-17T12:58:53.983' AS DateTime), 1, CAST(N'2016-11-17T12:57:56.117' AS DateTime), N'SONER-VBT', N'::1', 1)
GO
SET IDENTITY_INSERT [dbo].[SC_ROLE] OFF
GO
SET IDENTITY_INSERT [dbo].[SC_USER] ON 
GO
INSERT [dbo].[SC_USER] ([IdUser], [UserName], [Password], [RealName], [FailedLoginCount], [Email], [Active], [CreUser], [CreDate], [ModUser], [ModDate], [Client], [ClientIp], [Deleted], [Fotograf], [Adi], [Soyadi], [CepTelefonu], [Aciklama]) VALUES (1, N'admin', N'A9D2lonHt4bpyj/nqRHaLg==', N'Soner Acar', 0, N'soner.acar@vbt.com.tr', 1, 1, CAST(N'2016-07-19T14:01:30.780' AS DateTime), 1, CAST(N'2016-11-23T23:02:44.757' AS DateTime), N'SONER-VBT', N'::1', 0, N'/Content/global/img/user/default.jpg', N'Soner', N'Acar', N'5340543044', NULL)
GO
SET IDENTITY_INSERT [dbo].[SC_USER] OFF
GO
ALTER TABLE [dbo].[CR_ROLE_ACTION] ADD  CONSTRAINT [DF_CR_ROLE_ACTION_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[CR_ROLE_ACTION] ADD  CONSTRAINT [DF_CR_ROLE_ACTION_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CR_ROLE_MENU] ADD  CONSTRAINT [DF_CR_ROLE_MENU_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[CR_ROLE_MENU] ADD  CONSTRAINT [DF_CR_ROLE_MENU_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CR_ROLE_USER] ADD  CONSTRAINT [DF_CR_ROLE_USER_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[CR_ROLE_USER] ADD  CONSTRAINT [DF_CR_ROLE_USER_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CR_USER_ACTION] ADD  CONSTRAINT [DF_CR_USER_ACTION_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[CR_USER_ACTION] ADD  CONSTRAINT [DF_CR_USER_ACTION_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[CR_USER_MENU] ADD  CONSTRAINT [DF_CR_USER_MENU_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[CR_USER_MENU] ADD  CONSTRAINT [DF_CR_USER_MENU_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[GN_COLUMN] ADD  CONSTRAINT [DF_GN_COLUMN_MinLen]  DEFAULT ((0)) FOR [MinValue]
GO
ALTER TABLE [dbo].[GN_COLUMN] ADD  CONSTRAINT [DF_GN_COLUMN_MaxLen]  DEFAULT ((0)) FOR [MaxValue]
GO
ALTER TABLE [dbo].[GN_COLUMN] ADD  CONSTRAINT [DF_GN_COLUMN_CreUser]  DEFAULT ((1)) FOR [CreUser]
GO
ALTER TABLE [dbo].[GN_COLUMN] ADD  CONSTRAINT [DF_GN_COLUMN_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[GN_COLUMN] ADD  CONSTRAINT [DF_GN_COLUMN_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[GN_TABLE] ADD  CONSTRAINT [DF_GN_TABLE_CreUser]  DEFAULT ((1)) FOR [CreUser]
GO
ALTER TABLE [dbo].[GN_TABLE] ADD  CONSTRAINT [DF_GN_TABLE_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[GN_TABLE] ADD  CONSTRAINT [DF_GN_TABLE_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[RP_REPORT] ADD  CONSTRAINT [DF_RP_REPORT_IsPublic]  DEFAULT ((1)) FOR [IsPublic]
GO
ALTER TABLE [dbo].[RP_REPORT] ADD  CONSTRAINT [DF_RP_REPORT_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RP_REPORT] ADD  CONSTRAINT [DF_RP_REPORT_CreUser]  DEFAULT ((1)) FOR [CreUser]
GO
ALTER TABLE [dbo].[RP_REPORT] ADD  CONSTRAINT [DF_RP_REPORT_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[RP_REPORT] ADD  CONSTRAINT [DF_RP_REPORT_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SC_ACTION] ADD  CONSTRAINT [DF_SC_ACTION_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[SC_ACTION] ADD  CONSTRAINT [DF_SC_ACTION_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SC_LOG] ADD  CONSTRAINT [DF_SC_LOG_IdCompany]  DEFAULT ((1)) FOR [IdCompany]
GO
ALTER TABLE [dbo].[SC_LOG] ADD  CONSTRAINT [DF_SC_LOG_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[SC_LOG] ADD  CONSTRAINT [DF_SC_LOG_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SC_LOG_TYPE] ADD  CONSTRAINT [DF_SC_LOG_TYPE_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[SC_LOG_TYPE] ADD  CONSTRAINT [DF_SC_LOG_TYPE_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SC_MENU] ADD  CONSTRAINT [DF_SC_MENU_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[SC_MENU] ADD  CONSTRAINT [DF_SC_MENU_Controller]  DEFAULT ('') FOR [Controller]
GO
ALTER TABLE [dbo].[SC_MENU] ADD  CONSTRAINT [DF_SC_MENU_Action]  DEFAULT ('') FOR [Action]
GO
ALTER TABLE [dbo].[SC_MENU] ADD  CONSTRAINT [DF_SC_MENU_ParentId]  DEFAULT ((0)) FOR [ParentId]
GO
ALTER TABLE [dbo].[SC_MENU] ADD  CONSTRAINT [DF_SC_MENU_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[SC_MENU] ADD  CONSTRAINT [DF_GV_MENU_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SC_ROLE] ADD  CONSTRAINT [DF_SC_ROLE_CreUser]  DEFAULT ((1)) FOR [CreUser]
GO
ALTER TABLE [dbo].[SC_ROLE] ADD  CONSTRAINT [DF_SC_ROLE_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[SC_ROLE] ADD  CONSTRAINT [DF_SC_ROLE_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[SC_USER] ADD  CONSTRAINT [DF_SC_USER_FailedLoginCount]  DEFAULT ((0)) FOR [FailedLoginCount]
GO
ALTER TABLE [dbo].[SC_USER] ADD  CONSTRAINT [DF_SC_USER_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[SC_USER] ADD  CONSTRAINT [DF_SC_USER_CreUser]  DEFAULT ((1)) FOR [CreUser]
GO
ALTER TABLE [dbo].[SC_USER] ADD  CONSTRAINT [DF_SC_USER_CreDate]  DEFAULT (getdate()) FOR [CreDate]
GO
ALTER TABLE [dbo].[SC_USER] ADD  CONSTRAINT [DF_SC_USER_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateClass]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CreateClass]    
    @tableName varchar(100)
AS
BEGIN
SET NOCOUNT ON;

-- Subquery to return only the copy paste text
Select PropertyColumn from (
    SELECT 1 as rowNr, 'public class ' + @tableName + ' {' as PropertyColumn
    UNION
    SELECT 2 as rowNr, 'public ' + a1.NewType + ' ' + a1.COLUMN_NAME + ' {get;set;}' as PropertyColumn
    -- ,* comment added so that i get copy pasteable output
     FROM 
    (
        /*using top because i'm putting an order by ordinal_position on it. 
        putting a top on it is the only way for a subquery to be ordered*/
        SELECT TOP 100 PERCENT
        COLUMN_NAME,
        DATA_TYPE,
        IS_NULLABLE,
        CASE 
            WHEN DATA_TYPE = 'varchar' THEN 'string'
            WHEN DATA_TYPE = 'nvarchar' THEN 'string' 
            WHEN DATA_TYPE = 'datetime' AND IS_NULLABLE = 'NO' THEN 'DateTime'
            WHEN DATA_TYPE = 'datetime' AND IS_NULLABLE = 'YES' THEN 'DateTime?'
            WHEN DATA_TYPE = 'smalldatetime' AND IS_NULLABLE = 'NO' THEN 'DateTime'
            WHEN DATA_TYPE = 'datetime2' AND IS_NULLABLE = 'NO' THEN 'DateTime'
            WHEN DATA_TYPE = 'smalldatetime' AND IS_NULLABLE = 'YES' THEN 'DateTime?'
            WHEN DATA_TYPE = 'datetime2' AND IS_NULLABLE = 'YES' THEN 'DateTime?'
            WHEN DATA_TYPE = 'int' AND IS_NULLABLE = 'YES' THEN 'int?'
            WHEN DATA_TYPE = 'int' AND IS_NULLABLE = 'NO' THEN 'int'
            WHEN DATA_TYPE = 'smallint' AND IS_NULLABLE = 'NO' THEN 'Int16'
            WHEN DATA_TYPE = 'smallint' AND IS_NULLABLE = 'YES' THEN 'Int16?'
            WHEN DATA_TYPE = 'decimal' AND IS_NULLABLE = 'NO' THEN 'decimal'
            WHEN DATA_TYPE = 'decimal' AND IS_NULLABLE = 'YES' THEN 'decimal?'
            WHEN DATA_TYPE = 'numeric' AND IS_NULLABLE = 'NO' THEN 'decimal'
            WHEN DATA_TYPE = 'numeric' AND IS_NULLABLE = 'YES' THEN 'decimal?'
            WHEN DATA_TYPE = 'money' AND IS_NULLABLE = 'NO' THEN 'decimal'
            WHEN DATA_TYPE = 'money' AND IS_NULLABLE = 'YES' THEN 'decimal?'
            WHEN DATA_TYPE = 'bigint' AND IS_NULLABLE = 'NO' THEN 'long'
            WHEN DATA_TYPE = 'bigint' AND IS_NULLABLE = 'YES' THEN 'long?'
            WHEN DATA_TYPE = 'tinyint' AND IS_NULLABLE = 'NO' THEN 'byte'
            WHEN DATA_TYPE = 'tinyint' AND IS_NULLABLE = 'YES' THEN 'byte?'
            WHEN DATA_TYPE = 'char' THEN 'string'                       
            WHEN DATA_TYPE = 'timestamp' THEN 'byte[]'
            WHEN DATA_TYPE = 'varbinary' THEN 'byte[]'
            WHEN DATA_TYPE = 'bit' AND IS_NULLABLE = 'NO' THEN 'bool'
            WHEN DATA_TYPE = 'bit' AND IS_NULLABLE = 'YES' THEN 'bool?'
            WHEN DATA_TYPE = 'xml' THEN 'string'
        END AS NewType
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = @tableName
        ORDER BY ORDINAL_POSITION
        ) AS a1 
    UNION 
    SELECT 3 as rowNr,  '} // class ' + @tableName
    ) as t Order By rowNr asc
END

GO
/****** Object:  StoredProcedure [dbo].[sp_CreateClassVBT]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CreateClassVBT] @tableName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Subquery to return only the copy paste text
    SELECT PropertyColumn
    FROM (
        SELECT 0 AS RowNumber
            ,'using Dapper.Contrib.Extensions;
using System;

namespace VBT.ABYS.Models
{
    [Table("' + @tableName + '")]
    public class ' + @tableName + ' : BaseModel
    {
        [Key]' AS PropertyColumn
        
        UNION
        
        SELECT RowNumber
            ,'        public ' + a1.NewType + ' ' + a1.COLUMN_NAME + ' { get; set; }' AS PropertyColumn
        -- ,* comment added so that i get copy pasteable output
        FROM (
            /*using top because i'm putting an order by ordinal_position on it. 
        putting a top on it is the only way for a subquery to be ordered*/
            SELECT TOP 100 PERCENT ROW_NUMBER() OVER (
                    ORDER BY ORDINAL_POSITION
                    ) AS RowNumber
                ,COLUMN_NAME
                ,DATA_TYPE
                ,IS_NULLABLE
                ,CASE 
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'varchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nvarchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'YES'
                        THEN 'int'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'NO'
                        THEN 'int'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'long'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'long'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'byte'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'byte?'
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'timestamp'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'varbinary'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'NO'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'YES'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'xml'
                        THEN 'string'
                    END AS NewType
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = @tableName
                AND COLUMN_NAME NOT IN (
                    'CreUser'
                    ,'CreDate'
                    ,'ModUser'
                    ,'ModDate'
                    ,'Client'
                    ,'ClientIp'
                    ,'Deleted'
                    )
                AND COLUMN_NAME NOT LIKE 'Eski%'
            ORDER BY ORDINAL_POSITION
            ) AS a1
        
        UNION
        
        SELECT 1000 AS RowNumber
            ,'    }'
        
        UNION
        
        SELECT 1500 AS RowNumber
            ,'
    [Table("' + @tableName + '")]
    public class ' + @tableName + '_VM : BaseViewModel
    {
        [Key]' AS PropertyColumn
        
        UNION
        
        SELECT RowNumber + 2000
            ,'        public ' + a1.NewType + ' ' + a1.COLUMN_NAME + ' { get; set; }' AS PropertyColumn
        -- ,* comment added so that i get copy pasteable output
        FROM (
            /*using top because i'm putting an order by ordinal_position on it. 
        putting a top on it is the only way for a subquery to be ordered*/
            SELECT TOP 100 PERCENT ROW_NUMBER() OVER (
                    ORDER BY ORDINAL_POSITION
                    ) AS RowNumber
                ,COLUMN_NAME
                ,DATA_TYPE
                ,IS_NULLABLE
                ,CASE 
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'varchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nvarchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'YES'
                        THEN 'int'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'NO'
                        THEN 'int'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'long'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'long'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'byte'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'byte?'
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'timestamp'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'varbinary'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'NO'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'YES'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'xml'
                        THEN 'string'
                    END AS NewType
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = @tableName
                AND COLUMN_NAME NOT IN (
                    'CreUser'
                    ,'CreDate'
                    ,'ModUser'
                    ,'ModDate'
                    ,'Client'
                    ,'ClientIp'
                    ,'Deleted'
                    )
                AND COLUMN_NAME NOT LIKE 'Eski%'
            ORDER BY ORDINAL_POSITION
            ) AS a1
        
        UNION
        
        SELECT 3000 AS RowNumber
            ,'    }'
        
        UNION
        
        SELECT 4000 AS RowNumber
            ,'
    [Table("' + @tableName + '")]
    public class ' + @tableName + '_AKT : ' + @tableName + '
    {' AS PropertyColumn
        
        UNION
        
        SELECT RowNumber + 4000
            ,'        public ' + a1.NewType + ' ' + a1.COLUMN_NAME + ' { get; set; }' AS PropertyColumn
        -- ,* comment added so that i get copy pasteable output
        FROM (
            /*using top because i'm putting an order by ordinal_position on it. 
        putting a top on it is the only way for a subquery to be ordered*/
            SELECT TOP 100 PERCENT ROW_NUMBER() OVER (
                    ORDER BY ORDINAL_POSITION
                    ) AS RowNumber
                ,COLUMN_NAME
                ,DATA_TYPE
                ,IS_NULLABLE
                ,CASE 
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'varchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nvarchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'YES'
                        THEN 'int'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'NO'
                        THEN 'int'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'long'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'long'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'byte'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'byte?'
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'timestamp'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'varbinary'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'NO'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'YES'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'xml'
                        THEN 'string'
                    END AS NewType
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = @tableName
                AND COLUMN_NAME NOT IN (
                    'CreUser'
                    ,'CreDate'
                    ,'ModUser'
                    ,'ModDate'
                    ,'Client'
                    ,'ClientIp'
                    ,'Deleted'
                    )
                AND COLUMN_NAME LIKE 'Eski%'
            ORDER BY ORDINAL_POSITION
            ) AS a1
        
        UNION
        
        SELECT 5000 AS RowNumber
            ,'    }'
        
        UNION
        
        SELECT 7000 AS RowNumber
            ,'}'
        ) AS t
    ORDER BY RowNumber ASC
END


GO
/****** Object:  StoredProcedure [dbo].[sp_LogTablosuOlusturma]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author		: Soner Acar
-- Create date	: 23 Ocak 2016
-- Description	: LG tablolarını ve Triggerler ı otomatik oluşturuyor.
-- =============================================
CREATE PROCEDURE [dbo].[sp_LogTablosuOlusturma] @TABLE_NAME NVARCHAR(50)
	,@TRIGGER_NAME NVARCHAR(50)
AS
DECLARE @sonuc NVARCHAR(MAX);

--------------------------------
BEGIN TRY
	PRINT 'SP Başlangıcı : ' + CONVERT(NVARCHAR(50), GETDATE(), 108);

	-- Gereksiz Print Yazılarını Kapatıyorum 
	SET NOCOUNT ON;

	-- Transaction Baş
	BEGIN TRANSACTION trans;

	DECLARE @SQL NVARCHAR(MAX);
	DECLARE @TABLE_NAME_LG NVARCHAR(50);

	--DECLARE @sonuc NVARCHAR(MAX);
	--DECLARE @TABLE_NAME NVARCHAR(50) = N'TR_BUDGET_DETAIL';
	--DECLARE	@TRIGGER_NAME NVARCHAR(50) = N'TrgTrBudgetDetail'

	SET @TABLE_NAME_LG = 'LG' + SUBSTRING(@TABLE_NAME, 3, LEN(@TABLE_NAME)+1);
	SET @SQL = 'CREATE TABLE [dbo].[' + @TABLE_NAME_LG + '](
[LogDate] [datetime] NULL, ';

	SELECT @SQL = @SQL + '
[' + c.NAME + '] [' + t.NAME + ']' + CASE 
			WHEN t.NAME = 'decimal'
				THEN '(' + CONVERT(NVARCHAR(10),c.precision) + ',' + CONVERT(NVARCHAR(10),c.scale) + ')'
			WHEN t.NAME IN (
					'int'
					,'bit'
					,'datetime'
					,'date'
					)
				THEN ''
			WHEN t.NAME NOT IN (
					'ntext'
					,'text'
					)
				THEN '(' + CASE 
						WHEN t.NAME IN (
								'nchar'
								,'nvarchar'
								)
							AND c.max_length != - 1
							THEN CONVERT(NVARCHAR(10), c.max_length / 2)
						WHEN t.NAME IN (
								'nchar'
								,'nvarchar'
								)
							AND c.max_length = - 1
							THEN 'MAX'
						ELSE CAST(c.max_length AS VARCHAR(10))
						END + ')'
			ELSE ''
			END + ' NULL,'
	FROM sys.columns c WITH (NOLOCK)
	JOIN sys.objects o WITH (NOLOCK) ON c.[object_id] = o.[object_id]
	JOIN sys.types t WITH (NOLOCK) ON c.system_type_id = t.system_type_id
		AND c.user_type_id = t.user_type_id
	WHERE o.[type] = 'U'
		AND o.NAME = @TABLE_NAME;

	SET @SQL = SUBSTRING(@SQL, 0, LEN(@SQL));
	SET @SQL = @SQL +'
) ON [PRIMARY]
';

EXEC sp_executesql @SQL;

	SET @SQL = 'CREATE TRIGGER [dbo].[' + @TRIGGER_NAME + '] ON [dbo].[' + @TABLE_NAME + ']
FOR INSERT
,UPDATE
AS
BEGIN
INSERT INTO ' + @TABLE_NAME_LG + ' (
LogDate, ';

	SELECT @SQL = @SQL +'
'+ c.NAME + ','
	FROM sys.columns c WITH (NOLOCK)
	JOIN sys.objects o WITH (NOLOCK) ON c.[object_id] = o.[object_id]
	JOIN sys.types t WITH (NOLOCK) ON c.system_type_id = t.system_type_id
		AND c.user_type_id = t.user_type_id
	WHERE o.[type] = 'U'
		AND o.NAME = @TABLE_NAME;

	SET @SQL = SUBSTRING(@SQL, 0, LEN(@SQL));
	SET @SQL = @SQL + '
)
SELECT GETDATE()';

	SELECT @SQL = @SQL + '
,' + c.NAME
	FROM sys.columns c WITH (NOLOCK)
	JOIN sys.objects o WITH (NOLOCK) ON c.[object_id] = o.[object_id]
	JOIN sys.types t WITH (NOLOCK) ON c.system_type_id = t.system_type_id
		AND c.user_type_id = t.user_type_id
	WHERE o.[type] = 'U'
		AND o.NAME = @TABLE_NAME;

	SET @SQL = @SQL + '
FROM inserted;
END;';

	--SELECT @SQL;

	EXEC sp_executesql @SQL;

	SET @sonuc = '1';

	SELECT @sonuc;

	PRINT 'SP Bitişi     : ' + CONVERT(NVARCHAR(50), GETDATE(), 108);

	-- Transaction Commit
	COMMIT TRANSACTION trans;

	-- Tanımlamalar Bit
	SET NOCOUNT OFF;
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION trans;

	SET @sonuc = ERROR_MESSAGE();
	 
	  --SELECT
   --     ERROR_NUMBER() AS ErrorNumber,
   --     ERROR_SEVERITY() AS ErrorSeverity,
   --     ERROR_STATE() AS ErrorState,
   --     ERROR_PROCEDURE() AS ErrorProcedure,
   --     ERROR_LINE() AS ErrorLine,
   --     ERROR_MESSAGE() AS ErrorMessage;

	PRINT 'Hata Oluştu.';
END CATCH;

--------------------------------
RETURN @sonuc;

GO
/****** Object:  StoredProcedure [dbo].[sp_SetContext]    Script Date: 15.06.2017 12:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_SetContext] @prmIdUser INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @BINARY VARBINARY(100);

	SET @BINARY = (
			SELECT convert(VARBINARY, @prmIdUser)
			);
	SET CONTEXT_INFO @BINARY;
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 136
               Right = 481
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 519
               Bottom = 136
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CO"
            Begin Extent = 
               Top = 6
               Left = 736
               Bottom = 136
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1590
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2205
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_FIELD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_FIELD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LT"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 135
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_LOG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_LOG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "R"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RU"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ROLE_USER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ROLE_USER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "U"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_RP_Kullanıcı'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_RP_Kullanıcı'
GO
