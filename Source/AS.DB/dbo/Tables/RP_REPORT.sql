CREATE TABLE [dbo].[RP_REPORT] (
    [IdReport]    INT            IDENTITY (1, 1) NOT NULL,
    [ReportName]  NVARCHAR (150) NULL,
    [SourceName]  NVARCHAR (50)  NULL,
    [IsPublic]    BIT            CONSTRAINT [DF_RP_REPORT_IsPublic] DEFAULT ((1)) NOT NULL,
    [ColumnLists] NVARCHAR (MAX) NULL,
    [GroupByList] NVARCHAR (MAX) NULL,
    [OrderByList] NVARCHAR (MAX) NULL,
    [SQLString]   NVARCHAR (MAX) NULL,
    [IsActive]    BIT            CONSTRAINT [DF_RP_REPORT_IsActive] DEFAULT ((0)) NOT NULL,
    [CreUser]     INT            CONSTRAINT [DF_RP_REPORT_CreUser] DEFAULT ((1)) NULL,
    [CreDate]     DATETIME       CONSTRAINT [DF_RP_REPORT_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]     INT            NULL,
    [ModDate]     DATETIME       NULL,
    [Client]      NVARCHAR (50)  NULL,
    [ClientIp]    NVARCHAR (50)  NULL,
    [Deleted]     BIT            CONSTRAINT [DF_RP_REPORT_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RP_REPORT] PRIMARY KEY CLUSTERED ([IdReport] ASC)
);

