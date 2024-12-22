-- Calculate the Average Lead Time by customer_type (Result: /results/4_lead_time_analytics/alt_ct.csv)
SELECT customer_type,
    ROUND(AVG(lead_time), 2) AS "ALT (Average Lead Time)"
FROM bookings_dim
GROUP BY customer_type
ORDER BY "ALT (Average Lead Time)" DESC;
-- Calculate the Average Lead Time by month (Result: /results/4_lead_time_analytics/alt_m.csv)
SELECT arrival_date_month,
    ROUND(AVG(lead_time), 2) AS "ALT (Average Lead Time)"
FROM bookings_dim
GROUP BY arrival_date_month
ORDER BY "ALT (Average Lead Time)" DESC;
-- Calculate the Average Lead Time by hotel type (Result: /results/4_lead_time_analytics/alt_ht.csv)
SELECT hotel,
    ROUND(AVG(lead_time), 2) AS "ALT (Average Lead Time)"
FROM bookings_dim
GROUP BY hotel
ORDER BY "ALT (Average Lead Time)" DESC;
-- Calculate the Average Lead Time by country (Result: /results/4_lead_time_analytics/alt_c.csv)
SELECT country,
    ROUND(AVG(lead_time), 2) AS "ALT (Average Lead Time)"
FROM bookings_dim
GROUP BY country
ORDER BY "ALT (Average Lead Time)" DESC;
-- Calculate the Average Lead Time by market segment (Result: /results/4_lead_time_analytics/alt_ms.csv)
SELECT market_segment,
    ROUND(AVG(lead_time), 2) AS "ALT (Average Lead Time)"
FROM bookings_dim
GROUP BY market_segment
ORDER BY "ALT (Average Lead Time)" DESC;
-- Calculate the Average Lead Time by assigned room type (Result: /results/4_lead_time_analytics/alt_art.csv)
SELECT assigned_room_type,
    ROUND(AVG(lead_time), 2) AS "ALT (Average Lead Time)"
FROM bookings_dim
GROUP BY assigned_room_type
ORDER BY "ALT (Average Lead Time)" DESC;
-- Calculate the Average Lead Time by reserved room type (Result: /results/4_lead_time_analytics/alt_rrt.csv)
SELECT reserved_room_type,
    ROUND(AVG(lead_time), 2) AS "ALT (Average Lead Time)"
FROM bookings_dim
GROUP BY reserved_room_type
ORDER BY "ALT (Average Lead Time)" DESC;