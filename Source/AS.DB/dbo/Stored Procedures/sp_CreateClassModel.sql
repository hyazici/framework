
CREATE PROCEDURE [dbo].[sp_CreateClassVBT] @tableName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Subquery to return only the copy paste text
    SELECT PropertyColumn
    FROM (
        SELECT 0 AS RowNumber
            ,'using Dapper.Contrib.Extensions;
using System;

namespace AS.Models
{
    [Table("' + @tableName + '")]
    public class ' + @tableName + ' : BaseModel
    {
        [Key]' AS PropertyColumn
        
        UNION
        
        SELECT RowNumber
            ,'        public ' + a1.NewType + ' ' + a1.COLUMN_NAME + ' { get; set; }' AS PropertyColumn
        -- ,* comment added so that i get copy pasteable output
        FROM (
            /*using top because i'm putting an order by ordinal_position on it. 
        putting a top on it is the only way for a subquery to be ordered*/
            SELECT TOP 100 PERCENT ROW_NUMBER() OVER (
                    ORDER BY ORDINAL_POSITION
                    ) AS RowNumber
                ,COLUMN_NAME
                ,DATA_TYPE
                ,IS_NULLABLE
                ,CASE 
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'varchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nvarchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'YES'
                        THEN 'int'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'NO'
                        THEN 'int'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'long'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'long'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'byte'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'byte?'
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'timestamp'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'varbinary'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'NO'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'YES'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'xml'
                        THEN 'string'
                    END AS NewType
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = @tableName
                AND COLUMN_NAME NOT IN (
                    'CreUser'
                    ,'CreDate'
                    ,'ModUser'
                    ,'ModDate'
                    ,'Client'
                    ,'ClientIp'
                    ,'Deleted'
                    )
                AND COLUMN_NAME NOT LIKE 'Eski%'
            ORDER BY ORDINAL_POSITION
            ) AS a1
        
        UNION
        
        SELECT 1000 AS RowNumber
            ,'    }'
        
        UNION
        
        SELECT 1500 AS RowNumber
            ,'
    [Table("' + @tableName + '")]
    public class ' + @tableName + '_VM : BaseViewModel
    {
        [Key]' AS PropertyColumn
        
        UNION
        
        SELECT RowNumber + 2000
            ,'        public ' + a1.NewType + ' ' + a1.COLUMN_NAME + ' { get; set; }' AS PropertyColumn
        -- ,* comment added so that i get copy pasteable output
        FROM (
            /*using top because i'm putting an order by ordinal_position on it. 
        putting a top on it is the only way for a subquery to be ordered*/
            SELECT TOP 100 PERCENT ROW_NUMBER() OVER (
                    ORDER BY ORDINAL_POSITION
                    ) AS RowNumber
                ,COLUMN_NAME
                ,DATA_TYPE
                ,IS_NULLABLE
                ,CASE 
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'varchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'nvarchar'
                        THEN 'string'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'date'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'NO'
                        THEN 'DateTime'
                    WHEN DATA_TYPE = 'smalldatetime'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'datetime2'
                        AND IS_NULLABLE = 'YES'
                        THEN 'DateTime?'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'YES'
                        THEN 'int'
                    WHEN DATA_TYPE = 'int'
                        AND IS_NULLABLE = 'NO'
                        THEN 'int'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'smallint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'Int16'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'decimal'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'numeric'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'NO'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'money'
                        AND IS_NULLABLE = 'YES'
                        THEN 'decimal'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'long'
                    WHEN DATA_TYPE = 'bigint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'long'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'NO'
                        THEN 'byte'
                    WHEN DATA_TYPE = 'tinyint'
                        AND IS_NULLABLE = 'YES'
                        THEN 'byte?'
                    WHEN DATA_TYPE = 'char'
                        THEN 'string'
                    WHEN DATA_TYPE = 'timestamp'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'varbinary'
                        THEN 'byte[]'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'NO'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'bit'
                        AND IS_NULLABLE = 'YES'
                        THEN 'bool'
                    WHEN DATA_TYPE = 'xml'
                        THEN 'string'
                    END AS NewType
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_NAME = @tableName
                AND COLUMN_NAME NOT IN (
                    'CreUser'
                    ,'CreDate'
                    ,'ModUser'
                    ,'ModDate'
                    ,'Client'
                    ,'ClientIp'
                    ,'Deleted'
                    )
                AND COLUMN_NAME NOT LIKE 'Eski%'
            ORDER BY ORDINAL_POSITION
            ) AS a1
        
        UNION
        
        SELECT 3000 AS RowNumber
            ,'    }'
        
        UNION        
        
        SELECT 7000 AS RowNumber
            ,'}'
        ) AS t
    ORDER BY RowNumber ASC
END