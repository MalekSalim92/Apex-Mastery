SELECT [fields]
FROM [object]
WHERE [filter individual records]      -- Optional, before GROUP BY
GROUP BY [fields]                       -- Optional
HAVING [filter grouped results]         -- Optional, after GROUP BY
ORDER BY [fields]                       -- Optional
LIMIT [number]                          -- Optional