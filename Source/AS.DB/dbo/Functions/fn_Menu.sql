
-- =============================================
-- Author:		Soner ACAR
-- Create date: 4 Aralık 2015
-- Description:	IdUser parametrelerine göre yetkili olduğu menuler listeleniyor.
-- =============================================
CREATE FUNCTION [dbo].[fn_Menu] (
	@IdUser INT
	)
RETURNS TABLE
AS
RETURN (
		SELECT *
		FROM SC_MENU
		WHERE Deleted = 0
			AND isActive = 1
			AND IdMenu IN (
				SELECT IdMenu
				FROM CR_ROLE_MENU
				WHERE Deleted = 0
					AND IdRole IN (
						SELECT IdRole
						FROM CR_ROLE_USER
						WHERE Deleted = 0
							AND IdUser = @IdUser
						)
					OR IdMenu IN (
						SELECT IdMenu
						FROM CR_USER_MENU
						WHERE Deleted = 0
							AND IdUser = @IdUser
						)
				)
		)