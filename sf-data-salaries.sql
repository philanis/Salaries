-- show all columns and rows in the table
SELECT * FROM sf_data.salaries;

-- show only the EmployeeName and JobTitle columns
SELECT EmployeeName, JobTitle FROM sf_data.salaries;

-- show the number of employees in the table
SELECT COUNT(*) FROM sf_data.salaries; 

SELECT COUNT(DISTINCT EmployeeName) FROM sf_data.salaries; 

SELECT COUNT(DISTINCT Id) FROM sf_data.salaries;

-- show the unique job titles in the table
SELECT DISTINCT JobTitle FROM sf_data.salaries;

-- show the count of unique job titles in the table
SELECT COUNT(DISTINCT JobTitle) FROM sf_data.salaries;

-- show the job title and overtime pay for all employees with overtime pay greater than 50000
SELECT JobTitle, OvertimePay FROM sf_data.salaries WHERE OvertimePay > 50000;

-- show the average base pay for all employees;
SELECT avg(BasePay) FROM sf_data.salaries;  -- SELECT avg(BasePay) AS "AverageBasePay" FROM sf_data.salaries;

-- show the top 10 highest paid employees
SELECT EmployeeName,TotalPay FROM sf_data.salaries ORDER BY TotalPay DESC LIMIT 10;

-- show the average of base pay, overtimepay and other pay for each employee
SELECT EmployeeName, AVG(BasePay), AVG(OvertimePay), AVG(OtherPay) FROM sf_data.salaries GROUP BY EmployeeName;

-- show all employees who have the word "Manager" in their job title
SELECT EmployeeName, JobTitle FROM sf_data.salaries WHERE JobTitle LIKE "%Manager%";

-- show all employees with a job title not equal to "Manager"
SELECT EmployeeName, JobTitle FROM sf_data.salaries WHERE JobTitle !="%Manager%";

-- show all employees with a total pay between 50000 and 75000
SELECT EmployeeName,  TotalPay FROM sf_data.salaries WHERE TotalPay>=50000 AND TotalPay<=75000;
SELECT EmployeeName,  TotalPay FROM sf_data.salaries WHERE TotalPay BETWEEN 50000 AND 75000;

-- show all employees with a base pay less than 50000 or a total pay greater than 100000;
SELECT EmployeeName, BasePay, TotalPay FROM sf_data.salaries WHERE BasePay<50000 OR TotalPay>100000;

-- show all employees with a totalpay benefits value between 125000 and 150000 and a job title containing the word "Director"
SELECT EmployeeName, TotalPayBenefits, JobTitle FROM sf_data.salaries WHERE TotalPayBenefits BETWEEN 125000 AND 150000 AND JobTitle LIKE "%Director%";

-- show all employees ordered by their totalpay benefits in descending order
SELECT EmployeeName, TotalPayBenefits FROM sf_data.salaries ORDER BY TotalPayBenefits DESC;

-- show all job titles with an average base pay of at least 100 000 and order them by average base pay in descending order
SELECT EmployeeName, JobTitle FROM sf_data.salaries GROUP BY JobTitle HAVING AVG(BasePay)>=100000 ORDER BY AVG(BasePay) DESC;

-- delete the column Notes
ALTER TABLE sf_data.salaries DROP COLUMN Notes;
SELECT * FROM sf_data.salaries ;

-- update the base pay of all employees with the job title containing "Manager" by increasing it by 10%
UPDATE sf_data.salaries SET BasePay = BasePay*1.1 WHERE JobTitle LIKE "%Manager%";

