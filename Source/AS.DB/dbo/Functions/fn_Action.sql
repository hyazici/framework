
-- =============================================
-- Author:		Soner ACAR
-- Create date: 4 Aralık 2015
-- Description:	IdCompany ve IdUser parametrelerine göre yetkili olduğu Action lar listeleniyor.
-- =============================================
CREATE FUNCTION [dbo].[fn_Action] (
    @IdUser INT
	)
RETURNS TABLE
AS
RETURN (
		SELECT *
		FROM SC_ACTION
		WHERE IdAction IN (
				SELECT IdAction
				FROM CR_ROLE_ACTION
				WHERE Deleted = 0
					AND IdRole IN (
						SELECT IdRole
						FROM CR_ROLE_USER
						WHERE Deleted = 0
							AND IdUser = @IdUser
						)
				)
			OR IdAction IN (
				SELECT IdAction
				FROM CR_USER_ACTION
				WHERE Deleted = 0
					AND IdUser = @IdUser
				)
		)