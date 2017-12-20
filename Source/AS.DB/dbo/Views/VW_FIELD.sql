
CREATE VIEW [dbo].[VW_FIELD]
AS
SELECT o.NAME AS TableName
	,CASE WHEN c.column_id = 1 THEN 1111 ELSE c.column_id END AS TabIndex
	,c.NAME AS ColumnName
	,CO.ColumnNewName AS ColumnLabel
	,t.NAME AS ColumnType
	,CO.Placeholder
	,CO.MinValue
	,CO.MaxValue
	,CASE 
		WHEN t.NAME IN (
				'decimal'
				,'int'
				)
			AND c.is_identity = 1
			THEN 'number'
		WHEN t.NAME IN (
				'decimal'
				,'int'
				)
			AND c.is_identity = 0
			AND SUBSTRING(c.NAME, 1, 2) = 'Id'
			THEN 'select'
		WHEN t.NAME IN (
				'decimal'
				,'int'
				)
			AND c.is_identity = 0
			AND SUBSTRING(c.NAME, 1, 2) != 'Id'
			THEN 'number'
		WHEN t.NAME IN (
				'varchar'
				,'nvarchar'
				,'ntext'
				,'text'
				)
			THEN 'text'
		WHEN t.NAME IN (
				'datetime'
				,'date'
				)
			THEN 'date'
		WHEN t.NAME IN ('bit')
			THEN 'checkbox'
		ELSE ''
		END AS FieldType
	,c.max_length AS MaxLenght
	,c.is_nullable AS IsNullable
	,c.is_identity AS IsIdentity
	,c.is_computed AS IsComputed
FROM sys.columns AS c WITH (NOLOCK)
LEFT OUTER JOIN sys.objects AS o WITH (NOLOCK) ON c.object_id = o.object_id
LEFT OUTER JOIN sys.types AS t WITH (NOLOCK) ON c.system_type_id = t.system_type_id
	AND c.user_type_id = t.user_type_id
LEFT OUTER JOIN dbo.GN_COLUMN AS CO ON CO.ColumnName = c.NAME
WHERE (o.type = 'U')
	AND (
		c.NAME NOT IN (
			'CreUser'
			,'CreDate'
			,'ModUser'
			,'ModDate'
			,'Client'
			,'ClientIp'
			,'Deleted'
			)
		)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VW_FIELD';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 136
               Right = 481
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 519
               Bottom = 136
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CO"
            Begin Extent = 
               Top = 6
               Left = 736
               Bottom = 136
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1590
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2205
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'VW_FIELD';

