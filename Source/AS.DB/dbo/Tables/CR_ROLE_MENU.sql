CREATE TABLE [dbo].[CR_ROLE_MENU] (
    [IdCrRoleMenu] INT           IDENTITY (1, 1) NOT NULL,
    [IdRole]       INT           NOT NULL,
    [IdMenu]       INT           NOT NULL,
    [CreUser]      INT           NULL,
    [CreDate]      DATETIME      CONSTRAINT [DF_CR_ROLE_MENU_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]      INT           NULL,
    [ModDate]      DATETIME      NULL,
    [Client]       NVARCHAR (50) NULL,
    [ClientIp]     NVARCHAR (50) NULL,
    [Deleted]      BIT           CONSTRAINT [DF_CR_ROLE_MENU_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CR_ROLE_MENU] PRIMARY KEY CLUSTERED ([IdCrRoleMenu] ASC)
);

