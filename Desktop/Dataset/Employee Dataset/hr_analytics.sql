USE hr_analytics;
SHOW TABLES;

#How many employees per department
SELECT department,
COUNT(*) AS employee_count
FROM employee_records
GROUP BY Department
ORDER BY employee_count DESC;

#Average salary by department
SELECT department,
ROUND(AVG(salary), 2) AS avg_salary
FROM employee_records
GROUP BY Department
ORDER BY avg_salary DESC;

#Highest paying roles
SELECT position,
ROUND(AVG(salary), 2) AS avg_salary
FROM employee_records
GROUP BY Position
ORDER BY avg_salary DESC;

SELECT department, salary
FROM employee_records
ORDER BY Salary DESC;

SELECT
MIN(Salary) AS min_salary,
MAX(Salary) AS max_salary,
AVG(Salary) AS avg_salary,
COUNT(*) AS total_employees
FROM employee_records;

SELECT salary, COUNT(*) AS frequency
FROM employee_records
GROUP BY Salary
ORDER BY frequency DESC
LIMIT 1;

SELECT COUNT(*)
FROM employee_records;

#Employees per country
SELECT country,
COUNT(*) AS employee_count
FROM employee_records
GROUP BY Country
ORDER BY employee_count DESC;

DESCRIBE employee_records;

SELECT
MIN(Salary) AS min_salary,
MAX(Salary) AS max_salary,
ROUND(AVG(Salary),2) AS avg_salary,
COUNT(*) AS total_employees
FROM employee_records;

#Total payroll by Department
SELECT department,
ROUND(SUM(salary), 2) AS payroll_cost
FROM employee_records
GROUP BY Department
ORDER BY payroll_cost DESC;

#Workforce Distribution
SELECT Country,
COUNT(*) AS employees
FROM employee_records
GROUP BY Country
ORDER BY employees DESC;

#Payroll Cost Analysis
SELECT Department, COUNT(*) AS Employees,
ROUND(AVG(Salary), 2) AS Avg_salary,
ROUND(SUM(Salary), 2) AS Payroll_cost
FROM employee_records
GROUP BY Department
ORDER BY Payroll_cost DESC;

#Tenure Analysis
SELECT TIMESTAMPDIFF(YEAR, Joining_Date, CURDATE()) AS Years_with_company,
COUNT(*) AS Employees
FROM employee_records
GROUP BY Years_with_company
ORDER BY Years_with_company;

ALTER TABLE employee_records
RENAME COLUMN `Tax Rate %` TO tax_rate;

SELECT 
MAX(tax_rate) AS max_tax_rate,
MIN(tax_rate) AS min_tax_rate,
ROUND(AVG(tax_rate), 2) AS Avg_tax_rate
FROM employee_records;

#Tax Analysis
SELECT Department,
ROUND(AVG(tax_rate), 2) AS Avg_tax_rate
FROM employee_records
GROUP BY Department;

WITH dept_salary AS(
SELECT Department,
ROUND(AVG(Salary), 2) AS Avg_salary
FROM employee_records
GROUP BY Department
)
SELECT *
FROM dept_salary
ORDER BY Avg_salary DESC;

#Top 10 Highest Paid Employees
SELECT Employee_Name, Department, Position, Salary
FROM employee_records
ORDER BY Salary DESC
LIMIT 10;

#Employees Above Average Salary
SELECT COUNT(*) AS Employees_above_average
FROM employee_records
WHERE Salary >
(SELECT AVG(Salary)
FROM employee_records
);

#Demographics (Avg Age, Newest & Oldest Employee Join Date
SELECT ROUND(AVG(Age),1) AS Avg_age,
MIN(Joining_Date) AS Oldest_joining_date,
MAX(Joining_Date) AS Newest_joining_date
FROM employee_records;