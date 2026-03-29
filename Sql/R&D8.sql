SELECT
    p.project_name,

    TO_CHAR(DATE_TRUNC('quarter', t.created_date), 'YYYY "Q"Q') AS quarter,
    DATE_TRUNC('month', t.created_date) AS month,

    COUNT(t.task_id) AS total_tasks,

    SUM(CASE 
        WHEN t.task_status = 'Completed' THEN 1 
        ELSE 0 
    END) AS completed_tasks,

    SUM(CASE 
        WHEN t.task_status = 'Delayed' THEN 1 
        ELSE 0 
    END) AS delayed_tasks,

    ROUND(
        100.0 * SUM(CASE WHEN t.task_status = 'Completed' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(t.task_id),0),
        2
    ) AS completion_percentage

FROM Projects p
LEFT JOIN Tasks t
    ON p.project_id = t.project_id

GROUP BY
    p.project_name,
    DATE_TRUNC('quarter', t.created_date),
    DATE_TRUNC('month', t.created_date)

ORDER BY
    p.project_name,
    month;