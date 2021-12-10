CREATE OR REPLACE VIEW jobs_place_sums AS  SELECT trim(jobs.place) as place,
    count(jobs.id) AS count
   FROM jobs
  GROUP BY trim(jobs.place) 
  ORDER BY trim(jobs.place) ASC;