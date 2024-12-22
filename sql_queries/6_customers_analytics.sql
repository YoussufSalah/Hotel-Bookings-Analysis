-- Bookings by customer type (Results: /results/6_customers_analytics/ca_ct.csv)
SELECT customer_type AS "Customer Type",
    SUM(
        CASE
            WHEN is_canceled THEN 0
            ELSE 1
        END
    ) AS "Bookings Count",
    ROUND(
        (
            SUM(
                CASE
                    WHEN is_canceled THEN 0
                    ELSE 1
                END
            )::DECIMAL / (
                SELECT SUM(
                        CASE
                            WHEN is_canceled THEN 0
                            ELSE 1
                        END
                    )
                FROM bookings_dim
            )
        ) * 100,
        2
    ) AS "Percentage of Total"
FROM bookings_dim
GROUP BY customer_type
ORDER BY "Bookings Count" DESC;
-- Bookings by agent (Results: /results/6_customers_analytics/ca_a.csv)
SELECT agent AS "Agent",
    SUM(
        CASE
            WHEN is_canceled THEN 0
            ELSE 1
        END
    ) AS "Bookings Count",
    ROUND(
        (
            SUM(
                CASE
                    WHEN is_canceled THEN 0
                    ELSE 1
                END
            )::DECIMAL / (
                SELECT SUM(
                        CASE
                            WHEN is_canceled THEN 0
                            ELSE 1
                        END
                    )
                FROM bookings_dim
            )
        ) * 100,
        2
    ) AS "Percentage of Total"
FROM bookings_dim
GROUP BY agent
ORDER BY "Bookings Count" DESC;