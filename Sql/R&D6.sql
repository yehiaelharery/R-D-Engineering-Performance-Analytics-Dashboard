SELECT
    DATE_TRUNC('month', tl.log_date) AS month,

    e.engineer_id,
    e.full_name,
    e.weekly_capacity_hours,

    SUM(tl.hours_spent) AS logged_hours_Month,

    ROUND(
        SUM(tl.hours_spent) /
        (e.weekly_capacity_hours * 4.0),
        2
    ) AS utilization_ratio

FROM Time_Logs tl

JOIN Engineers e
    ON tl.engineer_id = e.engineer_id

GROUP BY
    month,
    e.engineer_id,
    e.full_name,
    e.weekly_capacity_hours

ORDER BY
    month,
    utilization_ratio DESC;