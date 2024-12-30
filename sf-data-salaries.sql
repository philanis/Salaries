--Summary of SQL Skills/Methods Used:
--Data Retrieval: SELECT statements used to retrieve data from the table.
--Filtering Data: WHERE clause to filter records based on conditions.
--Column Selection: Selecting specific columns from the table.
--Counting Records: COUNT(*) and COUNT(DISTINCT) to count records and unique values.
--Distinct Values: DISTINCT to retrieve unique values from a column.
--Aggregating Data: AVG, COUNT used to perform calculations on multiple rows.
--Sorting Data: ORDER BY to sort the result set.
--Limiting Rows: LIMIT to restrict the number of rows returned.
--Grouping Data: GROUP BY to group rows that have the same values.
--Having Clause: HAVING to filter groups based on aggregate calculations.
--String Matching: LIKE with wildcards for pattern matching.
--Updating Data: UPDATE to modify existing records.
--Deleting Data: ALTER TABLE to delete a column from the table.



-- show all columns and rows in the table
SELECT * FROM salaries;

-- show only the EmployeeName and JobTitle columns
SELECT EmployeeName, JobTitle FROM salaries;

-- show the number of employees in the table
SELECT COUNT(*) FROM salaries; 

SELECT COUNT(DISTINCT EmployeeName) FROM salaries; 

SELECT COUNT(DISTINCT Id) FROM salaries;

-- show the unique job titles in the table
SELECT DISTINCT JobTitle FROM salaries;

-- show the count of unique job titles in the table
SELECT COUNT(DISTINCT JobTitle) FROM salaries;

-- show the job title and overtime pay for all employees with overtime pay greater than 50000
SELECT JobTitle, OvertimePay FROM salaries WHERE OvertimePay > 50000;

-- show the average base pay for all employees;
SELECT avg(BasePay) FROM salaries;  -- SELECT avg(BasePay) AS "AverageBasePay" FROM salaries;

-- show the top 10 highest paid employees
SELECT TOP 10 EmployeeName, TotalPay FROM salaries ORDER BY TotalPay DESC;
--SELECT EmployeeName,TotalPay FROM salaries ORDER BY TotalPay DESC LIMIT 10; -- In Microsoft SQL Server, you don't use the LIMIT clause to restrict the number of returned rows. Instead, you can use the TOP clause or the OFFSET...FETCH clause.

-- show the average of base pay, overtimepay and other pay for each employee
SELECT EmployeeName, AVG(BasePay), AVG(OvertimePay), AVG(OtherPay) FROM salaries GROUP BY EmployeeName;

-- show all employees who have the word "Manager" in their job title
SELECT EmployeeName, JobTitle FROM salaries WHERE JobTitle LIKE '%Manager%';

-- show all employees with a job title not equal to "Manager"
SELECT EmployeeName, JobTitle FROM salaries WHERE JobTitle !='%Manager%';

-- show all employees with a total pay between 50000 and 75000
SELECT EmployeeName,  TotalPay FROM salaries WHERE TotalPay>=50000 AND TotalPay<=75000;
SELECT EmployeeName,  TotalPay FROM salaries WHERE TotalPay BETWEEN 50000 AND 75000;

-- show all employees with a base pay less than 50000 or a total pay greater than 100000;
SELECT EmployeeName, BasePay, TotalPay FROM salaries WHERE BasePay<50000 OR TotalPay>100000;

-- show all employees with a totalpay benefits value between 125000 and 150000 and a job title containing the word "Director"
SELECT EmployeeName, TotalPayBenefits, JobTitle FROM salaries WHERE TotalPayBenefits BETWEEN 125000 AND 150000 AND JobTitle LIKE '%Director%';

-- show all employees ordered by their totalpay benefits in descending order
SELECT EmployeeName, TotalPayBenefits FROM salaries ORDER BY TotalPayBenefits DESC;

-- show all job titles with an average base pay of at least 100 000 and order them by average base pay in descending order
SELECT EmployeeName, JobTitle FROM salaries GROUP BY JobTitle HAVING AVG(BasePay)>=100000 ORDER BY AVG(BasePay) DESC;

-- delete the column Notes
ALTER TABLE salaries DROP COLUMN Notes;
SELECT * FROM salaries ;

-- update the base pay of all employees with the job title containing "Manager" by increasing it by 10%
UPDATE salaries SET BasePay = BasePay*1.1 WHERE JobTitle LIKE '%Manager%';

