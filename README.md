# Hotel Bookings Analytics

## 1. Total Bookings, Cancellations, and Revenue (`1_total_bookings_cancellitions_and_revenue.sql`)

-   **Path**: `/sql_queries/1_total_bookings_cancellitions_and_revenue.sql`

### Queries:

#### Total Bookings

-   **Description**: Counts the total number of bookings from the `bookings_dim` table.
-   **Result**: 119,390 bookings.

#### Total Cancelled Bookings

-   **Description**: Counts the total number of cancelled bookings where the `is_canceled` flag is `TRUE`.
-   **Result**: 44,224 cancelled bookings.

#### Total Revenue

-   **Description**: Calculates the total revenue by summing up the product of `adr` (Average Daily Rate) and the total nights stayed (`stays_in_week_nights` + `stays_in_weekend_nights`) for non-cancelled bookings.
-   **Result**: $25,996,260.41.

---

## 2. Revenue Analytics (`2_revenue_analytics.sql`)

-   **Path**: `/sql_queries/2_revenue_analytics.sql`

### Queries:

#### ADR (Average Daily Rate) per Hotel Type

```sql
SELECT hotel AS "Hotel Type",
    ROUND(AVG(adr), 2) AS "ADR (Average Daily Rate)"
FROM bookings_dim
GROUP BY hotel
ORDER BY hotel ASC;
```

-   **Description**: Calculates the average `adr` for each type of hotel.
-   **Results File**: `/results/2_revenue_analytics/adr_ht.csv`.

#### ADR per Month

-   **Description**: Calculates the average `adr` for each month.
-   **Results File**: `/results/2_revenue_analytics/adr_m.csv`.

#### ADR per Assigned Room Type

-   **Description**: Calculates the average `adr` for each assigned room type.
-   **Results File**: `/results/2_revenue_analytics/adr_art.csv`.

#### ADR per Reserved Room Type

-   **Description**: Calculates the average `adr` for each reserved room type.
-   **Results File**: `/results/2_revenue_analytics/adr_rrt.csv`.

#### Total Revenue per Month

-   **Description**: Calculates the total revenue generated for each month.
-   **Results File**: `/results/2_revenue_analytics/tr_m.csv`.

#### Ranking Months by Total Revenue

-   **Description**: Ranks months by their total revenue in descending order.
-   **Results File**: `/results/2_revenue_analytics/rmb_tr.csv`.

---

## 3. Monthly Occupancy Trend (`3_monthly_occupincy_trend.sql`)

-   **Path**: `/sql_queries/3_monthly_occupincy_trend.sql`

### Queries:

#### Create Temporary Table for Monthly Status

-   **Description**: Creates a temporary table to calculate occupancy rate and booking trends for each hotel type per month.

#### Get peak booking months for City Hotels based on Occupancy Rate (%)

-   **Description**: Ranks the months based on `Occupancy Rate (%)` for hotel type `City Hotel`
-   **Results File**: `/results/3_monthly_occupincy_trend/rmb_or_ch.csv`

#### Get peak booking months for Resort Hotels based on Occupancy Rate (%)

-   **Description**: Ranks the months based on `Occupancy Rate (%)` for hotel type `Resort Hotel`
-   **Results File**: `/results/3_monthly_occupincy_trend/rmb_or_rh.csv`

#### Get peak booking months for City Hotels based on Total Bookings

-   **Description**: Ranks the months based on `Total Bookings` for hotel type `City Hotel`
-   **Results File**: `/results/3_monthly_occupincy_trend/rmb_tb_ch.csv`

#### Get peak booking months for Resort Hotels based on Total Bookings

-   **Description**: Ranks the months based on `Total Bookings` for hotel type `Resort Hotel`
-   **Results File**: `/results/3_monthly_occupincy_trend/rmb_tb_rh.csv`

#### Get peak booking months for City Hotels based on Total Booked Room-Night

-   **Description**: Ranks the months based on `Total Booked Room-Night` for hotel type `City Hotel`
-   **Results File**: `/results/3_monthly_occupincy_trend/rmb_tbrn_ch.csv`

#### Get peak booking months for Resort Hotels based on Total Booked Room-Night

