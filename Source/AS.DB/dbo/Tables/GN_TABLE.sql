CREATE TABLE [dbo].[GN_TABLE] (
    [IdTable]        INT           IDENTITY (1, 1) NOT NULL,
    [TableName]      NVARCHAR (50) NOT NULL,
    [TableShortName] NVARCHAR (50) NULL,
    [TableTRName]    NVARCHAR (50) NULL,
    [CreUser]        INT           CONSTRAINT [DF_GN_TABLE_CreUser] DEFAULT ((1)) NULL,
    [CreDate]        DATETIME      CONSTRAINT [DF_GN_TABLE_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]        INT           NULL,
    [ModDate]        DATETIME      NULL,
    [Client]         NVARCHAR (50) NULL,
    [ClientIp]       NVARCHAR (50) NULL,
    [Deleted]        BIT           CONSTRAINT [DF_GN_TABLE_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_GN_TABLE] PRIMARY KEY CLUSTERED ([IdTable] ASC)
);

