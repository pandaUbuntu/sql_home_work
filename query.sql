# query #1
SELECT em.employee_id, em.first_name, em.last_name
FROM employee em
ORDER BY em.last_name;

# query #2
SELECT em.employee_id, em.first_name, em.last_name, AVG(s.amount)
FROM employee em
INNER JOIN salary s on em.employee_id = s.employee_id
GROUP BY em.employee_id;

# query #3
SELECT p.name, AVG(s.amount) as avarage, MAX(s.amount) as max
FROM salary s
INNER JOIN employee em on s.employee_id = em.employee_id
INNER JOIN position p on em.position_id = p.position_id
GROUP BY  p.name
ORDER BY p.name;

# query #4
SELECT t.number, SUM(td.income) as sum, AVG(td.income) as avarage, COUNT(td.transport_data_id) as count_day
FROM transport_data td
INNER JOIN transport t on td.transport_id = t.transport_id
GROUP BY td.transport_id;

# query #5
SELECT e.last_name, SUM(td.income) as sum, COUNT(td.employee_id) as count_day
FROM transport_data td
INNER JOIN employee e on td.employee_id = e.employee_id
GROUP BY e.last_name;

# query #6
SELECT e.last_name
FROM employee e
WHERE e.dob LIKE '%-05-%';

# query #7
SELECT e.last_name
FROM employee e
INNER JOIN salary s on e.employee_id = s.employee_id
WHERE ((YEAR(CURRENT_DATE) - YEAR(s.salary_date)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(s.salary_date, '%m%d'))) > 0