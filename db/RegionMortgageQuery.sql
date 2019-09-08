
SELECT * FROM RegionMortgage
WHERE rownum = 1
AND ([LABEL] LIKE '%Renmark%'
    OR [LABEL] LIKE '%Penrith%')
 
 
 