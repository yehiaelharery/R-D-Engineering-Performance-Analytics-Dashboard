SELECT
    DATE_TRUNC('quarter', t.completion_date) AS quarter,

    e.engineer_id,
    e.full_name,
    e.team,

    COUNT(t.task_id) AS tasks_completed,

    ROUND(SUM(t.planned_hours),2) AS total_planned_hours,

    ROUND(SUM(tl.total_logged),2) AS total_actual_hours,

    ROUND(
        SUM(tl.total_logged) /
        NULLIF(SUM(t.planned_hours),0),
        2
    ) AS estimation_ratio

FROM Tasks t

JOIN Engineers e
    ON t.assigned_to = e.engineer_id

JOIN (
    SELECT
        task_id,
        SUM(hours_spent) AS total_logged
    FROM Time_Logs
    GROUP BY task_id
) tl
    ON t.task_id = tl.task_id

WHERE
    t.task_status = 'Completed'

GROUP BY
    quarter,
    e.engineer_id,
    e.full_name,
    e.team

ORDER BY
    quarter,
    estimation_ratio DESC;