SELECT
    p.project_name,
    m.milestone_name,
    DATE_TRUNC('quarter', m.target_date) AS quarter,  -- use milestone's target date for quarter

    COUNT(DISTINCT t.task_id) AS total_tasks,  -- all tasks under milestone
    COUNT(DISTINCT CASE WHEN t.task_status='Completed' THEN t.task_id END) AS completed_tasks,

    ROUND(
        100.0 *
        COUNT(DISTINCT CASE WHEN t.task_status='Completed' THEN t.task_id END)
        / NULLIF(COUNT(DISTINCT t.task_id),0),
        2
    ) AS progress_percentage

FROM Milestones m
JOIN Projects p
    ON m.project_id = p.project_id
LEFT JOIN Tasks t
    ON m.milestone_id = t.milestone_id

GROUP BY
    p.project_name,
    m.milestone_name,
    DATE_TRUNC('quarter', m.target_date)

ORDER BY
    quarter,
    progress_percentage DESC;