SELECT
    DATE_TRUNC('quarter', t.completion_date) AS quarter,
    t.task_level_id,

    COUNT(t.task_id) AS total_tasks,

    ROUND(AVG(t.planned_hours),2) AS avg_planned_hours,

    ROUND(AVG(tl.total_logged),2) AS avg_actual_hours,

    ROUND(
        AVG(tl.total_logged) /
        NULLIF(AVG(t.planned_hours),0) * 100,
        2
    ) AS estimation_accuracy_percent

FROM Tasks t

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
    AND t.completion_date IS NOT NULL

GROUP BY
    quarter,
    t.task_level_id

ORDER BY
    quarter,
    t.task_level_id;