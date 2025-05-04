-- 1. Full Name and Email of all Agents --

SELECT "Full Name", "Email"
FROM "Agent Details";

-- 2. Total Tickets Handled by Each Agent -- 

SELECT a."Full Name", COUNT(t."ID Ticket") AS "Total Tickets"
FROM "Agent Details" a
LEFT JOIN "IT Tickets" t ON a."Agent ID" = t."Agent ID"
GROUP BY a."Full Name";

-- 3. Agents Who Haven't Handled Any Tickets --

SELECT "Full Name"
FROM "Agent Details"
WHERE "Agent ID" NOT IN (
    SELECT DISTINCT "Agent ID" FROM "IT Tickets"
);

-- 4. Agents with Average Satisfaction > 4.5 -- 

SELECT a."Full Name", 
	ROUND(AVG(t."Satisfaction Rate"),2) AS "Avg Satisfaction"
FROM "Agent Details" a
JOIN "IT Tickets" t ON a."Agent ID" = t."Agent ID"
GROUP BY a."Full Name"
HAVING AVG(t."Satisfaction Rate") > 4.5;

-- 5. Agent Total Resolution Time --

SELECT a."Full Name", 
	SUM(t."Resolution Time (Days)") AS "Total Resolution Time"
FROM "Agent Details" a
JOIN "IT Tickets" t ON a."Agent ID" = t."Agent ID"
GROUP BY a."Full Name";

-- 6. Youngest Agent (by Date of Birth) --

SELECT "Full Name", 
	MAKE_DATE("Year of Birth", 
	"Month of Birth", "Day of Birth") AS "DOB"
FROM "Agent Details"
ORDER BY "DOB" DESC
LIMIT 1;

-- 7. Oldest Agent --

SELECT "Full Name", 
	MAKE_DATE("Year of Birth", 
	"Month of Birth", "Day of Birth") AS "DOB"
FROM "Agent Details"
ORDER BY "DOB"
LIMIT 1;

-- 8. Agent Ages Calculation --

SELECT "Full Name", 
	DATE_PART('year', CURRENT_DATE) - "Year of Birth" AS "Age"
FROM "Agent Details";

-- 9. Agents Ranked by Average Satisfaction (Window Function) --

SELECT a."Full Name", 
	ROUND(AVG(t."Satisfaction Rate"),2) AS "Avg Rate",
    RANK() OVER (ORDER BY AVG(t."Satisfaction Rate") DESC) AS "Rank"
FROM "Agent Details" a
JOIN "IT Tickets" t ON a."Agent ID" = t."Agent ID"
GROUP BY a."Full Name";

-- 10. High Severity Ticket Counts by Agent --

SELECT a."Full Name", COUNT(*) AS "High Severity Tickets"
FROM "Agent Details" a
JOIN "IT Tickets" t ON a."Agent ID" = t."Agent ID"
WHERE t."Severity" = '4 - Urgent'
GROUP BY a."Full Name"
ORDER BY "High Severity Tickets" DESC
LIMIT 5;
