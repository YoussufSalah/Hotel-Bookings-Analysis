-- Overall Cancellation Rate: 37.04%
SELECT ROUND(
        AVG(
            CASE
                WHEN is_canceled THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS "Cancellation Rate (%)"
FROM bookings_dim;
-- Cancellation Rate by Customer Type: (Results: /results/5_cancellition_analytics/cr_ct.csv)
SELECT customer_type AS "Customer Type",
    ROUND(
        AVG(
            CASE
                WHEN is_canceled THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS "Cancellation Rate (%)"
FROM bookings_dim
GROUP BY customer_type
ORDER BY "Cancellation Rate (%)" DESC;
-- Cancellation Rate by Hotel Type: (Results: /results/5_cancellition_analytics/cr_ht.csv)
SELECT hotel AS "Hotel Type",
    ROUND(
        AVG(
            CASE
                WHEN is_canceled THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS "Cancellation Rate (%)"
FROM bookings_dim
GROUP BY hotel
ORDER BY "Cancellation Rate (%)" DESC;
-- Cancellation Rate by Country: (Results: /results/5_cancellition_analytics/cr_c.csv)
SELECT country AS "Country",
    ROUND(
        AVG(
            CASE
                WHEN is_canceled THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS "Cancellation Rate (%)"
FROM bookings_dim
GROUP BY country
ORDER BY "Cancellation Rate (%)" DESC;
-- Cancellation Rate by Market Segment: (Results: /results/5_cancellition_analytics/cr_ms.csv)
SELECT market_segment AS "Market Segment",
    ROUND(
        AVG(
            CASE
                WHEN is_canceled THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS "Cancellation Rate (%)"
FROM bookings_dim
GROUP BY market_segment
ORDER BY "Cancellation Rate (%)" DESC;
-- Cancellation Rate by Lead Time: (Results: /results/5_cancellition_analytics/cr_lt.csv)
SELECT CASE
        WHEN lead_time <= 30 THEN 'Short (< 31 Days)'
        WHEN lead_time BETWEEN 31 AND 90 THEN 'Medium (31 - 90 Days)'
        ELSE 'Long (> 90 Days)'
    END AS "Lead Time Category",
    ROUND(
        AVG(
            CASE
                WHEN is_canceled THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS "Cancellation Rate (%)"
FROM bookings_dim
GROUP BY "Lead Time Category"
ORDER BY "Cancellation Rate (%)" DESC;
-- Cancellation Rate by Reserved Room Type and Assigned Room Type: (Results: /results/5_cancellition_analytics/cr_rrt_art.csv) 
SELECT reserved_room_type AS "Reserved Room Type",
    assigned_room_type AS "Assigned Room Type",
    ROUND(
        AVG(
            CASE
                WHEN is_canceled THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS "Cancellation Rate (%)"
FROM bookings_dim
GROUP BY reserved_room_type,
    assigned_room_type
ORDER BY "Cancellation Rate (%)" DESC;