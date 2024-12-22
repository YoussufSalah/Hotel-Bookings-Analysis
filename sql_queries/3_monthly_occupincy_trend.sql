-- Create temporary table for monthly status
CREATE TEMP TABLE monthly_status AS (
    WITH monthly_status AS (
        SELECT hotel AS "Hotel Type",
            arrival_date_month AS "Month",
            COUNT(*) AS "Total Bookings",
            SUM(stays_in_week_nights + stays_in_weekend_nights) AS "Total Booked Room-Nights",
            CASE
                WHEN hotel = 'City Hotel' THEN 1000 * (
                    CASE
                        WHEN arrival_date_month = 'February' THEN 28
                        WHEN arrival_date_month IN (
                            'January',
                            'March',
                            'May',
                            'July',
                            'August',
                            'October',
                            'December'
                        ) THEN 31
                        ELSE 30
                    END
                ) -- assume larger capacity due to urban location
                WHEN hotel = 'Resort Hotel' THEN 600 * (
                    CASE
                        WHEN arrival_date_month = 'February' THEN 28
                        WHEN arrival_date_month IN (
                            'January',
                            'March',
                            'May',
                            'July',
                            'August',
                            'October',
                            'December'
                        ) THEN 31
                        ELSE 30
                    END
                ) -- assume smaller capacity due to location and design
            END AS "Total Available Room-Nights"
        FROM bookings_dim
        WHERE is_canceled = FALSE
        GROUP BY arrival_date_month,
            hotel
    )
    SELECT *,
        ROUND(
            "Total Booked Room-Nights"::DECIMAL / "Total Available Room-Nights" * 100,
            2
        ) AS "Occupancy Rate (%)"
    FROM monthly_status
    ORDER BY "Hotel Type" ASC,
        CASE
            WHEN "Month" = 'January' THEN 1
            WHEN "Month" = 'February' THEN 2
            WHEN "Month" = 'March' THEN 3
            WHEN "Month" = 'April' THEN 4
            WHEN "Month" = 'May' THEN 5
            WHEN "Month" = 'June' THEN 6
            WHEN "Month" = 'July' THEN 7
            WHEN "Month" = 'August' THEN 8
            WHEN "Month" = 'September' THEN 9
            WHEN "Month" = 'October' THEN 10
            WHEN "Month" = 'November' THEN 11
            WHEN "Month" = 'December' THEN 12
        END ASC
);
-- Get peak booking months for City Hotels based on Occupancy Rate (%) (Results: /results/3_monthly_occupincy_trend/rmb_or_ch.csv):
SELECT RANK() OVER(
        ORDER BY "Occupancy Rate (%)" DESC
    ) AS "Rank",
    "Hotel Type",
    "Month",
    "Occupancy Rate (%)"
FROM monthly_status
WHERE "Hotel Type" = 'City Hotel'
ORDER BY "Rank" ASC;
-- Get peak booking months for Resort Hotels based on Occupancy Rate (%) (Results: /results/3_monthly_occupincy_trend/rmb_or_rh.csv):
SELECT RANK() OVER(
        ORDER BY "Occupancy Rate (%)" DESC
    ) AS "Rank",
    "Hotel Type",
    "Month",
    "Occupancy Rate (%)"
FROM monthly_status
WHERE "Hotel Type" = 'Resort Hotel'
ORDER BY "Rank" ASC;
-- Get peak booking months for City Hotels based on Total Bookings  (Results: /results/3_monthly_occupincy_trend/rmb_tb_ch.csv):
SELECT RANK() OVER(
        ORDER BY "Total Bookings" DESC
    ) AS "Rank",
    "Hotel Type",
    "Month",
    "Total Bookings"
FROM monthly_status
WHERE "Hotel Type" = 'City Hotel'
ORDER BY "Rank" ASC;
-- Get peak booking months for Resort Hotels based on Total Bookings (Results: /results/3_monthly_occupincy_trend/rmb_tb_rh.csv):
SELECT RANK() OVER(
        ORDER BY "Total Bookings" DESC
    ) AS "Rank",
    "Hotel Type",
    "Month",
    "Total Bookings"
FROM monthly_status
WHERE "Hotel Type" = 'Resort Hotel'
ORDER BY "Rank" ASC;
-- Get peak booking months for City Hotels based on Total Booked Room-Nights (Results: /results/3_monthly_occupincy_trend/rmb_tbrn_ch.csv):
SELECT RANK() OVER(
        ORDER BY "Total Booked Room-Nights" DESC
    ) AS "Rank",
    "Hotel Type",
    "Month",
    "Total Booked Room-Nights"
FROM monthly_status
WHERE "Hotel Type" = 'City Hotel'
ORDER BY "Rank" ASC;
-- Get peak booking months for Resort Hotels based on Total Booked Room-Nights  (Results: /results/3_monthly_occupincy_trend/rmb_tbrn_rh.csv):
SELECT RANK() OVER(
        ORDER BY "Total Booked Room-Nights" DESC
    ) AS "Rank",
    "Hotel Type",
    "Month",
    "Total Booked Room-Nights"
FROM monthly_status
WHERE "Hotel Type" = 'Resort Hotel'
ORDER BY "Rank" ASC;
-- Compare the two hotel types "Resort" and "City"  (Results: /results/3_monthly_occupincy_trend/cbcr.csv):
SELECT c."Month",
    CASE
        WHEN r."Total Bookings" > c."Total Bookings" THEN 'Resort Hotels'
        WHEN c."Total Bookings" > r."Total Bookings" THEN 'City Hotels'
        ELSE 'Tie'
    END AS "Has Higher Bookings",
    r."Total Bookings" AS "Resort Hotels Total Bookings",
    c."Total Bookings" AS "City Hotels Total Bookings",
    CASE
        WHEN r."Occupancy Rate (%)" > c."Occupancy Rate (%)" THEN 'Resort Hotels'
        WHEN c."Occupancy Rate (%)" > r."Occupancy Rate (%)" THEN 'City Hotels'
        ELSE 'Tie'
    END AS "Has Higher Occupancy Rate",
    r."Occupancy Rate (%)" AS "Resort Hotels Occupancy Rate (%)",
    c."Occupancy Rate (%)" AS "City Hotels Occupancy Rate (%)",
    CASE
        WHEN r."Total Booked Room-Nights" > c."Total Booked Room-Nights" THEN 'Resort Hotels'
        WHEN c."Total Booked Room-Nights" > r."Total Booked Room-Nights" THEN 'City Hotels'
        ELSE 'Tie'
    END AS "Has Higher Booked Room-Nights",
    r."Total Booked Room-Nights" AS "Resort Hotels Total Booked Room-Nights",
    c."Total Booked Room-Nights" AS "City Hotels Total Booked Room-Nights"
FROM monthly_status AS c
    JOIN monthly_status AS r ON c."Month" = r."Month"
    AND c."Hotel Type" = 'City Hotel'
    AND r."Hotel Type" = 'Resort Hotel';