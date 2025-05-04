WITH AgentAvgResolution AS (
    SELECT 
        a."Full Name",
        AVG(t."Resolution Time (Days)") AS "Avg Resolution Days"
    FROM "IT Tickets" t
    JOIN "Agent Details" a ON t."Agent ID" = a."Agent ID"
    WHERE t."Resolution Time (Days)" IS NOT NULL
    GROUP BY a."Full Name"
)
SELECT *,
       RANK() OVER (ORDER BY "Avg Resolution Days" ASC) AS "Resolution Speed Rank"
FROM AgentAvgResolution
ORDER BY "Resolution Speed Rank"
LIMIT 5;
