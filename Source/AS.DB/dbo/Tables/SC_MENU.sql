CREATE TABLE [dbo].[SC_MENU] (
    [IdMenu]      INT           IDENTITY (1, 1) NOT NULL,
    [OrderNumber] INT           CONSTRAINT [DF_SC_MENU_OrderNumber] DEFAULT ((0)) NOT NULL,
    [MenuName]    NVARCHAR (50) NOT NULL,
    [Area]        NVARCHAR (50) NULL,
    [Controller]  NVARCHAR (50) CONSTRAINT [DF_SC_MENU_Controller] DEFAULT ('') NULL,
    [Action]      NVARCHAR (50) CONSTRAINT [DF_SC_MENU_Action] DEFAULT ('') NULL,
    [Parametre]   NVARCHAR (50) NULL,
    [imageClass]  NVARCHAR (50) NULL,
    [ParentId]    INT           CONSTRAINT [DF_SC_MENU_ParentId] DEFAULT ((0)) NOT NULL,
    [isParent]    BIT           NOT NULL,
    [hasChild]    BIT           NOT NULL,
    [isActive]    BIT           NOT NULL,
    [CreUser]     INT           NULL,
    [CreDate]     DATETIME      CONSTRAINT [DF_SC_MENU_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]     INT           NULL,
    [ModDate]     DATETIME      NULL,
    [Client]      NVARCHAR (50) NULL,
    [ClientIp]    NVARCHAR (50) NULL,
    [Deleted]     BIT           CONSTRAINT [DF_GV_MENU_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SC_MENU] PRIMARY KEY CLUSTERED ([IdMenu] ASC)
);

