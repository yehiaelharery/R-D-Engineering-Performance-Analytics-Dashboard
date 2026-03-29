WITH task_actual_hours AS (
    SELECT
        task_id,
        SUM(hours_spent) AS actual_hours
    FROM Time_Logs
    GROUP BY task_id
)

SELECT
    DATE_TRUNC('quarter', t.created_date) AS quarter,
    e.team,

    COUNT(DISTINCT t.task_id) AS total_tasks,

    COUNT(DISTINCT CASE
        WHEN t.task_status = 'Completed'
        THEN t.task_id
    END) AS completed_tasks,

    ROUND(
        COUNT(DISTINCT CASE
            WHEN t.task_status = 'Completed'
            THEN t.task_id
        END)::numeric
        /
        NULLIF(COUNT(DISTINCT t.task_id),0)
        * 100,
        2
    ) AS completion_rate,

    ROUND(SUM(t.planned_hours),2) AS planned_hours,

    ROUND(SUM(tah.actual_hours),2) AS actual_hours,

    ROUND(
        SUM(t.planned_hours) /
        NULLIF(SUM(tah.actual_hours),0),
        2
    ) AS efficiency_ratio

FROM Tasks t
JOIN Engineers e
    ON t.assigned_to = e.engineer_id

LEFT JOIN task_actual_hours tah
    ON t.task_id = tah.task_id

GROUP BY
    quarter,
    e.team

ORDER BY
    quarter,
    completion_rate DESC;