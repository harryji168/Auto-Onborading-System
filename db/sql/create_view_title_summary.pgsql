CREATE OR REPLACE VIEW jobs_title_sums AS  SELECT title, count(id) from jobs group by title ORDER by  count(id) desc ;
