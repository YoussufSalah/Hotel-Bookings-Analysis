-- Count total bookings ( 119390 )
SELECT COUNT(*) AS "Total Bookings"
FROM bookings_dim;
-- Count total cancelled bookings ( 44224 )
SELECT COUNT(*) AS "Total Cancelled Bookings"
FROM bookings_dim
WHERE is_canceled = TRUE;
-- Calculate total revenue ( 25996260.41$ )
SELECT ROUND(
        SUM(
            adr * (stays_in_week_nights + stays_in_weekend_nights)
        ),
        2
    ) || '$' AS "Total Revenue"
FROM bookings_dim
WHERE is_canceled = FALSE;