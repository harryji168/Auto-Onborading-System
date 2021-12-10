SELECT date, count(id)  
from 
( SELECT id,date from jobs where required_skills is not null) required_skills 
group by date 
ORDER by date DESC
;