CREATE TABLE [dbo].[SC_ROLE] (
    [IdRole]   INT           IDENTITY (1, 1) NOT NULL,
    [RoleName] NVARCHAR (50) NOT NULL,
    [MainPage] NVARCHAR (50) NULL,
    [CreUser]  INT           CONSTRAINT [DF_SC_ROLE_CreUser] DEFAULT ((1)) NULL,
    [CreDate]  DATETIME      CONSTRAINT [DF_SC_ROLE_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]  INT           NULL,
    [ModDate]  DATETIME      NULL,
    [Client]   NVARCHAR (50) NULL,
    [ClientIp] NVARCHAR (50) NULL,
    [Deleted]  BIT           CONSTRAINT [DF_SC_ROLE_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SC_ROLE] PRIMARY KEY CLUSTERED ([IdRole] ASC)
);

