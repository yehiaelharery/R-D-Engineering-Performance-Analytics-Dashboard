CREATE TABLE Engineers (
    engineer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    role VARCHAR(50),
    seniority VARCHAR(20),
    team VARCHAR(50),
    weekly_capacity_hours INT DEFAULT 40
);
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    target_deadline DATE,
    priority VARCHAR(20)
);
CREATE TABLE Task_Levels (
    level_id INT PRIMARY KEY,
    level_name VARCHAR(20),
    base_estimated_hours INT
);
CREATE TABLE Milestones (
    milestone_id INT PRIMARY KEY,
    project_id INT REFERENCES Projects(project_id),
    milestone_name VARCHAR(100),
    target_date DATE,
    is_critical_path BOOLEAN DEFAULT FALSE
);
CREATE TABLE Tasks (
    task_id INT PRIMARY KEY,
    project_id INT REFERENCES Projects(project_id),
    milestone_id INT REFERENCES Milestones(milestone_id),
    assigned_to INT REFERENCES Engineers(engineer_id),
    task_level_id INT REFERENCES Task_Levels(level_id),
    task_status VARCHAR(20) CHECK (
        task_status IN ('Open','In Progress','Completed','Delayed')
    ),
    planned_hours INT,
    percent_complete INT DEFAULT 0,
    created_date DATE,
    due_date DATE,
    completion_date DATE
);
CREATE TABLE Time_Logs (
    log_id SERIAL PRIMARY KEY,
    task_id INT REFERENCES Tasks(task_id),
    engineer_id INT REFERENCES Engineers(engineer_id),
    log_date DATE,
    hours_spent NUMERIC(5,2)
);
INSERT INTO Task_Levels (level_id, level_name, base_estimated_hours) VALUES 
(1, 'Simple', 8), 
(2, 'Medium', 24), 
(3, 'Complex', 60);