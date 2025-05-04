-- 1. Total Tickets Raised -- 

SELECT COUNT(*) AS "Total Tickets Raised"
FROM "IT Tickets";

-- 2. Average Resolution Time --

SELECT ROUND(AVG("Resolution Time (Days)")::numeric, 2) AS "Avg Resolution Time"
FROM "IT Tickets"
WHERE "Resolution Time (Days)" IS NOT NULL;

-- 3. Average Satisfaction Rate --

SELECT ROUND(AVG("Satisfaction Rate")::numeric, 2) AS "Avg Satisfaction Rate"
FROM "IT Tickets"
WHERE "Satisfaction Rate" IS NOT NULL;

-- 4. Tickets by Severity --

SELECT "Severity", COUNT(*) AS "Total Tickets"
FROM "IT Tickets"
GROUP BY "Severity"
ORDER BY "Total Tickets" DESC;

-- 5. Tickets by Priority --

SELECT "Priority", COUNT(*) AS "Total Tickets"
FROM "IT Tickets"
GROUP BY "Priority"
ORDER BY "Total Tickets" DESC;

-- 6. Tickets by Request Category --
SELECT "Request Category", COUNT(*) AS "Total Tickets"
FROM "IT Tickets"
GROUP BY "Request Category"
ORDER BY "Total Tickets" DESC;

-- 7. Top 5 Agents by Ticket Volume --

SELECT a."Full Name", COUNT(*) AS "Total Tickets Raised"
FROM "IT Tickets" t
JOIN "Agent Details" a ON t."Agent ID" = a."Agent ID"
GROUP BY a."Full Name"
ORDER BY "Total Tickets Raised" DESC
LIMIT 5;

-- 8. Severity Distribution Across Tickets --
SELECT "Severity", COUNT(*) AS "Count"
FROM "IT Tickets"
GROUP BY "Severity";
