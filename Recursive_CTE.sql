WITH Set_CTE AS (
    SELECT 
        DimID, 
        Dim, 
        Dim2ID, 
        1 AS DimLevel
    FROM DimTable
    WHERE Dim2ID IS NULL

    UNION ALL

    SELECT 
        e.DimID, 
        e.Dim, 
        e.Dim2ID, 
        cte.DimLevel + 1
    FROM DimTable e
    INNER JOIN Set_CTE cte ON e.Dim2ID = cte.DimID
)

SELECT * FROM Set_CTE
ORDER BY DimLevel, Dim;