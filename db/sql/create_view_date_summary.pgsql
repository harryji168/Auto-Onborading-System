CREATE OR REPLACE VIEW jobs_day_sums AS  SELECT date, count(id)  from jobs group by date ORDER by date desc ;
