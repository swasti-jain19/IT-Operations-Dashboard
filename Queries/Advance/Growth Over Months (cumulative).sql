Cumulative Ticket Volume Over Time (Running Total)

WITH MonthlyTicketCounts AS (
    SELECT 
        TO_CHAR("Date", 'MM') AS "Month",
        COUNT(*) AS "Tickets_Raised"
    FROM "IT Tickets"
    GROUP BY TO_CHAR("Date", 'MM')
)
SELECT 
    "Month",
    "Tickets_Raised",
    SUM("Tickets_Raised") OVER (ORDER BY "Month") AS "Cumulative Tickets"
FROM MonthlyTicketCounts
ORDER BY "Month";