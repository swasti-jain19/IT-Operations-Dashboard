5. Use a CTE and conditional logic to score agents based on satisfaction and resolution speed:

WITH AgentStats AS (
  SELECT a."Full Name",
         AVG(t."Satisfaction Rate") AS avg_satisfaction,
         AVG(t."Resolution Time (Days)") AS avg_resolution
  FROM "Agent Details" a
  JOIN "IT Tickets" t ON a."Agent ID" = t."Agent ID"
  GROUP BY a."Full Name"
)
SELECT "Full Name", 
       CASE 
         WHEN avg_satisfaction >= 4.5 AND avg_resolution <= 2 THEN 'Top Performer'
         WHEN avg_satisfaction >= 4.0 THEN 'Good'
         ELSE 'Needs Improvement'
       END AS "Rating"
FROM AgentStats;