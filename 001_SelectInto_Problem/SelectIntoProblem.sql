USE TestDB
GO

DROP TABLE IF EXISTS SourceTable;

CREATE TABLE SourceTable(
	ValueType INT NOT NULL,
	Content NVARCHAR(100) NULL
	);

INSERT INTO SourceTable
(ValueType, Content)
VALUES
(1,N'a')
,(1,N'b')
,(2,N'1234567890')
,(2,N'12345678901234567890')

--SELECT * FROM SourceTable

DROP TABLE IF EXISTS #targetTable;

SELECT ValueType, Content
INTO #targetTable
FROM SourceTable
WHERE ValueType = 1;

--SELECT * FROM #targetTable

EXEC tempdb.dbo.sp_help N'#targetTable';