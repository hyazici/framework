
CREATE FUNCTION [dbo].[fn_ConvertToString]
(
   @Code int,
   @digit int
)   
RETURNS NVARCHAR(200)    
AS    
BEGIN   
  RETURN RIGHT('0000000000'+CAST(@Code AS VARCHAR(10)),@digit)
END