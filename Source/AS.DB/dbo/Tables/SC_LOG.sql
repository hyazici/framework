CREATE TABLE [dbo].[SC_LOG] (
    [IdLog]          INT            IDENTITY (1, 1) NOT NULL,
    [ShortMessage]   NVARCHAR (MAX) NULL,
    [Message]        NVARCHAR (MAX) NULL,
    [RequestUrl]     NVARCHAR (500) NULL,
    [ControllerName] NVARCHAR (200) NULL,
    [ActionName]     NVARCHAR (50)  NULL,
    [IdLogType]      INT            NULL,
    [IsVisible]      BIT            NULL,
    [IdCompany]      INT            CONSTRAINT [DF_SC_LOG_IdCompany] DEFAULT ((1)) NOT NULL,
    [CreUser]        INT            NULL,
    [CreDate]        DATETIME       CONSTRAINT [DF_SC_LOG_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]        INT            NULL,
    [ModDate]        DATETIME       NULL,
    [Client]         NVARCHAR (50)  NULL,
    [ClientIp]       NVARCHAR (50)  NULL,
    [Deleted]        BIT            CONSTRAINT [DF_SC_LOG_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SC_LOG] PRIMARY KEY CLUSTERED ([IdLog] ASC)
);

