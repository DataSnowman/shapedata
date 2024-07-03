SELECT 進站, sum(人次)
FROM [testing].[dbo].[mrt201701]
WHERE 進站 like ('市政府')
GROUP BY 進站