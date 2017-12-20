CREATE TABLE [dbo].[GN_COLUMN] (
    [IdColumn]      INT           IDENTITY (1, 1) NOT NULL,
    [ColumnName]    NVARCHAR (50) NOT NULL,
    [ColumnNewName] NVARCHAR (50) NULL,
    [Placeholder]   NVARCHAR (50) NULL,
    [MinValue]      INT           CONSTRAINT [DF_GN_COLUMN_MinLen] DEFAULT ((0)) NOT NULL,
    [MaxValue]      INT           CONSTRAINT [DF_GN_COLUMN_MaxLen] DEFAULT ((0)) NOT NULL,
    [CreUser]       INT           CONSTRAINT [DF_GN_COLUMN_CreUser] DEFAULT ((1)) NULL,
    [CreDate]       DATETIME      CONSTRAINT [DF_GN_COLUMN_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]       INT           NULL,
    [ModDate]       DATETIME      NULL,
    [Client]        NVARCHAR (50) NULL,
    [ClientIp]      NVARCHAR (50) NULL,
    [Deleted]       BIT           CONSTRAINT [DF_GN_COLUMN_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_GN_COLUMN] PRIMARY KEY CLUSTERED ([IdColumn] ASC)
);

