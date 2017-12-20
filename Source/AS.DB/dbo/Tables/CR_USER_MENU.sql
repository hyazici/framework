CREATE TABLE [dbo].[CR_USER_MENU] (
    [IdCrUserMenu] INT           IDENTITY (1, 1) NOT NULL,
    [IdUser]       INT           NOT NULL,
    [IdMenu]       INT           NOT NULL,
    [CreUser]      INT           NULL,
    [CreDate]      DATETIME      CONSTRAINT [DF_CR_USER_MENU_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]      INT           NULL,
    [ModDate]      DATETIME      NULL,
    [Client]       NVARCHAR (50) NULL,
    [ClientIp]     NVARCHAR (50) NULL,
    [Deleted]      BIT           CONSTRAINT [DF_CR_USER_MENU_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CR_USER_MENU] PRIMARY KEY CLUSTERED ([IdCrUserMenu] ASC)
);

