CREATE TABLE student_productivity (
    date DATE,
    subject VARCHAR(50),
    study_hours FLOAT,
    mock_score INT,
    revision VARCHAR(10),
    focus_level VARCHAR(10),
    focus_score INT
);

-- All Data
select *
from student_productivity

-- Total Study Hours
select 
	sum(study_hours) as total_study_hours
from student_productivity 

-- Average Mock Score
select 
	avg(mock_score) as avg_mock_score
From student_productivity

-- Subject Wise Study Time
SELECT subject,
       SUM(study_hours) AS total_hours
FROM student_productivity
GROUP BY subject
ORDER BY total_hours DESC;

-- Best Performing Subject
select 
	subject,
	avg(mock_score) as avg_score
FROM student_productivity
group by subject
order by avg_score DESC

-- Focus vs Score Analysis
select 
	student_productivity.focus_level,
	avg(student_productivity.mock_score) as avg_score 
FROM student_productivity
GROUP BY focus_level
ORDER BY avg_score DESC;

-- Create Analytics View
CREATE VIEW student_productivity_summary AS
SELECT
    subject,
    SUM(study_hours) AS total_hours,
    AVG(mock_score) AS avg_score,
    AVG(focus_score) AS avg_focus
FROM student_productivity
GROUP BY subject;

SELECT * FROM student_productivity_summary;

-- Time Trend Dataset
Create view daily_progress as 
select 
	date,
	sum(study_hours) as daily_hours,
	avg(mock_score) as daily_avg_score
From student_productivity
group by date
order by date

SELECT * FROM daily_progress;