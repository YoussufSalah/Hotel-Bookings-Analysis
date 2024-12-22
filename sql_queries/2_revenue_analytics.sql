-- ADR per hotel type: (Results: /results/2_revenue_analytics/adr_ht.csv)
SELECT hotel AS "Hotel Type",
    ROUND(AVG(adr), 2) AS "ADR (Average Daily Rate)"
FROM bookings_dim
GROUP BY hotel
ORDER BY hotel ASC;
-- ADR per month: (Results: /results/2_revenue_analytics/adr_m.csv)
SELECT arrival_date_month AS "Month",
    ROUND(AVG(adr), 2) AS "ADR (Average Daily Rate)"
FROM bookings_dim
GROUP BY arrival_date_month
ORDER BY CASE
        WHEN arrival_date_month = 'January' THEN 1
        WHEN arrival_date_month = 'February' THEN 2
        WHEN arrival_date_month = 'March' THEN 3
        WHEN arrival_date_month = 'April' THEN 4
        WHEN arrival_date_month = 'May' THEN 5
        WHEN arrival_date_month = 'June' THEN 6
        WHEN arrival_date_month = 'July' THEN 7
        WHEN arrival_date_month = 'August' THEN 8
        WHEN arrival_date_month = 'September' THEN 9
        WHEN arrival_date_month = 'October' THEN 10
        WHEN arrival_date_month = 'November' THEN 11
        WHEN arrival_date_month = 'December' THEN 12
    END ASC;
-- ADR per assigned room type: (Results: /results/2_revenue_analytics/adr_art.csv)
SELECT assigned_room_type AS "Room Type",
    ROUND(AVG(adr), 2) AS "ADR (Average Daily Rate)"
FROM bookings_dim
GROUP BY assigned_room_type
ORDER BY assigned_room_type ASC;
-- ADR per reserved room type: (Results: /results/2_revenue_analytics/adr_rrt.csv)
SELECT reserved_room_type AS "Room Type",
    ROUND(AVG(adr), 2) AS "ADR (Average Daily Rate)"
FROM bookings_dim
GROUP BY reserved_room_type
ORDER BY reserved_room_type ASC;
-- Total Revenue per month: (Results: /results/2_revenue_analytics/tr_m.csv)
SELECT arrival_date_month AS "Month",
    ROUND(
        SUM(
            adr * (stays_in_weekend_nights + stays_in_week_nights)
        ),
        2
    ) AS "Total Revenue"
FROM bookings_dim
GROUP BY arrival_date_month
ORDER BY CASE
        WHEN arrival_date_month = 'January' THEN 1
        WHEN arrival_date_month = 'February' THEN 2
        WHEN arrival_date_month = 'March' THEN 3
        WHEN arrival_date_month = 'April' THEN 4
        WHEN arrival_date_month = 'May' THEN 5
        WHEN arrival_date_month = 'June' THEN 6
        WHEN arrival_date_month = 'July' THEN 7
        WHEN arrival_date_month = 'August' THEN 8
        WHEN arrival_date_month = 'September' THEN 9
        WHEN arrival_date_month = 'October' THEN 10
        WHEN arrival_date_month = 'November' THEN 11
        WHEN arrival_date_month = 'December' THEN 12
    END ASC;
-- Ranking months by total revenue: (Results: /results/2_revenue_analytics/rmb_tr.csv)
SELECT RANK() OVER(
        ORDER BY ROUND(
                SUM(
                    adr * (stays_in_weekend_nights + stays_in_week_nights)
                ),
                2
            ) DESC
    ) AS "Rank",
    arrival_date_month AS "Month",
    ROUND(
        SUM(
            adr * (stays_in_weekend_nights + stays_in_week_nights)
        ),
        2
    ) AS "Total Revenue"
FROM bookings_dim
GROUP BY arrival_date_month;