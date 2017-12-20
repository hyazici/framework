
-- =============================================
-- Author		: Soner Acar
-- Create date	: 23 Ocak 2016
-- Description	: LG tablolarını ve Triggerler ı otomatik oluşturuyor.
-- =============================================
CREATE PROCEDURE [dbo].[sp_LogTablosuOlusturma] @TABLE_NAME NVARCHAR(50)
	,@TRIGGER_NAME NVARCHAR(50)
AS
DECLARE @sonuc NVARCHAR(MAX);

--------------------------------
BEGIN TRY
	PRINT 'SP Başlangıcı : ' + CONVERT(NVARCHAR(50), GETDATE(), 108);

	-- Gereksiz Print Yazılarını Kapatıyorum 
	SET NOCOUNT ON;

	-- Transaction Baş
	BEGIN TRANSACTION trans;

	DECLARE @SQL NVARCHAR(MAX);
	DECLARE @TABLE_NAME_LG NVARCHAR(50);

	--DECLARE @sonuc NVARCHAR(MAX);
	--DECLARE @TABLE_NAME NVARCHAR(50) = N'TR_BUDGET_DETAIL';
	--DECLARE	@TRIGGER_NAME NVARCHAR(50) = N'TrgTrBudgetDetail'

	SET @TABLE_NAME_LG = 'LG' + SUBSTRING(@TABLE_NAME, 3, LEN(@TABLE_NAME)+1);
	SET @SQL = 'CREATE TABLE [dbo].[' + @TABLE_NAME_LG + '](
[LogDate] [datetime] NULL, ';

	SELECT @SQL = @SQL + '
[' + c.NAME + '] [' + t.NAME + ']' + CASE 
			WHEN t.NAME = 'decimal'
				THEN '(' + CONVERT(NVARCHAR(10),c.precision) + ',' + CONVERT(NVARCHAR(10),c.scale) + ')'
			WHEN t.NAME IN (
					'int'
					,'bit'
					,'datetime'
					,'date'
					)
				THEN ''
			WHEN t.NAME NOT IN (
					'ntext'
					,'text'
					)
				THEN '(' + CASE 
						WHEN t.NAME IN (
								'nchar'
								,'nvarchar'
								)
							AND c.max_length != - 1
							THEN CONVERT(NVARCHAR(10), c.max_length / 2)
						WHEN t.NAME IN (
								'nchar'
								,'nvarchar'
								)
							AND c.max_length = - 1
							THEN 'MAX'
						ELSE CAST(c.max_length AS VARCHAR(10))
						END + ')'
			ELSE ''
			END + ' NULL,'
	FROM sys.columns c WITH (NOLOCK)
	JOIN sys.objects o WITH (NOLOCK) ON c.[object_id] = o.[object_id]
	JOIN sys.types t WITH (NOLOCK) ON c.system_type_id = t.system_type_id
		AND c.user_type_id = t.user_type_id
	WHERE o.[type] = 'U'
		AND o.NAME = @TABLE_NAME;

	SET @SQL = SUBSTRING(@SQL, 0, LEN(@SQL));
	SET @SQL = @SQL +'
) ON [PRIMARY]
';

EXEC sp_executesql @SQL;

	SET @SQL = 'CREATE TRIGGER [dbo].[' + @TRIGGER_NAME + '] ON [dbo].[' + @TABLE_NAME + ']
FOR INSERT
,UPDATE
AS
BEGIN
INSERT INTO ' + @TABLE_NAME_LG + ' (
LogDate, ';

	SELECT @SQL = @SQL +'
'+ c.NAME + ','
	FROM sys.columns c WITH (NOLOCK)
	JOIN sys.objects o WITH (NOLOCK) ON c.[object_id] = o.[object_id]
	JOIN sys.types t WITH (NOLOCK) ON c.system_type_id = t.system_type_id
		AND c.user_type_id = t.user_type_id
	WHERE o.[type] = 'U'
		AND o.NAME = @TABLE_NAME;

	SET @SQL = SUBSTRING(@SQL, 0, LEN(@SQL));
	SET @SQL = @SQL + '
)
SELECT GETDATE()';

	SELECT @SQL = @SQL + '
,' + c.NAME
	FROM sys.columns c WITH (NOLOCK)
	JOIN sys.objects o WITH (NOLOCK) ON c.[object_id] = o.[object_id]
	JOIN sys.types t WITH (NOLOCK) ON c.system_type_id = t.system_type_id
		AND c.user_type_id = t.user_type_id
	WHERE o.[type] = 'U'
		AND o.NAME = @TABLE_NAME;

	SET @SQL = @SQL + '
FROM inserted;
END;';

	--SELECT @SQL;

	EXEC sp_executesql @SQL;

	SET @sonuc = '1';

	SELECT @sonuc;

	PRINT 'SP Bitişi     : ' + CONVERT(NVARCHAR(50), GETDATE(), 108);

	-- Transaction Commit
	COMMIT TRANSACTION trans;

	-- Tanımlamalar Bit
	SET NOCOUNT OFF;
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION trans;

	SET @sonuc = ERROR_MESSAGE();
	 
	  --SELECT
   --     ERROR_NUMBER() AS ErrorNumber,
   --     ERROR_SEVERITY() AS ErrorSeverity,
   --     ERROR_STATE() AS ErrorState,
   --     ERROR_PROCEDURE() AS ErrorProcedure,
   --     ERROR_LINE() AS ErrorLine,
   --     ERROR_MESSAGE() AS ErrorMessage;

	PRINT 'Hata Oluştu.';
END CATCH;

--------------------------------
RETURN @sonuc;