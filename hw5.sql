--Задание 1
SELECT
  date,
  amount,
  SUM(amount) OVER (ORDER BY date) AS running_total
FROM transactions;

--Задание 2
SELECT
  id,
  category,
  price,
  price - AVG(price) OVER (PARTITION BY category) AS deviation_from_avg
FROM products;

--Задание 3
SELECT
  log_time,
  temperature,
  AVG(temperature) OVER (ORDER BY log_time ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM temperature_logs;

--Задание 4
SELECT
  task_id,
  project_id,
  start_date,
  FIRST_VALUE(start_date) OVER (PARTITION BY project_id ORDER BY start_date) AS first_task_date,
  LAST_VALUE(start_date) OVER (PARTITION BY project_id ORDER BY start_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_task_date
FROM project_tasks;
