-- For performance and better analysis lets make a temp table view

CREATE VIEW hr_full_data AS
SELECT g.*, 
       e.environment_satisfaction, e.job_satisfaction, e.work_life_balance,
       m.job_involvement, m.performance_rating
FROM general_data g
LEFT JOIN employees e ON g.employee_id = e.employee_id
LEFT JOIN manager_sur m ON g.employee_id = m.employee_id;


select * from hr_full_data;

-- Q1 Which departments have the highest attrition rates, and what factors contribute to them?

SELECT department, 
count(*) as total_empployees,
sum(CASE when attrition='Yes' then 1 else 0 end) as attrition_count
from hr_full_data 
group by department;

-- Q2 Does lower monthly income correlate with higher attrition among employees?

SELECT department,
Round(avg(monthly_income),2) as avg_income,
SUM(CASE when attrition = 'Yes' then 1 else 0 end) as attri_count
from hr_full_data
group by department;

-- Q3 How does work‑life balance satisfaction influence attrition and overall employee satisfaction?

SELECT work_life_balance, 
count(*) as total,
SUM(CASE when attrition = 'Yes' then 1 else 0 end) as attrition_count
from hr_full_data
group by work_life_balance;

-- Q4 What is the relationship between job satisfaction and performance rating?

SELECT job_satisfaction, 
count(*) as total,
SUM(CASE when attrition = 'Yes' then 1 else 0 end) as attrition_count
from hr_full_data
group by job_satisfaction;

-- Q5 How do years since last promotion affect attrition likelihood?

SELECT years_since_last_promotion,
count(*) as total,
SUM(CASE when attrition = 'Yes' then 1 else 0 end) as attition_count
from hr_full_data
group by years_since_last_promotion
order by years_since_last_promotion;
-- Q6 Are employees with higher education levels less likely to leave the company?

SELECT education,
count(*) as total,
SUM(CASE when attrition = 'Yes' then 1 else 0 end) as attrition_count
from hr_full_data
group by education
order by education;
--Q7 Which departments show the lowest environment satisfaction scores, and why?

SELECT department, 
round(avg(environment_satisfaction),2) as avg_env_satisfaction,
sum(case when attrition = 'Yes' then 1 else 0 end) as attrition_count
from hr_full_data
group by department;


-- Q8  Do attrition rates differ significantly between male and female employees?

SELECT gender,
count(*) as total,
SUM(case when attrition = 'Yes' then 1 else 0 end) as attrition_count,
round(SUM(case when attrition = 'Yes' then 1 else 0 end)::numeric / count(*) * 100,2) as attrition_rate
from hr_full_data
group by gender;
-- Q9 Does frequent business travel increase attrition or reduce satisfaction levels?

SELECT business_travel,
count(*) as total,
sum(case when attrition = 'Yes' then 1 else 0 end) as attrition_count,
round(sum(case when attrition = 'Yes' then 1 else 0 end):: numeric / count(*) * 100,2) as attrition_rate
from hr_full_data
group by business_travel;


-- Q10 How does monthly income vary across different job roles, and are there pay disparities?

SELECT job_role,
round(avg(monthly_income),2) as avg_income,
sum(case when attrition = 'Yes' then 1 else 0 end) attrition_count,
round(sum(case when attrition = 'Yes' then 1 else 0 end):: numeric / count(*) * 100,2) as attrition_rate
from hr_full_data
group by job_role
order by avg_income desc;

-- Q11 How do total working years and years at the company influence attrition?
SELECT total_working_years,
count(*) as total,
sum(case when attrition = 'Yes' then 1 else 0 end) as attrition_count,
round(sum(case when attrition = 'Yes' then 1 else 0 end)::numeric / count(*) * 100,2) as attrition_rate
from hr_full_data
group by total_working_years
order by attrition_rate desc
limit 10;


-- Q12 Does the number of training sessions attended last year correlate with higher performance ratings?

SELECT training_times_last_year,
COUNT(*) AS total,
SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)::numeric / COUNT(*) * 100,2) AS attrition_rate
FROM hr_full_data
GROUP BY training_times_last_year
ORDER BY training_times_last_year;

-- Q13 Is marital status associated with differences in attrition or satisfaction levels?
SELECT marital_status,
COUNT(*) AS total,
SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)::numeric / COUNT(*) * 100,2) AS attrition_rate
FROM hr_full_data
GROUP BY marital_status;

-- Q14 Does a higher percent salary hike lead to improved job satisfaction and reduced attrition?0
SELECT percent_salary_hike,
COUNT(*) AS total,
SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
ROUND(SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)::numeric / COUNT(*) * 100,2) AS attrition_rate
FROM hr_full_data
GROUP BY percent_salary_hike
ORDER BY percent_salary_hike;


-- Q15 How do job involvement and years with the current manager affect attrition and satisfaction? 

SELECT performance_rating,
       COUNT(*) AS total,
       SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
       ROUND(SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)::numeric / COUNT(*) * 100,2) AS attrition_rate
FROM hr_full_data
GROUP BY performance_rating
ORDER BY performance_rating;

-- Q16 How does age influence attrition (grouped into bands)?
SELECT
CASE 
       WHEN age BETWEEN 18 AND 25 THEN '18-25'
       WHEN age BETWEEN 26 AND 30 THEN '26-30'
       WHEN age BETWEEN 31 AND 35 THEN '31-35'
       WHEN age BETWEEN 36 AND 40 THEN '36-40'
       WHEN age BETWEEN 41 AND 50 THEN '41-50'
       WHEN age BETWEEN 51 AND 60 THEN '51-60'
END AS age_band,
       COUNT(*) AS total,
       SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS attrition_count,
       ROUND(SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)::numeric / COUNT(*) * 100,2) AS attrition_rate
FROM hr_full_data
GROUP BY age_band
ORDER BY age_band;


