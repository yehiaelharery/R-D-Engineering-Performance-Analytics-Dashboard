SELECT
    e.engineer_id,
    e.full_name,
    e.team,

    DATE_TRUNC('quarter', tl.log_date) AS quarter,

    COUNT(DISTINCT t.task_id) AS assigned_tasks,

    COUNT(DISTINCT CASE
        WHEN t.task_status = 'Completed'
        THEN t.task_id
    END) AS completed_tasks,

    ROUND(
        SUM(DISTINCT t.planned_hours),
        2
    ) AS total_planned_hours,

    ROUND(
        SUM(tl.hours_spent),
        2
    ) AS total_logged_hours

FROM Engineers e

LEFT JOIN Tasks t
    ON e.engineer_id = t.assigned_to

LEFT JOIN Time_Logs tl
    ON t.task_id = tl.task_id

WHERE tl.log_date IS NOT NULL

GROUP BY
    e.engineer_id,
    e.full_name,
    e.team,
    DATE_TRUNC('quarter', tl.log_date)

ORDER BY
    quarter,
    completed_tasks DESC;