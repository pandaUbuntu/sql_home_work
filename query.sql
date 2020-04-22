# query #1
# no inbex 32-93
# index 32-36
SELECT e.employee_id, e.first_name, e.last_name
FROM employee as e
ORDER BY e.employee_id;

# query #2
# no inbex 2,58-2,78
# index 2,42-2,59
SELECT e.employee_id, e.first_name, e.last_name, AVG(s.amount)
FROM employee as e
INNER JOIN salary as s on e.employee_id = s.employee_id
GROUP BY e.employee_id;

# query #3
# no inbex 3,32-3,111
# index 2,994-2,996
SELECT p.name, AVG(s.amount) as avarage, MAX(s.amount) as max
FROM salary as s
INNER JOIN employee as e on s.employee_id = e.employee_id
INNER JOIN position as p on e.position_id = p.position_id
WHERE s.salary_date >= DATE_SUB(CURDATE(),INTERVAL 1 YEAR)
GROUP BY p.position_id
ORDER BY p.position_id;

# query #4
# no inbex 2,467-2,761
# index 2,477-2,615
SELECT e.last_name, SUM(td.income) as sum, COUNT(td.employee_id) as count_day
FROM transport_data td
INNER JOIN employee as e on td.employee_id = e.employee_id
GROUP BY e.employee_id;

# query #5
# no inbex 2,747-2,892
# index 2,761-2,765
SELECT t.number, COUNT(td.transport_data_id) as total_days_worked, SUM(td.income) as total_income, AVG(td.income) as average_income
FROM transport_data as td
         INNER JOIN transport as t on td.transport_id = t.transport_id
GROUP BY td.transport_id
ORDER BY total_days_worked, total_income, average_income DESC;

# query #6
# no inbex 35-73
# index 32-86
SELECT e.last_name
FROM employee as e
WHERE e.dob LIKE '%-05-%';

# query #7
# no inbex 2,586-2,770
# index 2,252-2,299
SELECT e.last_name
FROM employee as e
INNER JOIN salary as s on e.employee_id = s.employee_id
WHERE ((YEAR(CURRENT_DATE) - YEAR(s.salary_date)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(s.salary_date, '%m%d'))) > 0
GROUP BY e.employee_id