-- 1. Tickets Raised by Year --

SELECT EXTRACT(YEAR FROM "Date") AS "Year", COUNT(*) AS "Total Tickets Raised"
FROM "IT Tickets"
GROUP BY EXTRACT(YEAR FROM "Date")
ORDER BY "Year";

-- 2. Tickets Raised by Month --

SELECT TO_CHAR("Date", 'MM') AS "Month", COUNT(*) AS "Tickets Raised"
FROM "IT Tickets"
GROUP BY TO_CHAR("Date", 'MM')
ORDER BY "Month";

-- 3. Monthly Average Satisfaction Rate --

SELECT TO_CHAR("Date", 'MM') AS "Month",
       ROUND(AVG("Satisfaction Rate")::numeric, 2) AS "Avg Satisfaction Rate"
FROM "IT Tickets"
GROUP BY TO_CHAR("Date", 'MM')
ORDER BY "Month";

-- 4. Average Resolution Time by Year --

SELECT EXTRACT(YEAR FROM "Date") AS "Year",
       ROUND(AVG("Resolution Time (Days)")::numeric, 2) AS "Avg Resolution Time"
FROM "IT Tickets"
GROUP BY EXTRACT(YEAR FROM "Date")
ORDER BY "Year";

-- 5. Monthly Resolution Time Trends --

SELECT TO_CHAR("Date", 'MM') AS "Month",
       ROUND(AVG("Resolution Time (Days)")::numeric, 2) AS "Avg Resolution Time"
FROM "IT Tickets"
GROUP BY TO_CHAR("Date", 'MM')
ORDER BY "Month";

-- 6. Tickets by Priority Over Time --

SELECT EXTRACT(YEAR FROM "Date") AS "Year", 
       TO_CHAR("Date", 'MM') AS "Month", 
       "Priority", 
       COUNT(*) AS "Tickets Raised"
FROM "IT Tickets"
GROUP BY EXTRACT(YEAR FROM "Date"), TO_CHAR("Date", 'MM'), "Priority"
ORDER BY "Year", "Month";

-- 7. Monthly Ticket Volume --

SELECT TO_CHAR("Date", 'MM') AS "Month", COUNT(*) AS "Tickets"
FROM "IT Tickets"
GROUP BY TO_CHAR("Date", 'MM')
ORDER BY "Month";

-- 8. Yearly Satisfaction Rate --

SELECT EXTRACT(YEAR FROM "Date") AS "Year",
       ROUND(AVG("Satisfaction Rate")::numeric, 2) AS "Avg Satisfaction"
FROM "IT Tickets"
GROUP BY EXTRACT(YEAR FROM "Date")
ORDER BY "Year";

-- 9. Monthly Ticket Count by Severity --

SELECT TO_CHAR("Date", 'YYYY-MM') AS "Month",
       "Severity", 
       COUNT(*) AS "Ticket Count"
FROM "IT Tickets"
GROUP BY TO_CHAR("Date", 'YYYY-MM'), "Severity"
ORDER BY "Month";

-- 10. Yearly Ticket Volume for Each Category --

SELECT EXTRACT(YEAR FROM "Date") AS "Year", 
       "Request Category", 
       COUNT(*) AS "Ticket Volume"
FROM "IT Tickets"
GROUP BY EXTRACT(YEAR FROM "Date"), "Request Category"
ORDER BY "Year";