-   **Description**: Ranks the months based on `Total Booked Room-Night` for hotel type `Resort Hotel`
-   **Results File**: `/results/3_monthly_occupincy_trend/rmb_tbrn_rh.csv`

#### Comparison between the two hotel types "Resort" and "City"

-   **Description**: Compares the two hotel type `Resort Hotel` and `City Hotel` based on `Occupincy Rate (%)`, `Total Bookings`, and `Total Booked Room-Nights`
-   **Results File**: `/results/3_monthly_occupincy_trend/cbcr.csv`

## 4. Lead Time Analytics (`4_lead_time_analytics.sql`)

-   **Path**: `/sql_queries/4_lead_time_analytics.sql`

### Queries:

#### ALT by Customer Type

-   **Description**: Calculates the **A**verage **L**ead **T**ime `ALT` by `Customer Type`
-   **Results File**: `/results/4_lead_time_analytics/alt_ct.csv`

#### ALT by Month

-   **Description**: Calculates the **A**verage **L**ead **T**ime `ALT` by `Month`
-   **Results File**: `/results/4_lead_time_analytics/alt_m.csv`

#### ALT by Hotel Type

-   **Description**: Calculates the **A**verage **L**ead **T**ime `ALT` by `Hotel Type`
-   **Results File**: `/results/4_lead_time_analytics/alt_ht.csv`

#### ALT by Country

-   **Description**: Calculates the **A**verage **L**ead **T**ime `ALT` by `Country`
-   **Results File**: `/results/4_lead_time_analytics/alt_c.csv`

#### ALT by Market Segment

-   **Description**: Calculates the **A**verage **L**ead **T**ime `ALT` by `Market Segment`
-   **Results File**: `/results/4_lead_time_analytics/alt_ms.csv`

#### ALT by Assigned Room Type

-   **Description**: Calculates the **A**verage **L**ead **T**ime `ALT` by `Assigned Room Type`
-   **Results File**: `/results/4_lead_time_analytics/alt_art.csv`

#### ALT by Reserved Room Type

-   **Description**: Calculates the **A**verage **L**ead **T**ime `ALT` by `Reserved Room Type`
-   **Results File**: `/results/4_lead_time_analytics/alt_rrt.csv`

## 5. Cancellition Analytics (`5_cancellition_analytics.sql`)

-   **Path**: `/sql_queries/5_cancellition_analytics.sql`

### Queries:

#### Overall Cancellition Rate

-   **Description**: Calculate Overall Cancellition Rate
-   **Result**: `37.04%`

#### Cancellition Rate By Customer Type

-   **Description**: Calculate Cancellition Rate By `Customer Type`
-   **Results File**: `/results/5_cancellition_analytics/ca_ct.csv`

#### Cancellition Rate By Hotel Type

-   **Description**: Calculate Cancellition Rate By `Hotel Type`
-   **Results File**: `/results/5_cancellition_analytics/ca_ht.csv`

#### Cancellition Rate By Lead Time

-   **Description**: Calculate Cancellition Rate By `Lead Time`
-   **Results File**: `/results/5_cancellition_analytics/ca_lt.csv`

#### Cancellition Rate By Market Segment

-   **Description**: Calculate Cancellition Rate By `Market Segment`
-   **Results File**: `/results/5_cancellition_analytics/ca_ms.csv`

#### Cancellition Rate By Reserved Room Type & Assigned Room Type

-   **Description**: Calculate Cancellition Rate By `Reserved Room Type` & `Assigned Room Type`
-   **Results File**: `/results/5_cancellition_analytics/ca_rrt_art.csv`

## 6. Customers Analytics (`6_customers_analytics.sql`)

-   **Path**: `/sql_queries/6_customers_analytics.sql`

### Queries:

#### Total Bookings by Customer Type

-   **Desciption**: Calculates `Total Bookings` By `Customer Type`
-   **Results File**: `/results/6_customers_analytics/ca_ct.csv`

#### Total Bookings by Agent

-   **Desciption**: Calculates `Total Bookings` By `Agent`
-   **Results File**: `/results/6_customers_analytics/ca_a.csv`
