# query #1
# no inbex 32-93
# index 32-36
SELECT em.employee_id, em.first_name, em.last_name
FROM employee em
ORDER BY em.last_name;

# query #2
# no inbex 2,58-2,78
# index 2,42-2,59
SELECT em.employee_id, em.first_name, em.last_name, AVG(s.amount)
FROM employee em
INNER JOIN salary s on em.employee_id = s.employee_id
GROUP BY em.employee_id;

# query #3
# no inbex 3,32-3,111
# index 2,994-2,996
SELECT p.name, AVG(s.amount) as avarage, MAX(s.amount) as max
FROM salary s
INNER JOIN employee em on s.employee_id = em.employee_id
INNER JOIN position p on em.position_id = p.position_id
GROUP BY  p.name
ORDER BY p.name;

# query #4
# no inbex 2,467-2,761
# index 2,477-2,615
SELECT t.number, SUM(td.income) as sum, AVG(td.income) as avarage, COUNT(td.transport_data_id) as count_day
FROM transport_data td
INNER JOIN transport t on td.transport_id = t.transport_id
GROUP BY td.transport_id;

# query #5
# no inbex 2,747-2,892
# index 2,761-2,765
SELECT e.last_name, SUM(td.income) as sum, COUNT(td.employee_id) as count_day
FROM transport_data td
INNER JOIN employee e on td.employee_id = e.employee_id
GROUP BY e.last_name;

# query #6
# no inbex 35-73
# index 32-86
SELECT e.last_name
FROM employee e
WHERE e.dob LIKE '%-05-%';

# query #7
# no inbex 2,586-2,770
# index 2,252-2,299
SELECT e.last_name
FROM employee e
INNER JOIN salary s on e.employee_id = s.employee_id
WHERE ((YEAR(CURRENT_DATE) - YEAR(s.salary_date)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(s.salary_date, '%m%d'))) > 0
GROUP BY e.last_name