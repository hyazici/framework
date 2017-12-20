CREATE TABLE [dbo].[SC_ACTION] (
    [IdAction]   INT            IDENTITY (1, 1) NOT NULL,
    [ActionName] NVARCHAR (50)  NOT NULL,
    [FullPath]   NVARCHAR (50)  NOT NULL,
    [ActionDesc] NVARCHAR (500) NOT NULL,
    [CreUser]    INT            NULL,
    [CreDate]    DATETIME       CONSTRAINT [DF_SC_ACTION_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]    INT            NULL,
    [ModDate]    DATETIME       NULL,
    [Client]     NVARCHAR (50)  NULL,
    [ClientIp]   NVARCHAR (50)  NULL,
    [Deleted]    BIT            CONSTRAINT [DF_SC_ACTION_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SC_ACTION] PRIMARY KEY CLUSTERED ([IdAction] ASC)
);

