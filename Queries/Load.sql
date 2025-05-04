CREATE TABLE "IT Tickets" (
    "ID Ticket" TEXT,
    "Date" TIMESTAMP,
    "Employee ID" TEXT,
    "Agent ID" TEXT,
    "Request Category" TEXT,
    "Issue Type" TEXT,
    "Severity" TEXT,
    "Priority" TEXT,
    "Resolution Time (Days)" NUMERIC,
    "Satisfaction Rate" NUMERIC
);


CREATE TABLE "Agent Details" (
    "Agent ID" TEXT,
    "Full Name" TEXT,
    "Email" TEXT,
    "Year of Birth" INTEGER,
    "Month of Birth" INTEGER,
    "Day of Birth" INTEGER
);

COPY "IT Tickets" (
    "ID Ticket",
    "Date",
    "Employee ID",
    "Agent ID",
    "Request Category",
    "Issue Type",
    "Severity",
    "Priority",
    "Resolution Time (Days)",
    "Satisfaction Rate"
)
FROM 'C:\DA\Projects\PowerBi\IT Operations Dashboard\Data\Tickets.csv'
DELIMITER ','
CSV HEADER;


COPY "Agent Details" (
    "Agent ID",
    "Full Name",
    "Email",
    "Year of Birth",
    "Month of Birth",
    "Day of Birth"
)
FROM 'C:\DA\Projects\PowerBi\IT Operations Dashboard\Data\IT Agents.csv'
DELIMITER ','
CSV HEADER;


ALTER TABLE "Agent Details"
ADD CONSTRAINT unique_agent_id UNIQUE ("Agent ID");x

ALTER TABLE "IT Tickets"
ADD CONSTRAINT fk_agent
FOREIGN KEY ("Agent ID") REFERENCES "Agent Details"("Agent ID");
