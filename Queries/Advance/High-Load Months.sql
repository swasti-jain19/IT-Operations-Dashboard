-- Detect Months with Ticket Surges (above average monthly volume) --

WITH MonthlyTickets AS (
    SELECT 
        TO_CHAR("Date", 'MM') AS "Month",
        COUNT(*) AS "Tickets_Raised"
    FROM "IT Tickets"
    GROUP BY TO_CHAR("Date", 'MM')
),
AverageTicketVolume AS (
    SELECT AVG("Tickets_Raised") AS "Avg_Monthly_Tickets" FROM MonthlyTickets
)
SELECT m."Month", m."Tickets_Raised"
FROM MonthlyTickets m
CROSS JOIN AverageTicketVolume a
WHERE m."Tickets_Raised" > a."Avg_Monthly_Tickets"
ORDER BY m."Tickets_Raised" DESC;