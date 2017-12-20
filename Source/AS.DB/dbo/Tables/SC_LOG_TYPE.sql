CREATE TABLE [dbo].[SC_LOG_TYPE] (
    [IdLogType] INT           IDENTITY (1, 1) NOT NULL,
    [LogType]   NVARCHAR (50) NULL,
    [CreUser]   INT           NULL,
    [CreDate]   DATETIME      CONSTRAINT [DF_SC_LOG_TYPE_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]   INT           NULL,
    [ModDate]   DATETIME      NULL,
    [Client]    NVARCHAR (50) NULL,
    [ClientIp]  NVARCHAR (50) NULL,
    [Deleted]   BIT           CONSTRAINT [DF_SC_LOG_TYPE_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SC_LOG_TYPE] PRIMARY KEY CLUSTERED ([IdLogType] ASC)
);

