CREATE TABLE [dbo].[CR_ROLE_ACTION] (
    [IdCrRoleAction] INT           IDENTITY (1, 1) NOT NULL,
    [IdRole]         INT           NOT NULL,
    [IdAction]       INT           NOT NULL,
    [CreUser]        INT           NULL,
    [CreDate]        DATETIME      CONSTRAINT [DF_CR_ROLE_ACTION_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]        INT           NULL,
    [ModDate]        DATETIME      NULL,
    [Client]         NVARCHAR (50) NULL,
    [ClientIp]       NVARCHAR (50) NULL,
    [Deleted]        BIT           CONSTRAINT [DF_CR_ROLE_ACTION_Deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CR_ROLE_ACITON] PRIMARY KEY CLUSTERED ([IdCrRoleAction] ASC)
);

