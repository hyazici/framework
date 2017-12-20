
CREATE FUNCTION [dbo].[fn_ReadContext] ()
RETURNS INT
AS
BEGIN
	RETURN (
			SELECT CONVERT(INT, context_info)
			FROM sys.dm_exec_sessions
			WHERE session_id = @@SPID
			)
END