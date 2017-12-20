CREATE TABLE [dbo].[SC_USER] (
    [IdUser]           INT            IDENTITY (1, 1) NOT NULL,
    [UserName]         NVARCHAR (50)  NOT NULL,
    [Password]         NVARCHAR (50)  NOT NULL,
    [RealName]         NVARCHAR (50)  NOT NULL,
    [FailedLoginCount] INT            CONSTRAINT [DF_SC_USER_FailedLoginCount] DEFAULT ((0)) NOT NULL,
    [Email]            NVARCHAR (50)  NOT NULL,
    [Active]           BIT            CONSTRAINT [DF_SC_USER_Active] DEFAULT ((1)) NOT NULL,
    [CreUser]          INT            CONSTRAINT [DF_SC_USER_CreUser] DEFAULT ((1)) NULL,
    [CreDate]          DATETIME       CONSTRAINT [DF_SC_USER_CreDate] DEFAULT (getdate()) NOT NULL,
    [ModUser]          INT            NULL,
    [ModDate]          DATETIME       NULL,
    [Client]           NVARCHAR (50)  NULL,
    [ClientIp]         NVARCHAR (50)  NULL,
    [Deleted]          BIT            CONSTRAINT [DF_SC_USER_Deleted] DEFAULT ((0)) NOT NULL,
    [Fotograf]         NVARCHAR (500) NULL,
    [Adi]              NVARCHAR (50)  NULL,
    [Soyadi]           NVARCHAR (50)  NULL,
    [CepTelefonu]      NVARCHAR (50)  NULL,
    [Aciklama]         NVARCHAR (50)  NULL,
    CONSTRAINT [PK_SC_USER] PRIMARY KEY CLUSTERED ([IdUser] ASC)
);

