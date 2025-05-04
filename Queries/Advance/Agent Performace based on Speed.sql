WITH AvgTimes AS (
  SELECT a."Full Name", AVG(t."Resolution Time (Days)") AS agent_avg
  FROM "Agent Details" a
  JOIN "IT Tickets" t ON a."Agent ID" = t."Agent ID"
  GROUP BY a."Full Name"
),
GlobalAvg AS (
  SELECT AVG("Resolution Time (Days)") AS global_avg
  FROM "IT Tickets"
)
SELECT a."Full Name", 
	ROUND(a.agent_avg,2) agent_avg, 
	ROUND(g.global_avg,2) global_avg,
       CASE 
         WHEN a.agent_avg < g.global_avg THEN 'Faster'
         WHEN a.agent_avg = g.global_avg THEN 'Equal'
         ELSE 'Slower'
       END AS "Performance"
FROM AvgTimes a, GlobalAvg g;
